<%@ Page Title="Features - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="AI_Resume_WebApplication.Features" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="padding:var(--space-16) var(--space-4);">

        <!-- 1. HERO HEADER -->
        <div class="text-center" style="max-width:820px; margin:0 auto var(--space-16) auto;">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-6 glass-card" style="background:rgba(234, 170, 0, 0.12); border-color:rgba(234, 170, 0, 0.35);">
                <span class="badge badge-purple">Enterprise Capabilities</span>
                <span style="font-size:var(--text-xs); color:var(--text-secondary);">Autonomous Resume Intelligence</span>
            </div>

            <h1 class="hero-title" style="font-size:clamp(2.5rem, 4vw, 3.75rem); line-height:1.15; margin-bottom:var(--space-4);">
                Features Engineered to Win <span class="text-gradient-purple">Top-Tier Roles</span>
            </h1>
            <p class="hero-subtitle" style="font-size:var(--text-lg); color:var(--text-secondary); line-height:1.6; max-width:640px; margin:0 auto;">
                A comprehensive suite of deep-tech intelligence tools designed specifically for modern engineering, product, and executive resumes.
            </p>
        </div>

        <!-- 2. BENTO FEATURE GRID -->
        <div class="grid grid-cols-12 gap-8 mb-20">

            <!-- Large Card 1: Generative AI (Span 8) -->
            <div class="col-span-8 glass-card glow-border p-8 flex flex-col justify-between" style="border-radius:var(--radius-xl);">
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="stat-icon" style="color:var(--accent-primary); width:44px; height:44px;">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                        </div>
                        <span class="badge badge-purple">AI Core Engine</span>
                    </div>
                    <h3 style="font-size:var(--text-2xl); margin-bottom:var(--space-2);">Generative AI Bullet Rewriting &amp; Metric Synthesis</h3>
                    <p style="font-size:var(--text-sm); color:var(--text-secondary); line-height:1.6; margin-bottom:var(--space-6);">
                        Eliminate generic bullet points. Our AI engine understands complex technical systems and translates raw job duties into quantified, high-impact leadership achievements with industry-standard action verbs.
                    </p>
                </div>
                <div class="p-4 glass-card" style="background:rgba(20, 5, 19, 0.85); border-radius:var(--radius-md);">
                    <div style="font-size:11px; color:var(--text-muted); margin-bottom:4px;" class="font-mono">LIVE OPTIMIZATION EXAMPLE:</div>
                    <div style="font-size:var(--text-xs); color:#A7F3D0; line-height:1.5;">
                        &ldquo;Architected automated CI/CD deployment pipeline reducing latency by 64% across 80+ microservices serving 4.2B daily queries.&rdquo;
                    </div>
                </div>
            </div>

            <!-- Card 2: Job Description Matcher (Span 4) -->
            <div class="col-span-4 glass-card glow-border p-8 flex flex-col justify-between" style="border-radius:var(--radius-xl);">
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="stat-icon" style="color:var(--accent-highlight); width:44px; height:44px;">
                            <svg class="icon-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>
                        </div>
                        <span class="badge badge-cyan">Semantic Match</span>
                    </div>
                    <h3 style="font-size:var(--text-xl); margin-bottom:var(--space-2);">Target Job Matching</h3>
                    <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                        Paste any target job description. The engine identifies required technical competencies and surfaces exact keywords missing from your current document.
                    </p>
                </div>
                <div class="pt-4" style="border-top:1px solid var(--glass-border);">
                    <span class="badge badge-purple">98.4% Match Accuracy</span>
                </div>
            </div>

            <!-- Card 3: ATS Score Diagnostics (Span 4) -->
            <div class="col-span-4 glass-card glow-border p-8 flex flex-col justify-between" style="border-radius:var(--radius-xl);">
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="stat-icon" style="color:var(--accent-secondary); width:44px; height:44px;">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M18 20V10M12 20V4M6 20v-6"/></svg>
                        </div>
                        <span class="badge badge-purple">Real-Time Scoring</span>
                    </div>
                    <h3 style="font-size:var(--text-xl); margin-bottom:var(--space-2);">ATS Readiness Gauge</h3>
                    <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                        Get an automated 0-100 diagnostic score assessing parseability, semantic density, contact structure, and section hierarchy across enterprise ATS filters.
                    </p>
                </div>
                <div class="pt-4" style="border-top:1px solid var(--glass-border);">
                    <a href="Analyzer.aspx" class="btn btn-secondary btn-sm btn-full" style="text-align:center;">Run Analyzer Scan &rarr;</a>
                </div>
            </div>

            <!-- Large Card 4: Live Preview & Vector PDF (Span 8) -->
            <div class="col-span-8 glass-card glow-border p-8 flex flex-col justify-between" style="border-radius:var(--radius-xl);">
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="stat-icon" style="color:var(--color-success); width:44px; height:44px;">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M4 5h16M4 10h16M4 15h10"/></svg>
                        </div>
                        <span class="badge badge-success">Pixel Perfect</span>
                    </div>
                    <h3 style="font-size:var(--text-2xl); margin-bottom:var(--space-2);">Live Preview Studio &amp; Clean Vector PDF Export</h3>
                    <p style="font-size:var(--text-sm); color:var(--text-secondary); line-height:1.6; margin-bottom:var(--space-4);">
                        Edit your structured data on the left panel, and instantly see a real-time, pixel-perfect A4 replica on the right. Exports in vector PDF with clean machine-readable text layers—never fuzzy rasterized images.
                    </p>
                </div>
                <div class="flex items-center gap-4 flex-wrap pt-4" style="border-top:1px solid var(--glass-border);">
                    <span class="badge badge-cyan">20+ Canva-Grade Templates</span>
                    <span class="badge badge-purple">Zero OCR Degradation</span>
                    <a href="Templates.aspx" class="btn btn-primary btn-sm" style="margin-left:auto;">Explore Templates &rarr;</a>
                </div>
            </div>

        </div>

        <!-- 3. FEATURE COMPARISON MATRIX -->
        <div class="glass-card p-8 mb-20" style="border-radius:var(--radius-xl);">
            <div class="text-center" style="max-width:600px; margin:0 auto var(--space-8) auto;">
                <span class="badge badge-purple" style="margin-bottom:var(--space-2);">Plan Capabilities</span>
                <h2>Free vs Pro Feature Comparison</h2>
            </div>

            <div class="overflow-hidden">
                <table style="width:100%; text-align:left; font-size:var(--text-sm); border-collapse:collapse;">
                    <thead>
                        <tr style="border-bottom:1px solid var(--glass-border); color:var(--text-primary);">
                            <th style="padding:14px;">Capability</th>
                            <th style="padding:14px; text-align:center;">Free Starter</th>
                            <th style="padding:14px; text-align:center; color:var(--accent-primary);">Pro AI Pass</th>
                        </tr>
                    </thead>
                    <tbody style="color:var(--text-secondary);">
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:600; color:#FFF;">Master Career Profile Manager</td>
                            <td style="padding:14px; text-align:center; color:var(--color-success);">&check; Included</td>
                            <td style="padding:14px; text-align:center; color:var(--color-success);">&check; Included</td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:600; color:#FFF;">Active Resume Drafts</td>
                            <td style="padding:14px; text-align:center;">1 Draft</td>
                            <td style="padding:14px; text-align:center; color:var(--accent-primary); font-weight:700;">Unlimited</td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:600; color:#FFF;">AI Smart Bullet Rewriting</td>
                            <td style="padding:14px; text-align:center; color:var(--text-muted);">5 / month</td>
                            <td style="padding:14px; text-align:center; color:var(--accent-primary); font-weight:700;">Unlimited</td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:600; color:#FFF;">Real-Time ATS Match Diagnostics</td>
                            <td style="padding:14px; text-align:center;">Basic Score</td>
                            <td style="padding:14px; text-align:center; color:var(--accent-primary); font-weight:700;">Deep Semantic Breakdown</td>
                        </tr>
                        <tr>
                            <td style="padding:14px; font-weight:600; color:#FFF;">Vector PDF &amp; Word Export</td>
                            <td style="padding:14px; text-align:center; color:var(--color-success);">&check; Standard PDF</td>
                            <td style="padding:14px; text-align:center; color:var(--accent-primary); font-weight:700;">High-Res Vector PDF + Word</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 4. BOTTOM CTA -->
        <div class="glass-card glow-border p-12 text-center" style="max-width:760px; margin:0 auto; background:linear-gradient(135deg, rgba(58,15,52,0.65), rgba(20,5,19,0.92)); border-radius:var(--radius-xl); box-shadow:var(--shadow-purple-glow);">
            <h2 style="font-size:var(--text-3xl); margin-bottom:var(--space-3);">Supercharge Your Job Search Today</h2>
            <p style="font-size:var(--text-base); color:var(--text-secondary); max-width:540px; margin:0 auto var(--space-8) auto; line-height:1.6;">
                Build an ATS-optimized, executive-grade resume tailored for your next major career milestone.
            </p>
            <a href="Register.aspx" class="btn btn-primary btn-lg">
                Create Free Resume Now
                <svg class="icon-svg" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
            </a>
        </div>

    </div>
</asp:Content>
