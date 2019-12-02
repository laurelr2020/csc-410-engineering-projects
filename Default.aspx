<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="menuTopNav" runat="server" Orientation="Horizontal" OnMenuItemClick="menuTopNav_MenuItemClick">
              <staticmenuitemstyle 
                  HorizontalPadding="15"
                  VerticalPadding="2" 
                  ForeColor="Black"
              />
                <Items>
                    <asp:MenuItem Text="Add Proposal"></asp:MenuItem>
                    <asp:MenuItem Text="Update Proposal"></asp:MenuItem>
                    <asp:MenuItem Text="View Users"></asp:MenuItem>
                    <asp:MenuItem Text="Log Out"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <asp:Menu ID="menuNav2" runat="server" Orientation="Horizontal" OnMenuItemClick="menuNav2_MenuItemClick">
                <staticmenuitemstyle 
                  HorizontalPadding="15"
                  VerticalPadding="2" 
                  ForeColor="Black"
              />
                <Items>
                    <asp:MenuItem Text="Add Proposal"></asp:MenuItem>
                    <asp:MenuItem Text="Log Out"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <asp:Menu ID="menuNav3" runat="server" Orientation="Horizontal" OnMenuItemClick="menuNav3_MenuItemClick">
                <staticmenuitemstyle 
                  HorizontalPadding="15"
                  VerticalPadding="2" 
                  ForeColor="Black"
              />
                <Items>
                    <asp:MenuItem Text="Login"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <br />
            <h3>Engineering Projects</h3>
            <br />
            <table style="width:100%;">
                <tr>
                    <td><asp:TextBox ID="txtSearch" runat="server" AutoPostBack="true"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" DataTextField="Stat" DataValueField="Stat" DataSourceID="sdsStatus"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataTextField="OrganizationCategory" DataValueField="OrganizationCategory" DataSourceID="sdsCategory"></asp:DropDownList></td>
                    <td> <asp:DropDownList ID="ddlTypeOfNeed" runat="server" AutoPostBack="True" DataTextField="TypeOfNeed" DataValueField="TypeOfNeed" DataSourceID="sdsTypeOfNeed"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlClientType" runat="server" AutoPostBack="True" DataTextField="ClientType" DataValueField="ClientType" DataSourceID="sdsClientType"></asp:DropDownList></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="sdsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [Stat] FROM [StatusCode]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [OrganizationCategory] FROM [ProjectCategory]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsTypeOfNeed" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [TypeOfNeed] FROM [Need]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsClientType" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [ClientType] FROM [ClientType]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" DataSourceID="sdsProposals" OnRowEditing="gvProjects_RowEditing" OnRowUpdated="gvProjects_RowUpdated" OnSelectedIndexChanged="gvProjects_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="TypeOfNeed" HeaderText="TypeOfNeed" SortExpression="TypeOfNeed" />
                    <asp:BoundField DataField="ClientType" HeaderText="ClientType" SortExpression="ClientType" />
                    <asp:BoundField DataField="OrganizationCategory" HeaderText="OrganizationCategory" SortExpression="OrganizationCategory" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsProposals" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [Description], [Title], [ClientType], [OrganizationCategory], [TypeOfNeed], [ProjectID] FROM [Projects]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Projects] WHERE [ProjectID] = @original_ProjectID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Title] = @original_Title AND [ClientType] = @original_ClientType AND [OrganizationCategory] = @original_OrganizationCategory AND (([TypeOfNeed] = @original_TypeOfNeed) OR ([TypeOfNeed] IS NULL AND @original_TypeOfNeed IS NULL))" InsertCommand="INSERT INTO [Projects] ([Description], [Title], [ClientType], [OrganizationCategory], [TypeOfNeed]) VALUES (@Description, @Title, @ClientType, @OrganizationCategory, @TypeOfNeed)" OldValuesParameterFormatString="original_{0}"        
                UpdateCommand="UPDATE [Projects] SET [Description] = @Description, [Title] = @Title, [ClientType] = @ClientType, [OrganizationCategory] = @OrganizationCategory, [TypeOfNeed] = @TypeOfNeed  
                WHERE [ProjectID] = @original_ProjectID AND [Description] = @original_Description AND [Title] = @original_Title AND [ClientType] = @original_ClientType AND [OrganizationCategory] = @original_OrganizationCategory AND [TypeOfNeed] = @original_TypeOfNeed">
                <DeleteParameters>
                    <asp:Parameter Name="original_ProjectID" Type="Int32" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_Title" Type="String" />
                    <asp:Parameter Name="original_ClientType" Type="String" />
                    <asp:Parameter Name="original_OrganizationCategory" Type="String" />
                    <asp:Parameter Name="original_TypeOfNeed" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="ClientType" Type="String" />
                    <asp:Parameter Name="OrganizationCategory" Type="String" />
                    <asp:Parameter Name="TypeOfNeed" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="ClientType" Type="String" />
                    <asp:Parameter Name="OrganizationCategory" Type="String" />
                    <asp:Parameter Name="TypeOfNeed" Type="String" />
                    <asp:Parameter Name="original_ProjectID" Type="Int32" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_Title" Type="String" />
                    <asp:Parameter Name="original_ClientType" Type="String" />
                    <asp:Parameter Name="original_OrganizationCategory" Type="String" />
                    <asp:Parameter Name="original_TypeOfNeed" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
