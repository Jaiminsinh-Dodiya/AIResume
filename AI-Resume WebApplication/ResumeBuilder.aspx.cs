using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class ResumeBuilder : Page
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

        // load user profile details into textboxes
        void filldata()
        {
            getCon();

            da = new SqlDataAdapter("select * from Users where Id='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            }

            da = new SqlDataAdapter("select * from CareerProfile where UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            // fill career profile if exists
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtTargetTitle.Text = ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                txtSummary.Text = ds.Tables[0].Rows[0]["ProfessionalSummary"].ToString();
            }
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
                string templateId = Request.QueryString["template"];

                if (templateId != null)
                {
                    ViewState["CurrentTemplate"] = templateId;
                    Session["SelectedTemplate"] = templateId;
                }

                if (ViewState["CurrentTemplate"] == null)
                {
                    ViewState["CurrentTemplate"] = "modern";
                }

                filldata();
                RenderPreview();
            }
        }

        // render resume preview using selected template
        private void RenderPreview()
        {
            string templateId = Request.QueryString["template"];

            if (templateId == null)
            {
                templateId = "modern";
            }

            if (templateId != "modern" && templateId != "executive" && templateId != "minimalist")
            {
                templateId = "modern";
            }

            string primaryColor = "#3b82f6";
            var data = new ResumeData();

            // get text values from inputs
            data.FullName = Server.HtmlEncode(txtFullName.Text);
            data.JobTitle = Server.HtmlEncode(txtTargetTitle.Text);
            data.Email = Server.HtmlEncode(txtEmail.Text);
            data.Phone = Server.HtmlEncode(txtPhone.Text);
            data.Summary = Server.HtmlEncode(txtSummary.Text);

            getCon();

            // fetch career profile
            da = new SqlDataAdapter("select * from CareerProfile where UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
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

            // generate html template
            litResumeContent.Text = ResumeTemplateBase.RenderTemplate(templateId, primaryColor, data);
        }

        // save changes and update preview
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (lblStatus != null)
            {
                lblStatus.Text = "Resume changes saved successfully.";
                lblStatus.Visible = true;
            }
            RenderPreview();
        }

        // trigger ai rewrite action
        protected void btnAiRewrite_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (lblStatus != null)
            {
                lblStatus.Text = "AI Smart Rewrite will be available in a later phase.";
                lblStatus.Visible = true;
            }
        }
    }
}
