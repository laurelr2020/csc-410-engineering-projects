<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProposalSubmission.aspx.cs" Inherits="ProposalSubmission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proposal Submission</title>
</head>
<body>
    <h2>Proposal Submission Form</h2>
    <form id="form1" runat="server">

  <table>
     <tr>
         <td>
             <asp:Label ID="lblEnterTitle" runat="server" Text="Enter Title for Your Proposal"></asp:Label>
             <br />
             <asp:TextBox ID="txtEnterTitle" runat="server" Width="240px" Height="22px"></asp:TextBox>

         </td>
     </tr>

      <tr>
        <td>
             <asp:Label ID="Label1" runat="server" Text="Enter Client or Sponser"></asp:Label>
            <br />
        <asp:TextBox ID="txtClient" runat="server" Width="240px" Height="22px"></asp:TextBox>
        </td>
          <br />
        <td>
 <asp:Label ID="lblClientType" runat="server" Text="Choose a Client/ Sponser Type"></asp:Label>
            <br />
        <asp:DropDownList ID="ddlClientType" runat="server" Height="16px" Width="186px"></asp:DropDownList>
        </td>
      </tr>
      <tr>
          <td>
        <asp:Label ID="lblCompany" runat="server" Text="Enter Company"></asp:Label>
        <br />
        <asp:TextBox ID="txtCompany" runat="server" Height="16px" Width="240px"></asp:TextBox>
          </td>
          <td>
              <asp:Label ID="Label2" runat="server" Text="Choose a Organizational Category"></asp:Label>
            <br />
           <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="200px"></asp:DropDownList>
       </td>

      </tr>
      <tr>
          <td>
        <asp:Label ID="lblProposal" runat="server" Text="Whats Your Idea/Proposal Description?"></asp:Label>
              <br />
        <asp:TextBox ID="txtDescription" runat="server" Height="161px" Width="392px" ></asp:TextBox>
          <br />
        <asp:Button ID="Submit" runat="server" Text="Submit Proposal" />
       </td>
     </tr>
        </table>



    </form>
</body>
</html>
