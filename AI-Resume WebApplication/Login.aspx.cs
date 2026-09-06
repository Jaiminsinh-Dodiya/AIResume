using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class Login : Page
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
        }

        // check user login
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            getCon();
            string command = "select Id, FullName, Email, Role from Users where Email='" + txtEmail.Text.Trim() + "' and Password='" + txtPassword.Text + "'";
            da = new SqlDataAdapter(command, con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            // if valid user found, save session and redirect
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["userId"] = ds.Tables[0].Rows[0]["Id"].ToString();
                Session["userName"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                Session["userEmail"] = ds.Tables[0].Rows[0]["Email"].ToString();
                Session["role"] = ds.Tables[0].Rows[0]["Role"].ToString();

                if (Session["role"].ToString() == "Admin")
                {
                    Response.Redirect("AdminPanel.aspx");
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
            else
            {
                lblError.Text = "Invalid email or password combination.";
                lblError.Visible = true;
            }
        }
    }
}
