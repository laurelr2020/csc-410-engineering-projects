<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewUser.aspx.cs" Inherits="ViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Users</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>View Users</h2>
        <div>
        </div>
        <asp:GridView ID="gvViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="gvViewUsers" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName"  SortExpression="FirstName" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlViewUsers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Username] = @original_Username AND [LastName] = @original_LastName AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND [UserType] = @original_UserType AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND [Company] = @original_Company" InsertCommand="INSERT INTO [Users] ([LastName], [FirstName], [Username], [UserType], [Email], [Title], [Company]) VALUES (@LastName, @FirstName, @Username, @UserType, @Email, @Title, @Company)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [LastName], [FirstName], [Username], [UserType], [Email], [Title], [Company] FROM [Users] ORDER BY [LastName]" UpdateCommand="UPDATE [Users] SET [LastName] = @LastName, [FirstName] = @FirstName, [UserType] = @UserType, [Email] = @Email, [Title] = @Title, [Company] = @Company WHERE [Username] = @original_Username AND [LastName] = @original_LastName AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND [UserType] = @original_UserType AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND [Company] = @original_Company">
            <DeleteParameters>
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_UserType" Type="Int32" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_Company" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="UserType" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="UserType" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_UserType" Type="Int32" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_Company" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
    </form>
</body>
</html>
