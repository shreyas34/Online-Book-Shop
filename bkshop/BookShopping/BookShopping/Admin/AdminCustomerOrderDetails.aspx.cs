using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace BookShopping.Admin
{
    public partial class AdminCustomerOrderDetails : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String OrderId,CustomerId;
        String AdminId;
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderId = Request.QueryString.Get("OrderID");
            AdminId = (string)Session["AdminId"];
            if (!IsPostBack)
            {
                if (AdminId == null || AdminId == "")
                {
                    Response.Redirect("~/Account/AdminLogin.aspx");
                }
                else
                {
                    DropDownList1.DataBind();
                    DropDownList2.DataBind();
                    loadCustomerAndHisOrdersDetails();  
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //1. Create Connection
            SqlConnection sqlCon = new SqlConnection();
            //2.open your connection string and initiallize with connection object
            sqlCon.ConnectionString = sqlConnectionString;

            SqlCommand cmd;
            try
            {
                sqlCon.Open();
                String query = "UPDATE CustomerOrders SET Status ='" + DropDownStatusList.SelectedItem.ToString() + "' WHERE OrderId = '" + OrderId + "'";
                cmd = new SqlCommand(query, sqlCon);
                lblResult.Text = query;
                int updateSuccess = cmd.ExecuteNonQuery();
                sqlCon.Close();
              
                if (updateSuccess != 0)
                {
                    String msg = "alert('Yours details updated successfully!!!')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                    lblResult.Text = "update success";
                }
                else
                {
                    //show error
                    String msg = "alert('Sorry, Something wrong happened. Please try again later.')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                    lblResult.Text = "update failed";
                }
            }
            catch (Exception error)
            {
                lblResult.Text = "Error: " + error.Message + error.StackTrace;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }
        
        void loadCustomerAndHisOrdersDetails()
        {
            txtOrderId.Text = OrderId;
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT CustomerId,TotalQuantity,TotalPrice,Date,Status FROM CustomerOrders WHERE OrderId = '" + OrderId + "'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {                    
                    CustomerId          = dr[0].ToString();
                    txtCustomerId.Text  = CustomerId;
                    txtQuantity.Text    = dr[1].ToString();
                    txtPrice.Text       = dr[2].ToString();                   
                    txtOrderedDate.Text = dr[3].ToString();
                    DropDownStatusList.Items.FindByValue(dr[4].ToString()).Selected = true;
                }
                else
                {
                    //  lblResult.Text = "Not able to read";
                }
                dr.Close();
               
                SqlCommand cmd1 = new SqlCommand("SELECT FirstName,LastName,PhoneNo,Address,State,City,Zipcode,EmailId FROM Customer WHERE CustomerId = '" + CustomerId + "'", sqlCon);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    // lblResult.Text = "Able to read : " + dr[0].ToString() + "--" + dr[1].ToString() + "--" + dr[2].ToString() + "--" + dr[3].ToString() + "--" + dr[4].ToString() + "--" + dr[5].ToString() + "--" + dr[6].ToString();
                    txtFirstName.Text = dr1[0].ToString();
                    txtLastName.Text = dr1[1].ToString();
                    txtPhoneNo.Text = dr1[2].ToString();
                    txtAddress.Text = dr1[3].ToString();
                    DropDownList1.Items.FindByValue(dr1[4].ToString()).Selected = true;
                    DropDownList2.Items.FindByValue(dr1[5].ToString()).Selected = true;
                    txtZipcode.Text = dr1[6].ToString();
                    txtEmailId.Text = dr1[7].ToString();
                }
                else
                {
                    //  lblResult.Text = "Not able to read";
                }
                dr1.Close();
                bindGridViewData();
            }
            catch (Exception error)
            {
                // lblResult.Text = "Error: " + error.Message + error.StackTrace;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }

        void bindGridViewData() 
        { 
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            DataTable dt = new DataTable();
            String query = "SELECT * FROM ShoppingCartItem WHERE OrderId = '" + OrderId + "' AND CustomerId = '" + CustomerId + "'";
            lblResult.Text = query;
            SqlCommand cmd = new SqlCommand(query, sqlCon);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);                
            try
            {
                sqlCon.Open();
                adp.Fill(dt);
                sqlCon.Close();

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
            bindGridViewData();
        }
    }
}