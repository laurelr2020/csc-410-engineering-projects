﻿using System;
using System.Linq;
using System.Web.UI;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {}

    protected void Login_Click(object sender, EventArgs e)
    {
        DataView dataView;
        DataRowView dataRowView;
        string userName;

        if (usernameTextBox.Text.Length > 0 && passwordTextBox.Text.Length > 0)
        {
            dataView = (DataView)loginDataSource.Select(DataSourceSelectArguments.Empty);
            if (dataView.Count > 0)
            {
                dataRowView = dataView[0];
                userName = (string)dataRowView["UserName"];
                Session["Username"] = userName;
                Response.Redirect("~/Default.html"); //TO DO: THIS NEEDS CHANGED
            }
            else
            {
                statusLabel.Text = "Invalid login";
            }
        }
        else
        {
            statusLabel.Text = "Invalid login";
        }
    }

    protected void createButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CreateNewUser.aspx");
    }
}