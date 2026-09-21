<%@ Page Title="Career Profile - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="CareerProfile.aspx.cs" Inherits="AI_Resume_WebApplication.CareerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:var(--space-6);" class="flex items-center justify-between">
        <div>
            <h1 style="font-size:var(--text-3xl); font-weight:800; margin-bottom:var(--space-1);">Master Career Profile</h1>
            <p style="font-size:var(--text-sm); color:var(--text-muted);">Manage your universal career background and AI recommendations</p>
        </div>
        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-primary btn-sm" OnClick="btnSaveProfile_Click" ValidationGroup="ProfileGroup" />
    </div>

    <asp:Label ID="lblStatus" runat="server" CssClass="badge badge-purple" style="display:block; margin-bottom:16px; text-align:center;" Visible="false" EnableViewState="false"></asp:Label>

    <div class="grid grid-cols-12 gap-8">
        <!-- LEFT COLUMN: PERSONAL DETAILS & WORK HISTORY -->
        <div class="col-span-8" style="display:flex; flex-direction:column; gap:24px;">
            <!-- PERSONAL INFORMATION CARD -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-6);">Personal Information</h3>
                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" Text="Alexander Wright"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtTargetTitle.ClientID %>" class="form-label">Target Job Title</label>
                        <asp:TextBox ID="txtTargetTitle" runat="server" CssClass="form-input" Text="Principal Staff Engineer"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtEmail.ClientID %>" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" Text="alexander.wright@tech.io"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtPhone.ClientID %>" class="form-label">Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" Text="+1 (555) 234-5678"></asp:TextBox>
                    </div>
                    <div class="form-group col-span-2">
                        <label for="<%= txtLocation.ClientID %>" class="form-label">Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-input" Text="San Francisco, California, USA"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- WORK EXPERIENCE -->
            <div class="glass-card p-6">
                <div class="flex justify-between items-center" style="margin-bottom:var(--space-6);">
                    <h3>Work Experience</h3>
                    <button type="button" class="btn btn-secondary btn-sm">+ Add Role</button>
                </div>

                <!-- Role Item 1 -->
                <div class="glass-card p-4" style="background:var(--bg-secondary); margin-bottom:16px;">
                    <div class="flex justify-between items-start" style="margin-bottom:8px;">
                        <div>
                            <h4 style="font-size:var(--text-base); margin:0;">Lead Systems Architect</h4>
                            <p style="font-size:var(--text-xs); color:var(--accent-primary); margin:0;">CloudScale Inc. &bull; Full-time</p>
                        </div>
                        <span class="badge badge-purple">2021 &ndash; Present</span>
                    </div>
                    <p style="font-size:var(--text-xs); color:var(--text-secondary); margin-bottom:12px;">
                        Architected high-throughput microservices handling 4.2B daily requests with 99.99% uptime.
                    </p>
                    <div class="flex gap-2">
                        <button type="button" class="btn btn-ghost btn-sm">Edit Bullet Points</button>
                        <button type="button" class="btn btn-ghost btn-sm" style="color:var(--color-danger);">Delete</button>
                    </div>
                </div>

                <!-- Role Item 2 -->
                <div class="glass-card p-4" style="background:var(--bg-secondary);">
                    <div class="flex justify-between items-start" style="margin-bottom:8px;">
                        <div>
                            <h4 style="font-size:var(--text-base); margin:0;">Senior Infrastructure Engineer</h4>
                            <p style="font-size:var(--text-xs); color:var(--accent-highlight); margin:0;">Veloce Systems</p>
                        </div>
                        <span class="badge badge-cyan">2018 &ndash; 2021</span>
                    </div>
                    <p style="font-size:var(--text-xs); color:var(--text-secondary); margin:0;">
                        Spearheaded cloud migration of legacy monolith to AWS EKS, reducing hosting costs by $420k annually.
                    </p>
                </div>
            </div>

            <!-- SKILLS CLOUD -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-4);">Technical &amp; Leadership Skills</h3>
                <div style="display:flex; flex-wrap:wrap; gap:8px;">
                    <span class="badge badge-purple">Kubernetes</span>
                    <span class="badge badge-purple">Distributed Systems</span>
                    <span class="badge badge-purple">Go (Golang)</span>
                    <span class="badge badge-purple">TypeScript</span>
                    <span class="badge badge-cyan">AWS EKS / Terraform</span>
                    <span class="badge badge-cyan">GraphQL API</span>
                    <span class="badge badge-cyan">Kafka Systems</span>
                    <span class="badge badge-cyan">System Architecture</span>
                    <button type="button" class="badge badge-success" style="cursor:pointer; border:none;">+ Add Skill</button>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN: AI RECOMMENDATIONS PANEL -->
        <div class="col-span-4 flex flex-col gap-6">
            <div class="glass-card glow-border p-6" style="border-color:var(--accent-primary);">
                <div class="flex items-center gap-2" style="margin-bottom:var(--space-4);">
                    <div class="stat-icon" style="width:28px; height:28px; color:var(--accent-primary);">
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                    </div>
                    <h3>AI Career Insights</h3>
                </div>
                <p style="font-size:var(--text-xs); margin-bottom:var(--space-4);">Our AI analyzed your career profile against 5,000+ Principal Staff Engineer job descriptions.</p>

                <div style="display:flex; flex-direction:column; gap:12px;">
                    <div class="glass-card p-3" style="background:var(--bg-secondary);">
                        <span class="badge badge-purple" style="margin-bottom:4px;">High Priority Skill Match</span>
                        <p style="font-size:var(--text-xs); margin:0;">Adding <b>Rust</b> or <b>gRPC Microservices</b> could increase profile match by +14% for Tier-1 Tech companies.</p>
                    </div>

                    <div class="glass-card p-3" style="background:var(--bg-secondary);">
                        <span class="badge badge-cyan" style="margin-bottom:4px;">Quantifiable Achievement</span>
                        <p style="font-size:var(--text-xs); margin:0;">Your Veloce Systems bullet points have great revenue metrics. Apply them to your Lead Architect role.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
