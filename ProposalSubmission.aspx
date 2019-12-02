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
             <asp:TextBox ID="titleText" runat="server" Columns="50"></asp:TextBox>

         </td>
     </tr>
      <tr>
        <td>
            <asp:Label ID="needLabel" runat="server" Text="Choose a Type of Need"></asp:Label>
            <br />
            <asp:DropDownList ID="needDropDown" runat="server" AppendDataBoundItems="True"
                DataTextField="TypeOfNeed"
                DataValueField="TypeOfNeed"></asp:DropDownList>
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
                DataValueField="ClientType"></asp:DropDownList>

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
                DataValueField="OrganizationCategory"></asp:DropDownList>

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
       <asp:Button ID="submitButton" runat="server" Text="Submit Proposal" AutoPostBack="False" OnClick="ProposalSubmission_Click" />
        <br />
        <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="titleCharMaxLabel" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="descriptionCharMaxLabel" runat="server" Text=""></asp:Label><br />


        <asp:SqlDataSource ID="proposalSubmissionDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>"
            InsertCommand="INSERT INTO [Projects] ([TypeOfNeed], [Description], [Title], [ClientType], [OrganizationCategory]) 
                            VALUES (@TypeOfNeed, @Description, @Title, @ClientType, @OrganizationCategory)">
            <InsertParameters>
                <asp:Parameter Name="TypeOfNeed" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="ClientType" Type="String" />
                <asp:Parameter Name="OrganizationCategory" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="projectStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EngineeringProjectsConnectionString %>" 
            InsertCommand="INSERT INTO [ProjectStatus] ([ProjectID], [Stat], [DateUpdated])
                            VALUES(@ProjectID, @Status, @DateUpdated)">
             <InsertParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="DateUpdated" Type="DateTime" />
            </InsertParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
