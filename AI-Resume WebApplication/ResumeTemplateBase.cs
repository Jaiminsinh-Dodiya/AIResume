using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;

namespace AI_Resume_WebApplication
{
    // Model class to hold resume data
    public class ResumeData
    {
        public string FullName = "";
        public string JobTitle = "";
        public string Email = "";
        public string Phone = "";
        public string Location = "";
        public string LinkedIn = "";
        public string Portfolio = "";
        public string Summary = "";
        public List<string> Skills = new List<string>();
        public DataTable Education;
        public DataTable Experience;
    }

    // Renders authentic, real-world, high-impact resumes
    public static class ResumeTemplateBase
    {
        // Clean inline SVG Icons
        private static string SvgEmail() => "<svg class=\"resume-icon\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><rect width=\"20\" height=\"16\" x=\"2\" y=\"4\" rx=\"2\"/><path d=\"m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7\"/></svg>";
        private static string SvgPhone() => "<svg class=\"resume-icon\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z\"/></svg>";
        private static string SvgLocation() => "<svg class=\"resume-icon\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z\"/><circle cx=\"12\" cy=\"10\" r=\"3\"/></svg>";
        private static string SvgLinkedIn() => "<svg class=\"resume-icon\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z\"/><rect width=\"4\" height=\"12\" x=\"2\" y=\"9\"/><circle cx=\"4\" cy=\"4\" r=\"2\"/></svg>";
        private static string SvgPortfolio() => "<svg class=\"resume-icon\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"12\" r=\"10\"/><path d=\"M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20\"/><path d=\"M2 12h20\"/></svg>";

        private static bool HasRows(DataTable table)
        {
            return table != null && table.Rows.Count > 0;
        }

        private static string DateRange(DataRow row)
        {
            string start = "";
            string end = "Present";

            if (row.Table.Columns.Contains("StartDate") && row["StartDate"] != DBNull.Value)
            {
                start = Convert.ToDateTime(row["StartDate"]).ToString("MMM yyyy");
            }
            if (row.Table.Columns.Contains("IsCurrent") && row["IsCurrent"] != DBNull.Value && Convert.ToBoolean(row["IsCurrent"]))
            {
                end = "Present";
            }
            else if (row.Table.Columns.Contains("EndDate") && row["EndDate"] != DBNull.Value)
            {
                end = Convert.ToDateTime(row["EndDate"]).ToString("MMM yyyy");
            }

            if (string.IsNullOrEmpty(start)) return "";
            return start + " &ndash; " + end;
        }

        private static string Bullets(string text)
        {
            if (string.IsNullOrWhiteSpace(text)) return "";

            StringBuilder sb = new StringBuilder();
            string[] lines = text.Split(new char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);

            if (lines.Length == 0) return "";

            sb.Append("<ul>");
            foreach (string line in lines)
            {
                string clean = line.TrimStart('-', '*', '•', ' ').Trim();
                if (!string.IsNullOrEmpty(clean))
                {
                    sb.Append("<li>" + HttpUtility.HtmlEncode(clean) + "</li>");
                }
            }
            sb.Append("</ul>");
            return sb.ToString();
        }

        // Return embedded CSS styles to guarantee 100% visual fidelity and zero cache issues
        private static string GetEmbeddedStyles(string primaryColor)
        {
            if (string.IsNullOrEmpty(primaryColor)) primaryColor = "#2563eb";

            return "<style>\n" +
                ":root { --resume-primary-color: " + primaryColor + "; }\n" +
                ".resume-container { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; color: #1E293B; background: #FFFFFF; width: 100%; box-sizing: border-box; line-height: 1.5; font-size: 9.5pt; text-align: left; }\n" +
                ".resume-container * { box-sizing: border-box; margin: 0; padding: 0; }\n" +
                ".resume-container ul { margin: 6px 0 6px 18px; padding: 0; list-style-type: disc; }\n" +
                ".resume-container li { margin-bottom: 4px; font-size: 9.5pt; line-height: 1.55; color: #334155; }\n" +
                ".resume-icon { width: 13px; height: 13px; display: inline-block; vertical-align: middle; margin-right: 4px; color: #64748B; flex-shrink: 0; }\n" +

                // 1. Modern Styles
                ".res-modern { padding: 36px 42px; position: relative; }\n" +
                ".res-modern .header { border-bottom: 2px solid #E2E8F0; padding-bottom: 16px; margin-bottom: 20px; position: relative; }\n" +
                ".res-modern .header::before { content: ''; position: absolute; top: -36px; left: -42px; right: -42px; height: 6px; background: var(--resume-primary-color); }\n" +
                ".res-modern .name { font-size: 24pt; font-weight: 800; color: #0F172A; letter-spacing: -0.5px; line-height: 1.15; margin-bottom: 4px; }\n" +
                ".res-modern .title { font-size: 10.5pt; font-weight: 600; color: var(--resume-primary-color); text-transform: uppercase; letter-spacing: 1.2px; margin-bottom: 12px; }\n" +
                ".res-modern .contact-row { display: flex; flex-wrap: wrap; align-items: center; gap: 14px; font-size: 8.5pt; color: #64748B; }\n" +
                ".res-modern .contact-item { display: inline-flex; align-items: center; gap: 4px; }\n" +
                ".res-modern .section { margin-bottom: 20px; }\n" +
                ".res-modern .sec-title { font-size: 10.5pt; font-weight: 800; color: #0F172A; text-transform: uppercase; letter-spacing: 1.2px; display: flex; align-items: center; gap: 10px; margin-bottom: 12px; }\n" +
                ".res-modern .sec-title::after { content: ''; flex: 1; height: 1.5px; background: #E2E8F0; }\n" +
                ".res-modern .summary { font-size: 9.5pt; color: #334155; line-height: 1.65; text-align: justify; }\n" +
                ".res-modern .item { margin-bottom: 14px; }\n" +
                ".res-modern .item:last-child { margin-bottom: 0; }\n" +
                ".res-modern .item-header { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 3px; }\n" +
                ".res-modern .item-role { font-size: 10.5pt; font-weight: 700; color: #0F172A; }\n" +
                ".res-modern .item-sub { font-size: 9.5pt; font-weight: 600; color: var(--resume-primary-color); }\n" +
                ".res-modern .item-date { font-size: 8.5pt; font-weight: 600; color: #64748B; background: #F1F5F9; padding: 2px 8px; border-radius: 4px; }\n" +
                ".res-modern .skills-wrap { display: flex; flex-wrap: wrap; gap: 6px; }\n" +
                ".res-modern .skill-pill { background: #F8FAFC; border: 1px solid #CBD5E1; color: #1E293B; padding: 4px 10px; border-radius: 6px; font-size: 8.5pt; font-weight: 600; }\n" +

                // 2. Executive Styles
                ".res-exec { padding: 40px 48px; }\n" +
                ".res-exec .header { text-align: center; border-bottom: 2px solid #0F172A; padding-bottom: 16px; margin-bottom: 22px; }\n" +
                ".res-exec .name { font-family: 'Playfair Display', Georgia, serif; font-size: 26pt; font-weight: 700; color: #0F172A; letter-spacing: 0.5px; margin-bottom: 4px; }\n" +
                ".res-exec .title { font-size: 10.5pt; font-weight: 600; color: var(--resume-primary-color); text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px; }\n" +
                ".res-exec .contact-row { display: flex; justify-content: center; align-items: center; flex-wrap: wrap; gap: 10px; font-size: 8.5pt; color: #475569; }\n" +
                ".res-exec .contact-row .dot { color: #94A3B8; font-size: 9pt; }\n" +
                ".res-exec .section { margin-bottom: 20px; }\n" +
                ".res-exec .sec-title { font-size: 10.5pt; font-weight: 700; color: #0F172A; text-transform: uppercase; letter-spacing: 1.5px; border-bottom: 1px solid #CBD5E1; padding-bottom: 4px; margin-bottom: 12px; }\n" +
                ".res-exec .summary { font-size: 9.5pt; color: #334155; line-height: 1.65; text-align: justify; }\n" +
                ".res-exec .item { margin-bottom: 14px; }\n" +
                ".res-exec .item:last-child { margin-bottom: 0; }\n" +
                ".res-exec .item-header { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 2px; }\n" +
                ".res-exec .item-role strong { font-size: 10.5pt; font-weight: 700; color: #0F172A; }\n" +
                ".res-exec .item-sub { font-size: 9.5pt; font-style: italic; color: #475569; }\n" +
                ".res-exec .item-date { font-size: 8.5pt; font-weight: 600; color: #64748B; }\n" +
                ".res-exec .skills-wrap { display: flex; flex-wrap: wrap; gap: 8px; }\n" +
                ".res-exec .skill-pill { background: #F8FAFC; border-left: 3px solid var(--resume-primary-color); padding: 3px 10px; font-size: 8.5pt; font-weight: 600; color: #1E293B; }\n" +

                // 3. Minimalist Styles
                ".res-mini { padding: 38px 42px; }\n" +
                ".res-mini .header { display: flex; justify-content: space-between; align-items: flex-start; border-bottom: 1px solid #E2E8F0; padding-bottom: 16px; margin-bottom: 20px; gap: 16px; }\n" +
                ".res-mini .name { font-size: 24pt; font-weight: 800; color: #0F172A; letter-spacing: -0.6px; margin-bottom: 2px; }\n" +
                ".res-mini .title { font-size: 10.5pt; font-weight: 600; color: var(--resume-primary-color); letter-spacing: 0.5px; }\n" +
                ".res-mini .contact-col { display: flex; flex-direction: column; gap: 4px; text-align: right; font-size: 8.5pt; color: #64748B; }\n" +
                ".res-mini .section { margin-bottom: 20px; }\n" +
                ".res-mini .sec-title { font-size: 10.5pt; font-weight: 700; color: #0F172A; text-transform: uppercase; letter-spacing: 1px; border-left: 3.5px solid var(--resume-primary-color); padding-left: 8px; margin-bottom: 12px; }\n" +
                ".res-mini .summary { font-size: 9.5pt; color: #334155; line-height: 1.65; }\n" +
                ".res-mini .item { margin-bottom: 14px; }\n" +
                ".res-mini .item:last-child { margin-bottom: 0; }\n" +
                ".res-mini .item-header { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 2px; }\n" +
                ".res-mini .item-role { font-size: 10.5pt; font-weight: 700; color: #0F172A; }\n" +
                ".res-mini .item-sub { font-size: 9.5pt; color: #64748B; }\n" +
                ".res-mini .item-date { font-size: 8.5pt; font-weight: 600; color: var(--resume-primary-color); }\n" +
                ".res-mini .skills-wrap { display: flex; flex-wrap: wrap; gap: 6px; }\n" +
                ".res-mini .skill-pill { background: #F1F5F9; border: 1px solid #E2E8F0; padding: 3px 9px; border-radius: 4px; font-size: 8.5pt; font-weight: 600; color: #334155; }\n" +
                "</style>\n";
        }

        // Main render method
        public static string RenderTemplate(string templateId, string primaryColor, ResumeData data)
        {
            if (string.IsNullOrEmpty(templateId)) templateId = "modern";
            if (string.IsNullOrEmpty(primaryColor)) primaryColor = "#2563eb";

            StringBuilder sb = new StringBuilder();
            sb.Append(GetEmbeddedStyles(primaryColor));

            if (templateId == "executive")
            {
                sb.Append(RenderExecutive(data));
            }
            else if (templateId == "minimalist")
            {
                sb.Append(RenderMinimalist(data));
            }
            else
            {
                sb.Append(RenderModern(data));
            }

            return sb.ToString();
        }

        // ====================================================================
        // 1. MODERN (NOVA) - Clean Professional Tech Resume
        // ====================================================================
        private static string RenderModern(ResumeData data)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class=\"resume-container res-modern\">");

            // Header
            sb.Append("<div class=\"header\">");
            sb.Append("<h1 class=\"name\">" + data.FullName + "</h1>");
            if (!string.IsNullOrEmpty(data.JobTitle))
            {
                sb.Append("<div class=\"title\">" + data.JobTitle + "</div>");
            }

            // Contact Row
            sb.Append("<div class=\"contact-row\">");
            if (!string.IsNullOrEmpty(data.Email)) sb.Append("<span class=\"contact-item\">" + SvgEmail() + data.Email + "</span>");
            if (!string.IsNullOrEmpty(data.Phone)) sb.Append("<span class=\"contact-item\">" + SvgPhone() + data.Phone + "</span>");
            if (!string.IsNullOrEmpty(data.Location)) sb.Append("<span class=\"contact-item\">" + SvgLocation() + data.Location + "</span>");
            if (!string.IsNullOrEmpty(data.LinkedIn)) sb.Append("<span class=\"contact-item\">" + SvgLinkedIn() + data.LinkedIn + "</span>");
            if (!string.IsNullOrEmpty(data.Portfolio)) sb.Append("<span class=\"contact-item\">" + SvgPortfolio() + data.Portfolio + "</span>");
            sb.Append("</div></div>");

            // Professional Summary
            if (!string.IsNullOrEmpty(data.Summary))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Professional Summary</div>");
                sb.Append("<p class=\"summary\">" + data.Summary + "</p>");
                sb.Append("</div>");
            }

            // Work Experience
            if (HasRows(data.Experience))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Work Experience</div>");

                foreach (DataRow row in data.Experience.Rows)
                {
                    string title = HttpUtility.HtmlEncode(row["JobTitle"].ToString());
                    string company = HttpUtility.HtmlEncode(row["CompanyName"].ToString());
                    string date = DateRange(row);
                    string desc = row["Description"].ToString();

                    sb.Append("<div class=\"item\">");
                    sb.Append("<div class=\"item-header\">");
                    sb.Append("<div><span class=\"item-role\">" + title + "</span> &bull; <span class=\"item-sub\">" + company + "</span></div>");
                    if (!string.IsNullOrEmpty(date)) sb.Append("<span class=\"item-date\">" + date + "</span>");
                    sb.Append("</div>");
                    sb.Append(Bullets(desc));
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            // Education
            if (HasRows(data.Education))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Education</div>");

                foreach (DataRow row in data.Education.Rows)
                {
                    string degree = HttpUtility.HtmlEncode(row["Degree"].ToString());
                    string field = row.Table.Columns.Contains("FieldOfStudy") ? row["FieldOfStudy"].ToString() : "";
                    if (!string.IsNullOrEmpty(field)) degree += ", " + HttpUtility.HtmlEncode(field);
                    string inst = HttpUtility.HtmlEncode(row["Institution"].ToString());
                    string date = DateRange(row);
                    string grade = row.Table.Columns.Contains("Grade") ? row["Grade"].ToString() : "";

                    sb.Append("<div class=\"item\">");
                    sb.Append("<div class=\"item-header\">");
                    sb.Append("<div><span class=\"item-role\">" + degree + "</span> &bull; <span class=\"item-sub\">" + inst + "</span></div>");
                    if (!string.IsNullOrEmpty(date)) sb.Append("<span class=\"item-date\">" + date + "</span>");
                    sb.Append("</div>");
                    if (!string.IsNullOrEmpty(grade)) sb.Append("<div style=\"font-size:8.5pt; color:#64748B; margin-top:2px;\">Grade: " + HttpUtility.HtmlEncode(grade) + "</div>");
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            // Skills
            if (data.Skills != null && data.Skills.Count > 0)
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Technical Skills</div>");
                sb.Append("<div class=\"skills-wrap\">");
                foreach (string skill in data.Skills)
                {
                    sb.Append("<span class=\"skill-pill\">" + skill + "</span>");
                }
                sb.Append("</div></div>");
            }

            sb.Append("</div>");
            return sb.ToString();
        }

        // ====================================================================
        // 2. EXECUTIVE (PRESTIGE) - Harvard & Ivy League Classic
        // ====================================================================
        private static string RenderExecutive(ResumeData data)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class=\"resume-container res-exec\">");

            // Header
            sb.Append("<div class=\"header\">");
            sb.Append("<h1 class=\"name\">" + data.FullName + "</h1>");
            if (!string.IsNullOrEmpty(data.JobTitle))
            {
                sb.Append("<div class=\"title\">" + data.JobTitle + "</div>");
            }

            // Centered Contact Row with dots
            List<string> contactList = new List<string>();
            if (!string.IsNullOrEmpty(data.Email)) contactList.Add("<span>" + SvgEmail() + data.Email + "</span>");
            if (!string.IsNullOrEmpty(data.Phone)) contactList.Add("<span>" + SvgPhone() + data.Phone + "</span>");
            if (!string.IsNullOrEmpty(data.Location)) contactList.Add("<span>" + SvgLocation() + data.Location + "</span>");
            if (!string.IsNullOrEmpty(data.LinkedIn)) contactList.Add("<span>" + SvgLinkedIn() + data.LinkedIn + "</span>");
            if (!string.IsNullOrEmpty(data.Portfolio)) contactList.Add("<span>" + SvgPortfolio() + data.Portfolio + "</span>");

            sb.Append("<div class=\"contact-row\">");
            sb.Append(string.Join(" <span class=\"dot\">&bull;</span> ", contactList.ToArray()));
            sb.Append("</div>");
            sb.Append("</div>");

            // Executive Summary
            if (!string.IsNullOrEmpty(data.Summary))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Executive Summary</div>");
                sb.Append("<p class=\"summary\">" + data.Summary + "</p>");
                sb.Append("</div>");
            }

            // Work Experience
            if (HasRows(data.Experience))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Professional Experience</div>");

                foreach (DataRow row in data.Experience.Rows)
                {
                    string title = HttpUtility.HtmlEncode(row["JobTitle"].ToString());
                    string company = HttpUtility.HtmlEncode(row["CompanyName"].ToString());
                    string date = DateRange(row);
                    string desc = row["Description"].ToString();

                    sb.Append("<div class=\"item\">");
                    sb.Append("<div class=\"item-header\">");
                    sb.Append("<div class=\"item-role\"><strong>" + title + "</strong> &mdash; <span class=\"item-sub\">" + company + "</span></div>");
                    if (!string.IsNullOrEmpty(date)) sb.Append("<span class=\"item-date\">" + date + "</span>");
                    sb.Append("</div>");
                    sb.Append(Bullets(desc));
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            // Education
            if (HasRows(data.Education))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Education &amp; Credentials</div>");

                foreach (DataRow row in data.Education.Rows)
                {
                    string degree = HttpUtility.HtmlEncode(row["Degree"].ToString());
                    string field = row.Table.Columns.Contains("FieldOfStudy") ? row["FieldOfStudy"].ToString() : "";
                    if (!string.IsNullOrEmpty(field)) degree += ", " + HttpUtility.HtmlEncode(field);
                    string inst = HttpUtility.HtmlEncode(row["Institution"].ToString());
                    string date = DateRange(row);
                    string grade = row.Table.Columns.Contains("Grade") ? row["Grade"].ToString() : "";

                    sb.Append("<div class=\"item\">");
                    sb.Append("<div class=\"item-header\">");
                    sb.Append("<div class=\"item-role\"><strong>" + degree + "</strong> &mdash; <span class=\"item-sub\">" + inst + "</span></div>");
                    if (!string.IsNullOrEmpty(date)) sb.Append("<span class=\"item-date\">" + date + "</span>");
                    sb.Append("</div>");
                    if (!string.IsNullOrEmpty(grade)) sb.Append("<div style=\"font-size:8.5pt; color:#64748B; margin-top:2px;\">Academic Standing: " + HttpUtility.HtmlEncode(grade) + "</div>");
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            // Skills
            if (data.Skills != null && data.Skills.Count > 0)
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Core Competencies &amp; Technical Skills</div>");
                sb.Append("<div class=\"skills-wrap\">");
                foreach (string skill in data.Skills)
                {
                    sb.Append("<span class=\"skill-pill\">" + skill + "</span>");
                }
                sb.Append("</div></div>");
            }

            sb.Append("</div>");
            return sb.ToString();
        }

        // ====================================================================
        // 3. MINIMALIST (AURA) - Silicon Valley Clean Minimalist
        // ====================================================================
        private static string RenderMinimalist(ResumeData data)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class=\"resume-container res-mini\">");

            // Header
            sb.Append("<div class=\"header\">");
            sb.Append("<div>");
            sb.Append("<h1 class=\"name\">" + data.FullName + "</h1>");
            if (!string.IsNullOrEmpty(data.JobTitle))
            {
                sb.Append("<div class=\"title\">" + data.JobTitle + "</div>");
            }
            sb.Append("</div>");

            // Right Contact Column
            sb.Append("<div class=\"contact-col\">");
            if (!string.IsNullOrEmpty(data.Email)) sb.Append("<span>" + SvgEmail() + data.Email + "</span>");
            if (!string.IsNullOrEmpty(data.Phone)) sb.Append("<span>" + SvgPhone() + data.Phone + "</span>");
            if (!string.IsNullOrEmpty(data.Location)) sb.Append("<span>" + SvgLocation() + data.Location + "</span>");
            if (!string.IsNullOrEmpty(data.LinkedIn)) sb.Append("<span>" + SvgLinkedIn() + data.LinkedIn + "</span>");
            if (!string.IsNullOrEmpty(data.Portfolio)) sb.Append("<span>" + SvgPortfolio() + data.Portfolio + "</span>");
            sb.Append("</div></div>");

            // Profile Summary
            if (!string.IsNullOrEmpty(data.Summary))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Profile</div>");
                sb.Append("<p class=\"summary\">" + data.Summary + "</p>");
                sb.Append("</div>");
            }

            // Experience
            if (HasRows(data.Experience))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Experience</div>");

                foreach (DataRow row in data.Experience.Rows)
                {
                    string title = HttpUtility.HtmlEncode(row["JobTitle"].ToString());
                    string company = HttpUtility.HtmlEncode(row["CompanyName"].ToString());
                    string date = DateRange(row);
                    string desc = row["Description"].ToString();

                    sb.Append("<div class=\"item\">");
                    sb.Append("<div class=\"item-header\">");
                    sb.Append("<div><span class=\"item-role\">" + title + "</span> &bull; <span class=\"item-sub\">" + company + "</span></div>");
                    if (!string.IsNullOrEmpty(date)) sb.Append("<span class=\"item-date\">" + date + "</span>");
                    sb.Append("</div>");
                    sb.Append(Bullets(desc));
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            // Education
            if (HasRows(data.Education))
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Education</div>");

                foreach (DataRow row in data.Education.Rows)
                {
                    string degree = HttpUtility.HtmlEncode(row["Degree"].ToString());
                    string field = row.Table.Columns.Contains("FieldOfStudy") ? row["FieldOfStudy"].ToString() : "";
                    if (!string.IsNullOrEmpty(field)) degree += ", " + HttpUtility.HtmlEncode(field);
                    string inst = HttpUtility.HtmlEncode(row["Institution"].ToString());
                    string date = DateRange(row);
                    string grade = row.Table.Columns.Contains("Grade") ? row["Grade"].ToString() : "";

                    sb.Append("<div class=\"item\">");
                    sb.Append("<div class=\"item-header\">");
                    sb.Append("<div><span class=\"item-role\">" + degree + "</span> &bull; <span class=\"item-sub\">" + inst + "</span></div>");
                    if (!string.IsNullOrEmpty(date)) sb.Append("<span class=\"item-date\">" + date + "</span>");
                    sb.Append("</div>");
                    if (!string.IsNullOrEmpty(grade)) sb.Append("<div style=\"font-size:8.5pt; color:#64748B; margin-top:2px;\">Grade: " + HttpUtility.HtmlEncode(grade) + "</div>");
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            // Skills
            if (data.Skills != null && data.Skills.Count > 0)
            {
                sb.Append("<div class=\"section\">");
                sb.Append("<div class=\"sec-title\">Skills &amp; Technologies</div>");
                sb.Append("<div class=\"skills-wrap\">");
                foreach (string skill in data.Skills)
                {
                    sb.Append("<span class=\"skill-pill\">" + skill + "</span>");
                }
                sb.Append("</div></div>");
            }

            sb.Append("</div>");
            return sb.ToString();
        }
    }
}
