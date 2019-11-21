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
             <asp:Label ID="titleLabel" runat="server" Text="Enter Title for Your Proposal"></asp:Label>
             <br />
             <asp:TextBox ID="titleText" runat="server" Width="240px" Height="22px"></asp:TextBox>

         </td>
     </tr>

      <tr>
        <td>
            <asp:Label ID="clientLabel" runat="server" Text="Enter Client or Sponser"></asp:Label>
            <br />
            <asp:TextBox ID="clientText" runat="server" Width="240px" Height="22px"></asp:TextBox>
        </td>

        <td>
            <asp:Label ID="clientTypeLabel" runat="server" Text="Choose a Client/ Sponser Type"></asp:Label>
            <br />
            <asp:DropDownList ID="clientTypeDropDown" runat="server" Height="20px" AutoPostBack="true"
                DataTextField="ClientType"
                DataValueField="ClientType"></asp:DropDownList>

            <asp:SqlDataSource ID="cleintTypeDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [ClientType] FROM [ClientType]">
            </asp:SqlDataSource>
        </td>
      </tr>
      <tr>
        <td>
            <asp:Label ID="companyLabel" runat="server" Text="Enter Company"></asp:Label>
            <br />
            <asp:TextBox ID="companyText" runat="server" Height="16px" Width="240px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="orgCategoryLabel" runat="server" Text="Choose a Organizational Category"></asp:Label>
            <br />
            <asp:DropDownList ID="orgCategoryDropDown" runat="server" Height="20px" AutoPostBack="true"
                DataTextField="OrganizationCategory"
                DataValueField="OrganizationCategory"></asp:DropDownList>

            <asp:SqlDataSource ID="orgCategoryDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
                SelectCommand="SELECT [OrganizationCategory] FROM [OrgCategory]">
            </asp:SqlDataSource>
        </td>

      </tr>
      <tr>
          <td>
            <asp:Label ID="proposalLabel" runat="server" Text="Whats Your Idea/Proposal Description?"></asp:Label>
            <br />
            <asp:TextBox ID="proposalDescriptionText" runat="server" Height="161px" Width="392px" ></asp:TextBox>
       </td>
     </tr>
    </table>
       <asp:Button ID="submitButton" runat="server" Text="Submit Proposal" OnClick="ProposalSubmission_Click" />
        <br />
        <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>

        <asp:SqlDataSource ID="proposalSubmissionDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>"
            InsertCommand="INSERT INTO [Projects] ([TypeOfNeed], [Description], [Title], [ClientType], [OrganizationCategory], [Comments]) 
                            VALUES (@TypeOfNeed, @Description, @Title, @ClientType, @OrganizationCategory, @Comments)" >
            <InsertParameters>
                <asp:Parameter Name="TypeOfNeed" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="ClientType" Type="String" />
                <asp:Parameter Name="OrganizationCategory" Type="String" />
                <asp:Parameter Name="Comments" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
