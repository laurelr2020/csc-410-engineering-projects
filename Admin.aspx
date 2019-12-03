<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

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
                    <asp:MenuItem Text="Home"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <br />
            <h3>Administrative Permissons</h3>
            <br />
            <br />
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="gvUsers" runat="server">
                <%--Needs user info, so admin can edit user access--%>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
