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
        <div class="flex items-center gap-3">
            <asp:Label ID="lblAnalyzerStatus" runat="server" CssClass="badge badge-purple" Visible="false"></asp:Label>
            <asp:Button ID="btnAnalyze" runat="server" Text="Re-Scan Document" CssClass="btn btn-primary btn-sm" OnClick="btnAnalyze_Click" ValidationGroup="AnalyzerGroup" />
        </div>
    </div>

    <!-- UPLOAD & JOB DESCRIPTION SCAN SECTION -->
    <div class="glass-card mb-8 p-6 glow-border">
        <h3 style="margin-bottom:var(--space-4);">Upload &amp; Scan Target Job</h3>
        <div class="grid grid-cols-2 gap-6">
            <div class="form-group">
                <label for="<%= fileResumeUpload.ClientID %>" class="form-label">Upload Resume (TXT / PDF / DOCX - Optional)</label>
                <asp:FileUpload ID="fileResumeUpload" runat="server" CssClass="form-input" />
                <span style="font-size:11px; color:var(--text-muted); display:block; margin-top:4px;">If no file is uploaded, your saved profile data (skills, summary, experience) is automatically analyzed.</span>
            </div>
            <div class="form-group">
                <label for="<%= txtJobDescription.ClientID %>" class="form-label">Target Job Description</label>
                <asp:TextBox ID="txtJobDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-input" placeholder="Paste target job description here... (e.g. required skills, responsibilities)"></asp:TextBox>
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
                        <asp:Label ID="lblOverallScore" runat="server" Text="88%" CssClass="text-gradient-purple" style="font-size:var(--text-4xl); font-weight:800; line-height:1;"></asp:Label>
                        <asp:Label ID="lblScoreRating" runat="server" Text="STRONG MATCH" style="font-size:10px; color:var(--text-muted); text-transform:uppercase; display:block; margin-top:4px;"></asp:Label>
                    </div>
                </div>
                <asp:Label ID="lblAtsStatus" runat="server" Text="Greenhouse &amp; Lever Ready" CssClass="badge badge-success"></asp:Label>
            </div>

            <!-- SCORE BREAKDOWN CATEGORIES -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-4);">Score Breakdown</h3>
                <div style="display:flex; flex-direction:column; gap:16px;">
                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Impact &amp; Action Verbs</span>
                            <asp:Label ID="lblImpactScore" runat="server" Text="88/100" style="color:var(--color-success); font-weight:700;"></asp:Label>
                        </div>
                        <div class="progress-bar-bg"><div id="pbImpact" runat="server" class="progress-bar-fill" style="width:88%;"></div></div>
                    </div>

                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Keyword Density</span>
                            <asp:Label ID="lblKeywordScore" runat="server" Text="82/100" style="color:var(--color-success); font-weight:700;"></asp:Label>
                        </div>
                        <div class="progress-bar-bg"><div id="pbKeyword" runat="server" class="progress-bar-fill" style="width:82%;"></div></div>
                    </div>

                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Formatting &amp; Layout Compliance</span>
                            <asp:Label ID="lblFormatScore" runat="server" Text="95/100" style="color:var(--accent-highlight); font-weight:700;"></asp:Label>
                        </div>
                        <div class="progress-bar-bg"><div id="pbFormat" runat="server" class="progress-bar-fill" style="width:95%;"></div></div>
                    </div>

                    <div>
                        <div class="flex justify-between" style="font-size:var(--text-xs); margin-bottom:4px;">
                            <span>Brevity &amp; Conciseness</span>
                            <asp:Label ID="lblBrevityScore" runat="server" Text="86/100" style="color:var(--color-warning); font-weight:700;"></asp:Label>
                        </div>
                        <div class="progress-bar-bg"><div id="pbBrevity" runat="server" class="progress-bar-fill" style="width:86%;"></div></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN: KEYWORD MATCH & ACTIONABLE AI SUGGESTIONS -->
        <div class="col-span-8 flex flex-col gap-6">
            <!-- KEYWORD COMPARISON -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-4);">Target Job Keyword Match</h3>
                <p style="font-size:var(--text-xs); margin-bottom:var(--space-4);">Compared against: <b><asp:Label ID="lblComparedJob" runat="server" Text="Target Job Posting"></asp:Label></b></p>
                
                <div class="grid grid-cols-2 gap-4">
                    <div class="glass-card p-4" style="background:var(--bg-secondary);">
                        <h4 style="font-size:var(--text-xs); color:var(--color-success); margin-bottom:8px;">&check; Matched Keywords</h4>
                        <div style="display:flex; flex-wrap:wrap; gap:6px;">
                            <asp:Literal ID="litMatchedKeywords" runat="server">
                                <span class="badge badge-purple">C#</span>
                                <span class="badge badge-purple">ASP.NET</span>
                                <span class="badge badge-purple">SQL Server</span>
                                <span class="badge badge-purple">REST API</span>
                            </asp:Literal>
                        </div>
                    </div>

                    <div class="glass-card p-4" style="background:var(--bg-secondary);">
                        <h4 style="font-size:var(--text-xs); color:var(--color-warning); margin-bottom:8px;">&#9888; Recommended Keywords to Add</h4>
                        <div style="display:flex; flex-wrap:wrap; gap:6px;">
                            <asp:Literal ID="litRecommendedKeywords" runat="server">
                                <span class="badge badge-warning">Docker</span>
                                <span class="badge badge-warning">CI/CD</span>
                            </asp:Literal>
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
                            <asp:Label ID="lblSugTag1" runat="server" CssClass="badge badge-purple" style="margin-bottom:4px;" Text="Action Verb Suggestion"></asp:Label>
                            <h4 style="font-size:var(--text-sm);"><asp:Label ID="lblSugTitle1" runat="server" Text="Replace generic verb 'worked on' with 'Architected' or 'Spearheaded'"></asp:Label></h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted);"><asp:Label ID="lblSugDesc1" runat="server" Text="Improves executive leadership impact score by +8%."></asp:Label></p>
                        </div>
                        <asp:Button ID="btnAutoFix1" runat="server" Text="Auto-Fix" CssClass="btn btn-primary btn-sm" OnClick="btnAutoFix_Click" CommandArgument="1" />
                    </div>

                    <div class="glass-card p-4 flex items-center justify-between" style="background:var(--bg-secondary);">
                        <div style="flex:1;">
                            <asp:Label ID="lblSugTag2" runat="server" CssClass="badge badge-cyan" style="margin-bottom:4px;" Text="Keyword Integration"></asp:Label>
                            <h4 style="font-size:var(--text-sm);"><asp:Label ID="lblSugTitle2" runat="server" Text="Add recommended missing skills to your profile"></asp:Label></h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted);"><asp:Label ID="lblSugDesc2" runat="server" Text="Adds missing industry terms directly into your Skills database."></asp:Label></p>
                        </div>
                        <asp:Button ID="btnAutoFix2" runat="server" Text="Auto-Fix" CssClass="btn btn-primary btn-sm" OnClick="btnAutoFix_Click" CommandArgument="2" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
