using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProposalUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        proposalDropDown.DataSource = proposalDataSource;
        proposalDropDown.DataBind();
        proposalDropDown.Items.Insert(0, new ListItem("Select", "%"));

        needDropDown.DataSource = needDataSource;
        needDropDown.DataBind();
        needDropDown.Items.Insert(0, new ListItem("Select", "%"));

        clientTypeDropDown.DataSource = cleintTypeDataSource;
        clientTypeDropDown.DataBind();
        clientTypeDropDown.Items.Insert(0, new ListItem("Select", "%"));

        orgCategoryDropDown.DataSource = orgCategoryDataSource;
        orgCategoryDropDown.DataBind();
        orgCategoryDropDown.Items.Insert(0, new ListItem("Select", "%"));
    }

    //onselectedindexchange()
    protected void ProposalSubmission_Click(object sender, EventArgs e)
    {
        string projectDescription = replaceSingleQuote(proposalDescriptionText.Text);

        string projectTitle = proposalDropDown.SelectedItem.Text;
        string projectNeed = needDropDown.SelectedItem.Text;
        string projectClientType = clientTypeDropDown.SelectedItem.Text;
        string projectCategory = orgCategoryDropDown.SelectedItem.Text;

        if (allFieldsFilledIn(projectDescription, projectNeed, projectClientType, projectCategory)
            && characterLimitsMet(projectDescription))
        {
            proposalSubmissionDataSource.InsertParameters["Description"].DefaultValue = projectDescription;
            proposalSubmissionDataSource.InsertParameters["TypeOfNeed"].DefaultValue = projectNeed;
            proposalSubmissionDataSource.InsertParameters["ClientType"].DefaultValue = projectClientType;
            proposalSubmissionDataSource.InsertParameters["OrganizationCategory"].DefaultValue = projectCategory;

            try
            {
                proposalSubmissionDataSource.Insert();
                statusLabel.Text = "Proposal was added successfully";
                resetProposalFields();
            }
            catch (Exception ex)
            {
                statusLabel.Text = ex.Message;
            }
        }
    }

    protected void updateToTitle(object sender, EventArgs e)
    {
        string projectDescription = replaceSingleQuote(proposalDescriptionText.Text);

        string projectTitle = proposalDropDown.SelectedItem.Text;
        string projectNeed = needDropDown.SelectedItem.Text;
        string projectClientType = clientTypeDropDown.SelectedItem.Text;
        string projectCategory = orgCategoryDropDown.SelectedItem.Text;

        if (allFieldsFilledIn(projectDescription, projectNeed, projectClientType, projectCategory)
            && characterLimitsMet(projectDescription))
        {
            proposalSubmissionDataSource.InsertParameters["Description"].DefaultValue = projectDescription;
            proposalSubmissionDataSource.InsertParameters["TypeOfNeed"].DefaultValue = projectNeed;
            proposalSubmissionDataSource.InsertParameters["ClientType"].DefaultValue = projectClientType;
            proposalSubmissionDataSource.InsertParameters["OrganizationCategory"].DefaultValue = projectCategory;

            try
            {
                proposalSubmissionDataSource.Insert();
                statusLabel.Text = "Proposal was added successfully";
                resetProposalFields();
            }
            catch (Exception ex)
            {
                statusLabel.Text = ex.Message;
            }
        }
    }

    private string replaceSingleQuote(string dataField)
    {
        return dataField.Replace("'", "");
    }

    private bool allFieldsFilledIn(string description, string need, string clientType, string category)
    {
        if (!clientType.Equals("Select") && !category.Equals("Select") && !need.Equals("Select")
            && description.Length > 0)
        {
            return true;
        }
        else
        {
            statusLabel.Text = "Please fill in information for all fields";
            return false;
        }
    }

    private bool characterLimitsMet(string description)
    {
        if (description.Length <= 500)
        {
            titleCharMaxLabel.Text = "";
            descriptionCharMaxLabel.Text = "";
            return true;
        }

        if (description.Length > 500)
        {
            descriptionCharMaxLabel.Text = "Proposal Description Max 500 Characters";
        }

        return false;
    }

    private void resetProposalFields()
    {
        proposalDescriptionText.Text = "";
        needDropDown.SelectedIndex = -1;
        clientTypeDropDown.SelectedIndex = -1;
        orgCategoryDropDown.SelectedIndex = -1;
    }


    protected void updateFromTitle(object sender, EventArgs e) {
        string projectDescription;
        string projectNeed;
        string projectClientType;
        string projectCategory;

        try
        {
            SqlConnection conn = new SqlConnection(getConnectionString());
            conn.Open();

            SqlCommand command = new SqlCommand("Select * FROM Projects WHERE Title=@title", conn);
            command.Parameters.AddWithValue("@title", "Title");
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    projectDescription = Convert.ToString(reader["Description"]);
                    projectNeed = Convert.ToString(reader["TypeOfNeed"]);
                    projectClientType = Convert.ToString(reader["ClientType"]);
                    projectCategory = Convert.ToString(reader["OrganizationCategory"]);

                    proposalDescriptionText.Text = projectDescription.ToString();

                    needDropDown.ClearSelection(); //making sure the previous selection has been cleared
                    needDropDown.Items.FindByValue(projectNeed).Selected = true;

                    clientTypeDropDown.ClearSelection(); //making sure the previous selection has been cleared
                    clientTypeDropDown.Items.FindByValue(projectClientType).Selected = true;

                    orgCategoryDropDown.ClearSelection(); //making sure the previous selection has been cleared
                    orgCategoryDropDown.Items.FindByValue(projectCategory).Selected = true;
                }
            }

            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

private string getConnectionString()
{
    return ConfigurationManager.ConnectionStrings["EngineeringProjectsConnectionString"].ConnectionString;
}
}