using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AI_Resume_WebApplication
{
    public partial class Analyzer : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // open sql connection
        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // check user login
            if (Session["userId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Website site = Master as Website;
            if (site != null)
            {
                site.EnableAppLayout();
            }

            if (!IsPostBack)
            {
                // load user's target title for comparison header
                try
                {
                    getCon();
                    da = new SqlDataAdapter("select ProfessionalTitle from CareerProfile where UserId='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    con.Close();

                    if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["ProfessionalTitle"] != DBNull.Value)
                    {
                        string title = ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString();
                        if (!string.IsNullOrEmpty(title))
                        {
                            lblComparedJob.Text = title + " Posting";
                        }
                    }
                }
                catch
                {
                    if (con != null && con.State == ConnectionState.Open) con.Close();
                }
            }
        }

        // scan resume against job description using AI
        protected void btnAnalyze_Click(object sender, EventArgs e)
        {
            lblAnalyzerStatus.Visible = false;

            string jobDesc = txtJobDescription.Text.Trim();

            if (string.IsNullOrEmpty(jobDesc))
            {
                lblAnalyzerStatus.Text = "Please enter or paste a Target Job Description.";
                lblAnalyzerStatus.CssClass = "badge badge-warning";
                lblAnalyzerStatus.Visible = true;
                return;
            }

            // Assemble resume content
            StringBuilder resumeText = new StringBuilder();

            // Check if user uploaded a text file
            if (fileResumeUpload.HasFile)
            {
                string extension = Path.GetExtension(fileResumeUpload.FileName).ToLower();
                if (extension == ".txt")
                {
                    using (StreamReader reader = new StreamReader(fileResumeUpload.FileContent))
                    {
                        resumeText.Append(reader.ReadToEnd());
                    }
                }
            }

            // If no text file uploaded, pull user's real saved profile data from database
            if (resumeText.Length == 0)
            {
                try
                {
                    getCon();

                    // 1. User Info
                    da = new SqlDataAdapter("select FullName, Email from Users where Id='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        resumeText.AppendLine("NAME: " + ds.Tables[0].Rows[0]["FullName"]);
                        resumeText.AppendLine("EMAIL: " + ds.Tables[0].Rows[0]["Email"]);
                    }

                    // 2. Career Profile
                    da = new SqlDataAdapter("select ProfessionalTitle, ProfessionalSummary from CareerProfile where UserId='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        resumeText.AppendLine("TITLE: " + ds.Tables[0].Rows[0]["ProfessionalTitle"]);
                        resumeText.AppendLine("SUMMARY: " + ds.Tables[0].Rows[0]["ProfessionalSummary"]);
                    }

                    // 3. Skills
                    da = new SqlDataAdapter("select SkillName from Skills where UserId='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    var skills = new List<string>();
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        skills.Add(row["SkillName"].ToString());
                    }
                    if (skills.Count > 0)
                    {
                        resumeText.AppendLine("SKILLS: " + string.Join(", ", skills));
                    }

                    // 4. Experience
                    da = new SqlDataAdapter("select JobTitle, CompanyName, Description from Experience where UserId='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        resumeText.AppendLine("EXPERIENCE:");
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            resumeText.AppendLine("- " + row["JobTitle"] + " at " + row["CompanyName"] + ": " + row["Description"]);
                        }
                    }

                    // 5. Education
                    da = new SqlDataAdapter("select Degree, FieldOfStudy, Institution from Education where UserId='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        resumeText.AppendLine("EDUCATION:");
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            resumeText.AppendLine("- " + row["Degree"] + " in " + row["FieldOfStudy"] + " from " + row["Institution"]);
                        }
                    }

                    con.Close();
                }
                catch
                {
                    if (con != null && con.State == ConnectionState.Open) con.Close();
                }
            }

            // Perform AI ATS analysis
            AtsAnalysisResult result = AiHelper.AnalyzeResume(resumeText.ToString(), jobDesc);

            // Store in session for auto-fix actions
            Session["LatestAtsResult"] = result;

            // Display results on screen
            DisplayAtsResult(result);

            lblAnalyzerStatus.Text = "✅ Document scanned & ATS match computed!";
            lblAnalyzerStatus.CssClass = "badge badge-success";
            lblAnalyzerStatus.Visible = true;
        }

        // populate UI with analysis results
        private void DisplayAtsResult(AtsAnalysisResult result)
        {
            if (result == null) return;

            // Overall score & rating
            lblOverallScore.Text = result.overallScore + "%";
            lblScoreRating.Text = result.rating;
            lblAtsStatus.Text = result.statusBadge;

            // Category progress bars
            lblImpactScore.Text = result.impactScore + "/100";
            pbImpact.Style["width"] = result.impactScore + "%";

            lblKeywordScore.Text = result.keywordScore + "/100";
            pbKeyword.Style["width"] = result.keywordScore + "%";

            lblFormatScore.Text = result.formatScore + "/100";
            pbFormat.Style["width"] = result.formatScore + "%";

            lblBrevityScore.Text = result.brevityScore + "/100";
            pbBrevity.Style["width"] = result.brevityScore + "%";

            // Matched keywords
            if (result.matchedKeywords != null && result.matchedKeywords.Count > 0)
            {
                StringBuilder sbMatched = new StringBuilder();
                foreach (string kw in result.matchedKeywords)
                {
                    sbMatched.Append("<span class=\"badge badge-purple\">" + HttpUtility.HtmlEncode(kw) + "</span> ");
                }
                litMatchedKeywords.Text = sbMatched.ToString();
            }
            else
            {
                litMatchedKeywords.Text = "<span style=\"color:var(--text-muted); font-size:12px;\">No matching keywords found</span>";
            }

            // Recommended missing keywords
            if (result.missingKeywords != null && result.missingKeywords.Count > 0)
            {
                StringBuilder sbMissing = new StringBuilder();
                foreach (string kw in result.missingKeywords)
                {
                    sbMissing.Append("<span class=\"badge badge-warning\">" + HttpUtility.HtmlEncode(kw) + "</span> ");
                }
                litRecommendedKeywords.Text = sbMissing.ToString();
            }
            else
            {
                litRecommendedKeywords.Text = "<span style=\"color:var(--color-success); font-size:12px;\">&check; All target keywords matched!</span>";
            }

            // Actionable suggestions
            lblSugTag1.Text = result.suggestion1Tag;
            lblSugTitle1.Text = result.suggestion1Title;
            lblSugDesc1.Text = result.suggestion1Desc;

            lblSugTag2.Text = result.suggestion2Tag;
            lblSugTitle2.Text = result.suggestion2Title;
            lblSugDesc2.Text = result.suggestion2Desc;
        }

        // apply suggested improvements to database
        protected void btnAutoFix_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string arg = btn?.CommandArgument ?? "1";

            AtsAnalysisResult result = Session["LatestAtsResult"] as AtsAnalysisResult;

            if (arg == "1")
            {
                // Auto-fix 1: Enhance summary with action verbs
                try
                {
                    getCon();
                    da = new SqlDataAdapter("select ProfessionalTitle, ProfessionalSummary from CareerProfile where UserId='" + Session["userId"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    string title = "Software Developer";
                    string summary = "";

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        title = ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString();
                        summary = ds.Tables[0].Rows[0]["ProfessionalSummary"].ToString();
                    }

                    string improved = AiHelper.RewriteSummary(summary, title, "Executive Leadership, System Architecture, Agile Delivery");

                    SqlCommand cmd = new SqlCommand("update CareerProfile set ProfessionalSummary=@summary where UserId=@userId", con);
                    cmd.Parameters.AddWithValue("@summary", improved);
                    cmd.Parameters.AddWithValue("@userId", Session["userId"]);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblAnalyzerStatus.Text = "✨ Auto-Fix Applied: Professional summary rewritten with leadership action verbs!";
                    lblAnalyzerStatus.CssClass = "badge badge-success";
                    lblAnalyzerStatus.Visible = true;

                    // increase impact score
                    if (result != null)
                    {
                        result.impactScore = Math.Min(98, result.impactScore + 8);
                        result.overallScore = Math.Min(98, result.overallScore + 4);
                        DisplayAtsResult(result);
                    }
                }
                catch
                {
                    if (con != null && con.State == ConnectionState.Open) con.Close();
                }
            }
            else if (arg == "2")
            {
                // Auto-fix 2: Add missing keywords to Skills table
                if (result != null && result.missingKeywords != null && result.missingKeywords.Count > 0)
                {
                    string skillToAdd = result.missingKeywords[0];

                    try
                    {
                        getCon();
                        // check if skill already exists
                        da = new SqlDataAdapter("select SkillId from Skills where UserId='" + Session["userId"] + "' and SkillName='" + skillToAdd.Replace("'", "''") + "'", con);
                        ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count == 0)
                        {
                            SqlCommand cmd = new SqlCommand("insert into Skills(UserId, SkillName, SkillCategory, SkillLevel) values(@userId, @name, 'Technical', 'Intermediate')", con);
                            cmd.Parameters.AddWithValue("@userId", Session["userId"]);
                            cmd.Parameters.AddWithValue("@name", skillToAdd);
                            cmd.ExecuteNonQuery();
                        }
                        con.Close();

                        // Move skill from missing to matched
                        result.missingKeywords.RemoveAt(0);
                        result.matchedKeywords.Add(skillToAdd);
                        result.keywordScore = Math.Min(98, result.keywordScore + 10);
                        result.overallScore = Math.Min(98, result.overallScore + 5);

                        DisplayAtsResult(result);

                        lblAnalyzerStatus.Text = "✨ Auto-Fix Applied: Added '" + skillToAdd + "' to your Skills profile!";
                        lblAnalyzerStatus.CssClass = "badge badge-success";
                        lblAnalyzerStatus.Visible = true;
                    }
                    catch
                    {
                        if (con != null && con.State == ConnectionState.Open) con.Close();
                    }
                }
            }
        }
    }
}
