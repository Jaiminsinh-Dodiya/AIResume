    <%@ Page Title="Resume Document Viewer - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Preview.aspx.cs" Inherits="AI_Resume_WebApplication.Preview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container container-narrow">
       
        <div class="viewer-toolbar glow-border" style="position:sticky; top:20px; z-index:var(--z-fixed); margin-bottom:var(--space-8); display:flex; justify-content:space-between; align-items:center; padding:12px 20px; background:rgba(15,23,42,0.85); backdrop-filter:blur(12px); border-radius:var(--radius-lg); border:1px solid var(--glass-border);">
            <div class="flex items-center gap-3">
                <a href="ResumeBuilder.aspx" class="btn btn-secondary btn-sm">&larr; Back to Editor</a>
                <span style="font-weight:700; font-size:var(--text-sm);">My_Resume.pdf</span>
            </div>

            <div class="flex items-center gap-2">
               
                <button type="button" id="zoomOut" class="btn btn-secondary btn-sm" title="Zoom Out">-</button>
                <span id="zoomVal" style="font-size:var(--text-xs); width:48px; text-align:center; font-weight:600;">100%</span>
                <button type="button" id="zoomIn" class="btn btn-secondary btn-sm" title="Zoom In">+</button>
                <button type="button" id="zoomReset" class="btn btn-ghost btn-sm">Reset</button>
            </div>

            <div class="flex items-center gap-3">
                <button type="button" onclick="window.print()" class="btn btn-secondary btn-sm">
                    <svg class="icon-svg" viewBox="0 0 24 24"><polyline points="6 9 6 2 18 2 18 9"/><path d="M6 18H4a2 2 0 01-2-2v-5a2 2 0 012-2h16a2 2 0 012 2v5a2 2 0 01-2 2h-2"/><rect x="6" y="14" width="12" height="8"/></svg>
                    Print
                </button>
            </div>
        </div>

       
        <div class="a4-workspace" style="box-shadow: 0 25px 80px rgba(0,0,0,0.8); margin:0 auto;">
            <div id="resumeDoc" class="a4-document" style="background:#FFF; color:#0F172A; font-family:var(--font-body);">
                <asp:Literal ID="litResumeContent" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
