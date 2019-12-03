using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlStatus.DataSource = sdsStatus;
            ddlStatus.DataBind();

            ddlStatus.Items.Insert(0, new ListItem("Select a Status", "%"));


            ddlCategory.DataSource = sdsCategory;
            ddlCategory.DataBind();

            ddlCategory.Items.Insert(0, new ListItem("Select a Category", "%"));

            ddlTypeOfNeed.DataSource = sdsTypeOfNeed;
            ddlTypeOfNeed.DataBind();

            ddlTypeOfNeed.Items.Insert(0, new ListItem("Select a Type of Need", "%"));

            ddlClientType.DataSource = sdsClientType;
            ddlClientType.DataBind();

            ddlClientType.Items.Insert(0, new ListItem("Select a Client Type", "%"));
        }
    }

    protected void gvProjects_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvProjects.SelectedIndex = -1;
    }

    protected void gvProjects_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to save changes.";
            e.ExceptionHandled = true;
        }
        else
        {
            if (e.AffectedRows == 0)
            {
                lblStatus.Text = "Update failed.";
            }
            else
            {
                lblStatus.Text = "Updated OK";
            }
        }
    }
}