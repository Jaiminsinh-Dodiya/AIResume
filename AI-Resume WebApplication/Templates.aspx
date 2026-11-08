<%@ Page Title="Resume Templates Gallery - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Templates.aspx.cs" Inherits="AI_Resume_WebApplication.Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }
        .template-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 36px rgba(0,0,0,0.4);
            border-color: var(--accent-primary);
        }
        
        /* Realistic Resume Mockup Canvas */
        .premium-thumb {
            width: 100%;
            height: 340px;
            background: #FFFFFF;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 8px 24px rgba(0,0,0,0.25);
            position: relative;
            margin-bottom: 20px;
            border: 1px solid rgba(255,255,255,0.15);
            box-sizing: border-box;
            text-align: left;
        }

        /* 1. Nova Mockup (Modern Tech) */
        .thumb-nova {
            padding: 18px 22px;
            position: relative;
        }
        .thumb-nova::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 5px;
            background: #2563eb;
        }
        .mock-name { height: 9px; width: 55%; background: #0F172A; border-radius: 2px; margin-bottom: 5px; }
        .mock-title-blue { height: 5px; width: 35%; background: #2563eb; border-radius: 2px; margin-bottom: 8px; }
        .mock-contact { height: 3px; width: 80%; background: #94A3B8; border-radius: 2px; margin-bottom: 12px; }
        .mock-divider { height: 1.5px; width: 100%; background: #E2E8F0; margin-bottom: 10px; }
        .mock-sec-head { display: flex; align-items: center; gap: 8px; margin-bottom: 8px; }
        .mock-sec-text { height: 5px; width: 30%; background: #0F172A; border-radius: 2px; }
        .mock-sec-line { flex: 1; height: 1.5px; background: #E2E8F0; }
        .mock-body-line { height: 3px; width: 100%; background: #CBD5E1; border-radius: 1px; margin-bottom: 4px; }
        .mock-role-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 5px; }
        .mock-role-title { height: 5px; width: 45%; background: #0F172A; border-radius: 2px; }
        .mock-date-badge { height: 8px; width: 22%; background: #EFF6FF; border-radius: 4px; }
        .mock-pill-wrap { display: flex; gap: 4px; flex-wrap: wrap; margin-top: 8px; }
        .mock-pill { height: 9px; width: 32px; background: #F8FAFC; border: 1px solid #CBD5E1; border-radius: 3px; }

        /* 2. Prestige Mockup (Executive Classic) */
        .thumb-prestige {
            padding: 20px 22px;
            text-align: center;
        }
        .mock-exec-name { height: 10px; width: 50%; background: #0F172A; border-radius: 2px; margin: 0 auto 5px auto; }
        .mock-exec-title { height: 4px; width: 30%; background: #2563eb; border-radius: 2px; margin: 0 auto 6px auto; }
        .mock-exec-contact { height: 3px; width: 75%; background: #64748B; border-radius: 2px; margin: 0 auto 10px auto; }
        .mock-exec-border { height: 2px; width: 100%; background: #0F172A; margin-bottom: 12px; }
        .mock-exec-sec-title { height: 5px; width: 35%; background: #0F172A; border-radius: 2px; margin-bottom: 4px; }
        .mock-exec-sec-line { height: 1px; width: 100%; background: #CBD5E1; margin-bottom: 8px; }

        /* 3. Aura Mockup (Silicon Valley Clean Minimal) */
        .thumb-aura {
            padding: 20px 22px;
        }
        .mock-aura-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 12px; }
        .mock-aura-contact { display: flex; flex-direction: column; gap: 3px; align-items: flex-end; width: 35%; }
        .mock-aura-sec { border-left: 3px solid #2563eb; padding-left: 6px; margin-bottom: 10px; }
        .mock-aura-pill { height: 9px; width: 28px; background: #F1F5F9; border: 1px solid #E2E8F0; border-radius: 3px; }
    </style>
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="gallery-header">
        <h1>Authentic Resume Templates</h1>
        <p style="font-size:var(--text-lg); color:var(--text-muted); max-width:650px; margin:0 auto;">
            ATS-optimized, recruiter-approved A4 resume layouts designed for real hiring processes. Clean vector exports with pixel-perfect typography.
        </p>
    </div>

    <!-- SEARCH & FILTER BAR -->
    <div class="glass-card p-4" style="margin-bottom:var(--space-12); backdrop-filter: blur(24px);">
        <div class="flex justify-between items-center flex-wrap gap-4">
            <div style="position:relative; width:340px;">
                <input type="text" id="templateSearch" class="form-input" placeholder="Search templates by role..." style="padding-left:40px; border-radius:30px; background:rgba(255,255,255,0.05);">
                <svg class="icon-svg" style="position:absolute; left:14px; top:14px; width:18px; height:18px; color:var(--accent-primary);" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><path d="M21 21l-4.35-4.35"/></svg>
            </div>

            <div class="tab-group flex gap-2" style="border:none; padding:0;">
                <button type="button" class="tab-btn active" data-filter="all" style="padding:8px 18px; background:var(--accent-primary); border:none; border-radius:30px; color:#FFF; font-weight:600; cursor:pointer;">All Templates</button>
                <button type="button" class="tab-btn" data-filter="tech" style="padding:8px 18px; background:rgba(255,255,255,0.05); border:1px solid var(--glass-border); border-radius:30px; color:var(--text-primary); cursor:pointer;">Technology</button>
                <button type="button" class="tab-btn" data-filter="executive" style="padding:8px 18px; background:rgba(255,255,255,0.05); border:1px solid var(--glass-border); border-radius:30px; color:var(--text-primary); cursor:pointer;">Executive</button>
                <button type="button" class="tab-btn" data-filter="minimal" style="padding:8px 18px; background:rgba(255,255,255,0.05); border:1px solid var(--glass-border); border-radius:30px; color:var(--text-primary); cursor:pointer;">Minimalist</button>
            </div>
        </div>
    </div>

    <!-- TEMPLATE CARDS GRID -->
    <div class="grid grid-cols-3 gap-8">
        
        <!-- 1. Nova (Modern Tech) -->
        <div class="template-card glass-card p-5 glow-border" data-category="tech">
            <div class="premium-thumb thumb-nova">
                <div class="mock-name"></div>
                <div class="mock-title-blue"></div>
                <div class="mock-contact"></div>
                <div class="mock-divider"></div>
                
                <div class="mock-sec-head">
                    <div class="mock-sec-text"></div>
                    <div class="mock-sec-line"></div>
                </div>
                <div class="mock-body-line"></div>
                <div class="mock-body-line" style="width:85%;"></div>
                
                <div class="mock-sec-head" style="margin-top:14px;">
                    <div class="mock-sec-text" style="width:40%;"></div>
                    <div class="mock-sec-line"></div>
                </div>
                <div class="mock-role-row">
                    <div class="mock-role-title"></div>
                    <div class="mock-date-badge"></div>
                </div>
                <div class="mock-body-line"></div>
                <div class="mock-body-line" style="width:90%;"></div>

                <div class="mock-sec-head" style="margin-top:14px;">
                    <div class="mock-sec-text" style="width:30%;"></div>
                    <div class="mock-sec-line"></div>
                </div>
                <div class="mock-pill-wrap">
                    <div class="mock-pill"></div>
                    <div class="mock-pill" style="width:40px;"></div>
                    <div class="mock-pill"></div>
                    <div class="mock-pill" style="width:48px;"></div>
                </div>
            </div>
            <div class="flex justify-between items-center mb-5">
                <div>
                    <h4 style="font-size:var(--text-lg); font-weight:700; color:#FFF;">Nova</h4>
                    <p style="font-size:var(--text-xs); color:var(--accent-primary);">Modern Tech &bull; Top Accent &amp; Clean Timeline</p>
                </div>
                <span class="badge badge-purple">Popular</span>
            </div>
            <div class="flex gap-3">
                <a href="ResumeBuilder.aspx?template=modern" class="btn btn-primary flex-1">Use Template</a>
                <a href="Preview.aspx?template=modern" class="btn btn-secondary flex-1">Preview</a>
            </div>
        </div>

        <!-- 2. Prestige (Executive Classic) -->
        <div class="template-card glass-card p-5 glow-border" data-category="executive">
            <div class="premium-thumb thumb-prestige">
                <div class="mock-exec-name"></div>
                <div class="mock-exec-title"></div>
                <div class="mock-exec-contact"></div>
                <div class="mock-exec-border"></div>

                <div class="mock-exec-sec-title"></div>
                <div class="mock-exec-sec-line"></div>
                <div class="mock-body-line"></div>
                <div class="mock-body-line" style="width:90%;"></div>

                <div class="mock-exec-sec-title" style="width:45%; margin-top:14px;"></div>
                <div class="mock-exec-sec-line"></div>
                <div class="mock-role-row">
                    <div class="mock-role-title"></div>
                    <div style="height:4px; width:25%; background:#64748B;"></div>
                </div>
                <div class="mock-body-line"></div>
                <div class="mock-body-line" style="width:85%;"></div>

                <div class="mock-exec-sec-title" style="width:35%; margin-top:14px;"></div>
                <div class="mock-exec-sec-line"></div>
                <div class="mock-pill-wrap">
                    <div class="mock-pill" style="border-left:2px solid #2563eb;"></div>
                    <div class="mock-pill" style="width:42px; border-left:2px solid #2563eb;"></div>
                    <div class="mock-pill" style="border-left:2px solid #2563eb;"></div>
                </div>
            </div>
            <div class="flex justify-between items-center mb-5">
                <div>
                    <h4 style="font-size:var(--text-lg); font-weight:700; color:#FFF;">Prestige</h4>
                    <p style="font-size:var(--text-xs); color:var(--text-muted);">Executive &bull; Harvard &amp; Ivy League Classic</p>
                </div>
                <span class="badge badge-cyan">Executive</span>
            </div>
            <div class="flex gap-3">
                <a href="ResumeBuilder.aspx?template=executive" class="btn btn-primary flex-1">Use Template</a>
                <a href="Preview.aspx?template=executive" class="btn btn-secondary flex-1">Preview</a>
            </div>
        </div>

        <!-- 3. Aura (Minimalist Tech) -->
        <div class="template-card glass-card p-5 glow-border" data-category="minimal">
            <div class="premium-thumb thumb-aura">
                <div class="mock-aura-header">
                    <div style="width:55%;">
                        <div class="mock-name" style="width:80%;"></div>
                        <div class="mock-title-blue" style="width:60%;"></div>
                    </div>
                    <div class="mock-aura-contact">
                        <div class="mock-body-line" style="width:100%;"></div>
                        <div class="mock-body-line" style="width:80%;"></div>
                        <div class="mock-body-line" style="width:90%;"></div>
                    </div>
                </div>
                <div class="mock-divider"></div>

                <div class="mock-aura-sec">
                    <div class="mock-sec-text" style="width:35%;"></div>
                </div>
                <div class="mock-body-line"></div>
                <div class="mock-body-line" style="width:80%;"></div>

                <div class="mock-aura-sec" style="margin-top:14px;">
                    <div class="mock-sec-text" style="width:40%;"></div>
                </div>
                <div class="mock-role-row">
                    <div class="mock-role-title"></div>
                    <div class="mock-date-badge"></div>
                </div>
                <div class="mock-body-line"></div>
                <div class="mock-body-line" style="width:85%;"></div>

                <div class="mock-aura-sec" style="margin-top:14px;">
                    <div class="mock-sec-text" style="width:30%;"></div>
                </div>
                <div class="mock-pill-wrap">
                    <div class="mock-aura-pill"></div>
                    <div class="mock-aura-pill" style="width:36px;"></div>
                    <div class="mock-aura-pill"></div>
                    <div class="mock-aura-pill" style="width:44px;"></div>
                </div>
            </div>
            <div class="flex justify-between items-center mb-5">
                <div>
                    <h4 style="font-size:var(--text-lg); font-weight:700; color:#FFF;">Aura</h4>
                    <p style="font-size:var(--text-xs); color:var(--text-muted);">Minimalist &bull; Silicon Valley Clean Tech</p>
                </div>
                <span class="badge badge-success">Clean Tech</span>
            </div>
            <div class="flex gap-3">
                <a href="ResumeBuilder.aspx?template=minimalist" class="btn btn-primary flex-1">Use Template</a>
                <a href="Preview.aspx?template=minimalist" class="btn btn-secondary flex-1">Preview</a>
            </div>
        </div>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('templateSearch');
            if (searchInput) {
                searchInput.addEventListener('input', function () {
                    const query = this.value.toLowerCase().trim();
                    const cards = document.querySelectorAll('.template-card');
                    cards.forEach(card => {
                        const text = card.textContent.toLowerCase();
                        if (query === '' || text.includes(query)) {
                            card.style.display = 'block';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            }
        });
    </script>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
