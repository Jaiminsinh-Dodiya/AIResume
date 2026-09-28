<%@ Page Title="My Profile - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AI_Resume_WebApplication.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-table { width: 100%; border-collapse: collapse; font-size: var(--text-sm); }
        .profile-table th { text-align: left; padding: 10px 12px; color: var(--text-muted); font-weight: 600; border-bottom: 1px solid var(--glass-border); }
        .profile-table td { padding: 10px 12px; color: var(--text-secondary); border-bottom: 1px solid var(--glass-border); vertical-align: middle; }
        .profile-table a { color: var(--accent-primary); font-weight: 600; margin-right: 8px; }
    </style>
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom: var(--space-6);">
        <h1 style="font-size: var(--text-3xl); font-weight: 800; margin-bottom: var(--space-1);">My Profile</h1>
        <p style="font-size: var(--text-sm); color: var(--text-muted);">Manage all information used to build your resume.</p>
    </div>

    <asp:Label ID="lblMessage" runat="server" Style="display: block; margin-bottom: 16px; text-align: center;" Visible="false" EnableViewState="false"></asp:Label>

    <!-- ==================== 1. CAREER PROFILE ==================== -->
    <div class="glass-card glow-border p-6" style="margin-bottom: var(--space-8);">
        <h3 style="margin-bottom: var(--space-4);">Career Profile</h3>

        <div class="grid grid-cols-2 gap-4">
            <div class="form-group col-span-2">
                <label for="<%= txtProfessionalTitle.ClientID %>" class="form-label">Professional Title</label>
                <asp:TextBox ID="txtProfessionalTitle" runat="server" CssClass="form-input" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="<%= txtPhone.ClientID %>" class="form-label">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" MaxLength="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="<%= txtLocation.ClientID %>" class="form-label">Location</label>
                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-input" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="<%= txtLinkedIn.ClientID %>" class="form-label">LinkedIn URL</label>
                <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="form-input" MaxLength="255"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="<%= txtPortfolio.ClientID %>" class="form-label">Portfolio URL</label>
                <asp:TextBox ID="txtPortfolio" runat="server" CssClass="form-input" MaxLength="255"></asp:TextBox>
            </div>
            <div class="form-group col-span-2">
                <label for="<%= txtSummary.ClientID %>" class="form-label">Professional Summary</label>
                <asp:TextBox ID="txtSummary" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
        </div>

        <asp:Button ID="btnSaveProfile" runat="server" Text="Add Profile" CssClass="btn btn-primary" OnClick="btnSaveProfile_Click" ValidationGroup="ProfileGroup" />
    </div>

    <!-- ==================== 2. SKILLS ==================== -->
    <div class="glass-card glow-border p-6" style="margin-bottom: var(--space-8); overflow-x: auto;">
        <div class="flex justify-between items-center" style="margin-bottom: var(--space-4);">
            <h3>Skills</h3>
            <asp:Button ID="btnShowSkill" runat="server" Text="+ Add Skill" CssClass="btn btn-secondary btn-sm" OnClick="btnShowSkill_Click" CausesValidation="false" />
        </div>

        <asp:Panel ID="pnlSkill" runat="server" Visible="false" Style="margin-bottom: var(--space-4);">
            <div class="grid grid-cols-3 gap-4">
                <div class="form-group">
                    <label for="<%= txtSkillName.ClientID %>" class="form-label">Skill Name *</label>
                    <asp:TextBox ID="txtSkillName" runat="server" CssClass="form-input" MaxLength="100" placeholder="e.g. C#"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSkillName" runat="server" ControlToValidate="txtSkillName" ValidationGroup="SkillGroup" ErrorMessage="Skill name is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: 12px;"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="<%= txtSkillCategory.ClientID %>" class="form-label">Skill Category</label>
                    <asp:TextBox ID="txtSkillCategory" runat="server" CssClass="form-input" MaxLength="50" placeholder="e.g. Programming"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%= txtSkillLevel.ClientID %>" class="form-label">Skill Level</label>
                    <asp:TextBox ID="txtSkillLevel" runat="server" CssClass="form-input" MaxLength="30" placeholder="e.g. Intermediate"></asp:TextBox>
                </div>
            </div>
            <asp:Button ID="btnSaveSkill" runat="server" Text="Add Skill" CssClass="btn btn-primary btn-sm" OnClick="btnSaveSkill_Click" ValidationGroup="SkillGroup" />
            <asp:Button ID="btnCancelSkill" runat="server" Text="Cancel" CssClass="btn btn-ghost btn-sm" OnClick="btnCancelSkill_Click" CausesValidation="false" />
        </asp:Panel>

        <asp:GridView ID="gvSkills" runat="server" AutoGenerateColumns="False" CssClass="profile-table" GridLines="None" EmptyDataText="You have not added any skills yet."
            OnRowCommand="gvSkills_RowCommand">
            <Columns>
                <asp:BoundField DataField="SkillName" HeaderText="Skill Name" />
                <asp:BoundField DataField="SkillCategory" HeaderText="Category" />
                <asp:BoundField DataField="SkillLevel" HeaderText="Level" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditSkill" runat="server" Text="Edit" CommandName="cmd_edit" CommandArgument='<%# Eval("SkillId") %>' CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton ID="lnkDeleteSkill" runat="server" Text="Delete" CommandName="cmd_delete" CommandArgument='<%# Eval("SkillId") %>' CausesValidation="false" OnClientClick="return confirm('Delete this skill?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- ==================== 3. EDUCATION ==================== -->
    <div class="glass-card glow-border p-6" style="margin-bottom: var(--space-8); overflow-x: auto;">
        <div class="flex justify-between items-center" style="margin-bottom: var(--space-4);">
            <h3>Education</h3>
            <asp:Button ID="btnShowEdu" runat="server" Text="+ Add Education" CssClass="btn btn-secondary btn-sm" OnClick="btnShowEdu_Click" CausesValidation="false" />
        </div>

        <asp:Panel ID="pnlEdu" runat="server" Visible="false" Style="margin-bottom: var(--space-4);">
            <div class="grid grid-cols-3 gap-4">
                <div class="form-group">
                    <label for="<%= txtInstitution.ClientID %>" class="form-label">Institution *</label>
                    <asp:TextBox ID="txtInstitution" runat="server" CssClass="form-input" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInstitution" runat="server" ControlToValidate="txtInstitution" ValidationGroup="EduGroup" ErrorMessage="Institution is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: 12px;"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="<%= txtDegree.ClientID %>" class="form-label">Degree *</label>
                    <asp:TextBox ID="txtDegree" runat="server" CssClass="form-input" MaxLength="100" placeholder="e.g. BCA"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDegree" runat="server" ControlToValidate="txtDegree" ValidationGroup="EduGroup" ErrorMessage="Degree is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: 12px;"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="<%= txtFieldOfStudy.ClientID %>" class="form-label">Field of Study</label>
                    <asp:TextBox ID="txtFieldOfStudy" runat="server" CssClass="form-input" MaxLength="100"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%= txtEduStart.ClientID %>" class="form-label">Start Date</label>
                    <asp:TextBox ID="txtEduStart" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%= txtEduEnd.ClientID %>" class="form-label">End Date (empty = still studying)</label>
                    <asp:TextBox ID="txtEduEnd" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%= txtGrade.ClientID %>" class="form-label">Grade</label>
                    <asp:TextBox ID="txtGrade" runat="server" CssClass="form-input" MaxLength="50" placeholder="e.g. 8.2 CGPA"></asp:TextBox>
                </div>
            </div>
            <asp:Button ID="btnSaveEdu" runat="server" Text="Add Education" CssClass="btn btn-primary btn-sm" OnClick="btnSaveEdu_Click" ValidationGroup="EduGroup" />
            <asp:Button ID="btnCancelEdu" runat="server" Text="Cancel" CssClass="btn btn-ghost btn-sm" OnClick="btnCancelEdu_Click" CausesValidation="false" />
        </asp:Panel>

        <asp:GridView ID="gvEducation" runat="server" AutoGenerateColumns="False" CssClass="profile-table" GridLines="None" EmptyDataText="You have not added any education yet."
            OnRowCommand="gvEducation_RowCommand">
            <Columns>
                <asp:BoundField DataField="Institution" HeaderText="Institution" />
                <asp:BoundField DataField="Degree" HeaderText="Degree" />
                <asp:BoundField DataField="FieldOfStudy" HeaderText="Field of Study" />
                <asp:BoundField DataField="StartDate" HeaderText="Start" DataFormatString="{0:MMM yyyy}" />
                <asp:BoundField DataField="EndDate" HeaderText="End" DataFormatString="{0:MMM yyyy}" NullDisplayText="Present" />
                <asp:BoundField DataField="Grade" HeaderText="Grade" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditEdu" runat="server" Text="Edit" CommandName="cmd_edit" CommandArgument='<%# Eval("EducationId") %>' CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton ID="lnkDeleteEdu" runat="server" Text="Delete" CommandName="cmd_delete" CommandArgument='<%# Eval("EducationId") %>' CausesValidation="false" OnClientClick="return confirm('Delete this education record?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- ==================== 4. EXPERIENCE ==================== -->
    <div class="glass-card glow-border p-6" style="margin-bottom: var(--space-8); overflow-x: auto;">
        <div class="flex justify-between items-center" style="margin-bottom: var(--space-4);">
            <h3>Experience</h3>
            <asp:Button ID="btnShowExp" runat="server" Text="+ Add Experience" CssClass="btn btn-secondary btn-sm" OnClick="btnShowExp_Click" CausesValidation="false" />
        </div>

        <asp:Panel ID="pnlExp" runat="server" Visible="false" Style="margin-bottom: var(--space-4);">
            <div class="grid grid-cols-3 gap-4">
                <div class="form-group">
                    <label for="<%= txtCompany.ClientID %>" class="form-label">Company Name *</label>
                    <asp:TextBox ID="txtCompany" runat="server" CssClass="form-input" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany" ValidationGroup="ExpGroup" ErrorMessage="Company name is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: 12px;"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="<%= txtJobTitle.ClientID %>" class="form-label">Job Title *</label>
                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-input" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="txtJobTitle" ValidationGroup="ExpGroup" ErrorMessage="Job title is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: 12px;"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Is Current</label>
                    <asp:CheckBox ID="chkIsCurrent" runat="server" Text=" I currently work here" />
                </div>
                <div class="form-group">
                    <label for="<%= txtExpStart.ClientID %>" class="form-label">Start Date</label>
                    <asp:TextBox ID="txtExpStart" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%= txtExpEnd.ClientID %>" class="form-label">End Date (not needed if current)</label>
                    <asp:TextBox ID="txtExpEnd" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group col-span-3">
                    <label for="<%= txtDescription.ClientID %>" class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
            </div>
            <asp:Button ID="btnSaveExp" runat="server" Text="Add Experience" CssClass="btn btn-primary btn-sm" OnClick="btnSaveExp_Click" ValidationGroup="ExpGroup" />
            <asp:Button ID="btnCancelExp" runat="server" Text="Cancel" CssClass="btn btn-ghost btn-sm" OnClick="btnCancelExp_Click" CausesValidation="false" />
        </asp:Panel>

        <asp:GridView ID="gvExperience" runat="server" AutoGenerateColumns="False" CssClass="profile-table" GridLines="None" EmptyDataText="You have not added any experience yet."
            OnRowCommand="gvExperience_RowCommand">
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                <asp:BoundField DataField="StartDate" HeaderText="Start" DataFormatString="{0:MMM yyyy}" />
                <asp:BoundField DataField="EndDate" HeaderText="End" DataFormatString="{0:MMM yyyy}" NullDisplayText="Present" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditExp" runat="server" Text="Edit" CommandName="cmd_edit" CommandArgument='<%# Eval("ExperienceId") %>' CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton ID="lnkDeleteExp" runat="server" Text="Delete" CommandName="cmd_delete" CommandArgument='<%# Eval("ExperienceId") %>' CausesValidation="false" OnClientClick="return confirm('Delete this experience record?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
