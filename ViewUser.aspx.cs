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
}