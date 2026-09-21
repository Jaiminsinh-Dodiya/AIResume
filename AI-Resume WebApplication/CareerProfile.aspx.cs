using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class CareerProfile : Page
    {
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
                if (lblStatus != null)
                {
                    lblStatus.Visible = false;
                }
            }
        }

        // save career profile changes
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (lblStatus != null)
            {
                lblStatus.Text = "Master Career Profile updated successfully.";
                lblStatus.Visible = true;
            }
        }
    }
}
