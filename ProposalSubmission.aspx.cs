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

    }

    protected void ProposalSubmission_Click(object sender, EventArgs e)
    {


        if (allFieldsFilledIn())
        {

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

        firstNameTextBox.Text = "";
        lastNameTextBox.Text = "";
        emailTextBox.Text = "";
        phoneNumberTextBox.Text = "";
        jobTitleTextBox.Text = "";
        companyNameTextBox.Text = "";
        usernameTextBox.Text = "";
        passwordTextBox.Text = "";
    }

    private string replaceSingleQuote(string dataField)
    {
        return dataField.Replace("'", "");
    }

    private bool allFieldsFilledIn()
    {
        if (email.Length > 0 || phoneNumber.Length > 0)
        {
            if (name.Length > 0 && company.Length > 0 && username.Length > 0 && password.Length > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
}