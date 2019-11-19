<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="menuTopNav" runat="server" Orientation="Horizontal">
              <staticmenuitemstyle 
                  HorizontalPadding="15"
                  VerticalPadding="2" 
                  ForeColor="Black"
              />
                <Items>
                    <asp:MenuItem Text="Add Proposal"></asp:MenuItem>
                    <asp:MenuItem Text="Update Proposal"></asp:MenuItem>
                    <asp:MenuItem Text="View Users"></asp:MenuItem>
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
            <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" DataSourceID="sdsProposals">
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
                SelectCommand="SELECT [TypeOfNeed], [Description], [Title], [ClientType], [OrganizationCategory] FROM [Projects] ORDER BY [Title]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="Search" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlStatus" DefaultValue="%" Name="Status" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlCategory" DefaultValue="%" Name="Category" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlTypeOfNeed" DefaultValue="%" Name="TypeOfNeed" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlClientType" DefaultValue="%" Name="ClientType" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
