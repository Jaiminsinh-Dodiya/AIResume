<%@ Page Title="How It Works - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="HowItWorks.aspx.cs" Inherits="AI_Resume_WebApplication.HowItWorks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- 1. HERO SECTION -->
    <section class="section" style="padding:var(--space-16) 0 var(--space-12) 0;">
        <div class="container text-center" style="max-width:820px; margin:0 auto;">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-6 glass-card" style="background:rgba(234, 170, 0, 0.12); border-color:rgba(234, 170, 0, 0.35);">
                <span class="badge badge-purple">UNDER THE HOOD</span>
                <span style="font-size:var(--text-xs); color:var(--text-secondary);">Enterprise ATS Parsing Engine</span>
            </div>

            <h1 style="font-size:clamp(2.5rem, 4vw, 3.75rem); line-height:1.15; margin-bottom:var(--space-6);">
                How <span class="text-gradient-purple">ResumeAI</span> Outsmarts Corporate ATS Parsers
            </h1>

            <p style="font-size:var(--text-lg); color:var(--text-secondary); line-height:1.6; margin-bottom:var(--space-8);">
                Our autonomous AI intelligence pipeline analyzes 5,000+ job descriptions per domain to guarantee your resume passes Greenhouse, Lever, Workday, and Taleo algorithms with top-tier rankings.
            </p>
        </div>
    </section>

    <!-- 2. 4-STAGE PIPELINE CARDS -->
    <section class="section" style="padding-bottom:var(--space-16);">
        <div class="container">
            <div class="grid grid-cols-4 gap-6">
                <!-- STEP 1 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between" style="border-radius:var(--radius-lg);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">01</span>
                            <span class="badge badge-purple">Import</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Universal Profile Setup</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                            Upload your current resume or populate your Master Career Profile. Our parser converts your history, skills, and projects into structured JSON.
                        </p>
                    </div>
                    <div class="pt-4 mt-4" style="border-top:1px solid var(--glass-border); font-size:11px; color:var(--text-muted);">
                        &bull; Structured data schema
                    </div>
                </div>

                <!-- STEP 2 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between" style="border-radius:var(--radius-lg);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:#FFF;">02</span>
                            <span class="badge badge-cyan">Inspect</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Target Job Analysis</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                            Paste any target job description. The AI engine extracts required hard skills, leadership keywords, and semantic density required by corporate ATS algorithms.
                        </p>
                    </div>
                    <div class="pt-4 mt-4" style="border-top:1px solid var(--glass-border); font-size:11px; color:var(--text-muted);">
                        &bull; Semantic keyword mapping
                    </div>
                </div>

                <!-- STEP 3 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between" style="border-radius:var(--radius-lg);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">03</span>
                            <span class="badge badge-purple">Optimize</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Smart Bullet Optimization</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                            1-click AI Smart Rewrite converts generic bullet points into high-impact, metric-driven achievements using action verbs and quantified revenue metrics.
                        </p>
                    </div>
                    <div class="pt-4 mt-4" style="border-top:1px solid var(--glass-border); font-size:11px; color:var(--text-muted);">
                        &bull; Action verbs &amp; quantifiable metrics
                    </div>
                </div>

                <!-- STEP 4 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between" style="border-radius:var(--radius-lg);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:var(--color-success);">04</span>
                            <span class="badge badge-success">Export</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Vector PDF Export</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                            Export your resume in crisp, pixel-perfect vector PDF format with zero image rasterization, guaranteeing 100% parser compatibility across all recruiting systems.
                        </p>
                    </div>
                    <div class="pt-4 mt-4" style="border-top:1px solid var(--glass-border); font-size:11px; color:var(--text-muted);">
                        &bull; 100% OCR text extraction
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. DEEP ARCHITECTURE: FAILURE VS RESUMEAI -->
    <section class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container grid grid-cols-12 gap-8 items-center">

            <div class="col-span-6">
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">DEEP ARCHITECTURE</span>
                <h2 style="margin-bottom:var(--space-4); font-size:var(--text-3xl);">Why Traditional Resumes Fail ATS Parsers</h2>
                <p style="font-size:var(--text-sm); color:var(--text-secondary); line-height:1.6; margin-bottom:var(--space-6);">
                    Over 75% of resumes submitted to Fortune 500 companies are rejected automatically by Applicant Tracking Systems before a human recruiter ever sees them.
                </p>

                <div style="display:flex; flex-direction:column; gap:14px; font-size:var(--text-xs);">
                    <div class="glass-card p-4 flex items-start gap-3" style="border-radius:var(--radius-md);">
                        <span style="color:var(--color-danger); font-weight:800; font-size:16px;">&times;</span>
                        <div>
                            <strong style="color:#FFF;">Two-Column Tables &amp; Text Boxes:</strong>
                            <p style="color:var(--text-secondary); margin:2px 0 0 0;">Traditional graphic templates break optical character recognition (OCR) in Workday and Taleo, scrambling text into unreadable fragments.</p>
                        </div>
                    </div>

                    <div class="glass-card p-4 flex items-start gap-3" style="border-radius:var(--radius-md);">
                        <span style="color:var(--color-danger); font-weight:800; font-size:16px;">&times;</span>
                        <div>
                            <strong style="color:#FFF;">Skill Rating Bars &amp; Star Icons:</strong>
                            <p style="color:var(--text-secondary); margin:2px 0 0 0;">Canva-style visual skill meters (e.g. 4/5 stars) are invisible to ATS scrapers, leaving your core proficiencies completely undetected.</p>
                        </div>
                    </div>

                    <div class="glass-card p-4 flex items-start gap-3" style="border-radius:var(--radius-md); border-color:rgba(16, 185, 129, 0.4);">
                        <span style="color:var(--color-success); font-weight:800; font-size:16px;">&check;</span>
                        <div>
                            <strong style="color:#FFF;">ResumeAI Semantic Architecture:</strong>
                            <p style="color:var(--text-secondary); margin:2px 0 0 0;">We render strict semantic HTML streams that convert cleanly into structured text during automated ATS ingestion without missing a single keyword.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-span-6">
                <div class="glass-card glow-border p-6" style="background:rgba(26, 7, 24, 0.95); border-radius:var(--radius-xl); box-shadow:var(--shadow-lg);">
                    <div class="flex justify-between items-center mb-6 pb-4" style="border-bottom:1px solid var(--glass-border);">
                        <div>
                            <span class="badge badge-purple">Live ATS Score Diagnostic</span>
                            <h3 style="font-size:var(--text-base); margin-top:4px;">Diagnostic Output Simulation</h3>
                        </div>
                        <div class="font-mono" style="font-size:var(--text-2xl); font-weight:800; color:var(--accent-primary);">98.4%</div>
                    </div>

                    <div style="display:flex; flex-direction:column; gap:12px; font-size:var(--text-xs);">
                        <div class="flex justify-between items-center p-3 glass-card" style="background:rgba(20, 5, 19, 0.85); border-radius:var(--radius-md);">
                            <span style="font-weight:600; color:#FFF;">Greenhouse ATS Parsing Extraction</span>
                            <span class="badge badge-success">&check; 100% Extract Rate</span>
                        </div>
                        <div class="flex justify-between items-center p-3 glass-card" style="background:rgba(20, 5, 19, 0.85); border-radius:var(--radius-md);">
                            <span style="font-weight:600; color:#FFF;">Lever Semantic Keyword Match Index</span>
                            <span class="badge badge-success">&check; 98% Match Index</span>
                        </div>
                        <div class="flex justify-between items-center p-3 glass-card" style="background:rgba(20, 5, 19, 0.85); border-radius:var(--radius-md);">
                            <span style="font-weight:600; color:#FFF;">Workday Hierarchy Formatting Compliance</span>
                            <span class="badge badge-success">&check; 100% Passed</span>
                        </div>
                        <div class="flex justify-between items-center p-3 glass-card" style="background:rgba(20, 5, 19, 0.85); border-radius:var(--radius-md);">
                            <span style="font-weight:600; color:#FFF;">Taleo Contact &amp; Metadata OCR Scraper</span>
                            <span class="badge badge-success">&check; 100% Clean Parse</span>
                        </div>
                    </div>

                    <div class="mt-6 pt-4 flex items-center justify-between" style="border-top:1px solid var(--glass-border); font-size:var(--text-xs); color:var(--text-muted);">
                        <span>Status: Verified Across 4 Enterprise Platforms</span>
                        <a href="Analyzer.aspx" class="btn btn-secondary btn-sm">Test Your Resume &rarr;</a>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <!-- 4. CALL TO ACTION BANNER -->
    <section class="section text-center" style="padding:var(--space-16) 0;">
        <div class="container">
            <div class="glass-card glow-border p-12" style="max-width:760px; margin:0 auto; background:linear-gradient(135deg, rgba(58,15,52,0.65), rgba(20,5,19,0.92)); border-radius:var(--radius-xl); box-shadow:var(--shadow-purple-glow);">
                <div class="badge badge-purple" style="margin-bottom:var(--space-3);">Get Hired Faster</div>
                <h2 style="font-size:var(--text-3xl); margin-bottom:var(--space-3);">Ready to Build Your ATS-Proof Resume?</h2>
                <p style="font-size:var(--text-base); color:var(--text-secondary); max-width:560px; margin:0 auto var(--space-8) auto; line-height:1.6;">
                    Join over 10,000 engineers, product managers, and executives landing interviews at top tech companies.
                </p>
                <div class="flex items-center justify-center gap-4 flex-wrap">
                    <a href="Register.aspx" class="btn btn-primary btn-lg">
                        Build Free Resume Now
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                    </a>
                    <a href="Templates.aspx" class="btn btn-secondary btn-lg">
                        Browse 20+ Templates
                    </a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
