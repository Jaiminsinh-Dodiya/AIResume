using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Dashboard : Page
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
        }
    }
}
