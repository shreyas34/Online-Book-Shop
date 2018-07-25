using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShopping
{
    public partial class AdvanceSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtBookName.Text = "";
            txtAuthorName.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtBookName.Text != null && txtBookName.Text != "" && txtAuthorName.Text != null && txtAuthorName.Text != "")
            {
                Response.Redirect("~/ProductList.aspx?BookName=" + txtBookName.Text + "&AuthorName=" + txtAuthorName.Text);
            }
            else
            {
                Response.Redirect("~/ProductList.aspx?BookName=" + txtBookName.Text);
            }
      
        }
    }
}