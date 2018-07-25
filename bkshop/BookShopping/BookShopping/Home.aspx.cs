using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShopping
{
    public partial class _Default : System.Web.UI.Page
    {
      //  protected void Page_Init(object sender, EventArgs e)
    ////{
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
      //  Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
       // Response.Cache.SetNoStore();
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
//}
   

        protected void Page_Load(object sender, EventArgs e)
        {

          //  if (Session["EmailId"] == null) Response.Redirect("Login.aspx");
//Session.Clear();
//Response.Redirect("Login.aspx");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }
    }
}
