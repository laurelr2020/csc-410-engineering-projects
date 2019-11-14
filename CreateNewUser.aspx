<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateNewUser.aspx.cs" Inherits="CreateNewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New User</title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
             <td colspan="2">
                    <h2>Create New User</h2>
            </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="firstNameLabel" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="firstNameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lastNameLabel" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="lastNameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="phoneNumberLabel" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="phoneNumberTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="jobTitleLabel" runat="server" Text="Job Title:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="jobTitleTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="companyNameLabel" runat="server" Text="Company Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="companyNameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text="Username:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="usernameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
                <tr>
                <td>
                    <asp:Label ID="passwordLabel" runat="server" Text="Password:" TextMode="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="createUserButton" runat="server" Text="Create" />

        <asp:SqlDataSource ID="createNewUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
            InsertCommand="INSERT INTO [Users] ([Username], [FirstName], [LastName], [Email], [PhoneNumber], [Title], [UserType], [Company], [Pass]) 
                           VALUES (@Username, @FirstName, @LastName, @Email, @PhoneNumber, @Title, @UserType, @Company, @Pass)" >
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="UserType" Type="Int32" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="Pass" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
