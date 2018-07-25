using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;

namespace BookShopping
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        String productCategoryId;
        String productId;
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String CustomerId;

        protected void Page_Load(object sender, EventArgs e)
        {
            productId           = Request.QueryString.Get("ProductID");
            productCategoryId   = Request.QueryString.Get("ProductCategoryID");
            CustomerId          = (string)Session["CustomerId"];

            if (!IsPostBack)
            {
                if (CustomerId == null || CustomerId == "")
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
                else
                {
                    ViewState["priceTotal"] = 0;
                    ViewState["quantityTotal"] = 0;
                    BindGridViewData();
                }               
            }
        }

        String getNextId(String previousId)
        {
            String prefix = previousId.Substring(0, 2);
            int idNumber = Convert.ToInt32(previousId.Substring(2));
            idNumber += 1;
            return prefix + idNumber;
        }

        private void BindGridViewData()
        {
            SqlConnection sqlCon    = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM ShoppingCartItem WHERE Date = '' AND CustomerId = '" + CustomerId + "'", sqlCon);
                SqlDataAdapter da    = new SqlDataAdapter(cmd);
                DataSet ds           = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    int columncount = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                    GridView1.Rows[0].Cells[0].Text = "No Records Found";

                    confirmOrderBtn.Visible = false;
                }
                else
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                    confirmOrderBtn.Visible = true;
                }

                cmd = new SqlCommand("select sum(SubTotalPrice),sum(Quantity) from ShoppingCartItem WHERE Date = '' AND CustomerId = '" + CustomerId + "'", sqlCon);                
                SqlDataReader dr = cmd.ExecuteReader();
                double sumPrice = 0;
                if(dr.Read())
                {
                    sumPrice = Convert.ToDouble(dr[0].ToString());
                    ViewState["quantityTotal"]  = Convert.ToInt32(dr[1].ToString());                   
                }                  
                dr.Close();
                sqlCon.Close();
                String shippingPrice = "0";
                if (sumPrice < 500)
                {
                    shippingPrice = "0";
                }
                else if (sumPrice > 500)
                {
                    shippingPrice = "50";
                }
                else if (sumPrice > 100)
                {
                    shippingPrice = "70";
                }
                else if (sumPrice > 1500)
                {
                    shippingPrice = "100";
                }
                else {
                    shippingPrice = "150";
                }
                lblTotal.Text = " Rs. " + sumPrice.ToString();
                lblShippingPrice.Text = " Rs. " + shippingPrice;
                double total = Convert.ToDouble(sumPrice) + Convert.ToDouble(shippingPrice);
                lblTotalPrice.Text = " Rs. " + total.ToString();
                ViewState["priceTotal"] = total;
            }
            catch (Exception error)
            {
                lblTotal.Text += "Error " + error.Message;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridViewData();            
        }

        protected void continueShoppingBtn_Click(object sender, EventArgs e)
        {
            if (productCategoryId == "")
            {
                Response.Redirect("~/ProductList.aspx");
            }
            else {
                Response.Redirect("~/ProductList.aspx?ProductCategoryID=" + productCategoryId);
            }
        }

        protected void confirmOrderBtn_Click(object sender, EventArgs e)
        {
           

            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;

            SqlCommand cmd;

            //====================================================================================
            // Get last orderid from database
            //====================================================================================
            cmd = new SqlCommand("SELECT TOP (1) OrderId FROM CustomerOrders ORDER BY OrderId DESC", sqlCon);
            String lastOrderID = "";
            try
            { 
                sqlCon.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lastOrderID = dr[0].ToString();               
                }             
                dr.Close();

                if (lastOrderID == null || lastOrderID == "")
                {
                   // lastOrderID = "O01";
                    lastOrderID = "1";
                }
                else {                 
                   // lastOrderID = getNextId(lastOrderID);
                    int nextId = Convert.ToInt32(lastOrderID) + 1; ;
                    lastOrderID = nextId.ToString();
                }

                //====================================================================================
                // Insert into CustomerOrders
                //====================================================================================
                //lblTotal.Text = "Quantity " + ViewState["quantityTotal"] + " Rs. " + ViewState["priceTotal"];                  
                String insertQuery = "INSERT INTO CustomerOrders (OrderId,CustomerId,TotalQuantity,TotalPrice,Date,Status) values('" + lastOrderID + "','" + CustomerId + "','" + ViewState["quantityTotal"] + "','" + ViewState["priceTotal"] + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','Pending')";
                cmd = new SqlCommand(insertQuery, sqlCon);
                int insertSuccess = cmd.ExecuteNonQuery();
                lblTotal.Text = "insertQuery " + insertQuery + "insertSuccess " + insertSuccess;
                //==========================================================================================================
                // Insert into ShoppingCartItems
                //==========================================================================================================                
                if (insertSuccess != 0)
                {
                    cmd = new SqlCommand("UPDATE ShoppingCartItem SET Date = '" + DateTime.Now.ToString("yyyy-MM-dd") + "', OrderId= '" + lastOrderID + "' WHERE Date = '' AND CustomerId = '" + CustomerId + "'", sqlCon);
                    int updateSuccess = cmd.ExecuteNonQuery();
                   lblTotal.Text = "updateSuccess " + updateSuccess + "UPDATE SET Date = '" + DateTime.Now + "' ShoppingCartItem";
                }
                sqlCon.Close();

                Response.Redirect("ConfirmOrder.aspx");
            }
            catch (Exception error)
            {
                 lblTotal.Text = "Error" +error.Message  ;
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string CommandName = btn.CommandName;
            string CommandArgument = btn.CommandArgument;
            String ShoppingCartItemID = CommandArgument;
           // lblTotal.Text = "ShoppingCartItemId :" + ShoppingCartItemID;
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            SqlCommand cmd = new SqlCommand("DELETE FROM ShoppingCartItem WHERE ShoppingCartItemId = '" + ShoppingCartItemID + "' AND CustomerId = '" + CustomerId + "'", sqlCon);
            try
            {
                
                sqlCon.Open();
                int deleteSuccess = cmd.ExecuteNonQuery(); 
                if(deleteSuccess != 0)
                     BindGridViewData();    
            }
            catch (Exception ex)
            {
                 //lblTotal.Text = ex.Message;
            }
            finally
            {
                sqlCon.Close();
            }
        }

        protected void EditOrder(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridViewData();
        }
        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridViewData();
        }

        protected void UpdateEdit(object sender, GridViewUpdateEventArgs e)
        {
            //string CustomerID = ((Label)GridView1.Rows[e.RowIndex]
            //                    .FindControl("lblCustomerID")).Text;
            //string Name = ((TextBox)GridView1.Rows[e.RowIndex]
            //                    .FindControl("txtContactName")).Text;
            //string Company = ((TextBox)GridView1.Rows[e.RowIndex]
            //                    .FindControl("txtCompany")).Text;
            //SqlConnection con = new SqlConnection(strConnString);
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "update customers set ContactName=@ContactName," +
            // "CompanyName=@CompanyName where CustomerID=@CustomerID;" +
            // "select CustomerID,ContactName,CompanyName from customers";
            //cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = CustomerID;
            //cmd.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = Name;
            //cmd.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = Company;
            //GridView1.EditIndex = -1;
            //GridView1.DataSource = GetData(cmd);
            //GridView1.DataBind();
        }
    }
}