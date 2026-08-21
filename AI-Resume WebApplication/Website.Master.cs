using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AI_Resume_WebApplication
{
    public partial class Website : System.Web.UI.MasterPage
    {
        // switch to dashboard layout for logged in users
        public void EnableAppLayout()
        {
            appSidebar.Visible = true;
            appTopbar.Visible = true;

            mainWrap.Attributes["class"] = "dashboard-main";
            mainWrap.Attributes["style"] = "";
            contentInner.Attributes["class"] = "dashboard-content";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        // set active class on current nav link
        public string GetActiveClass(string pageName)
        {
            string currentPath = Request.Url.AbsolutePath;
            if (currentPath.EndsWith(pageName, StringComparison.OrdinalIgnoreCase))
            {
                return "active";
            }
            if (pageName.Equals("Default.aspx", StringComparison.OrdinalIgnoreCase) && (currentPath.EndsWith("/") || string.IsNullOrEmpty(System.IO.Path.GetFileName(currentPath))))
            {
                return "active";
            }
            return string.Empty;
        }

        // get current username from session
        public string GetUserName()
        {
            return Session["userName"] != null
                ? Session["userName"].ToString()
                : "Guest";
        }
    }
}
