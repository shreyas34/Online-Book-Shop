using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace BookShopping
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                lblNewUser.Visible = false;
                hlRegister.Visible = false;
                hlForgot.Visible = false;
            }
            else {
                lblNewUser.Visible = true;
                hlRegister.Visible = true;
                hlForgot.Visible = true;
                Session.Clear();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            Response.Redirect("~/ProductList.aspx?SearchText="+ txtSearch.Text);
        }
        
        protected void Logoutbtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
           
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}
