<%@ Page Title="ResumeAI - Autonomous AI Resume Builder & Intelligence System" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AI_Resume_WebApplication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- 1. HERO SECTION -->
    <section class="hero-section" style="position:relative; padding:var(--space-12) 0 var(--space-16) 0; overflow:hidden;">
        <div class="container grid grid-cols-12 gap-8 items-center">
            
            <!-- Hero Left Copy -->
            <div class="col-span-7 hero-content animate-fade-up">
                <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-6 glass-card" style="background:rgba(234, 170, 0, 0.12); border-color:rgba(234, 170, 0, 0.35);">
                    <span class="badge badge-purple">AI Engine v4.8</span>
                    <span style="font-size:var(--text-xs); color:var(--text-secondary);">Autonomous ATS Scoring &amp; Real-Time Resume Optimization</span>
                </div>

                <h1 style="margin-bottom:var(--space-6); font-size:clamp(2.5rem, 4.5vw, 4rem); line-height:1.1;" class="hero-title">
                    Land 3x More Interviews With <span class="text-gradient-purple">AI-Powered Resumes</span>
                </h1>

                <p style="margin-bottom:var(--space-8); font-size:var(--text-lg); line-height:1.6;" class="hero-subtitle">
                    Transform your career background into executive-grade, ATS-proof resumes in minutes. Powered by real-time intelligence tailored for top tech &amp; leadership roles.
                </p>

                <div class="flex items-center gap-4 flex-wrap mb-8">
                    <a href="Register.aspx" class="btn btn-primary btn-lg">
                        Build Your Resume Free
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                    </a>
                    <a href="HowItWorks.aspx" class="btn btn-secondary btn-lg">
                        See How It Works
                    </a>
                </div>

                <!-- Trust Micro-Badges -->
                <div class="flex items-center gap-6 flex-wrap" style="font-size:var(--text-xs); color:var(--text-muted);">
                    <div class="flex items-center gap-2">
                        <span style="color:var(--color-success); font-weight:700;">&check;</span> No credit card required
                    </div>
                    <span>&bull;</span>
                    <div class="flex items-center gap-2">
                        <span style="color:var(--accent-primary);">&#11088;</span> 4.9/5 from 10,000+ job seekers
                    </div>
                    <span>&bull;</span>
                    <div class="flex items-center gap-2">
                        <span style="color:var(--accent-primary); font-weight:700;">&check;</span> Greenhouse &amp; Lever Verified
                    </div>
                </div>
            </div>

            <!-- Hero Right Live Preview Showcase -->
            <div class="col-span-5 hero-preview animate-fade-up" style="animation-delay:150ms;">
                <div class="glass-card glow-border p-4 relative" style="background:rgba(30, 8, 28, 0.9); box-shadow:var(--shadow-purple-glow); border-radius:var(--radius-xl);">
                    
                    <!-- Live ATS Metric Header -->
                    <div class="glass-card p-3 mb-4 flex items-center justify-between" style="background:var(--bg-surface); border-color:var(--accent-primary-glow);">
                        <div class="flex items-center gap-3">
                            <div class="stat-icon" style="color:var(--color-success); width:32px; height:32px;">
                                <svg class="icon-svg" style="width:16px; height:16px;" viewBox="0 0 24 24"><path d="M22 11.08V12a10 10 0 11-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                            </div>
                            <div>
                                <h4 style="font-size:var(--text-xs); margin:0;">ATS Match Index</h4>
                                <p style="font-size:var(--text-xs); color:var(--color-success); font-weight:700; margin:0;" class="font-mono">98% Match Rate</p>
                            </div>
                        </div>
                        <span class="badge badge-success">Passed All Filters</span>
                    </div>

                    <!-- AI Suggestion Bubble -->
                    <div class="glass-card p-3 mb-4" style="background:rgba(58, 15, 52, 0.7); border:1px solid rgba(234, 170, 0, 0.3);">
                        <p style="font-size:var(--text-xs); margin:0; line-height:1.4;">
                            &#10024; <b style="color:var(--accent-primary);">AI Suggestion:</b> Add quantifiable metrics to your Cloud Infrastructure bullet points to boost impact by 14%.
                        </p>
                    </div>

                    <!-- Realistic Mini A4 Paper Preview -->
                    <div style="background:#FFF; color:#0F172A; border-radius:var(--radius-md); padding:var(--space-5); font-size:10px; line-height:1.4; box-shadow:0 8px 24px rgba(0,0,0,0.4);">
                        <h3 style="font-size:14px; color:#0F172A; margin-bottom:2px; font-weight:800;">Alexander Wright</h3>
                        <p style="color:var(--accent-secondary); font-weight:700; font-size:11px; margin-bottom:4px;">Senior Principal Software Engineer</p>
                        <p style="color:#64748B; font-size:9px; margin-bottom:10px;">San Francisco, CA &bull; alexander@tech.io &bull; linkedin.com/in/alexanderwright</p>
                        
                        <h4 style="color:#0F172A; font-size:10px; border-bottom:1.5px solid #E2E8F0; padding-bottom:2px; margin-bottom:4px; font-weight:700;">WORK EXPERIENCE</h4>
                        <p style="font-weight:700; color:#1E293B; font-size:9px;">Lead Systems Architect - CloudScale Inc. (2021 &ndash; Present)</p>
                        <p style="font-size:9px; color:#475569; margin:2px 0;">&bull; Scaled Kubernetes microservices architecture to process 4.2B daily API requests with 99.99% SLA.</p>
                        <p style="font-size:9px; color:#475569; margin:2px 0;">&bull; Architected automated CI/CD pipeline reducing deployment latency by 64% across 80+ microservices.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 2. METRICS STRIP -->
    <section style="padding:var(--space-8) 0; border-top:1px solid var(--glass-border); border-bottom:1px solid var(--glass-border); background:rgba(30, 8, 28, 0.6);">
        <div class="container">
            <div class="grid grid-cols-4 gap-6 text-center">
                <div class="p-4">
                    <div class="stat-number" style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">10,000+</div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); text-transform:uppercase; letter-spacing:0.04em;">Resumes Optimized</div>
                </div>
                <div class="p-4">
                    <div class="stat-number" style="font-size:var(--text-3xl); font-weight:800; color:#FFF;">98.4%</div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); text-transform:uppercase; letter-spacing:0.04em;">ATS Extraction Rate</div>
                </div>
                <div class="p-4">
                    <div class="stat-number" style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">3.2x</div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); text-transform:uppercase; letter-spacing:0.04em;">Interview Callback Rate</div>
                </div>
                <div class="p-4">
                    <div class="stat-number" style="font-size:var(--text-3xl); font-weight:800; color:#FFF;">20+</div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); text-transform:uppercase; letter-spacing:0.04em;">Vector Templates</div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. AUTONOMOUS WORKFLOW SECTION -->
    <section class="section" style="padding:var(--space-16) 0; background:var(--bg-secondary);">
        <div class="container">
            <div style="text-align:center; max-width:640px; margin:0 auto var(--space-12) auto;">
                <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Autonomous Workflow</span>
                <h2>How ResumeAI Works in 4 Simple Steps</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">From raw career history to interview invitations in under 5 minutes.</p>
            </div>

            <div class="grid grid-cols-4 gap-6">
                <div class="glass-card p-6 flex flex-col justify-between">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:12px;">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">01</span>
                            <span class="badge badge-purple">Import</span>
                        </div>
                        <h3 style="font-size:var(--text-base); margin-bottom:8px;">Import Background</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.5;">
                            Upload your existing PDF/DOCX or fill out your Master Career Profile once.
                        </p>
                    </div>
                </div>

                <div class="glass-card p-6 flex flex-col justify-between">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:12px;">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:#FFF;">02</span>
                            <span class="badge badge-cyan">Inspect</span>
                        </div>
                        <h3 style="font-size:var(--text-base); margin-bottom:8px;">Paste Target Job</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.5;">
                            Paste any job description to trigger instant semantic keyword and density analysis.
                        </p>
                    </div>
                </div>

                <div class="glass-card p-6 flex flex-col justify-between">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:12px;">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">03</span>
                            <span class="badge badge-purple">Optimize</span>
                        </div>
                        <h3 style="font-size:var(--text-base); margin-bottom:8px;">AI Smart Optimization</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.5;">
                            1-click rewrite transforms basic bullet points into quantified, high-impact achievements.
                        </p>
                    </div>
                </div>

                <div class="glass-card p-6 flex flex-col justify-between">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:12px;">
                            <span class="font-mono" style="font-size:var(--text-3xl); font-weight:800; color:var(--color-success);">04</span>
                            <span class="badge badge-success">Export</span>
                        </div>
                        <h3 style="font-size:var(--text-base); margin-bottom:8px;">Vector PDF Export</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.5;">
                            Download clean, pixel-perfect vector PDFs guaranteed to pass all recruiting systems.
                        </p>
                    </div>
                </div>
            </div>

            <div style="text-align:center; margin-top:var(--space-8);">
                <a href="HowItWorks.aspx" class="btn btn-secondary">Explore Detailed ATS Architecture &rarr;</a>
            </div>
        </div>
    </section>

    <!-- 4. INTELLIGENT FEATURES BENTO GRID -->
    <section class="section" style="padding:var(--space-16) 0;">
        <div class="container">
            <div style="text-align:center; max-width:640px; margin:0 auto var(--space-12) auto;">
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">Built for Job Seekers &amp; Executives</span>
                <h2>Everything You Need to Win Your Dream Role</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">Designed from the ground up to beat ATS algorithms and captivate hiring teams.</p>
            </div>

            <div class="grid grid-cols-12 gap-8">
                <!-- Large Spotlight Feature (Span 7) -->
                <div class="col-span-7 glass-card glow-border p-8 flex flex-col justify-between">
                    <div>
                        <div class="stat-icon mb-4" style="color:var(--accent-primary); width:44px; height:44px;">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
                        </div>
                        <h3 style="font-size:var(--text-xl); margin-bottom:var(--space-2);">Real-Time ATS Inspector &amp; Gap Diagnostics</h3>
                        <p style="font-size:var(--text-sm); color:var(--text-secondary); margin-bottom:var(--space-6); line-height:1.6;">
                            Scan your resume against any job posting. The engine identifies missing hard skills, analyzes semantic keyword density, and checks layout parseability in real time.
                        </p>
                    </div>
                    <div class="flex items-center justify-between flex-wrap gap-4 pt-4" style="border-top:1px solid var(--glass-border);">
                        <span class="badge badge-purple">Greenhouse &bull; Lever &bull; Workday Ready</span>
                        <a href="Analyzer.aspx" class="btn btn-primary btn-sm">Run ATS Scan Now &rarr;</a>
                    </div>
                </div>

                <!-- Secondary Spotlight (Span 5) -->
                <div class="col-span-5 glass-card glow-border p-8 flex flex-col justify-between">
                    <div>
                        <div class="stat-icon mb-4" style="color:var(--accent-highlight); width:44px; height:44px;">
                            <svg class="icon-svg" viewBox="0 0 24 24"><path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                        </div>
                        <h3 style="font-size:var(--text-xl); margin-bottom:var(--space-2);">AI Smart Bullet Generator</h3>
                        <p style="font-size:var(--text-sm); color:var(--text-secondary); line-height:1.6;">
                            Generate high-impact, metric-driven achievements tailored specifically to senior engineering, design, and management roles with proven action verbs.
                        </p>
                    </div>
                    <div class="pt-4" style="border-top:1px solid var(--glass-border);">
                        <span class="badge badge-cyan">Quantified Revenue Impact</span>
                    </div>
                </div>

                <!-- Feature Card 3 (Span 6) -->
                <div class="col-span-6 glass-card glow-border p-6 flex items-start gap-4">
                    <div class="stat-icon" style="color:var(--color-success); width:40px; height:40px; flex-shrink:0;">
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                    </div>
                    <div>
                        <h4 style="font-size:var(--text-base); margin-bottom:4px;">Vector PDF Engine</h4>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.5;">
                            Zero rasterization. Exports structured, machine-readable text layers that parse flawlessly across all major enterprise ATS platforms.
                        </p>
                    </div>
                </div>

                <!-- Feature Card 4 (Span 6) -->
                <div class="col-span-6 glass-card glow-border p-6 flex items-start gap-4">
                    <div class="stat-icon" style="color:var(--accent-primary); width:40px; height:40px; flex-shrink:0;">
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 14H9V8h2v8zm4 0h-2V8h2v8z"/></svg>
                    </div>
                    <div>
                        <h4 style="font-size:var(--text-base); margin-bottom:4px;">Multi-Target Resume Versions</h4>
                        <p style="font-size:var(--text-xs); color:var(--text-secondary); line-height:1.5;">
                            Spin off targeted variants from your Master Career Profile in seconds, maintaining unified work history with job-specific keyword tuning.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 5. ATS VERIFICATION TABLE -->
    <section class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container text-center" style="max-width:860px; margin:0 auto;">
            <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Proven Results</span>
            <h2 style="margin-bottom:var(--space-4);">100% Extraction Rate Across Corporate ATS Systems</h2>
            <p style="font-size:var(--text-sm); color:var(--text-muted); margin-bottom:var(--space-8);">
                Tested across thousands of live candidate submissions to ensure zero parsing errors.
            </p>

            <div class="glass-card p-6 overflow-hidden" style="border-radius:var(--radius-lg);">
                <table style="width:100%; text-align:left; font-size:var(--text-xs); border-collapse:collapse;">
                    <thead>
                        <tr style="border-bottom:1px solid var(--glass-border); color:var(--text-primary);">
                            <th style="padding:14px;">ATS Platform</th>
                            <th style="padding:14px;">Parsing Compatibility</th>
                            <th style="padding:14px;">Keyword Extraction</th>
                            <th style="padding:14px; text-align:right;">Status</th>
                        </tr>
                    </thead>
                    <tbody style="color:var(--text-secondary);">
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:700; color:#FFF;">Greenhouse ATS</td>
                            <td style="padding:14px;">100% Clean Parse</td>
                            <td style="padding:14px;">Full Match</td>
                            <td style="padding:14px; text-align:right;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:700; color:#FFF;">Lever Recruitment</td>
                            <td style="padding:14px;">100% Clean Parse</td>
                            <td style="padding:14px;">Full Match</td>
                            <td style="padding:14px; text-align:right;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:14px; font-weight:700; color:#FFF;">Workday HCM</td>
                            <td style="padding:14px;">100% Clean Parse</td>
                            <td style="padding:14px;">Full Match</td>
                            <td style="padding:14px; text-align:right;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                        <tr>
                            <td style="padding:14px; font-weight:700; color:#FFF;">Oracle Taleo</td>
                            <td style="padding:14px;">99.8% Clean Parse</td>
                            <td style="padding:14px;">Full Match</td>
                            <td style="padding:14px; text-align:right;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- 6. FAQ ACCORDION -->
    <section class="section" style="padding:var(--space-16) 0;">
        <div class="container" style="max-width:760px; margin:0 auto;">
            <div style="text-align:center; margin-bottom:var(--space-12);">
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">Got Questions?</span>
                <h2>Frequently Asked Questions</h2>
            </div>

            <div style="display:flex; flex-direction:column; gap:16px;">
                <details class="glass-card p-6" style="cursor:pointer; border-radius:var(--radius-lg);">
                    <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                        How does ResumeAI ensure my resume passes ATS filters?
                    </summary>
                    <p style="margin-top:12px; font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                        ResumeAI uses strict single and dual-column ATS-compliant HTML layouts and outputs vector PDFs. It avoids rasterized images, complex tables, or text boxes that cause parsing failures in Greenhouse, Lever, and Workday.
                    </p>
                </details>

                <details class="glass-card p-6" style="cursor:pointer; border-radius:var(--radius-lg);">
                    <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                        Can I target multiple job descriptions with different resumes?
                    </summary>
                    <p style="margin-top:12px; font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                        Yes! You can create unlimited targeted resume versions from your Master Career Profile. Each resume version can be tailored to a specific job description with 1-click AI optimizations.
                    </p>
                </details>

                <details class="glass-card p-6" style="cursor:pointer; border-radius:var(--radius-lg);">
                    <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                        Is my personal career data private and secure?
                    </summary>
                    <p style="margin-top:12px; font-size:var(--text-xs); color:var(--text-secondary); line-height:1.6;">
                        Absolutely. We never sell your personal data or use your private work history to train public AI models. All data is encrypted in transit and at rest.
                    </p>
                </details>
            </div>
        </div>
    </section>

    <!-- 7. PRICING SECTION -->
    <section id="pricing" class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container">
            <div style="text-align:center; max-width:640px; margin:0 auto var(--space-12) auto;">
                <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Flexible Pricing</span>
                <h2>Simple, Transparent Plans</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">Start building your resume for free. Upgrade when you need unlimited AI optimizations.</p>
            </div>

            <div class="grid grid-cols-3 gap-8 items-stretch">
                <!-- Free Tier -->
                <div class="glass-card p-6 flex flex-col justify-between" style="border-radius:var(--radius-lg);">
                    <div>
                        <h3 style="margin-bottom:var(--space-2);">Free Starter</h3>
                        <div class="stat-number" style="font-size:var(--text-4xl); font-weight:800; margin-bottom:var(--space-4);">$0</div>
                        <ul style="display:flex; flex-direction:column; gap:10px; font-size:var(--text-xs); margin-bottom:var(--space-6); color:var(--text-secondary);">
                            <li>&check; 1 Active Resume Draft</li>
                            <li>&check; Standard Document Templates</li>
                            <li>&check; Basic PDF Export</li>
                        </ul>
                    </div>
                    <a href="Register.aspx" class="btn btn-secondary btn-full" style="text-align:center;">Get Started Free</a>
                </div>

                <!-- Pro Tier (Popular) -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between relative" style="border-color:var(--accent-primary); background:rgba(58, 15, 52, 0.6); border-radius:var(--radius-xl); transform:scale(1.03); box-shadow:var(--shadow-purple-glow);">
                    <div>
                        <span class="badge badge-purple" style="margin-bottom:var(--space-2);">Most Popular</span>
                        <h3 style="margin-bottom:var(--space-2);">Pro AI Pass</h3>
                        <div class="stat-number" style="font-size:var(--text-4xl); font-weight:800; color:var(--accent-primary); margin-bottom:var(--space-4);">
                            $19 <span style="font-size:var(--text-sm); color:var(--text-muted); font-weight:400;">/ mo</span>
                        </div>
                        <ul style="display:flex; flex-direction:column; gap:10px; font-size:var(--text-xs); margin-bottom:var(--space-6); color:#FFF;">
                            <li>&check; Unlimited Resumes &amp; Cover Letters</li>
                            <li>&check; Unlimited AI Bullet Point Generation</li>
                            <li>&check; Real-Time ATS Match Scoring</li>
                            <li>&check; All 20+ Liquid Glass Templates</li>
                            <li>&check; High-Res Vector PDF &amp; Word Export</li>
                        </ul>
                    </div>
                    <a href="Register.aspx" class="btn btn-primary btn-full btn-lg" style="text-align:center;">Start 7-Day Free Trial</a>
                </div>

                <!-- Executive Tier -->
                <div class="glass-card p-6 flex flex-col justify-between" style="border-radius:var(--radius-lg);">
                    <div>
                        <h3 style="margin-bottom:var(--space-2);">Executive Suite</h3>
                        <div class="stat-number" style="font-size:var(--text-4xl); font-weight:800; margin-bottom:var(--space-4);">
                            $49 <span style="font-size:var(--text-sm); color:var(--text-muted); font-weight:400;">/ mo</span>
                        </div>
                        <ul style="display:flex; flex-direction:column; gap:10px; font-size:var(--text-xs); margin-bottom:var(--space-6); color:var(--text-secondary);">
                            <li>&check; Everything in Pro</li>
                            <li>&check; 1-on-1 Executive Review Coaching</li>
                            <li>&check; Priority AI Model Processing</li>
                            <li>&check; Custom Portfolio Page Host</li>
                        </ul>
                    </div>
                    <a href="Register.aspx" class="btn btn-secondary btn-full" style="text-align:center;">Get Executive Suite</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
