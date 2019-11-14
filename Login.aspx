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
                    <asp:Button ID="loginButton" runat="server" Text="Login"  />
                </td>
            </tr>
        </table>
         <p>
            Don't have a log in?
            <asp:Button ID="createButton" runat="server" Text="Create New User" OnClick="createButton_Click"  />
        </p>

        <asp:Label ID="statusLabel" runat="server" Text="" EnableViewState="false"></asp:Label>
    </form>
</body>
</html>
