<%@ Page Title="Dashboard - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AI_Resume_WebApplication.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- ONBOARDING BANNER -->
    <div class="alert-banner alert-info" style="margin-bottom:var(--space-6); display:flex; align-items:center; gap:12px; padding:16px; background:rgba(59, 130, 246, 0.1); border:1px solid rgba(59, 130, 246, 0.3); border-radius:var(--radius-lg);">
        <svg class="icon-svg" style="color:#3B82F6; width:24px; height:24px;" viewBox="0 0 24 24"><path d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
        <div style="flex:1;">
            <strong style="color:#FFF;">Welcome to ResumeAI!</strong> Complete your <b>Master Career Profile</b> to enable one-click AI resume generation.
        </div>
        <a href="Profile.aspx" class="btn btn-primary btn-sm" style="margin-left:auto;">Complete Profile &rarr;</a>
    </div>

    <div style="margin-bottom:var(--space-8);">
        <h1 style="font-size:var(--text-3xl); font-weight:800; margin-bottom:var(--space-2);">Dashboard Overview</h1>
        <p style="font-size:var(--text-sm); color:var(--text-muted);">Manage your ATS resumes, active job applications, and AI optimizations.</p>
    </div>

    <!-- BENTO-STYLE DASHBOARD LAYOUT -->
    <div class="bento-grid grid grid-cols-12 gap-8">
        <!-- PRIMARY HERO WIDGET: RECENT RESUMES (Span 8) -->
        <div class="col-span-8 glass-card glow-border p-6" style="border-color:var(--accent-primary);">
            <div class="flex justify-between items-center" style="margin-bottom:var(--space-6);">
                <div>
                    <h3>Recent Resumes &amp; Drafts</h3>
                    <p style="font-size:var(--text-xs); color:var(--text-muted);">Your active ATS resume documents</p>
                </div>
                <a href="ResumeBuilder.aspx" class="btn btn-primary btn-sm">+ Create Resume</a>
            </div>

            <div style="display:flex; flex-direction:column; gap:12px;">
                <!-- Resume Card Item 1 -->
                <div class="glass-card p-4 flex items-center justify-between" style="background:var(--bg-secondary);">
                    <div class="flex items-center gap-4">
                        <div class="stat-icon" style="color:var(--accent-primary);">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/></svg>
                        </div>
                        <div>
                            <h4 style="font-size:var(--text-sm); margin:0;">Principal Software Engineer_v3.pdf</h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted); margin:0;">Updated 2 hours ago &bull; Modern Executive Theme</p>
                        </div>
                    </div>

                    <div class="flex items-center gap-3">
                        <span class="badge badge-success">98% ATS</span>
                        <a href="ResumeBuilder.aspx" class="btn btn-secondary btn-sm">Edit</a>
                        <a href="Preview.aspx" class="btn btn-primary btn-sm">Preview</a>
                    </div>
                </div>

                <!-- Resume Card Item 2 -->
                <div class="glass-card p-4 flex items-center justify-between" style="background:var(--bg-secondary);">
                    <div class="flex items-center gap-4">
                        <div class="stat-icon" style="color:var(--accent-highlight);">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/></svg>
                        </div>
                        <div>
                            <h4 style="font-size:var(--text-sm); margin:0;">Tech Lead - Cloud Architecture.pdf</h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted); margin:0;">Updated 3 days ago &bull; Minimalist Pure</p>
                        </div>
                    </div>

                    <div class="flex items-center gap-3">
                        <span class="badge badge-purple">92% ATS</span>
                        <a href="ResumeBuilder.aspx" class="btn btn-secondary btn-sm">Edit</a>
                        <a href="Preview.aspx" class="btn btn-primary btn-sm">Preview</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- SPOTLIGHT WIDGET: ATS SCORE & METRICS (Span 4) -->
        <div class="col-span-4 glass-card p-6 flex flex-col justify-between" style="background:linear-gradient(135deg, rgba(58,15,52,0.6), rgba(20,5,19,0.85));">
            <div>
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">ATS Match Engine</span>
                <h3 style="margin-bottom:var(--space-2);">Overall ATS Average</h3>
                <div style="font-size:var(--text-5xl); font-weight:800; color:var(--accent-highlight); margin-bottom:var(--space-2);">98.4%</div>
                <p style="font-size:var(--text-xs); margin-bottom:var(--space-4);">Your active resumes pass Greenhouse, Lever, and Workday filters with top-tier rankings.</p>
            </div>
            <a href="Analyzer.aspx" class="btn btn-secondary btn-sm btn-full" style="text-align:center;">Detailed ATS Breakdown &rarr;</a>
        </div>

        <!-- QUICK ACTIONS & PROFILE PROGRESS (Span 4) -->
        <div class="col-span-4 glass-card p-6">
            <h3 style="margin-bottom:var(--space-3);">Profile Completeness</h3>
            <div class="flex justify-between items-center" style="margin-bottom:6px; font-size:var(--text-xs);">
                <span>Master Profile Progress</span>
                <span class="text-gradient-purple" style="font-weight:700;">88%</span>
            </div>
            <div class="progress-bar-bg" style="margin-bottom:var(--space-6);">
                <div class="progress-bar-fill" style="width:88%;"></div>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <a href="ResumeBuilder.aspx" class="btn btn-secondary btn-sm" style="text-align:center;">New Resume</a>
                <a href="Analyzer.aspx" class="btn btn-secondary btn-sm" style="text-align:center;">Scan ATS</a>
            </div>
        </div>

        <!-- ACTIVITY & AI INSIGHTS (Span 8) -->
        <div class="col-span-8 glass-card p-6">
            <h3 style="margin-bottom:var(--space-4);">Recent Activity &amp; AI Suggestions</h3>
            <div style="display:flex; flex-direction:column; gap:12px; font-size:var(--text-xs);">
                <div class="glass-card p-3 flex items-center justify-between" style="background:var(--bg-secondary);">
                    <div class="flex items-center gap-3">
                        <span class="badge badge-purple">AI Insight</span>
                        <span>Add <b>gRPC Microservices</b> to your Lead Architect role to increase Stripe application match rate by 12%.</span>
                    </div>
                    <a href="Analyzer.aspx" class="btn btn-ghost btn-sm" style="color:var(--accent-primary);">Apply</a>
                </div>

                <div class="glass-card p-3 flex items-center justify-between" style="background:var(--bg-secondary);">
                    <div class="flex items-center gap-3">
                        <span class="badge badge-cyan">Export</span>
                        <span>Exported <b>Principal Software Engineer_v3.pdf</b> in Vector PDF format.</span>
                    </div>
                    <span style="color:var(--text-muted);">2 hours ago</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
