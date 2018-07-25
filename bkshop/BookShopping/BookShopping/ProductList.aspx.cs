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
    public partial class ProductList : System.Web.UI.Page
    {
        String productCategoryId;
        String SearchText;
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String BookName, AuthorName;
        String CustomerId;


        protected void Page_Load(object sender, EventArgs e)
        {
           ViewState["currentPage"] = 0;         

            productCategoryId = Request.QueryString.Get("ProductCategoryID");
            SearchText = Request.QueryString.Get("SearchText");
            BookName = Request.QueryString.Get("BookName");
            AuthorName = Request.QueryString.Get("AuthorName");

            CustomerId = (string)Session["CustomerId"];

            if (!IsPostBack)
            {
                if (SearchText != null && SearchText != "")
                {
                    loadDataListWithSearchText();
                }
                else if (BookName != null && BookName != "")
                {
                    loadDataListWithBookName();
                } 
                else
                {
                    loadDataList();
                }
            }                         
        }
        
        private void loadDataList()
        {
            SqlConnection sqlcon = new SqlConnection();
            sqlcon.ConnectionString = sqlConnectionString;
            DataTable dt = new DataTable();
            String query;
            if (productCategoryId == null || productCategoryId == "")
            {
                query = "select * from ProductList";
            }
            else
            {
                query = "select * from ProductList where CategoryId='" + productCategoryId + "'";
            }

            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            try
            {
                sqlcon.Open();
                int rowsCount = adp.Fill(dt);
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
            if (SearchText != null && SearchText != "")
            {
                loadDataListWithSearchText();
            }
            else if (BookName != null && BookName != "")
            {
                loadDataListWithBookName();
            }
            else
            {
                loadDataList();
            }
            GridView1.DataBind();          
        }

        private void loadDataListWithSearchText()
        {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                String query = "SELECT * FROM ProductList WHERE ProductName LIKE '%" + SearchText + "%' OR BookDescription LIKE '%" + SearchText + "%'";
                SqlCommand cmd = new SqlCommand(query, sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
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
                }
                else
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                sqlCon.Close();
            }
            catch (Exception error)
            {
                
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }

        private void loadDataListWithBookName()
        {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                String query = "";
                if (BookName != null && BookName != "" && AuthorName != null && AuthorName != "")
                {
                    query = "SELECT * FROM ProductList WHERE ProductName LIKE '%" + BookName + "%' AND AuthorName LIKE '%" + AuthorName + "%'";
                }
                else if ((BookName == null || BookName == "") && AuthorName != null && AuthorName != "")
                {
                    query = "SELECT * FROM ProductList WHERE AuthorName LIKE '%" + AuthorName + "%'";
                }
                else
                {
                    query = "SELECT * FROM ProductList WHERE ProductName LIKE '%" + BookName + "%'";
                }
                SqlCommand cmd = new SqlCommand(query, sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
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
                }
                else
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                sqlCon.Close();
            }
            catch (Exception error)
            {

            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string CommandName = btn.CommandName;
            string CommandArgument = btn.CommandArgument;
            String productId = CommandArgument;

            lblResult.Text = "in click action" + productId;

            if (CustomerId == null || CustomerId == "")
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                String productName = "";
                Double subTotalPrice, productPrice, shippingCharge, qty;
                subTotalPrice = productPrice = shippingCharge = qty = 0;

                SqlConnection sqlcon = new SqlConnection();
                sqlcon.ConnectionString = sqlConnectionString;

                //====================================================================================
                // Get Product details from database
                //====================================================================================
                string query = "select ProductName, Price, ShippingCharges from ProductList where ProductId='" + productId + "'";
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlcon;
                cmd.CommandText = query;
                SqlDataReader reader;
                try
                {
                    //sqlcon.Open();
                    cmd.Connection.Open();
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        productName = reader.GetValue(0).ToString();
                        productPrice = Double.Parse(reader.GetString(1));
                        //shippingCharge = Double.Parse(reader.GetString(2));

                        qty = 1;
                        subTotalPrice = productPrice * qty;
                        lblResult.Text = "Productname = " + productName + " Price = " + productPrice + " shipping price = " + shippingCharge + "\n Qty = " + qty + "\n total = " + subTotalPrice + "";

                    }
                    else
                    {
                        lblResult.Text = "Data Not found";
                    }
                    reader.Close();

                    //====================================================================================
                    // Get last shoppingcartid from database
                    //====================================================================================
                    String lastshoppingcartID = "";
                    query = "SELECT TOP (1) ShoppingCartItemId FROM ShoppingCartItem ORDER BY ShoppingCartItemId DESC";
                    cmd.Connection = sqlcon;
                    cmd.CommandText = query;
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lastshoppingcartID = dr[0].ToString();
                    }
                    dr.Close();
                    lblResult.Text = "1) id = "+ lastshoppingcartID;
                    if (lastshoppingcartID == null || lastshoppingcartID == "")
                    {
                        lastshoppingcartID = "1";
                    }
                    else
                    {
                       // lastshoppingcartID = getNextId(lastshoppingcartID);
                        int nextId = Convert.ToInt32(lastshoppingcartID) + 1;;
                        lastshoppingcartID = nextId.ToString();
                    }
                    lblResult.Text += "-----3) id = " + lastshoppingcartID;
                    //====================================================================================
                    //insert prodcut details into TempShoppingCartItem table
                    //====================================================================================
                    query = "INSERT INTO ShoppingCartItem (ShoppingCartItemId,CustomerId,ProductId,ProductCategoryId,ProductName,Quantity,Price,SubTotalPrice,Date) values('" + lastshoppingcartID + "','" + CustomerId + "','" + productId + "','" + productCategoryId + "','" + productName + "','" + qty + "','" + productPrice + "','" + subTotalPrice + "','')";
                    //query = "INSERT INTO ShoppingCartItem (ShoppingCartItemId,CustomerId,ProductId,ProductCategoryId,ProductName,Quantity,Price,ShippingCharge,SubTotalPrice) values('S01','ss','1','12','abc','1','250','10','300')";
                    cmd.CommandText = query;
                    cmd.ExecuteNonQuery();

                    //====================================================================================
                    //close connection
                    //====================================================================================
                    cmd.Connection.Close();

                    //====================================================================================
                    // Redirect to ShoppingCart.aspx to view cart.
                    //====================================================================================
                    Response.Redirect("~/ShoppingCart.aspx?ProductID=" + productId + "&ProductCategoryID=" + productCategoryId);
            
                }
                catch (Exception err)
                {
                    lblResult.Text = err.Message;
                }
                finally
                {
                    if (sqlcon.State == ConnectionState.Open)
                    {
                        sqlcon.Close();
                    }
                }
            }
        }

        String getNextId(String previousId)
        {
            String prefix = previousId.Substring(0, 1);
            int idNumber = Convert.ToInt32(previousId.Substring(1));
            
            lblResult.Text += "-------2.1) prefix = " + prefix + "--------idNumber = " + idNumber;
            idNumber += 1;
            lblResult.Text += "------2.2) now idNumber = " + idNumber;
                               
            return prefix + idNumber;
        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string CommandName = btn.CommandName;
            string CommandArgument = btn.CommandArgument;
            String productId = CommandArgument;
            Response.Redirect("~/ProductDetails.aspx?ProductID=" + productId + "&ProductCategoryID=" + productCategoryId);
         }
    }
}