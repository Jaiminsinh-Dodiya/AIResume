<%@ Page Title="Sign In - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AI_Resume_WebApplication.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="min-height: 85vh; display: flex; align-items: center; justify-content: center; padding: var(--space-12) var(--space-4);">
        <div class="grid grid-cols-12 gap-8 items-center" style="width: 100%; max-width: 1020px;">

            <!-- LEFT COLUMN: Brand Value & Social Proof Showcase -->
            <div class="col-span-6 flex flex-col justify-between animate-fade-up" style="padding: var(--space-6);">
                <div>
                    <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-6 glass-card" style="background: rgba(234, 170, 0, 0.12); border-color: rgba(234, 170, 0, 0.3);">
                        <span class="badge badge-purple">AI Engine v4.8</span>
                        <span style="font-size: var(--text-xs); color: var(--text-secondary);">Executive ATS Intelligence</span>
                    </div>

                    <h1 style="font-size: clamp(2rem, 3.5vw, 2.75rem); line-height: 1.15; margin-bottom: var(--space-4);">
                        Welcome Back to <span class="text-gradient-purple">ResumeAI</span>
                    </h1>

                    <p style="font-size: var(--text-base); color: var(--text-secondary); line-height: 1.6; margin-bottom: var(--space-8);">
                        Access your active resume workspace, live ATS score diagnostics, and tailored job description optimizations.
                    </p>
                </div>

                <!-- Proof Metrics Bento -->
                <div class="grid grid-cols-2 gap-4 mb-8">
                    <div class="glass-card p-4">
                        <div class="stat-number" style="font-size: var(--text-2xl); font-weight: 800; color: var(--accent-primary); margin-bottom: 2px;">98.4%</div>
                        <div style="font-size: var(--text-xs); color: var(--text-muted);">Average ATS pass rate across Greenhouse &amp; Lever</div>
                    </div>
                    <div class="glass-card p-4">
                        <div class="stat-number" style="font-size: var(--text-2xl); font-weight: 800; color: #FFF; margin-bottom: 2px;">10,000+</div>
                        <div style="font-size: var(--text-xs); color: var(--text-muted);">Engineers &amp; leaders hired at top tech firms</div>
                    </div>
                </div>

                <!-- Verified Quote Pill -->
                <div class="glass-card p-4 flex items-center gap-3" style="background: rgba(58, 15, 52, 0.55);">
                    <div class="stat-icon" style="width: 38px; height: 38px; font-weight: 700;">AW</div>
                    <div style="flex: 1;">
                        <p style="font-size: var(--text-xs); color: #FFF; margin: 0; font-style: italic;">
                            "The ATS suggestions boosted my interview callback rate by 3x within 2 weeks."
                        </p>
                        <span style="font-size: 11px; color: var(--text-muted);">Alexander W. &bull; Principal Architect</span>
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN: Sign In Card -->
            <div class="col-span-6 animate-fade-up" style="animation-delay: 100ms;">
                <div class="glass-card glow-border" style="padding: var(--space-8); border-radius: var(--radius-xl); box-shadow: var(--shadow-lg);">

                    <div style="margin-bottom: var(--space-6);">
                        <h2 style="font-size: var(--text-2xl); margin-bottom: var(--space-1);">Account Login</h2>
                        <p style="font-size: var(--text-sm); color: var(--text-secondary);">Enter your credentials to enter your workspace</p>
                    </div>

                    <!-- Social Login Options -->
                    <div class="grid grid-cols-2 gap-3" style="margin-bottom: var(--space-6);">
                        <button type="button" class="btn btn-secondary btn-sm" style="width: 100%; gap: 8px;">
                            <svg class="icon-svg" style="width: 16px; height: 16px;" viewBox="0 0 24 24"><path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/></svg>
                            GitHub
                        </button>
                        <button type="button" class="btn btn-secondary btn-sm" style="width: 100%; gap: 8px;">
                            <svg class="icon-svg" style="width: 16px; height: 16px;" viewBox="0 0 24 24"><path d="M12 5c1.6 0 3 .6 4.1 1.6l3.1-3.1C17.3 1.7 14.8 1 12 1 7.5 1 3.7 3.6 1.9 7.3l3.7 2.9C6.5 7.4 9 5 12 5z"/></svg>
                            Google
                        </button>
                    </div>

                    <div class="glass-divider" style="margin: var(--space-4) 0 var(--space-6) 0;"></div>

                    <!-- Server Error Message -->
                    <asp:Label ID="lblError" runat="server" CssClass="badge badge-purple" style="display:block; margin-bottom:16px; text-align:center; background:rgba(244,63,94,0.15); color:#FDA4AF; border-color:rgba(244,63,94,0.35);" Visible="false" EnableViewState="false"></asp:Label>

                    <!-- Email Field -->
                    <div class="form-group">
                        <label for="<%= txtEmail.ClientID %>" class="form-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="alexander@tech.io" autocomplete="username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="LoginGroup" ErrorMessage="Email address is required." Display="Dynamic" ForeColor="#F43F5E" Style="font-size:var(--text-xs); margin-top:4px;" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="LoginGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address." Display="Dynamic" ForeColor="#F43F5E" Style="font-size:var(--text-xs); margin-top:4px;" />
                    </div>

                    <!-- Password Field -->
                    <div class="form-group">
                        <div class="form-label">
                            <label for="<%= txtPassword.ClientID %>">Password</label>
                            <a href="#" style="font-size:var(--text-xs); color:var(--accent-primary);">Forgot Password?</a>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••••••" autocomplete="current-password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="LoginGroup" ErrorMessage="Password is required." Display="Dynamic" ForeColor="#F43F5E" Style="font-size:var(--text-xs); margin-top:4px;" />
                    </div>

                    <!-- Remember Me Option -->
                    <div class="flex items-center gap-2" style="margin: var(--space-4) 0 var(--space-6) 0;">
                        <asp:CheckBox ID="chkRemember" runat="server" Text="Remember this device for 30 days" Style="font-size:var(--text-xs); color:var(--text-secondary);" />
                    </div>

                    <!-- Submit Button -->
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In to Dashboard" CssClass="btn btn-primary btn-full btn-lg" OnClick="btnLogin_Click" ValidationGroup="LoginGroup" />

                    <!-- Sign Up Switch Prompt -->
                    <div style="text-align:center; margin-top:var(--space-6); font-size:var(--text-xs); color:var(--text-secondary);">
                        Don't have an account yet? <a href="Register.aspx" style="color:var(--accent-primary); font-weight:700; text-decoration:underline;">Create free account</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
