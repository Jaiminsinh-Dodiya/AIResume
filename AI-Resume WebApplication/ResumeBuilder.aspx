<%@ Page Title="AI Resume Builder - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="ResumeBuilder.aspx.cs" Inherits="AI_Resume_WebApplication.ResumeBuilder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="glass-card glow-border p-4 mb-6 flex justify-between items-center" style="background:rgba(15,23,42,0.85); backdrop-filter:blur(12px);">
        <div class="flex items-center gap-4">
            <a href="Dashboard.aspx" class="btn btn-ghost btn-sm">&larr; Back to Dashboard</a>
            <span style="font-weight:700; font-size:var(--text-base);">Resume Editor: <span class="text-gradient-purple">My Resume</span></span>
        </div>

        <div class="flex items-center gap-3">
            <span class="badge badge-success flex items-center gap-1">
                <svg class="icon-svg" style="width:12px; height:12px;" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                Auto-Saved
            </span>
            <a href="Preview.aspx" class="btn btn-secondary btn-sm">Full Document Preview</a>
            <asp:Button ID="btnSave" runat="server" Text="Save Document" CssClass="btn btn-secondary btn-sm" OnClick="btnSave_Click" ValidationGroup="BuilderGroup" />
            <a href="Preview.aspx" class="btn btn-primary btn-sm">Export PDF</a>
        </div>
    </div>

   
    <asp:Label ID="lblStatus" runat="server" CssClass="badge badge-purple" style="display:block; margin:0 auto 16px auto; max-width:400px; text-align:center;" Visible="false" EnableViewState="false"></asp:Label>

    
    <div class="builder-container">
        
        <div class="builder-form-panel">
            
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-6);">1. Personal Information</h3>
                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtTargetTitle.ClientID %>" class="form-label">Target Job Title</label>
                        <asp:TextBox ID="txtTargetTitle" runat="server" CssClass="form-input"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtEmail.ClientID %>" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtPhone.ClientID %>" class="form-label">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input"></asp:TextBox>
                    </div>
                </div>
            </div>

         
            <div class="glass-card p-6">
                <div class="flex justify-between items-center" style="margin-bottom:var(--space-4);">
                    <h3>2. Executive Summary</h3>
                    <asp:Button ID="btnAiRewrite" runat="server" Text="&#10024; AI Smart Rewrite" CssClass="btn btn-secondary btn-sm" OnClick="btnAiRewrite_Click" ValidationGroup="BuilderGroup" style="color:var(--accent-primary);" />
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-textarea"></asp:TextBox>
                </div>
            </div>

            <div class="glass-card p-6">
                <div class="flex justify-between items-center" style="margin-bottom:var(--space-4);">
                    <h3>3. Work Experience</h3>
                    <a href="Profile.aspx" class="btn btn-secondary btn-sm">Edit in My Profile</a>
                </div>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">Your work experience, education and skills are loaded from My Profile and shown in the live preview.</p>
            </div>
            
            <details class="glass-card p-6" style="cursor:pointer;">
                <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                    Advanced Document Formatting &amp; Custom Sections (Optional)
                </summary>
                <div style="margin-top:var(--space-4); border-top:1px solid var(--glass-border); padding-top:var(--space-4);">
                    <div class="form-group">
                        <label class="form-label">Custom Section Header</label>
                        <input type="text" class="form-input" placeholder="e.g. Open Source Contributions, Patents, Speaking">
                    </div>
                </div>
            </details>
        </div>

        
        <div class="builder-preview-panel">
            <div class="glass-card p-2 glow-border" style="background:#0F111E;">
                <div class="flex justify-between items-center p-3" style="border-bottom:1px solid var(--glass-border);">
                    <span class="badge badge-purple">Live Preview</span>
                    <span style="font-size:var(--text-xs); color:var(--text-muted);">Template: Modern Executive</span>
                </div>

                
                <div style="background:#FFFFFF; color:#0F172A; min-height:580px; font-size:var(--text-xs); line-height:1.5;">
                    <asp:Literal ID="litResumeContent" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
