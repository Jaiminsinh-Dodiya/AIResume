<%@ Page Title="Create Account - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AI_Resume_WebApplication.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="min-height: 85vh; display: flex; align-items: center; justify-content: center; padding: var(--space-12) var(--space-4);">
        <div class="grid grid-cols-12 gap-8 items-center" style="width: 100%; max-width: 1060px;">

            <!-- LEFT COLUMN: Value Proposition & Feature Highlights -->
            <div class="col-span-5 flex flex-col justify-between animate-fade-up" style="padding: var(--space-4);">
                <div>
                    <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-6 glass-card" style="background: rgba(234, 170, 0, 0.12); border-color: rgba(234, 170, 0, 0.3);">
                        <span class="badge badge-purple">Free Account</span>
                        <span style="font-size: var(--text-xs); color: var(--text-secondary);">No credit card required</span>
                    </div>

                    <h1 style="font-size: clamp(2rem, 3.2vw, 2.75rem); line-height: 1.15; margin-bottom: var(--space-4);">
                        Supercharge Your Career with <span class="text-gradient-purple">ResumeAI</span>
                    </h1>

                    <p style="font-size: var(--text-base); color: var(--text-secondary); line-height: 1.6; margin-bottom: var(--space-8);">
                        Build executive-grade, ATS-proof resumes backed by machine learning models trained on 500,000+ successful tech applications.
                    </p>
                </div>

                <!-- Feature Benefits List -->
                <div style="display: flex; flex-direction: column; gap: 14px; margin-bottom: var(--space-8);">
                    <div class="glass-card p-3 flex items-start gap-3">
                        <span style="color: var(--accent-primary); font-weight: 800; font-size: 16px;">&check;</span>
                        <div>
                            <strong style="color: #FFF; font-size: var(--text-xs);">Real-Time ATS Diagnostic</strong>
                            <p style="color: var(--text-muted); font-size: 11px; margin: 0;">Instant score &amp; keyword density checks against job descriptions.</p>
                        </div>
                    </div>

                    <div class="glass-card p-3 flex items-start gap-3">
                        <span style="color: var(--accent-primary); font-weight: 800; font-size: 16px;">&check;</span>
                        <div>
                            <strong style="color: #FFF; font-size: var(--text-xs);">Smart Semantic Rewriter</strong>
                            <p style="color: var(--text-muted); font-size: 11px; margin: 0;">Converts generic bullet points into quantifiable high-impact achievements.</p>
                        </div>
                    </div>

                    <div class="glass-card p-3 flex items-start gap-3">
                        <span style="color: var(--accent-primary); font-weight: 800; font-size: 16px;">&check;</span>
                        <div>
                            <strong style="color: #FFF; font-size: var(--text-xs);">20+ Canva-Grade Vector Templates</strong>
                            <p style="color: var(--text-muted); font-size: 11px; margin: 0;">Pixel-perfect single and dual column formats with crisp PDF vector exports.</p>
                        </div>
                    </div>
                </div>

                <!-- Trust Callout -->
                <div class="flex items-center gap-3" style="font-size: var(--text-xs); color: var(--text-muted);">
                    <svg class="icon-svg" style="width: 16px; height: 16px; color: var(--color-success);" viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                    <span>Bank-grade 256-bit encryption. Your career data is strictly private.</span>
                </div>
            </div>

            <!-- RIGHT COLUMN: Registration Form Card -->
            <div class="col-span-7 animate-fade-up" style="animation-delay: 100ms;">
                <div class="glass-card glow-border" style="padding: var(--space-8); border-radius: var(--radius-xl); box-shadow: var(--shadow-lg);">

                    <div style="margin-bottom: var(--space-6);">
                        <h2 style="font-size: var(--text-2xl); margin-bottom: var(--space-1);">Create Free Account</h2>
                        <p style="font-size: var(--text-sm); color: var(--text-secondary);">Set up your workspace in under 60 seconds</p>
                    </div>

                    <!-- Server Error Message -->
                    <asp:Label ID="lblError" runat="server" CssClass="badge badge-purple" Style="display: block; margin-bottom: 16px; text-align: center; background: rgba(244,63,94,0.15); color: #FDA4AF; border-color: rgba(244,63,94,0.35);" Visible="false" EnableViewState="false"></asp:Label>

                    <!-- STEP 1: Account Identification -->
                    <div style="margin-bottom: var(--space-6);">
                        <div class="flex items-center gap-2" style="font-size: var(--text-xs); font-weight: 700; color: var(--accent-primary); text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: var(--space-3);">
                            <span class="badge badge-purple" style="padding: 2px 8px;">1</span>
                            Personal Profile
                        </div>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="form-group" style="margin-bottom: 0;">
                                <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name *</label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="Alexander Wright" autocomplete="name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ValidationGroup="RegisterGroup" ErrorMessage="Full name is required." Display="Dynamic" ForeColor="#F43F5E" Style="font-size: var(--text-xs); margin-top: 4px;" />
                            </div>

                            <div class="form-group" style="margin-bottom: 0;">
                                <label for="<%= txtEmail.ClientID %>" class="form-label">Email Address *</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="alexander@tech.io" autocomplete="email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="RegisterGroup" ErrorMessage="Email address is required." Display="Dynamic" ForeColor="#F43F5E" Style="font-size: var(--text-xs); margin-top: 4px;" />
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="RegisterGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter a valid email." Display="Dynamic" ForeColor="#F43F5E" Style="font-size: var(--text-xs); margin-top: 4px;" />
                            </div>
                        </div>
                    </div>

                    <!-- STEP 2: Security Credentials -->
                    <div style="margin-bottom: var(--space-6);">
                        <div class="flex items-center gap-2" style="font-size: var(--text-xs); font-weight: 700; color: var(--accent-primary); text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: var(--space-3);">
                            <span class="badge badge-purple" style="padding: 2px 8px;">2</span>
                            Security Credentials
                        </div>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="form-group" style="margin-bottom: 0;">
                                <label for="<%= txtPassword.ClientID %>" class="form-label">Password *</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••••••" autocomplete="new-password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="RegisterGroup" ErrorMessage="Password is required." Display="Dynamic" ForeColor="#F43F5E" Style="font-size: var(--text-xs); margin-top: 4px;" />
                            </div>

                            <div class="form-group" style="margin-bottom: 0;">
                                <label for="<%= txtConfirmPassword.ClientID %>" class="form-label">Confirm Password *</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••••••" autocomplete="new-password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ValidationGroup="RegisterGroup" ErrorMessage="Confirm password." Display="Dynamic" ForeColor="#F43F5E" Style="font-size: var(--text-xs); margin-top: 4px;" />
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ValidationGroup="RegisterGroup" ErrorMessage="Passwords do not match." Display="Dynamic" ForeColor="#F43F5E" Style="font-size: var(--text-xs); margin-top: 4px;" />
                            </div>
                        </div>
                    </div>

                    <!-- Terms Checkbox -->
                    <div class="flex items-center gap-2" style="margin-bottom: var(--space-6);">
                        <asp:CheckBox ID="chkTerms" runat="server" Text="I agree to the Terms of Service, Privacy Policy, and AI Processing Terms" Style="font-size: var(--text-xs); color: var(--text-secondary);" />
                    </div>

                    <!-- Submit Button -->
                    <asp:Button ID="btnRegister" runat="server" Text="Create Account &amp; Start Building Free" CssClass="btn btn-primary btn-full btn-lg" OnClick="btnRegister_Click" ValidationGroup="RegisterGroup" />

                    <!-- Sign In Link -->
                    <div style="text-align: center; margin-top: var(--space-6); font-size: var(--text-xs); color: var(--text-secondary);">
                        Already registered? <a href="Login.aspx" style="color: var(--accent-primary); font-weight: 700; text-decoration: underline;">Sign in here</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
