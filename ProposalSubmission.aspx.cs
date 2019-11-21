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
        string projectClient = clientText.Text;
        string projectClientType = clientTypeDropDown.SelectedItem.Text;
        string projectCompany = companyText.Text;
        string projectCategory = orgCategoryDropDown.SelectedItem.Text;
        string projectDescription = proposalDescriptionText.Text;

        if (allFieldsFilledIn(projectTitle, projectClient, projectCompany, projectDescription, projectClientType, projectCategory))
        {
            proposalSubmissionDataSource.InsertParameters["Title"].DefaultValue = projectTitle;
            //proposalSubmissionDataSource.InsertParameters[""]


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

    private bool allFieldsFilledIn(string title, string client, string company, string description, string clientType, string category)
    {
        if (clientType.Equals("Select") || category.Equals("Select"))
        {
            return false;
        }
        else if(title.Length > 0 && client.Length > 0 && company.Length > 0 && description.Length > 0 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}