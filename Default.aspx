﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
            <table>
                <tr>
                    <td><asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" DataTextField="Stat" DataValueField="Stat"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataTextField="OrganizationCategory" DataValueField="OrganizationCategory" ></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlTypeOfNeed" runat="server" AutoPostBack="True" DataTextField="TypeOfNeed" DataValueField="TypeOfNeed" ></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlClientType" runat="server" AutoPostBack="True" DataTextField="ClientType" DataValueField="ClientType"></asp:DropDownList></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="sdsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [Stat] FROM [StatusCode]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [OrganizationCategory] FROM [ProjectCategory]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsTypeOfNeed" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [TypeOfNeed] FROM [Need]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsClientType" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" SelectCommand="SELECT [ClientType] FROM [ClientType]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" DataSourceID="sdsProposals" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Stat" HeaderText="Status" SortExpression="Stat" />
                    <asp:BoundField DataField="TypeOfNeed" HeaderText="TypeOfNeed" SortExpression="TypeOfNeed" />
                    <asp:BoundField DataField="ClientType" HeaderText="ClientType" SortExpression="ClientType" />
                    <asp:BoundField DataField="OrganizationCategory" HeaderText="OrganizationCategory" SortExpression="OrganizationCategory" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsProposals" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [TypeOfNeed], [Description], [Title], [ClientType], [OrganizationCategory], SelectStatus.Stat, SelectStatus.ProjectID, Projects.ProjectID 
                                FROM [Projects], (SELECT TOP 1 Stat, ProjectID
                                                    FROM ProjectStatus
				                                    WHERE Stat LIKE @Status + '%'
				                                    ORDER BY DateUpdated DESC) as SelectStatus
                                WHERE ((Projects.ProjectID = SelectStatus.ProjectID) AND ([OrganizationCategory] LIKE @Category + '%') AND ( [TypeOfNeed] LIKE @TypeOfNeed + '%') AND ( [ClientType] LIKE @ClientType + '%')) 
                                ORDER BY [Title]">
                <SelectParameters>
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
