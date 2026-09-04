using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class Register : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // open sql connection
        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // clear form inputs
        public void clear()
        {
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            chkTerms.Checked = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // register new user account
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // check password match
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblError.Text = "Password and Confirm Password do not match.";
                lblError.Visible = true;
                return;
            }

            getCon();

            // check if email already registered
            string check = "select * from Users where Email='" + txtEmail.Text.Trim() + "'";
            da = new SqlDataAdapter(check, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                con.Close();
                lblError.Text = "This email is already registered. Please login or use another email.";
                lblError.Visible = true;
                return;
            }

            // insert new user record
            string command = "insert into Users(FullName,Email,Password,Role,CreatedAt) " +
                "values('" + txtFullName.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + txtPassword.Text + "','User',GETDATE())";
            cmd = new SqlCommand(command, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Login.aspx");
        }
    }
}
