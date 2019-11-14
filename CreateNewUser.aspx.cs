using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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
        string phoneNumber = replaceSingleQuote(phoneNumberTextBox.Text);
        string jobTitle = replaceSingleQuote(jobTitleTextBox.Text);
        string company = replaceSingleQuote(companyNameTextBox.Text);
        string username = replaceSingleQuote(usernameTextBox.Text);
        string password = replaceSingleQuote(passwordTextBox.Text);

        if(allFieldsFilledIn(lastName, email, phoneNumber, company, username, password))
        {
            createNewUserDataSource.InsertParameters["Username"].DefaultValue = username;
            createNewUserDataSource.InsertParameters["Pass"].DefaultValue = password;
            createNewUserDataSource.InsertParameters["FirstName"].DefaultValue = firstName;
            createNewUserDataSource.InsertParameters["LastName"].DefaultValue = lastName;
            createNewUserDataSource.InsertParameters["Email"].DefaultValue = email;
            createNewUserDataSource.InsertParameters["PhoneNumber"].DefaultValue = phoneNumber;
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