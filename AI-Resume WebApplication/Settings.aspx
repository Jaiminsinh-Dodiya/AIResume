<%@ Page Title="Account Settings - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="AI_Resume_WebApplication.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="padding: var(--space-8) 0 var(--space-16) 0;">

        <!-- TOP HEADER -->
        <div style="margin-bottom: var(--space-8);" class="flex items-center justify-between flex-wrap gap-4">
            <div>
                <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-3 glass-card" style="background: rgba(234, 170, 0, 0.12); border-color: rgba(234, 170, 0, 0.3);">
                    <span class="badge badge-purple">Account Preferences</span>
                </div>
                <h1 style="font-size: var(--text-3xl); font-weight: 800; margin-bottom: var(--space-1);">Settings &amp; Preferences</h1>
                <p style="font-size: var(--text-sm); color: var(--text-secondary);">Manage your profile identity, security credentials, and alert configurations</p>
            </div>

            <div class="flex items-center gap-3">
                <asp:Button ID="btnSaveSettings" runat="server" Text="Save Preferences" CssClass="btn btn-primary" OnClick="btnSaveSettings_Click" ValidationGroup="SettingsGroup" />
            </div>
        </div>

        <!-- SERVER STATUS MESSAGE -->
        <asp:Label ID="lblStatus" runat="server" CssClass="badge badge-purple" style="display:block; margin-bottom:var(--space-6); text-align:center; padding:10px 16px; font-size:var(--text-sm);" Visible="false" EnableViewState="false"></asp:Label>

        <!-- SETTINGS SPLIT GRID -->
        <div class="settings-grid grid grid-cols-12 gap-8 items-start">

            <!-- LEFT NAVIGATION TABS -->
            <div class="col-span-3 glass-card p-4" style="border-radius: var(--radius-lg); position: sticky; top: 100px;">
                <div style="display: flex; flex-direction: column; gap: 6px;">
                    <button type="button" class="sidebar-item active" style="width: 100%; border: none; text-align: left; cursor: pointer;">
                        <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                        Public Profile
                    </button>
                    <button type="button" class="sidebar-item" style="width: 100%; border: none; text-align: left; cursor: pointer; background: transparent;">
                        <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>
                        Security &amp; Auth
                    </button>
                    <button type="button" class="sidebar-item" style="width: 100%; border: none; text-align: left; cursor: pointer; background: transparent;">
                        <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0"/></svg>
                        Notifications
                    </button>
                    <button type="button" class="sidebar-item" style="width: 100%; border: none; text-align: left; cursor: pointer; background: transparent;">
                        <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><path d="M12 2a10 10 0 010 20"/></svg>
                        Theme &amp; Style
                    </button>
                </div>
            </div>

            <!-- RIGHT PANELS CONTAINER -->
            <div class="col-span-9 flex flex-col gap-8">

                <!-- PANEL 1: PUBLIC PROFILE -->
                <div class="glass-card glow-border p-8" style="border-radius: var(--radius-xl);">
                    <div class="flex items-center justify-between mb-6 pb-4" style="border-bottom: 1px solid var(--glass-border);">
                        <div>
                            <h3 style="font-size: var(--text-xl); margin-bottom: 4px;">Public Profile</h3>
                            <p style="font-size: var(--text-xs); color: var(--text-secondary); margin: 0;">This information is used across your resume header and cover letters.</p>
                        </div>
                        <span class="badge badge-purple">Verified Profile</span>
                    </div>

                    <!-- Avatar Row -->
                    <div class="flex items-center gap-4 mb-6">
                        <div class="stat-icon" style="width: 56px; height: 56px; font-size: var(--text-lg); font-weight: 800; background: var(--bg-surface); border-color: var(--accent-primary);">
                            AW
                        </div>
                        <div>
                            <h4 style="font-size: var(--text-sm); margin-bottom: 2px;">Profile Avatar</h4>
                            <p style="font-size: 11px; color: var(--text-muted); margin: 0;">Initials auto-generated from your full name.</p>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4 mb-4">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" Text="Alexander Wright"></asp:TextBox>
                        </div>
                        <div class="form-group" style="margin-bottom: 0;">
                            <label for="<%= txtEmail.ClientID %>" class="form-label">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" Text="alexander.wright@tech.io"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%= txtBio.ClientID %>" class="form-label">Professional Summary / Bio</label>
                        <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-textarea" Text="Principal Software Engineer specializing in distributed cloud microservices, high-scale Kubernetes infrastructure, and Go distributed systems."></asp:TextBox>
                    </div>
                </div>

                <!-- PANEL 2: PASSWORD & SECURITY -->
                <div class="glass-card glow-border p-8" style="border-radius: var(--radius-xl);">
                    <div class="flex items-center justify-between mb-6 pb-4" style="border-bottom: 1px solid var(--glass-border);">
                        <div>
                            <h3 style="font-size: var(--text-xl); margin-bottom: 4px;">Security &amp; Credentials</h3>
                            <p style="font-size: var(--text-xs); color: var(--text-secondary); margin: 0;">Update your password to ensure your resume assets remain secure.</p>
                        </div>
                        <span class="badge badge-cyan">Protected</span>
                    </div>

                    <div class="grid grid-cols-2 gap-4 mb-6">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label for="<%= txtCurrentPassword.ClientID %>" class="form-label">Current Password</label>
                            <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••••••"></asp:TextBox>
                        </div>
                        <div class="form-group" style="margin-bottom: 0;">
                            <label for="<%= txtNewPassword.ClientID %>" class="form-label">New Password</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••••••"></asp:TextBox>
                        </div>
                    </div>

                    <div class="flex items-center justify-between">
                        <span style="font-size: 11px; color: var(--text-muted);">Must be at least 8 characters with a number or symbol.</span>
                        <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn btn-secondary btn-sm" OnClick="btnUpdatePassword_Click" ValidationGroup="SecurityGroup" />
                    </div>
                </div>

                <!-- PANEL 3: NOTIFICATIONS -->
                <div class="glass-card glow-border p-8" style="border-radius: var(--radius-xl);">
                    <div class="flex items-center justify-between mb-6 pb-4" style="border-bottom: 1px solid var(--glass-border);">
                        <div>
                            <h3 style="font-size: var(--text-xl); margin-bottom: 4px;">Notification Preferences</h3>
                            <p style="font-size: var(--text-xs); color: var(--text-secondary); margin: 0;">Control what emails and automated AI insights you receive.</p>
                        </div>
                    </div>

                    <div style="display: flex; flex-direction: column; gap: 16px;">
                        <div class="flex items-center justify-between p-4 glass-card" style="border-radius: var(--radius-md);">
                            <div>
                                <h4 style="font-size: var(--text-sm); margin: 0 0 2px 0;">Weekly ATS Digest</h4>
                                <p style="font-size: var(--text-xs); color: var(--text-muted); margin: 0;">Receive weekly email reports on your resume match score changes and trending tech skills.</p>
                            </div>
                            <asp:CheckBox ID="chkWeeklyDigest" runat="server" Checked="true" />
                        </div>

                        <div class="flex items-center justify-between p-4 glass-card" style="border-radius: var(--radius-md);">
                            <div>
                                <h4 style="font-size: var(--text-sm); margin: 0 0 2px 0;">AI Optimization Suggestions</h4>
                                <p style="font-size: var(--text-xs); color: var(--text-muted); margin: 0;">Get notified when new AI models or high-converting templates are matched to your job titles.</p>
                            </div>
                            <asp:CheckBox ID="chkAiAlerts" runat="server" Checked="true" />
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
