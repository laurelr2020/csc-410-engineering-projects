using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProposalSubmission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

    protected void ProposalSubmission_Click(object sender, EventArgs e)
    {
        string projectTitle = titleText.Text;
        projectTitle = replaceSingleQuote(projectTitle);

        string projectDescription = proposalDescriptionText.Text;
        projectDescription = replaceSingleQuote(projectDescription);

        string projectNeed = needDropDown.SelectedItem.Text;
        string projectClientType = clientTypeDropDown.SelectedItem.Text;
        string projectCategory = orgCategoryDropDown.SelectedItem.Text;

        //This is a test to see if this is working and I am typing in the middle of the text box so this is something that i will need to checkout later and i also need to check for max number of characters.

        if (allFieldsFilledIn(projectTitle, projectDescription, projectNeed, projectClientType, projectCategory))
        {
            proposalSubmissionDataSource.InsertParameters["Title"].DefaultValue = projectTitle;
            proposalSubmissionDataSource.InsertParameters["Description"].DefaultValue = projectDescription;
            proposalSubmissionDataSource.InsertParameters["TypeOfNeed"].DefaultValue = projectNeed;
            proposalSubmissionDataSource.InsertParameters["ClientType"].DefaultValue = projectClientType;
            proposalSubmissionDataSource.InsertParameters["OrganizationCategory"].DefaultValue = projectCategory;

            try
            {
                statusLabel.Text = "Proposal was added successfully";
            }
            catch (Exception ex)
            {
                statusLabel.Text = ex.Message;
            }
        }
        else
        {
            statusLabel.Text = "Please enter information for all fields";
        }
    }

    private string replaceSingleQuote(string dataField)
    {
        return dataField.Replace("'", "");
    }

    private bool allFieldsFilledIn(string title, string description, string need, string clientType, string category)
    {
        if (clientType.Equals("Select") || category.Equals("Select") || need.Equals("Select"))
        {
            return false;
        }
        else if(title.Length > 0 && description.Length > 0 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}