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
        <asp:Label ID="lblClient" runat="server" Text="Enter Client or Sponser"></asp:Label>
        </td>
        <td>
        <asp:Label ID="lblClientType" runat="server" Text="Choose a Client/ Sponser Type"></asp:Label>
        </td>
     </tr>        
    
      <tr>
        <td>   
        <asp:TextBox ID="txtClient" runat="server" Width="240px"></asp:TextBox>
        </td>
        <td>
        <asp:DropDownList ID="ddlClientType" runat="server"></asp:DropDownList>
        </td>
      </tr>
      <tr>
          <td>
        <asp:Label ID="lblCompany" runat="server" Text="Enter Company"></asp:Label>
          </td>
          <td>
        <asp:TextBox ID="txtCompany" runat="server" Height="16px" Width="240px"></asp:TextBox>
          </td>
   
        
      <tr> 
          <td>
        <asp:Label ID="lblCategory" runat="server" Text="Choose a Organizational Category"></asp:Label>
        </td>
        <td>
        <asp:DropDownList ID="ddlCategory" runat="server" Height="17px" Width="183px"></asp:DropDownList>
        </td>
      </tr>   
      <tr>
          <td>
        <asp:Label ID="lblProposal" runat="server" Text="Whats Your Idea/Proposal Description?"></asp:Label>
              <br />
        <asp:TextBox ID="txtDescription" runat="server" Height="163px" Width="446px"></asp:TextBox> 
          <br />
        <asp:Button ID="Submit" runat="server" Text="Submit Proposal" />
       </td>
     </tr>
        </table>



    </form>
</body>
</html>
