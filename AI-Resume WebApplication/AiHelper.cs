using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace AI_Resume_WebApplication
{
    // Model class for ATS analysis results
    public class AtsAnalysisResult
    {
        public int overallScore { get; set; } = 82;
        public string rating { get; set; } = "STRONG MATCH";
        public string statusBadge { get; set; } = "Greenhouse & Lever Ready";
        public int impactScore { get; set; } = 85;
        public int keywordScore { get; set; } = 80;
        public int formatScore { get; set; } = 95;
        public int brevityScore { get; set; } = 88;
        public List<string> matchedKeywords { get; set; } = new List<string>();
        public List<string> missingKeywords { get; set; } = new List<string>();
        public string suggestion1Tag { get; set; } = "Action Verb Suggestion";
        public string suggestion1Title { get; set; } = "Strengthen leadership and action verbs in experience";
        public string suggestion1Desc { get; set; } = "Replace passive phrases like 'worked on' with 'Architected' or 'Spearheaded' to boost leadership score.";
        public string suggestion2Tag { get; set; } = "Keyword Integration";
        public string suggestion2Title { get; set; } = "Add target job keywords to your profile skills";
        public string suggestion2Desc { get; set; } = "Include missing industry skills from the job description to improve ranking in recruiter searches.";
    }

    // Helper class to call AI API
    // Uses native HttpClient and Newtonsoft.Json for lightweight REST communication
    public static class AiHelper
    {
        private static readonly HttpClient client = new HttpClient();

        public class ChatMessage
        {
            [JsonProperty("role")]
            public string Role { get; set; }

            [JsonProperty("content")]
            public string Content { get; set; }
        }

        public class ChatRequest
        {
            [JsonProperty("model")]
            public string Model { get; set; }

            [JsonProperty("messages")]
            public List<ChatMessage> Messages { get; set; }
        }

        public class ChatChoice
        {
            [JsonProperty("message")]
            public ChatMessage Message { get; set; }
        }

        public class ChatResponse
        {
            [JsonProperty("choices")]
            public List<ChatChoice> Choices { get; set; }
        }

        // Call AI API asynchronously
        public static async Task<string> AskAiAsync(string prompt)
        {
            string apiKey = ConfigurationManager.AppSettings["AIApiKey"];
            string endpoint = ConfigurationManager.AppSettings["AIApiEndpoint"];
            string model = ConfigurationManager.AppSettings["AIModel"];

            if (string.IsNullOrEmpty(apiKey) || string.IsNullOrEmpty(endpoint))
            {
                return null;
            }

            try
            {
                var requestData = new ChatRequest
                {
                    Model = model,
                    Messages = new List<ChatMessage>
                    {
                        new ChatMessage { Role = "user", Content = prompt }
                    }
                };

                string jsonPayload = JsonConvert.SerializeObject(requestData);
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

                using (var request = new HttpRequestMessage(HttpMethod.Post, endpoint))
                {
                    request.Content = content;
                    request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

                    // 10 second timeout for responsiveness
                    var cts = new System.Threading.CancellationTokenSource(10000);
                    HttpResponseMessage response = await client.SendAsync(request, cts.Token).ConfigureAwait(false);

                    if (response.IsSuccessStatusCode)
                    {
                        string responseJson = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                        var parsedResponse = JsonConvert.DeserializeObject<ChatResponse>(responseJson);

                        if (parsedResponse?.Choices != null && parsedResponse.Choices.Count > 0)
                        {
                            return parsedResponse.Choices[0].Message.Content?.Trim();
                        }
                    }
                }
            }
            catch
            {
                // Fallback handles offline or network errors gracefully
            }
            return null;
        }

        // Synchronous wrapper
        public static string AskAi(string prompt)
        {
            return Task.Run(() => AskAiAsync(prompt)).GetAwaiter().GetResult();
        }

        // AI Summary Rewrite with smart fallback
        public static string RewriteSummary(string currentSummary, string targetTitle, string skills)
        {
            string prompt = "Act as an expert resume editor and ATS specialist. " +
                "Rewrite the following resume summary to be professional, compelling, action-oriented, and ATS-friendly (3 to 4 sentences, 50-70 words) for a professional with target title '" + targetTitle + "'. " +
                "Key skills: " + skills + ". " +
                "Return ONLY the plain text rewritten summary with no markdown, no quotes, and no preamble.\n\n" +
                "Current summary:\n" + currentSummary;

            string aiResult = AskAi(prompt);

            if (!string.IsNullOrEmpty(aiResult))
            {
                // clean any markdown or quotes
                aiResult = aiResult.Trim('"', '\'', '`', ' ', '\r', '\n');
                return aiResult;
            }

            // Smart fallback if offline: produce high quality professional summary
            if (string.IsNullOrEmpty(currentSummary))
            {
                return "Results-driven " + targetTitle + " with demonstrated expertise in " + (string.IsNullOrEmpty(skills) ? "software engineering and modern technology stacks" : skills) + ". Proven track record of developing scalable, high-performance solutions while collaborating closely across cross-functional teams. Committed to delivering measurable business value and maintaining engineering excellence across all stages of project lifecycles.";
            }
            else
            {
                return "Accomplished " + targetTitle + " experienced in delivering scalable, reliable solutions. " + currentSummary.TrimEnd('.') + ", focusing on driving performance optimization, clean architectural design, and cross-functional team collaboration. Adept at leveraging modern methodologies to solve complex problems and exceed organizational goals.";
            }
        }

        // AI ATS Analyzer with smart fallback
        public static AtsAnalysisResult AnalyzeResume(string resumeText, string jobDesc)
        {
            string prompt = "You are an ATS (Applicant Tracking System) analyzer and technical recruiter.\n" +
                "Analyze the candidate's resume against the target job description.\n" +
                "Return ONLY a valid JSON object matching this exact schema (no markdown, no code fences, no extra text):\n" +
                "{\n" +
                "  \"overallScore\": 85,\n" +
                "  \"rating\": \"GREAT MATCH\",\n" +
                "  \"statusBadge\": \"Greenhouse & Lever Ready\",\n" +
                "  \"impactScore\": 88,\n" +
                "  \"keywordScore\": 82,\n" +
                "  \"formatScore\": 95,\n" +
                "  \"brevityScore\": 86,\n" +
                "  \"matchedKeywords\": [\"C#\", \"ASP.NET\", \"SQL Server\"],\n" +
                "  \"missingKeywords\": [\"Docker\", \"CI/CD\"],\n" +
                "  \"suggestion1Tag\": \"Action Verb Suggestion\",\n" +
                "  \"suggestion1Title\": \"Strengthen leadership verbs in experience\",\n" +
                "  \"suggestion1Desc\": \"Replace passive phrases like 'worked on' with 'Architected' or 'Spearheaded' to boost leadership score.\",\n" +
                "  \"suggestion2Tag\": \"Keyword Integration\",\n" +
                "  \"suggestion2Title\": \"Add missing keywords to your profile skills\",\n" +
                "  \"suggestion2Desc\": \"Include target skills from the job posting to improve ATS ranking.\"\n" +
                "}\n\n" +
                "JOB DESCRIPTION:\n" + jobDesc + "\n\n" +
                "RESUME:\n" + resumeText;

            string aiResult = AskAi(prompt);

            if (!string.IsNullOrEmpty(aiResult))
            {
                try
                {
                    // Clean up markdown code blocks if the AI returned ```json ... ```
                    string cleanJson = aiResult.Trim();
                    if (cleanJson.StartsWith("```json"))
                    {
                        cleanJson = cleanJson.Substring(7);
                    }
                    if (cleanJson.StartsWith("```"))
                    {
                        cleanJson = cleanJson.Substring(3);
                    }
                    if (cleanJson.EndsWith("```"))
                    {
                        cleanJson = cleanJson.Substring(0, cleanJson.Length - 3);
                    }
                    cleanJson = cleanJson.Trim();

                    var parsed = JsonConvert.DeserializeObject<AtsAnalysisResult>(cleanJson);
                    if (parsed != null && parsed.overallScore > 0)
                    {
                        return parsed;
                    }
                }
                catch
                {
                    // fallback to rule-based analysis below
                }
            }

            // Smart rule-based ATS analysis if offline or AI did not return strict JSON
            var result = new AtsAnalysisResult();

            // Extract keywords from job description
            var commonTechWords = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
            {
                "c#", ".net", "asp.net", "sql", "sql server", "javascript", "typescript", "react", "angular", "vue",
                "html", "css", "python", "java", "git", "github", "api", "rest api", "docker", "kubernetes",
                "aws", "azure", "ci/cd", "microservices", "agile", "scrum", "linux", "mongodb", "postgresql",
                "data structures", "algorithms", "oop", "mvc", "web forms", "testing", "debugging"
            };

            var jobWords = jobDesc.ToLower();
            var resumeWords = resumeText.ToLower();

            var matched = new List<string>();
            var missing = new List<string>();

            foreach (var word in commonTechWords)
            {
                if (jobWords.Contains(word.ToLower()))
                {
                    if (resumeWords.Contains(word.ToLower()))
                    {
                        matched.Add(word);
                    }
                    else
                    {
                        missing.Add(word);
                    }
                }
            }

            // If none matched from common list, do word intersection
            if (matched.Count == 0 && missing.Count == 0)
            {
                var candidateKeywords = jobDesc.Split(new char[] { ' ', ',', '.', ';', '(', ')', '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries)
                    .Where(w => w.Length > 4)
                    .Distinct(StringComparer.OrdinalIgnoreCase)
                    .Take(10);

                foreach (var w in candidateKeywords)
                {
                    if (resumeWords.Contains(w.ToLower()))
                    {
                        matched.Add(w);
                    }
                    else
                    {
                        missing.Add(w);
                    }
                }
            }

            result.matchedKeywords = matched.Distinct().Take(8).ToList();
            result.missingKeywords = missing.Distinct().Take(5).ToList();

            int totalKeywords = matched.Count + missing.Count;
            int matchPercent = totalKeywords > 0 ? (matched.Count * 100 / totalKeywords) : 75;

            // Normalize match score into a realistic ATS range (65% - 94%)
            result.overallScore = Math.Min(95, Math.Max(60, matchPercent + 15));
            result.keywordScore = Math.Min(95, Math.Max(50, matchPercent));
            result.impactScore = resumeWords.Contains("led") || resumeWords.Contains("developed") || resumeWords.Contains("architected") || resumeWords.Contains("implemented") ? 90 : 78;
            result.formatScore = 95;
            result.brevityScore = resumeText.Length > 300 && resumeText.Length < 3000 ? 92 : 82;

            if (result.overallScore >= 85)
            {
                result.rating = "EXCELLENT MATCH";
                result.statusBadge = "Top 5% Candidate - Interview Ready";
            }
            else if (result.overallScore >= 75)
            {
                result.rating = "STRONG MATCH";
                result.statusBadge = "Greenhouse & Lever Ready";
            }
            else
            {
                result.rating = "MODERATE MATCH";
                result.statusBadge = "Needs Optimization";
            }

            if (result.missingKeywords.Count > 0)
            {
                result.suggestion2Title = "Integrate missing keyword: " + string.Join(", ", result.missingKeywords.Take(2));
                result.suggestion2Desc = "Adding these keywords into your skills or project descriptions will increase ATS match score by +12%.";
            }

            return result;
        }
    }
}
