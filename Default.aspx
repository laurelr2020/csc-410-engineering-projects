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
                    <asp:MenuItem Text="Admin" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="User" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="Login" Value="2"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <br />
            <h3>Engineering Projects</h3>
            <br />
            <br />
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlStatus" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlCategory" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlTypeOfNeed" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlClientType" runat="server">
            </asp:DropDownList>
            <br />
            <asp:GridView ID="gvProjects" runat="server">
                <%--Columns: Status, Title, OrgCategory, ClientType, TypeOfNeed, Description, DateSubmitted, DateUpdated--%>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
