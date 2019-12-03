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

        if (Session["UserType"] == null)
        {
            menuNav3.Visible = true;
            menuTopNav.Visible =false;
            menuNav2.Visible = false;


        }
        else
        {

            if (Session["UserType"].Equals("1"))
            {
                menuTopNav.Visible = true;
                menuNav2.Visible = false;
                menuNav3.Visible = false;

            } // admin
            else
            {
                menuNav2.Visible = true;
                menuTopNav.Visible = false;
                menuNav3.Visible = false;

            } // not admin
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

    protected void menuTopNav_MenuItemClick(object sender, MenuEventArgs e)
    {

        if (menuTopNav.SelectedItem == menuTopNav.Items[0])
        {
            Response.Redirect("~/ProposalSubmission.aspx");
        }
        else if (menuTopNav.SelectedItem == menuTopNav.Items[1])
        {
            Response.Redirect("~/Update.aspx");
        }
        else if (menuTopNav.SelectedItem == menuTopNav.Items[2])
        {
            Response.Redirect("~/ViewUser.aspx");
        }
        else if(menuTopNav.SelectedItem==menuTopNav.Items[3])
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }

    }

    protected void gvProjects_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void menuNav3_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (menuNav3.SelectedItem == menuNav3.Items[0])
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void menuNav2_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (menuNav2.SelectedItem == menuNav2.Items[0])
        {
            Response.Redirect("~/ProposalSubmission.aspx");
        }
        else if (menuNav2.SelectedItem == menuNav2.Items[1])
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
    }
}
