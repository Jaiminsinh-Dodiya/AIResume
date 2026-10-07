<%@ Page Title="AI Resume Analyzer & ATS Inspector - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Analyzer.aspx.cs" Inherits="AI_Resume_WebApplication.Analyzer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:var(--space-6);" class="flex items-center justify-between">
        <div>
            <h1 style="font-size:var(--text-3xl); font-weight:800; margin-bottom:var(--space-1);">AI Resume &amp; ATS Score Inspector</h1>
            <p style="font-size:var(--text-sm); color:var(--text-muted);">Real-time document analysis against target job postings</p>
        </div>
        <asp:Button ID="btnAnalyze" runat="server" Text="Re-Scan Document" CssClass="btn btn-primary btn-sm" OnClick="btnAnalyze_Click" ValidationGroup="AnalyzerGroup" />
    </div>

    <!-- UPLOAD & JOB DESCRIPTION SCAN SECTION -->
    <div class="glass-card mb-8 p-6 glow-border">
        <h3 style="margin-bottom:var(--space-4);">Upload &amp; Scan Target Job</h3>
        <div class="grid grid-cols-2 gap-6">
            <div class="form-group">
                <label for="<%= fileResumeUpload.ClientID %>" class="form-label">Upload Resume (PDF / DOCX)</label>
                <asp:FileUpload ID="fileResumeUpload" runat="server" CssClass="form-input" />
            </div>
            <div class="form-group">
                <label for="<%= txtJobDescription.ClientID %>" class="form-label">Target Job Description</label>
                <asp:TextBox ID="txtJobDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-input" placeholder="Paste target job description here..."></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-12 gap-8">
        <!-- LEFT COLUMN: ATS SCORE GAUGE & BREAKDOWN -->
        <div class="col-span-4 flex flex-col gap-6">
            <!-- SCORE GAUGE CARD -->
            <div class="glass-card glow-border text-center p-8" style="border-color:var(--accent-primary);">
                <h3 style="margin-bottom:var(--space-4);">Overall ATS Match</h3>
                <div class="analyzer-gauge" style="margin-bottom:var(--space-4);">
                    <div class="analyzer-gauge-inner">
                        <span class="text-gradient-purple" style="font-size:var(--text-4xl); font-weight:800; line-height:1;">98%</span>
                        <span style="font-size:10px; color:var(--text-muted);">EXCELLENT</span>
                    </div>
                </div>
                <span class="badge badge-success">Greenhouse &amp; Lever Ready</span>
            </div>

            <!-- SCORE BREAKDOWN CATEGORIES -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-4);">Score Breakdown</h3>
                <div style="display:flex; flex-direction:column; gap:16px;">
                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Impact &amp; Action Verbs</span>
                            <span style="color:var(--color-success); font-weight:700;">96/100</span>
                        </div>
                        <div class="progress-bar-bg"><div class="progress-bar-fill" style="width:96%;"></div></div>
                    </div>

                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Keyword Density</span>
                            <span style="color:var(--color-success); font-weight:700;">94/100</span>
                        </div>
                        <div class="progress-bar-bg"><div class="progress-bar-fill" style="width:94%;"></div></div>
                    </div>

                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Formatting &amp; Layout Compliance</span>
                            <span style="color:var(--accent-highlight); font-weight:700;">100/100</span>
                        </div>
                        <div class="progress-bar-bg"><div class="progress-bar-fill" style="width:100%;"></div></div>
                    </div>

                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Brevity &amp; Conciseness</span>
                            <span style="color:var(--color-warning); font-weight:700;">88/100</span>
                        </div>
                        <div class="progress-bar-bg"><div class="progress-bar-fill" style="width:88%;"></div></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN: KEYWORD MATCH & ACTIONABLE AI SUGGESTIONS -->
        <div class="col-span-8 flex flex-col gap-6">
            <!-- KEYWORD COMPARISON -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-4);">Target Job Keyword Match</h3>
                <p style="font-size:var(--text-xs); margin-bottom:var(--space-4);">Compared against: <b>Principal Staff Engineer - Stripe Inc.</b></p>
                
                <div class="grid grid-cols-2 gap-4">
                    <div class="glass-card p-4" style="background:var(--bg-secondary);">
                        <h4 style="font-size:var(--text-xs); color:var(--color-success); margin-bottom:8px;">&check; Matched Keywords (18)</h4>
                        <div style="display:flex; flex-wrap:wrap; gap:6px;">
                            <span class="badge badge-purple">Kubernetes</span>
                            <span class="badge badge-purple">Golang</span>
                            <span class="badge badge-purple">EKS Architecture</span>
                            <span class="badge badge-purple">CI/CD Pipeline</span>
                            <span class="badge badge-purple">Microservices</span>
                            <span class="badge badge-purple">AWS Infrastructure</span>
                        </div>
                    </div>

                    <div class="glass-card p-4" style="background:var(--bg-secondary);">
                        <h4 style="font-size:var(--text-xs); color:var(--color-warning); margin-bottom:8px;">&#9888; Recommended Keywords to Add (2)</h4>
                        <div style="display:flex; flex-wrap:wrap; gap:6px;">
                            <span class="badge badge-warning">gRPC Protocols</span>
                            <span class="badge badge-warning">Service Mesh Istio</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ACTIONABLE AI SUGGESTIONS -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-4);">Actionable AI Improvement Suggestions</h3>
                <div style="display:flex; flex-direction:column; gap:12px;">
                    <div class="glass-card p-4 flex items-center justify-between" style="background:var(--bg-secondary);">
                        <div style="flex:1;">
                            <span class="badge badge-purple" style="margin-bottom:4px;">Action Verb Suggestion</span>
                            <h4 style="font-size:var(--text-sm);">Replace generic verb "worked on" with "Architected" or "Spearheaded"</h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted);">Improves executive leadership impact score by +8%.</p>
                        </div>
                        <asp:Button ID="btnAutoFix1" runat="server" Text="Auto-Fix" CssClass="btn btn-primary btn-sm" OnClick="btnAutoFix_Click" />
                    </div>

                    <div class="glass-card p-4 flex items-center justify-between" style="background:var(--bg-secondary);">
                        <div style="flex:1;">
                            <span class="badge badge-cyan" style="margin-bottom:4px;">Keyword Integration</span>
                            <h4 style="font-size:var(--text-sm);">Insert "gRPC Microservices" into Lead Systems Architect experience</h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted);">Matches target job posting requirements at Stripe.</p>
                        </div>
                        <asp:Button ID="btnAutoFix2" runat="server" Text="Auto-Fix" CssClass="btn btn-primary btn-sm" OnClick="btnAutoFix_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
