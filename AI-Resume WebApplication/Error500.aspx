<%@ Page Title="500 Server Error - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Error500.aspx.cs" Inherits="AI_Resume_WebApplication.Error500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display:flex; align-items:center; justify-content:center; min-height:70vh; text-align:center; padding:var(--space-12) 0;">
        <div class="glass-card glow-border p-12" style="max-width:560px; width:100%;">
            <div class="stat-icon" style="width:56px; height:56px; background:rgba(239, 68, 68, 0.2); border-color:#EF4444; margin:0 auto var(--space-4) auto;">
                <svg class="icon-svg" style="color:#EF4444; width:28px; height:28px;" viewBox="0 0 24 24"><path d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
            </div>
            <h1 style="font-size:var(--text-4xl); font-weight:800; color:#EF4444; margin-bottom:var(--space-2);">500 Internal Server Error</h1>
            <p style="font-size:var(--text-lg); color:var(--text-secondary); margin-bottom:var(--space-4);">Oops! Something unexpected went wrong on our end.</p>
            <p style="font-size:var(--text-sm); color:var(--text-muted); margin-bottom:var(--space-8);">Our engineering team has been notified. Please try refreshing the page or returning to home.</p>

            <div class="flex items-center justify-center gap-4 flex-wrap">
                <a href="Default.aspx" class="btn btn-primary">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 001 1m-6 0h6"/></svg>
                    Go to Home
                </a>
                <a href="mailto:support@resumeai.tech" class="btn btn-secondary">
                    Contact Support
                </a>
            </div>
        </div>
    </div>
</asp:Content>
