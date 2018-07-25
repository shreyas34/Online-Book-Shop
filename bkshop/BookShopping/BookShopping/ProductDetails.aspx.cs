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
    public partial class ProductDetails : System.Web.UI.Page
    {
        String productCategoryId;
        String productId;
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            productId = Request.QueryString.Get("ProductID");
            productCategoryId = Request.QueryString.Get("ProductCategoryID");
          
            if (!IsPostBack)
            {
                btnDescription.CssClass = "brownbtn";
                btnReview.CssClass = "graybtn";
                MultiView1.ActiveViewIndex = 0;
                loadProductDetails();
                loadReviewList();
                
            }
        }

        protected void btnDescription_Click(object sender, EventArgs e)
        {
            btnDescription.CssClass = "brownbtn";
            btnReview.CssClass = "graybtn";
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            btnDescription.CssClass = "graybtn";
            btnReview.CssClass = "brownbtn";            
            MultiView1.ActiveViewIndex = 1;
        }

        protected void loadProductDetails()
        {
            SqlConnection sqlcon = new SqlConnection();
            sqlcon.ConnectionString = sqlConnectionString;
                       
            String query;
            if (productId == null || productId == "")
            {
                query = "select * from ProductList";
            }
            else
            {
                query = "select * from ProductList where ProductId='" + productId + "'";
            }

            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);   
            DataSet dsvalue = new DataSet();

            try{
                sqlcon.Open();
                adp.Fill(dsvalue, "ProductList");
                sqlcon.Close();

                DetailsView1.DataSource = dsvalue;
                DetailsView1.DataBind();
                imgBook.ImageUrl = dsvalue.Tables[0].Rows[0]["PathToIcon"].ToString();
                txtDescription.Text = dsvalue.Tables[0].Rows[0]["BookDescription"].ToString();
               
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }           
        }
             

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            String CustomerId = (string)Session["CustomerId"];

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

                        qty = Double.Parse(txtQty.Text);
                        subTotalPrice = productPrice * qty;
                        //   txtDescription.Text = "Productname = " + productName + " Price = " + productPrice + " shipping price = " + shippingCharge + "\n Qty = " + qty + "\n total = " + subTotalPrice + "";

                    }
                    else
                    {
                        //    txtDescription.Text = "Data Not found";
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

                    if (lastshoppingcartID == null || lastshoppingcartID == "")
                    {
                        //lastshoppingcartID = "S01";
                        lastshoppingcartID = "1";
                    }
                    else
                    {
                       // lastshoppingcartID = getNextId(lastshoppingcartID);
                        int nextId = Convert.ToInt32(lastshoppingcartID) + 1; ;
                        lastshoppingcartID = nextId.ToString();
                    }

                    //====================================================================================
                    //insert prodcut details into TempShoppingCartItem table
                    //====================================================================================
                    query = "INSERT INTO ShoppingCartItem (ShoppingCartItemId,CustomerId,ProductId,ProductCategoryId,ProductName,Quantity,Price,SubTotalPrice,Date) values('" + lastshoppingcartID + "','" + CustomerId + "','" + productId + "','" + productCategoryId + "','" + productName + "','" + txtQty.Text + "','" + productPrice + "','" + subTotalPrice + "','')";
                    //query = "INSERT INTO ShoppingCartItem (ShoppingCartItemId,CustomerId,ProductId,ProductCategoryId,ProductName,Quantity,Price,ShippingCharge,SubTotalPrice) values('S01','ss','1','12','abc','1','250','10','300')";
                    cmd.CommandText = query;
                    cmd.ExecuteNonQuery();

                    //====================================================================================
                    //clsoe connection
                    //====================================================================================
                    cmd.Connection.Close();

                    //====================================================================================
                    // Redirect to ShoppingCart.aspx to view cart.
                    //====================================================================================
                    Response.Redirect("ShoppingCart.aspx?ProductID=" + productId + "&ProductCategoryID=" + productCategoryId);
                }
                catch (Exception err)
                {
                    txtDescription.Text = err.Message;
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
            String prefix = previousId.Substring(0, 2);
            int idNumber = Convert.ToInt32(previousId.Substring(2));
            idNumber += 1;
            return prefix + idNumber;
        }

        protected void btnSubmitRate_Click(object sender, EventArgs e)
        {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            SqlCommand cmd;
            try
            {
                sqlCon.Open();

                //====================================================================================
                // Get last reviewid from database
                //====================================================================================
                String lastReviewID = "";
                String query = "SELECT TOP (1) ReviewId FROM UserReviews ORDER BY ReviewId DESC";
                cmd = new SqlCommand(query,sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lastReviewID = dr[0].ToString();
                }
                dr.Close();

                if (lastReviewID == null || lastReviewID == "")
                {
                    //lastshoppingcartID = "S01";
                    lastReviewID = "1";
                }
                else
                {
                    // lastshoppingcartID = getNextId(lastshoppingcartID);
                    int nextId = Convert.ToInt32(lastReviewID) + 1; ;
                    lastReviewID = nextId.ToString();
                }

                query = "INSERT INTO UserReviews(ReviewId,UserName,UserRates,UserReview,ProductId,Date) VALUES('" + lastReviewID + "','" + txtUserName.Text + "','" + DropDownRateList.SelectedValue.ToString() + "','" + txtUserReview.Text + "','" + productId + "','" + DateTime.Now.ToString() + "')";
                //String query = "INSERT INTO UserReviews(UserName,UserRates,UserReview) VALUES('kirti','~/Imageresources/Stars/1star.png','Test')";
                
                cmd = new SqlCommand(query, sqlCon);
                lblResult.Text = query;
                int insertSuccess = cmd.ExecuteNonQuery();
                if (insertSuccess != 0)
                {
                    String msg = "alert('Thanks for your review!!!')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                    lblResult.Text = "insert success";
                    loadReviewList();
                    GridView1.DataBind();
                }
                else
                {
                    //show error
                    lblResult.Text = "insert failed";
                }
            }
            catch (Exception error)
            {
                lblResult.Text = "Error: " + error.Message;
                //   MsgBox.Show("Error: "+error);
                //      log.Write( "Error: "+error.Message  + error.StackTrace );
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
        }

        private void loadReviewList()
        {
            SqlConnection sqlcon = new SqlConnection();
            sqlcon.ConnectionString = sqlConnectionString;
            DataTable dt = new DataTable();
            String query = "select * from UserReviews where ProductId='" + productId + "' ORDER BY Date DESC";            

            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            try
            {
                sqlcon.Open();
                int rowsCount = adp.Fill(dt);
                sqlcon.Close();
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (rowsCount == 0)
                {
                    lblReviewResult.Visible = true;
                }
                else {
                    lblReviewResult.Visible = false;
                }
            }
            catch (Exception exp)
            {

            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loadReviewList();            
            GridView1.DataBind();
        }

      }

  }

    








