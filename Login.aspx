<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td colspan="2">
                    <h2>Login to submit a proposal</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text="User name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="usernameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="passwordLabel" runat="server" Text="Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="Login_Click" />
                </td>
            </tr>
        </table>
         <p>
            Don't have a log in?
            <asp:Button ID="createButton" runat="server" Text="Create New User"  />
        </p>

        <asp:Label ID="statusLabel" runat="server" Text="" EnableViewState="false"></asp:Label>

        <asp:SqlDataSource ID="loginDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
            SelectCommand="SELECT * 
                           FROM [Users] 
                           WHERE (([Username] = @Username) 
                            AND ([Pass] = @Pass))">
            <SelectParameters>
                <asp:ControlParameter ControlID="usernameTextBox" Name="Username" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordTextBox" Name="Pass" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
