using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string firstName = firstNameTextBox.Text;
        string lastName = lastNameTextBox.Text;
        string email = emailTextBox.Text;
        string phoneNumber = phoneNumberTextBox.Text;
        string jobTitle = jobTitleTextBox.Text;
        string company = companyNameTextBox.Text;
        string username = usernameTextBox.Text;
        string password = passwordTextBox.Text;

        if(allFieldsFilledIn(lastName, email, phoneNumber, company, username, password))
        {

        }
    }

    private bool allFieldsFilledIn(string name, string email, string phoneNumber, string company, string username, string password)
    {
        if(email.Length > 0|| phoneNumber.Length > 0)
        {
            if(name.Length > 0 && company.Length > 0 && username.Length > 0 && password.Length > 0)
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