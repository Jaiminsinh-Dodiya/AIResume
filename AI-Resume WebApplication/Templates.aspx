<%@ Page Title="Resume Templates Gallery - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Templates.aspx.cs" Inherits="AI_Resume_WebApplication.Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Specific gallery styles to enhance the page */
        .gallery-header {
            margin-bottom: var(--space-12);
            text-align: center;
        }
        .gallery-header h1 {
            font-size: var(--text-4xl);
            font-weight: 800;
            background: linear-gradient(135deg, #FFFFFF 0%, #EAAA00 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: var(--space-4);
        }
        .template-card {
            transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275), box-shadow 0.4s ease, border-color 0.4s ease;
            transform-style: preserve-3d;
            perspective: 1000px;
        }
        .template-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.4), 0 0 20px rgba(234, 170, 0, 0.25);
            border-color: rgba(234, 170, 0, 0.45);
            z-index: 10;
        }
        
        /* Premium Thumbnail Wrappers */
        .premium-thumb {
            width: 100%;
            height: 320px;
            background: #FFF;
            border-radius: 4px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: relative;
            margin-bottom: 20px;
        }

        /* Nova Thumbnail */
        .thumb-nova {
            display: flex;
        }
        .thumb-nova .mock-sidebar {
            width: 34%;
            background: #111827;
            border-top: 4px solid var(--accent-primary);
            padding: 10px;
            box-sizing: border-box;
        }
        .thumb-nova .main {
            width: 66%;
            padding: 10px;
            box-sizing: border-box;
        }
        .thumb-nova .mock-line { background: rgba(255,255,255,0.2); height: 4px; border-radius: 2px; margin-bottom: 6px; }
        .thumb-nova .mock-line.dark { background: #E2E8F0; }
        .thumb-nova .mock-circle { width: 8px; height: 8px; border-radius: 50%; background: var(--accent-primary); margin-bottom: 6px; }

        /* Prestige Thumbnail */
        .thumb-prestige {
            padding: 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .thumb-prestige .header {
            text-align: center;
            width: 100%;
            border-bottom: 1px solid var(--accent-primary);
            padding-bottom: 8px;
            margin-bottom: 8px;
        }
        .thumb-prestige .mock-title { font-family: serif; font-size: 10px; font-weight: bold; color: #000; }
        .thumb-prestige .mock-line { background: #CBD5E1; height: 3px; border-radius: 2px; margin-bottom: 4px; width: 100%; }

        /* Aura Thumbnail */
        .thumb-aura {
            padding: 16px;
            background: #FAFAFA;
        }
        .thumb-aura .inner-glass {
            background: #FFF;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            height: 100%;
            padding: 10px;
        }
        .thumb-aura .mock-gradient { background: linear-gradient(90deg, var(--accent-primary), transparent); height: 6px; width: 40px; border-radius: 3px; margin-bottom: 8px; }
        .thumb-aura .mock-tag { background: #F1F5F9; border: 1px solid #E2E8F0; height: 8px; width: 24px; border-radius: 4px; display: inline-block; margin-right: 4px; }
    </style>
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="gallery-header">
        <h1>Next-Level Templates</h1>
        <p style="font-size:var(--text-lg); color:var(--text-muted); max-width:600px; margin:0 auto;">
            Powered by advanced CSS Flexbox, SVG iconography, and ultra-premium typography. Designed to beat ATS parsers while looking stunning.
        </p>
    </div>

    <!-- SEARCH & FILTER BAR -->
    <div class="glass-card p-4" style="margin-bottom:var(--space-12); backdrop-filter: blur(24px);">
        <div class="flex justify-between items-center flex-wrap gap-4">
            <div style="position:relative; width:340px;">
                <input type="text" class="form-input" placeholder="Search templates by role..." style="padding-left:40px; border-radius:30px; background:rgba(255,255,255,0.05);">
                <svg class="icon-svg" style="position:absolute; left:14px; top:14px; width:18px; height:18px; color:var(--accent-primary);" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><path d="M21 21l-4.35-4.35"/></svg>
            </div>

            <div class="tab-group flex gap-2" style="border:none; padding:0;">
                <button type="button" class="tab-btn active" style="padding:8px 18px; background:var(--accent-primary); border:none; border-radius:30px; color:#FFF; font-weight:600; box-shadow:0 4px 12px var(--accent-primary-glow);">All Templates</button>
                <button type="button" class="tab-btn" style="padding:8px 18px; background:rgba(255,255,255,0.05); border:1px solid var(--glass-border); border-radius:30px; color:var(--text-primary); transition:0.3s;">Technology</button>
                <button type="button" class="tab-btn" style="padding:8px 18px; background:rgba(255,255,255,0.05); border:1px solid var(--glass-border); border-radius:30px; color:var(--text-primary); transition:0.3s;">Executive</button>
                <button type="button" class="tab-btn" style="padding:8px 18px; background:rgba(255,255,255,0.05); border:1px solid var(--glass-border); border-radius:30px; color:var(--text-primary); transition:0.3s;">Minimalist</button>
            </div>
        </div>
    </div>

    <!-- TEMPLATE CARDS GRID -->
    <div class="grid grid-cols-3 gap-8">
        
        <!-- Nova (Modern Tech) -->
        <div class="template-card glass-card p-5 glow-border" data-category="tech">
            <div class="premium-thumb thumb-nova">
                <div class="mock-sidebar" style="position:relative;">
                    <div class="mock-line" style="width:80%; margin-top:10px;"></div>
                    <div class="mock-line" style="width:60%; background:var(--accent-primary);"></div>
                    <div style="margin-top:20px;">
                        <div class="mock-line" style="width:100%; height:2px;"></div>
                        <div class="mock-line" style="width:100%; height:2px;"></div>
                    </div>
                    <div style="position:absolute; bottom:10px; left:50%; transform:translateX(-50%); width:30px; height:30px; background:#FFF; border:2px solid var(--accent-primary); border-radius:4px; padding:2px;">
                        <div style="width:100%; height:100%; background:#111827; border-radius:2px;"></div>
                    </div>
                </div>
                <div class="main">
                    <div class="mock-line dark" style="width:40%; height:6px;"></div>
                    <div class="mock-line dark" style="width:100%; height:3px; margin-top:10px;"></div>
                    <div class="mock-line dark" style="width:90%; height:3px;"></div>
                    
                    <div style="margin-top:20px; display:flex; gap:10px;">
                        <div style="width:2px; height:50px; background:#E2E8F0; position:relative;">
                            <div class="mock-circle" style="position:absolute; left:-3px; top:0;"></div>
                        </div>
                        <div style="flex:1;">
                            <div class="mock-line dark" style="width:60%; height:5px;"></div>
                            <div class="mock-line dark" style="width:100%; height:2px;"></div>
                            <div class="mock-line dark" style="width:80%; height:2px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex justify-between items-center mb-5">
                <div>
                    <h4 style="font-size:var(--text-lg); font-weight:700; color:#FFF;">Nova</h4>
                    <p style="font-size:var(--text-xs); color:var(--accent-primary);">Modern Tech &bull; Timeline</p>
                </div>
                <span class="badge badge-purple">Popular</span>
            </div>
            <div class="flex gap-3">
                <a href="ResumeBuilder.aspx?template=modern" class="btn btn-primary flex-1">Use Template</a>
                <a href="Preview.aspx?template=modern" class="btn btn-secondary flex-1">Preview</a>
            </div>
        </div>

        <!-- Prestige (Executive) -->
        <div class="template-card glass-card p-5 glow-border" data-category="executive">
            <div class="premium-thumb thumb-prestige" style="position:relative;">
                <div style="position:absolute; top:12px; right:12px; width:24px; height:24px; border:1px solid #CBD5E1; padding:2px; background:#FFF;">
                    <div style="width:100%; height:100%; background:#0F172A;"></div>
                </div>
                <div class="header">
                    <div class="mock-title">ALEXANDER WRIGHT</div>
                    <div class="mock-line" style="width:40%; margin:4px auto; background:var(--accent-primary);"></div>
                </div>
                <div style="width:100%; display:flex; gap:10px; margin-top:10px;">
                    <div style="width:30%;">
                        <div class="mock-line dark" style="width:100%; height:4px;"></div>
                    </div>
                    <div style="width:70%;">
                        <div class="mock-line dark" style="width:100%;"></div>
                        <div class="mock-line dark" style="width:90%;"></div>
                        <div class="mock-line dark" style="width:95%;"></div>
                    </div>
                </div>
                <div style="width:100%; display:flex; gap:10px; margin-top:10px;">
                    <div style="width:30%;">
                        <div class="mock-line dark" style="width:80%; height:4px;"></div>
                    </div>
                    <div style="width:70%;">
                        <div class="mock-line dark" style="width:100%;"></div>
                        <div class="mock-line dark" style="width:85%;"></div>
                    </div>
                </div>
            </div>
            <div class="flex justify-between items-center mb-5">
                <div>
                    <h4 style="font-size:var(--text-lg); font-weight:700; color:#FFF;">Prestige</h4>
                    <p style="font-size:var(--text-xs); color:var(--text-muted);">Executive &bull; Serif Elegance</p>
                </div>
                <span class="badge badge-cyan">Executive</span>
            </div>
            <div class="flex gap-3">
                <a href="ResumeBuilder.aspx?template=executive" class="btn btn-primary flex-1">Use Template</a>
                <a href="Preview.aspx?template=executive" class="btn btn-secondary flex-1">Preview</a>
            </div>
        </div>

        <!-- Aura (Minimalist) -->
        <div class="template-card glass-card p-5 glow-border" data-category="minimal">
            <div class="premium-thumb thumb-aura">
                <div class="inner-glass">
                    <div style="display:flex; justify-content:space-between;">
                        <div>
                            <div class="mock-line dark" style="width:60px; height:8px;"></div>
                            <div class="mock-line dark" style="width:40px; height:4px; background:var(--accent-primary);"></div>
                        </div>
                        <div style="width:30px; height:10px; background:#F1F5F9; border-radius:2px;"></div>
                    </div>
                    <div style="margin-top:20px;">
                        <div class="mock-gradient"></div>
                        <div class="mock-line dark" style="width:100%;"></div>
                        <div class="mock-line dark" style="width:80%;"></div>
                    </div>
                    <div style="margin-top:20px;">
                        <div class="mock-gradient"></div>
                        <div>
                            <div class="mock-tag"></div><div class="mock-tag"></div><div class="mock-tag" style="width:30px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex justify-between items-center mb-5">
                <div>
                    <h4 style="font-size:var(--text-lg); font-weight:700; color:#FFF;">Aura</h4>
                    <p style="font-size:var(--text-xs); color:var(--text-muted);">Minimalist &bull; Glassmorphism</p>
                </div>
                <span class="badge badge-success">New</span>
            </div>
            <div class="flex gap-3">
                <a href="ResumeBuilder.aspx?template=minimalist" class="btn btn-primary flex-1">Use Template</a>
                <a href="Preview.aspx?template=minimalist" class="btn btn-secondary flex-1">Preview</a>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
