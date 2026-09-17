<%@ Page Title="Admin Panel - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="AI_Resume_WebApplication.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-table { width: 100%; border-collapse: collapse; font-size: var(--text-sm); }
        .admin-table th { text-align: left; padding: 10px 12px; color: var(--text-muted); font-weight: 600; border-bottom: 1px solid var(--glass-border); }
        .admin-table td { padding: 10px 12px; color: var(--text-secondary); border-bottom: 1px solid var(--glass-border); vertical-align: middle; }
        .admin-table a { color: var(--accent-primary); font-weight: 600; margin-right: 8px; }
    </style>
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-bottom: var(--space-8);">
        <h1 style="font-size: var(--text-3xl); font-weight: 800; margin-bottom: var(--space-2);">Admin Panel</h1>
        <p style="font-size: var(--text-sm); color: var(--text-muted);">Add, edit and delete the users of ResumeAI.</p>
    </div>

    <asp:Label ID="lblMessage" runat="server" Style="display: block; margin-bottom: 16px; text-align: center;" Visible="false" EnableViewState="false"></asp:Label>

    <!-- ADD USER FORM -->
    <div class="glass-card glow-border p-6" style="margin-bottom: var(--space-8);">
        <h3 style="margin-bottom: var(--space-4);">Add User</h3>

        <div class="grid grid-cols-4 gap-4">
            <div class="form-group">
                <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name *</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="e.g. Admin Test"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ValidationGroup="AddUserGroup" ErrorMessage="Full name is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
            </div>

            <div class="form-group">
                <label for="<%= txtEmail.ClientID %>" class="form-label">Email *</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="name@example.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="AddUserGroup" ErrorMessage="Email is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="AddUserGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter a valid email." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
            </div>

            <div class="form-group">
                <label for="<%= txtPassword.ClientID %>" class="form-label">Password *</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter a password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="AddUserGroup" ErrorMessage="Password is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
            </div>

            <div class="form-group">
                <label for="<%= ddlRole.ClientID %>" class="form-label">Role</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                    <asp:ListItem Value="User">User</asp:ListItem>
                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <asp:Button ID="btnAdd" runat="server" Text="Add User" CssClass="btn btn-primary" OnClick="btnAdd_Click" ValidationGroup="AddUserGroup" />
    </div>

    <!-- USERS GRIDVIEW -->
    <div class="glass-card glow-border p-6" style="overflow-x: auto;">
        <h3 style="margin-bottom: var(--space-4);">Users</h3>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="admin-table" GridLines="None" EmptyDataText="No users found."
            OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Role" HeaderText="Role" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created" DataFormatString="{0:dd MMM yyyy}" />

                <asp:ButtonField HeaderText="Edit" Text="Edit" CommandName="cmd_edit" ButtonType="Link" />
                <asp:ButtonField HeaderText="Delete" Text="Delete" CommandName="cmd_delete" ButtonType="Link" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
