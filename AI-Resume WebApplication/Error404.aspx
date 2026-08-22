<%@ Page Title="404 Page Not Found - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="AI_Resume_WebApplication.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display:flex; align-items:center; justify-content:center; min-height:70vh; text-align:center; padding:var(--space-12) 0;">
        <div class="glass-card glow-border p-12" style="max-width:560px; width:100%;">
            <div class="stat-icon" style="width:56px; height:56px; background:var(--accent-primary-glow); margin:0 auto var(--space-4) auto;">
                <svg class="icon-svg" style="color:#FFF; width:28px; height:28px;" viewBox="0 0 24 24"><path d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/></svg>
            </div>
            <h1 class="text-gradient-purple" style="font-size:var(--text-4xl); font-weight:800; margin-bottom:var(--space-2);">404 Page Not Found</h1>
            <p style="font-size:var(--text-lg); color:var(--text-secondary); margin-bottom:var(--space-4);">We couldn't find the page you're looking for.</p>
            <p style="font-size:var(--text-sm); color:var(--text-muted); margin-bottom:var(--space-8);">The requested URL may have been moved, renamed, or is temporarily unavailable.</p>

            <div class="flex items-center justify-center gap-4 flex-wrap">
                <a href="Default.aspx" class="btn btn-primary">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                    Go to Home
                </a>
                <a href="mailto:support@resumeai.tech" class="btn btn-secondary">
                    Contact Support
                </a>
            </div>
        </div>
    </div>
</asp:Content>
