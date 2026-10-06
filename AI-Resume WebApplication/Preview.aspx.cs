using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class Preview : Page
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

            if (!IsPostBack)
            {
                if (Request.QueryString["template"] != null)
                {
                    Session["SelectedTemplate"] = Request.QueryString["template"];
                }
                
                RenderPreview();
            }
        }

        // render full resume preview
        private void RenderPreview()
        {
            string templateId = Session["SelectedTemplate"] as string ?? "modern";
            string primaryColor = Session["ThemeColor"] as string ?? "#3b82f6";

            if (templateId != "modern" && templateId != "executive" && templateId != "minimalist")
            {
                templateId = "modern";
            }

            var data = new ResumeData();

            getCon();

            // fetch user name and email
            da = new SqlDataAdapter("select * from Users where Id='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                data.FullName = Server.HtmlEncode(ds.Tables[0].Rows[0]["FullName"].ToString());
                data.Email = Server.HtmlEncode(ds.Tables[0].Rows[0]["Email"].ToString());
            }

            // fetch career profile
            da = new SqlDataAdapter("select * from CareerProfile where UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                data.JobTitle = Server.HtmlEncode(ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString());
                data.Summary = Server.HtmlEncode(ds.Tables[0].Rows[0]["ProfessionalSummary"].ToString());
                data.Phone = Server.HtmlEncode(ds.Tables[0].Rows[0]["Phone"].ToString());
                data.Location = Server.HtmlEncode(ds.Tables[0].Rows[0]["Location"].ToString());
                data.LinkedIn = Server.HtmlEncode(ds.Tables[0].Rows[0]["LinkedInUrl"].ToString());
                data.Portfolio = Server.HtmlEncode(ds.Tables[0].Rows[0]["PortfolioUrl"].ToString());
            }

            // fetch skills
            da = new SqlDataAdapter("select * from Skills where UserId='" + Session["userId"] + "' order by SkillId", con);
            ds = new DataSet();
            da.Fill(ds);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                data.Skills.Add(Server.HtmlEncode(row["SkillName"].ToString()));
            }

            // fetch education
            da = new SqlDataAdapter("select * from Education where UserId='" + Session["userId"] + "' order by StartDate desc, EducationId desc", con);
            ds = new DataSet();
            da.Fill(ds);
            data.Education = ds.Tables[0];

            // fetch experience
            da = new SqlDataAdapter("select * from Experience where UserId='" + Session["userId"] + "' order by StartDate desc, ExperienceId desc", con);
            ds = new DataSet();
            da.Fill(ds);
            data.Experience = ds.Tables[0];

            con.Close();

            // generate html output
            litResumeContent.Text = ResumeTemplateBase.RenderTemplate(templateId, primaryColor, data);
        }
    }
}
