using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class Profile : Page
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

        // convert date for sql query
        string sqlDate(string text)
        {
            if (text.Trim() == "")
            {
                return "NULL";
            }
            return "'" + Convert.ToDateTime(text).ToString("yyyy-MM-dd") + "'";
        }

        // format date for text box
        string textDate(object value)
        {
            if (value.ToString() == "")
            {
                return "";
            }
            return Convert.ToDateTime(value).ToString("yyyy-MM-dd");
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
                filldata();
                fillgridSkill();
                fillgridEdu();
                fillgridExp();
            }
        }

        // reset profile form
        void clear()
        {
            txtProfessionalTitle.Text = "";
            txtPhone.Text = "";
            txtLocation.Text = "";
            txtLinkedIn.Text = "";
            txtPortfolio.Text = "";
            txtSummary.Text = "";
        }

        // load career profile data
        void filldata()
        {
            getCon();
            da = new SqlDataAdapter("select * from CareerProfile where UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtProfessionalTitle.Text = ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString();
                txtSummary.Text = ds.Tables[0].Rows[0]["ProfessionalSummary"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                txtLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                txtLinkedIn.Text = ds.Tables[0].Rows[0]["LinkedInUrl"].ToString();
                txtPortfolio.Text = ds.Tables[0].Rows[0]["PortfolioUrl"].ToString();
                btnSaveProfile.Text = "Update Profile";
            }
            else
            {
                clear();
                btnSaveProfile.Text = "Add Profile";
            }
        }

        // save or update career profile
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string title = txtProfessionalTitle.Text.Trim().Replace("'", "''");
            string summary = txtSummary.Text.Trim().Replace("'", "''");
            string phone = txtPhone.Text.Trim().Replace("'", "''");
            string location = txtLocation.Text.Trim().Replace("'", "''");
            string linkedin = txtLinkedIn.Text.Trim().Replace("'", "''");
            string portfolio = txtPortfolio.Text.Trim().Replace("'", "''");

            if (btnSaveProfile.Text == "Add Profile")
            {
                getCon();

                // check if profile already exists
                da = new SqlDataAdapter("select * from CareerProfile where UserId='" + Session["userId"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    con.Close();
                    filldata();
                    showMessage("Your profile already exists. It has been loaded for updating.", false);
                    return;
                }

                // insert profile
                string command = "insert into CareerProfile(UserId, ProfessionalTitle, ProfessionalSummary, Phone, Location, LinkedInUrl, PortfolioUrl) values('" +
                    Session["userId"] + "','" + title + "','" + summary + "','" + phone + "','" + location + "','" + linkedin + "','" + portfolio + "')";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                filldata();
                showMessage("Career Profile added successfully.", true);
            }
            else
            {
                getCon();

                // update profile
                string command = "update CareerProfile set ProfessionalTitle='" + title +
                    "', ProfessionalSummary='" + summary +
                    "', Phone='" + phone +
                    "', Location='" + location +
                    "', LinkedInUrl='" + linkedin +
                    "', PortfolioUrl='" + portfolio +
                    "' where UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                filldata();
                showMessage("Career Profile updated successfully.", true);
            }
        }

        // bind skills to gridview
        void fillgridSkill()
        {
            getCon();
            da = new SqlDataAdapter("select * from Skills where UserId='" + Session["userId"] + "' order by SkillId", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            gvSkills.DataSource = ds;
            gvSkills.DataBind();
        }

        // reset skill form
        void clearSkill()
        {
            txtSkillName.Text = "";
            txtSkillCategory.Text = "";
            txtSkillLevel.Text = "";
            btnSaveSkill.Text = "Add Skill";
            ViewState["SkillId"] = null;
            pnlSkill.Visible = false;
        }

        protected void btnShowSkill_Click(object sender, EventArgs e)
        {
            clearSkill();
            pnlSkill.Visible = true;
        }

        protected void btnCancelSkill_Click(object sender, EventArgs e)
        {
            clearSkill();
        }

        // add or update skill
        protected void btnSaveSkill_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string name = txtSkillName.Text.Trim().Replace("'", "''");
            string category = txtSkillCategory.Text.Trim().Replace("'", "''");
            string level = txtSkillLevel.Text.Trim().Replace("'", "''");

            if (btnSaveSkill.Text == "Add Skill")
            {
                getCon();
                string command = "insert into Skills(UserId, SkillName, SkillCategory, SkillLevel) values('" +
                    Session["userId"] + "','" + name + "','" + category + "','" + level + "')";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridSkill();
                clearSkill();
                showMessage("Skill added successfully.", true);
            }
            else
            {
                string id = ViewState["SkillId"].ToString();

                getCon();
                string command = "update Skills set SkillName='" + name +
                    "', SkillCategory='" + category +
                    "', SkillLevel='" + level +
                    "' where SkillId='" + id + "' and UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridSkill();
                clearSkill();
                showMessage("Skill updated successfully.", true);
            }
        }

        // handle edit or delete skill
        protected void gvSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_edit")
            {
                ViewState["SkillId"] = id;
                filldataSkill();
            }
            else if (e.CommandName == "cmd_delete")
            {
                getCon();
                string command = "delete from Skills where SkillId='" + id + "' and UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridSkill();
                clearSkill();
                showMessage("Skill deleted successfully.", true);
            }
        }

        // load skill for edit
        void filldataSkill()
        {
            getCon();
            da = new SqlDataAdapter("select * from Skills where SkillId='" + ViewState["SkillId"] + "' and UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtSkillName.Text = ds.Tables[0].Rows[0]["SkillName"].ToString();
                txtSkillCategory.Text = ds.Tables[0].Rows[0]["SkillCategory"].ToString();
                txtSkillLevel.Text = ds.Tables[0].Rows[0]["SkillLevel"].ToString();
                btnSaveSkill.Text = "Update Skill";
                pnlSkill.Visible = true;
            }
            else
            {
                clearSkill();
                showMessage("Skill not found.", false);
            }
        }

        // bind education to gridview
        void fillgridEdu()
        {
            getCon();
            da = new SqlDataAdapter("select * from Education where UserId='" + Session["userId"] + "' order by EducationId", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            gvEducation.DataSource = ds;
            gvEducation.DataBind();
        }

        // reset education form
        void clearEdu()
        {
            txtInstitution.Text = "";
            txtDegree.Text = "";
            txtFieldOfStudy.Text = "";
            txtEduStart.Text = "";
            txtEduEnd.Text = "";
            txtGrade.Text = "";
            btnSaveEdu.Text = "Add Education";
            ViewState["EduId"] = null;
            pnlEdu.Visible = false;
        }

        protected void btnShowEdu_Click(object sender, EventArgs e)
        {
            clearEdu();
            pnlEdu.Visible = true;
        }

        protected void btnCancelEdu_Click(object sender, EventArgs e)
        {
            clearEdu();
        }

        // add or update education
        protected void btnSaveEdu_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            // validate dates
            if (txtEduStart.Text != "" && txtEduEnd.Text != "")
            {
                if (Convert.ToDateTime(txtEduEnd.Text) < Convert.ToDateTime(txtEduStart.Text))
                {
                    showMessage("End Date cannot be before Start Date.", false);
                    return;
                }
            }

            string institution = txtInstitution.Text.Trim().Replace("'", "''");
            string degree = txtDegree.Text.Trim().Replace("'", "''");
            string fieldOfStudy = txtFieldOfStudy.Text.Trim().Replace("'", "''");
            string grade = txtGrade.Text.Trim().Replace("'", "''");

            if (btnSaveEdu.Text == "Add Education")
            {
                getCon();
                string command = "insert into Education(UserId, Institution, Degree, FieldOfStudy, StartDate, EndDate, Grade) values('" +
                    Session["userId"] + "','" + institution + "','" + degree + "','" + fieldOfStudy + "'," +
                    sqlDate(txtEduStart.Text) + "," + sqlDate(txtEduEnd.Text) + ",'" + grade + "')";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridEdu();
                clearEdu();
                showMessage("Education added successfully.", true);
            }
            else
            {
                string id = ViewState["EduId"].ToString();

                getCon();
                string command = "update Education set Institution='" + institution +
                    "', Degree='" + degree +
                    "', FieldOfStudy='" + fieldOfStudy +
                    "', StartDate=" + sqlDate(txtEduStart.Text) +
                    ", EndDate=" + sqlDate(txtEduEnd.Text) +
                    ", Grade='" + grade +
                    "' where EducationId='" + id + "' and UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridEdu();
                clearEdu();
                showMessage("Education updated successfully.", true);
            }
        }

        // handle edit or delete education
        protected void gvEducation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_edit")
            {
                ViewState["EduId"] = id;
                filldataEdu();
            }
            else if (e.CommandName == "cmd_delete")
            {
                getCon();
                string command = "delete from Education where EducationId='" + id + "' and UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridEdu();
                clearEdu();
                showMessage("Education deleted successfully.", true);
            }
        }

        // load education for edit
        void filldataEdu()
        {
            getCon();
            da = new SqlDataAdapter("select * from Education where EducationId='" + ViewState["EduId"] + "' and UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtInstitution.Text = ds.Tables[0].Rows[0]["Institution"].ToString();
                txtDegree.Text = ds.Tables[0].Rows[0]["Degree"].ToString();
                txtFieldOfStudy.Text = ds.Tables[0].Rows[0]["FieldOfStudy"].ToString();
                txtEduStart.Text = textDate(ds.Tables[0].Rows[0]["StartDate"]);
                txtEduEnd.Text = textDate(ds.Tables[0].Rows[0]["EndDate"]);
                txtGrade.Text = ds.Tables[0].Rows[0]["Grade"].ToString();
                btnSaveEdu.Text = "Update Education";
                pnlEdu.Visible = true;
            }
            else
            {
                clearEdu();
                showMessage("Education record not found.", false);
            }
        }

        // bind experience to gridview
        void fillgridExp()
        {
            getCon();
            da = new SqlDataAdapter("select * from Experience where UserId='" + Session["userId"] + "' order by ExperienceId", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            gvExperience.DataSource = ds;
            gvExperience.DataBind();
        }

        // reset experience form
        void clearExp()
        {
            txtCompany.Text = "";
            txtJobTitle.Text = "";
            txtExpStart.Text = "";
            txtExpEnd.Text = "";
            chkIsCurrent.Checked = false;
            txtDescription.Text = "";
            btnSaveExp.Text = "Add Experience";
            ViewState["ExpId"] = null;
            pnlExp.Visible = false;
        }

        protected void btnShowExp_Click(object sender, EventArgs e)
        {
            clearExp();
            pnlExp.Visible = true;
        }

        protected void btnCancelExp_Click(object sender, EventArgs e)
        {
            clearExp();
        }

        // add or update experience
        protected void btnSaveExp_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string endDate = "NULL";
            string isCurrent = "0";

            // check if currently working
            if (chkIsCurrent.Checked == true)
            {
                isCurrent = "1";
            }
            else
            {
                if (txtExpEnd.Text == "")
                {
                    showMessage("Enter an End Date or tick 'I currently work here'.", false);
                    return;
                }
                endDate = sqlDate(txtExpEnd.Text);

                if (txtExpStart.Text != "")
                {
                    if (Convert.ToDateTime(txtExpEnd.Text) < Convert.ToDateTime(txtExpStart.Text))
                    {
                        showMessage("End Date cannot be before Start Date.", false);
                        return;
                    }
                }
            }

            string company = txtCompany.Text.Trim().Replace("'", "''");
            string jobTitle = txtJobTitle.Text.Trim().Replace("'", "''");
            string description = txtDescription.Text.Trim().Replace("'", "''");

            if (btnSaveExp.Text == "Add Experience")
            {
                getCon();
                string command = "insert into Experience(UserId, CompanyName, JobTitle, StartDate, EndDate, IsCurrent, Description) values('" +
                    Session["userId"] + "','" + company + "','" + jobTitle + "'," +
                    sqlDate(txtExpStart.Text) + "," + endDate + "," + isCurrent + ",'" + description + "')";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridExp();
                clearExp();
                showMessage("Experience added successfully.", true);
            }
            else
            {
                string id = ViewState["ExpId"].ToString();

                getCon();
                string command = "update Experience set CompanyName='" + company +
                    "', JobTitle='" + jobTitle +
                    "', StartDate=" + sqlDate(txtExpStart.Text) +
                    ", EndDate=" + endDate +
                    ", IsCurrent=" + isCurrent +
                    ", Description='" + description +
                    "' where ExperienceId='" + id + "' and UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridExp();
                clearExp();
                showMessage("Experience updated successfully.", true);
            }
        }

        // handle edit or delete experience
        protected void gvExperience_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_edit")
            {
                ViewState["ExpId"] = id;
                filldataExp();
            }
            else if (e.CommandName == "cmd_delete")
            {
                getCon();
                string command = "delete from Experience where ExperienceId='" + id + "' and UserId='" + Session["userId"] + "'";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgridExp();
                clearExp();
                showMessage("Experience deleted successfully.", true);
            }
        }

        // load experience for edit
        void filldataExp()
        {
            getCon();
            da = new SqlDataAdapter("select * from Experience where ExperienceId='" + ViewState["ExpId"] + "' and UserId='" + Session["userId"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtCompany.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                txtJobTitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
                txtExpStart.Text = textDate(ds.Tables[0].Rows[0]["StartDate"]);
                txtExpEnd.Text = textDate(ds.Tables[0].Rows[0]["EndDate"]);
                chkIsCurrent.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsCurrent"]);
                txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                btnSaveExp.Text = "Update Experience";
                pnlExp.Visible = true;
            }
            else
            {
                clearExp();
                showMessage("Experience record not found.", false);
            }
        }
    }
}
