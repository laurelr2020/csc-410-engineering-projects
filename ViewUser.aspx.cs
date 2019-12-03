using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvViewUsers_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvViewUsers_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to save changes. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Update failed. Someone else changed or deleted this user.";
        }
    }

    protected void gvViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvViewUsers.SelectedIndex = -1;
    }

    protected void menuTopNav_MenuItemClick(object sender, MenuEventArgs e)
    {

        if (menuTopNav.SelectedItem == menuTopNav.Items[0])
        {
            Response.Redirect("~/Default.aspx");
        }
        else if (menuTopNav.SelectedItem == menuTopNav.Items[1])
        {
            Response.Redirect("~/ProposalSubmission.aspx");
        }
        else if (menuTopNav.SelectedItem == menuTopNav.Items[2])
        {
            Response.Redirect("~/ProposalUpdate.aspx");
        }
        else if (menuTopNav.SelectedItem == menuTopNav.Items[3])
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }

    }


}