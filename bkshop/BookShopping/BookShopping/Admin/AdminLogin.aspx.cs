using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShopping.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminSubmit_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text == "admin" && txtPassword.Text == "admin")
            {
                Session["AdminId"] = txtUserName.Text;
                Response.Redirect("~/Admin/AdminProductList.aspx");
            }
            else
            {
                lblResult.Text = "Enter the correct detail please";
            }
        }
    }
}