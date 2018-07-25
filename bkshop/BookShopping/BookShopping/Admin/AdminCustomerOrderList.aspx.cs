using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BookShopping.Admin
{
    public partial class AdminCustomerOrderList : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String AdminId;
        protected void Page_Load(object sender, EventArgs e)
        {
            AdminId = (string)Session["AdminId"];
            if (!IsPostBack)
            {
                if (AdminId == null || AdminId == "")
                {
                    Response.Redirect("~/Account/AdminLogin.aspx");
                }
                else
                {
                    loadCustomerOrdersList();
                }
            }
        }

        private void loadCustomerOrdersList()
        {
            SqlConnection sqlcon = new SqlConnection();
            sqlcon.ConnectionString = sqlConnectionString;
            DataTable dt = new DataTable();
            String query = "SELECT * FROM CustomerOrders";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            try
            {
                sqlcon.Open();
                adp.Fill(dt);
                sqlcon.Close();

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception exp)
            {

            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loadCustomerOrdersList();
        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string CommandName = btn.CommandName;
            string CommandArgument = btn.CommandArgument;
            String OrderId = CommandArgument;
            Response.Redirect("~/Admin/AdminCustomerOrderDetails.aspx?OrderID=" + OrderId);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string CommandName = btn.CommandName;
            string CommandArgument = btn.CommandArgument;
            String OrderId = CommandArgument;
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            SqlCommand cmd = new SqlCommand("DELETE FROM CustomerOrders WHERE OrderId = '" + OrderId + "'", sqlCon);
            try
            {
                sqlCon.Open();
                int deleteSuccess = cmd.ExecuteNonQuery();
                if (deleteSuccess != 0)
                    loadCustomerOrdersList();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                sqlCon.Close();
            }
        }
    }
}