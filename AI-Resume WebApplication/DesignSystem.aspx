<%@ Page Title="Design System (Developer Tool) - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="DesignSystem.aspx.cs" Inherits="AI_Resume_WebApplication.DesignSystem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-16" style="padding:var(--space-8) 0;">
        <div style="margin-bottom:var(--space-8);">
            <div class="badge badge-purple" style="margin-bottom:var(--space-3);">Developer Showcase Tool</div>
            <h1 style="font-size:var(--text-4xl); margin-bottom:var(--space-2);">Liquid Glass Design System</h1>
            <p style="color:var(--text-muted);">Single source of truth for all reusable UI components, color tokens, and layout primitives.</p>
        </div>

        <!-- Typography -->
        <section style="margin-bottom:var(--space-12);">
            <h2 style="font-size:var(--text-2xl); margin-bottom:var(--space-6); padding-bottom:var(--space-2); border-bottom:1px solid var(--glass-border);">Typography</h2>
            <div class="glass-card p-6 flex flex-col gap-6">
                <div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); margin-bottom:4px;">text-5xl</div>
                    <h1 style="font-size:var(--text-5xl);">The quick brown fox</h1>
                </div>
                <div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); margin-bottom:4px;">text-4xl</div>
                    <h1 style="font-size:var(--text-4xl);">The quick brown fox</h1>
                </div>
                <div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); margin-bottom:4px;">text-3xl</div>
                    <h1 style="font-size:var(--text-3xl);">The quick brown fox</h1>
                </div>
                <div>
                    <div style="font-size:var(--text-xs); color:var(--text-muted); margin-bottom:4px;">text-2xl</div>
                    <h2 style="font-size:var(--text-2xl);">The quick brown fox</h2>
                </div>
            </div>
        </section>

        <!-- Buttons -->
        <section style="margin-bottom:var(--space-12);">
            <h2 style="font-size:var(--text-2xl); margin-bottom:var(--space-6); padding-bottom:var(--space-2); border-bottom:1px solid var(--glass-border);">Buttons &amp; Actions</h2>
            <div class="glass-card p-6 flex flex-wrap gap-4 items-center">
                <button type="button" class="btn btn-primary">Primary Button</button>
                <button type="button" class="btn btn-secondary">Secondary Button</button>
                <button type="button" class="btn btn-ghost">Ghost Button</button>
                <button type="button" class="btn btn-primary btn-lg">Large Button</button>
            </div>
        </section>

        <!-- Badges -->
        <section style="margin-bottom:var(--space-12);">
            <h2 style="font-size:var(--text-2xl); margin-bottom:var(--space-6); padding-bottom:var(--space-2); border-bottom:1px solid var(--glass-border);">Badges &amp; Status Indicators</h2>
            <div class="glass-card p-6 flex flex-wrap gap-4">
                <span class="badge badge-purple">Purple Glow</span>
                <span class="badge badge-cyan">Cyan Highlight</span>
                <span class="badge badge-success">Success Green</span>
                <span class="badge badge-warning">Warning Yellow</span>
            </div>
        </section>
    </div>
</asp:Content>
