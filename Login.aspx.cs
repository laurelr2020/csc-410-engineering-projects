using System;
using System.Linq;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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
                string userType;
                try
                {
                    SqlConnection conn = new SqlConnection(getConnectionString());
                    conn.Open();

                    SqlCommand command = new SqlCommand("Select UserType FROM Users WHERE Username=@username", conn);
            
                    command.Parameters.AddWithValue("@username", Session["Username"]);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userType = Convert.ToString(reader["UserType"]);
                            Session["userType"] = userType;
                        }
                    }

                    conn.Close();
                    Response.Redirect("~/Default.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }



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
    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["EngineeringProjectsConnectionString"].ConnectionString;
    }
}