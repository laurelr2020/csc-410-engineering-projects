using System;

public partial class CreateNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string firstName = replaceSingleQuote(firstNameTextBox.Text);
        string lastName = replaceSingleQuote(lastNameTextBox.Text);
        string email = replaceSingleQuote(emailTextBox.Text);
        string jobTitle = replaceSingleQuote(jobTitleTextBox.Text);
        string company = replaceSingleQuote(companyNameTextBox.Text);
        string username = replaceSingleQuote(usernameTextBox.Text);
        string password = replaceSingleQuote(passwordTextBox.Text);

        if(allFieldsFilledIn(lastName, email, company, username, password))
        {
            createNewUserDataSource.InsertParameters["Username"].DefaultValue = username;
            createNewUserDataSource.InsertParameters["Pass"].DefaultValue = password;
            createNewUserDataSource.InsertParameters["FirstName"].DefaultValue = firstName;
            createNewUserDataSource.InsertParameters["LastName"].DefaultValue = lastName;
            createNewUserDataSource.InsertParameters["Email"].DefaultValue = email;
            createNewUserDataSource.InsertParameters["Company"].DefaultValue = company;
            createNewUserDataSource.InsertParameters["Title"].DefaultValue = jobTitle;
            createNewUserDataSource.InsertParameters["UserType"].DefaultValue = "0";

            try
            {
                createNewUserDataSource.Insert();
                statusLabel.Text = username + " was added successfully";
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
        jobTitleTextBox.Text = "";
        companyNameTextBox.Text = "";
        usernameTextBox.Text = "";
        passwordTextBox.Text = "";

        Response.Redirect("~/Default.aspx");
    }

    private string replaceSingleQuote(string dataField)
    {
        return dataField.Replace("'", "");
    } 

    private bool allFieldsFilledIn(string name, string email, string company, string username, string password)
    {
        if(name.Length > 0 && company.Length > 0 && username.Length > 0 && password.Length > 0 && email.Length > 0) 
            return true;
        else 
            return false;
    }
}