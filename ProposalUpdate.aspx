<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProposalUpdate.aspx.cs" Inherits="ProposalUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proposal Submission</title>
</head>
<body>
    <h2>Proposal Update Form</h2>
    <form id="form1" runat="server">

  <table>
     <tr>
        <td>
            <asp:Label ID="selectProposalLabel" runat="server" Text="Select a Proposal"></asp:Label>
            <br />
            <asp:DropDownList ID="proposalDropDown" runat="server" AppendDataBoundItems="True"
                DataTextField="Title"
                DataValueField="Title"
                AutoPostBack ="False">
            </asp:DropDownList>

            <asp:Button ID="btnSelectProposal" runat="server" Text="Select" OnClick="btnSelectProposal_Click" />

            <asp:SqlDataSource ID="proposalDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [Title] FROM [Projects]"></asp:SqlDataSource>
        </td>
      </tr>
      <tr>
        <td>
            <asp:Label ID="needLabel" runat="server" Text="Choose a Type of Need"></asp:Label>
            <br />
            <asp:DropDownList ID="needDropDown" runat="server" AppendDataBoundItems="True"
                DataTextField="TypeOfNeed"
                DataValueField="TypeOfNeed"
                AutoPostBack ="False"></asp:DropDownList>
            <asp:SqlDataSource ID="needDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [TypeOfNeed] FROM [Need] ORDER BY [TypeOfNeed]">
            </asp:SqlDataSource>
        </td>
      </tr>
      <tr>
        <td>
            <asp:Label ID="clientTypeLabel" runat="server" Text="Choose a Client/ Sponser Type"></asp:Label>
            <br />
            <asp:DropDownList ID="clientTypeDropDown" runat="server" AppendDataBoundItems="True"
                DataTextField="ClientType"
                DataValueField="ClientType"
                AutoPostBack ="False"></asp:DropDownList>

            <asp:SqlDataSource ID="cleintTypeDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [ClientType] FROM [ClientType] ORDER BY [ClientType]">
            </asp:SqlDataSource>
        </td>
      </tr>
      <tr>
        <td>
            <asp:Label ID="orgCategoryLabel" runat="server" Text="Choose a Organizational Category"></asp:Label>
            <br />
            <asp:DropDownList ID="orgCategoryDropDown" runat="server" AppendDataBoundItems="True"
                DataTextField="OrganizationCategory"
                DataValueField="OrganizationCategory"
                AutoPostBack ="False"></asp:DropDownList>

            <asp:SqlDataSource ID="orgCategoryDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [OrganizationCategory] FROM [OrgCategory] ORDER BY [OrganizationCategory]">
            </asp:SqlDataSource>
        </td>
      </tr>
      <tr>
          <td>
            <asp:Label ID="proposalLabel" runat="server" Text="Whats Your Idea/Proposal Description?"></asp:Label>
            <br />
            <asp:TextBox ID="proposalDescriptionText" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox>
       </td>
     </tr>
    </table>
       <asp:Button ID="submitButton" runat="server" Text="Update Proposal" AutoPostBack="False" OnClick="ProposalSubmission_Click" />
        <br />
        <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="titleCharMaxLabel" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="descriptionCharMaxLabel" runat="server" Text=""></asp:Label>

        <br />

    </form>
</body>
</html>
