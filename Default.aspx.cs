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
            // We are only here if NOT a PostBack, i.e. ONCE


            // Get city categories and load then into the DropDownList
            ddlStatus.DataSource = sdsStatus;
            ddlStatus.DataBind();

            // Insert a ListItem at the top, above the actual categories
            ddlStatus.Items.Insert(0, new ListItem("Select", "%"));


            // Get state categories and load then into the DropDownList
            ddlCategory.DataSource = sdsCategory;
            ddlCategory.DataBind();

            // Insert a ListItem at the top, above the actual categories
            ddlCategory.Items.Insert(0, new ListItem("Select", "%"));

            // Get state categories and load then into the DropDownList
            ddlTypeOfNeed.DataSource = sdsTypeOfNeed;
            ddlTypeOfNeed.DataBind();

            // Insert a ListItem at the top, above the actual categories
            ddlTypeOfNeed.Items.Insert(0, new ListItem("Select", "%"));

            // Get state categories and load then into the DropDownList
            ddlClientType.DataSource = sdsClientType;
            ddlClientType.DataBind();

            // Insert a ListItem at the top, above the actual categories
            ddlClientType.Items.Insert(0, new ListItem("Select", "%"));
        } // NOT PostBack
    }
}