using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BookShopping
{
    public partial class ConfirmOrder : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String CustomerId;

        protected void Page_Load(object sender, EventArgs e)
        {
            CustomerId = (string)Session["CustomerId"];
            if (!IsPostBack)
            {                
                if (CustomerId == null || CustomerId == "")
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
                else
                {
                    loadDataFromTable();
                }
            }
        }

        void loadDataFromTable() 
        {
            SqlConnection sqlcon = new SqlConnection();
            sqlcon.ConnectionString = sqlConnectionString;

            String query = "select  TOP (1) * from CustomerOrders where CustomerId='" + CustomerId + "' AND Date = '" + DateTime.Now.ToString("yyyy-MM-dd") + "' ORDER BY OrderId DESC";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet dsvalue = new DataSet();
            lblResult.Text = query;
            try
            {
                sqlcon.Open();
                adp.Fill(dsvalue, "CustomerOrders");
                sqlcon.Close();

                DetailsView1.DataSource = dsvalue;
                DetailsView1.DataBind();
            }
            catch (Exception error)
            {
            //    Response.Write("Error: " + ex.Message);
               // lblResult.Text = "Error: " + error.Message + error.StackTrace;
            }    
        }
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThankYou.aspx");
        }
    }
}