using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class AdminPanel : Page
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

        // bind users to gridview
        void fillgrid()
        {
            getCon();
            da = new SqlDataAdapter("select Id, FullName, Email, Role, CreatedAt from Users order by Id", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        // show status message
        void showMessage(string text, bool ok)
        {
            lblMessage.Text = text;
            if (ok == true)
            {
                lblMessage.CssClass = "badge badge-success";
            }
            else
            {
                lblMessage.CssClass = "badge badge-warning";
            }
            lblMessage.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // check admin session
            if (Session["userId"] == null || Session["role"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (Session["role"].ToString() != "Admin")
            {
                Response.Redirect("Dashboard.aspx");
                return;
            }

            Website site = Master as Website;
            if (site != null)
            {
                site.EnableAppLayout();
            }

            if (btnAdd.Text == "Add User")
            {
                rfvPassword.Enabled = true;
            }
            else
            {
                rfvPassword.Enabled = false;
            }

            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        // add or update user
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (btnAdd.Text == "Add User")
            {
                getCon();

                // check if email exists
                string check = "select * from Users where Email='" + txtEmail.Text.Trim() + "'";
                da = new SqlDataAdapter(check, con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    con.Close();
                    showMessage("This email is already registered.", false);
                    return;
                }

                // insert user
                string command = "insert into Users(FullName,Email,Password,Role,CreatedAt) " +
                    "values('" + txtFullName.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + txtPassword.Text + "','" + ddlRole.SelectedValue + "',GETDATE())";

                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgrid();
                clear();
                showMessage("User added successfully.", true);
            }
            else
            {
                string id = ViewState["Id"].ToString();

                // prevent removing own admin role
                if (id == Session["userId"].ToString() && ddlRole.SelectedValue != "Admin")
                {
                    showMessage("You cannot remove your own Admin role.", false);
                    return;
                }

                getCon();

                // check if email taken by other user
                string check = "select * from Users where Email='" + txtEmail.Text.Trim() + "' and Id<>'" + id + "'";
                da = new SqlDataAdapter(check, con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    con.Close();
                    showMessage("This email is already used by another user.", false);
                    return;
                }

                // update user details
                string command = "update Users set FullName='" + txtFullName.Text.Trim() + "', Email='" + txtEmail.Text.Trim() + "', Role='" + ddlRole.SelectedValue + "' where Id='" + id + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgrid();
                clear();
                showMessage("User updated successfully.", true);
            }
        }

        // reset form inputs
        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            ddlRole.SelectedIndex = 0;
            btnAdd.Text = "Add User";
            rfvPassword.Enabled = true;
            ViewState["Id"] = null;
        }

        // edit or delete user from grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

            if (e.CommandName == "cmd_edit")
            {
                ViewState["Id"] = id;
                btnAdd.Text = "Update User";
                rfvPassword.Enabled = false;
                filldata();
            }
            else if (e.CommandName == "cmd_delete")
            {
                // do not allow deleting current user
                if (id.ToString() == Session["userId"].ToString())
                {
                    showMessage("You cannot delete your own account while you are logged in.", false);
                    return;
                }

                getCon();
                string command = "delete from Users where Id='" + id + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgrid();
                showMessage("User deleted successfully.", true);
            }
        }

        // load user data into form for editing
        void filldata()
        {
            getCon();
            da = new SqlDataAdapter("select * from Users where Id='" + ViewState["Id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                ddlRole.SelectedValue = ds.Tables[0].Rows[0]["Role"].ToString();
                txtPassword.Text = "";
            }
        }
    }
}
