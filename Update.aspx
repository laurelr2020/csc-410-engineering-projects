<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

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
            <h3>Update Proposal</h3>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
                <%--Show user submissions that are still in submitted, so they can edit them.--%>
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
