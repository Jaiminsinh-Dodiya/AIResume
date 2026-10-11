using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;

namespace AI_Resume_WebApplication
{
    // model class to hold resume data
    public class ResumeData
    {
        public string FullName;
        public string JobTitle;
        public string Email;
        public string Phone;
        public string Location;
        public string LinkedIn;
        public string Portfolio;
        public string Summary;
        public List<string> Skills = new List<string>();
        public DataTable Education;
        public DataTable Experience;
    }

    // renders resume data into html templates
    public static class ResumeTemplateBase
    {
        // check if datatable has rows
        static bool HasRows(DataTable table)
        {
            if (table == null)
            {
                return false;
            }
            return table.Rows.Count > 0;
        }

        // format start and end date range
        static string DateRange(DataRow row)
        {
            string start = "";
            string end = "Present";

            if (row["StartDate"] != DBNull.Value)
            {
                start = Convert.ToDateTime(row["StartDate"]).ToString("MMM yyyy");
            }
            if (row["EndDate"] != DBNull.Value)
            {
                end = Convert.ToDateTime(row["EndDate"]).ToString("MMM yyyy");
            }

            if (start == "")
            {
                return "";
            }
            return start + " - " + end;
        }

        // format job title and company
        static string ExperienceTitle(DataRow row)
        {
            return HttpUtility.HtmlEncode(row["JobTitle"].ToString()) + " - " + HttpUtility.HtmlEncode(row["CompanyName"].ToString());
        }

        // format degree and institution
        static string EducationTitle(DataRow row)
        {
            string text = HttpUtility.HtmlEncode(row["Degree"].ToString());
            string field = row["FieldOfStudy"].ToString();

            if (field != "")
            {
                text = text + ", " + HttpUtility.HtmlEncode(field);
            }
            return text + " - " + HttpUtility.HtmlEncode(row["Institution"].ToString());
        }

        // convert multiline text into html bullet points
        static string Bullets(string text)
        {
            StringBuilder sb = new StringBuilder();
            string[] lines = text.Split(new char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);

            if (lines.Length == 0)
            {
                return "";
            }

            sb.Append("<ul>");
            foreach (string line in lines)
            {
                sb.Append("<li>" + HttpUtility.HtmlEncode(line.TrimStart('-').Trim()) + "</li>");
            }
            sb.Append("</ul>");
            return sb.ToString();
        }

        // build contact details html
        static string ContactItems(ResumeData data)
        {
            string html = "";
            if (!string.IsNullOrEmpty(data.Email))
            {
                html = html + "<div class=\"contact-item\">" + data.Email + "</div>";
            }
            if (!string.IsNullOrEmpty(data.Phone))
            {
                html = html + "<div class=\"contact-item\">" + data.Phone + "</div>";
            }
            if (!string.IsNullOrEmpty(data.Location))
            {
                html = html + "<div class=\"contact-item\">" + data.Location + "</div>";
            }
            if (!string.IsNullOrEmpty(data.LinkedIn))
            {
                html = html + "<div class=\"contact-item\">" + data.LinkedIn + "</div>";
            }
            if (!string.IsNullOrEmpty(data.Portfolio))
            {
                html = html + "<div class=\"contact-item\">" + data.Portfolio + "</div>";
            }
            return html;
        }

        // main render method
        public static string RenderTemplate(string templateId, string primaryColor, ResumeData data)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<style>:root { --resume-primary-color: " + primaryColor + "; }</style>");
            sb.Append("<div class=\"resume-document template-" + templateId + "\">");

            if (templateId == "modern")
            {
                sb.Append(Modern(data));
            }
            else if (templateId == "executive")
            {
                sb.Append(Executive(data));
            }
            else
            {
                sb.Append(Minimalist(data));
            }

            sb.Append("</div>");
            return sb.ToString();
        }

        // modern template layout
        static string Modern(ResumeData data)
        {
            StringBuilder sb = new StringBuilder();

            // left sidebar: name, contact, skills
            sb.Append("<div class=\"nova-sidebar\">");
            sb.Append("<h1>" + data.FullName + "</h1>");
            sb.Append("<div class=\"job-title\">" + data.JobTitle + "</div>");
            sb.Append("<div class=\"section-title-side\">Contact</div>");
            sb.Append("<div class=\"contact-info\">" + ContactItems(data) + "</div>");

            if (data.Skills.Count > 0)
            {
                sb.Append("<div class=\"section-title-side\">Skills</div>");
                sb.Append("<div class=\"skills-wrap\">");
                foreach (string skill in data.Skills)
                {
                    sb.Append("<span class=\"skill-pill\">" + skill + "</span>");
                }
                sb.Append("</div>");
            }
            sb.Append("</div>");

            // main column: summary, experience, education
            sb.Append("<div class=\"nova-main\">");

            if (!string.IsNullOrEmpty(data.Summary))
            {
                sb.Append("<div class=\"section-title\">Profile</div>");
                sb.Append("<div class=\"summary-text\">" + data.Summary + "</div>");
            }

            if (HasRows(data.Experience))
            {
                sb.Append("<div class=\"section-title\">Experience</div>");
                sb.Append("<div class=\"timeline\">");
                foreach (DataRow row in data.Experience.Rows)
                {
                    sb.Append("<div class=\"timeline-item\">");
                    sb.Append("<div class=\"timeline-marker\"></div>");
                    sb.Append("<div class=\"timeline-header\">");
                    sb.Append("<h3>" + ExperienceTitle(row) + "</h3>");
                    sb.Append("<div class=\"timeline-date\">" + DateRange(row) + "</div>");
                    sb.Append("</div>");
                    sb.Append(Bullets(row["Description"].ToString()));
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            if (HasRows(data.Education))
            {
                sb.Append("<div class=\"section-title\">Education</div>");
                sb.Append("<div class=\"timeline\">");
                foreach (DataRow row in data.Education.Rows)
                {
                    sb.Append("<div class=\"timeline-item\">");
                    sb.Append("<div class=\"timeline-marker\"></div>");
                    sb.Append("<div class=\"timeline-header\">");
                    sb.Append("<h3>" + EducationTitle(row) + "</h3>");
                    sb.Append("<div class=\"timeline-date\">" + DateRange(row) + "</div>");
                    sb.Append("</div>");
                    if (row["Grade"].ToString() != "")
                    {
                        sb.Append(Bullets("Grade: " + row["Grade"].ToString()));
                    }
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            sb.Append("</div>");
            return sb.ToString();
        }

        // executive template layout
        static string Executive(ResumeData data)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<div style=\"width:100%;\">");
            sb.Append("<div class=\"header-top\">");
            sb.Append("<h1>" + data.FullName + "</h1>");
            sb.Append("<div class=\"job-title\">" + data.JobTitle + "</div>");
            sb.Append("<div class=\"contact-bar\">" + ContactItems(data) + "</div>");
            sb.Append("</div>");

            if (!string.IsNullOrEmpty(data.Summary))
            {
                sb.Append("<div class=\"section-title\">Profile</div>");
                sb.Append("<div class=\"summary-text\">" + data.Summary + "</div>");
            }

            if (HasRows(data.Experience))
            {
                sb.Append("<div class=\"section-title\">Experience</div>");
                foreach (DataRow row in data.Experience.Rows)
                {
                    sb.Append("<div class=\"exp-grid\">");
                    sb.Append("<div class=\"exp-date\">" + DateRange(row) + "</div>");
                    sb.Append("<div class=\"exp-content\">");
                    sb.Append("<h3>" + ExperienceTitle(row) + "</h3>");
                    sb.Append(Bullets(row["Description"].ToString()));
                    sb.Append("</div></div>");
                }
            }

            if (HasRows(data.Education))
            {
                sb.Append("<div class=\"section-title\">Education</div>");
                foreach (DataRow row in data.Education.Rows)
                {
                    sb.Append("<div class=\"exp-grid\">");
                    sb.Append("<div class=\"exp-date\">" + DateRange(row) + "</div>");
                    sb.Append("<div class=\"exp-content\">");
                    sb.Append("<h3>" + EducationTitle(row) + "</h3>");
                    if (row["Grade"].ToString() != "")
                    {
                        sb.Append(Bullets("Grade: " + row["Grade"].ToString()));
                    }
                    sb.Append("</div></div>");
                }
            }

            if (data.Skills.Count > 0)
            {
                sb.Append("<div class=\"section-title\">Skills</div>");
                sb.Append("<div class=\"skills-list\">" + string.Join(", ", data.Skills.ToArray()) + "</div>");
            }

            sb.Append("</div>");
            return sb.ToString();
        }

        // minimalist template layout
        static string Minimalist(ResumeData data)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<div class=\"aura-container\">");
            sb.Append("<div class=\"header-area\">");
            sb.Append("<div class=\"header-left\">");
            sb.Append("<h1>" + data.FullName + "</h1>");
            sb.Append("<div class=\"job-title\">" + data.JobTitle + "</div>");
            sb.Append("</div>");
            sb.Append("<div class=\"header-right\">" + ContactItems(data) + "</div>");
            sb.Append("</div>");

            if (!string.IsNullOrEmpty(data.Summary))
            {
                sb.Append("<div class=\"section-block\">");
                sb.Append("<div class=\"section-title\">About</div>");
                sb.Append("<div class=\"summary-text\">" + data.Summary + "</div>");
                sb.Append("</div>");
            }

            if (data.Skills.Count > 0)
            {
                sb.Append("<div class=\"section-block\">");
                sb.Append("<div class=\"section-title\">Skills</div>");
                sb.Append("<div class=\"skill-tags\">");
                foreach (string skill in data.Skills)
                {
                    sb.Append("<span class=\"skill-tag\">" + skill + "</span>");
                }
                sb.Append("</div></div>");
            }

            if (HasRows(data.Experience))
            {
                sb.Append("<div class=\"section-block\">");
                sb.Append("<div class=\"section-title\">Experience</div>");
                foreach (DataRow row in data.Experience.Rows)
                {
                    sb.Append("<div class=\"exp-item\">");
                    sb.Append("<div class=\"exp-header\">");
                    sb.Append("<div class=\"exp-title\">" + ExperienceTitle(row) + "</div>");
                    sb.Append("<div class=\"exp-date\">" + DateRange(row) + "</div>");
                    sb.Append("</div>");
                    sb.Append(Bullets(row["Description"].ToString()));
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            if (HasRows(data.Education))
            {
                sb.Append("<div class=\"section-block\">");
                sb.Append("<div class=\"section-title\">Education</div>");
                foreach (DataRow row in data.Education.Rows)
                {
                    sb.Append("<div class=\"exp-item\">");
                    sb.Append("<div class=\"exp-header\">");
                    sb.Append("<div class=\"exp-title\">" + EducationTitle(row) + "</div>");
                    sb.Append("<div class=\"exp-date\">" + DateRange(row) + "</div>");
                    sb.Append("</div>");
                    if (row["Grade"].ToString() != "")
                    {
                        sb.Append(Bullets("Grade: " + row["Grade"].ToString()));
                    }
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }

            sb.Append("</div>");
            return sb.ToString();
        }
    }
}
