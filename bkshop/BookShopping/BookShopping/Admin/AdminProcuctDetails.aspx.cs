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
    public partial class AdminProcuctDetails : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String ProductId, AdminId;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductId = Request.QueryString.Get("ProductID");
            AdminId = (string)Session["AdminId"];
            if (!IsPostBack)
            {
                if (AdminId == null || AdminId == "")
                {
                    Response.Redirect("~/Account/AdminLogin.aspx");
                }
                else
                {
                    DropDownRateList.DataBind();
                    DropDownLanguageList.DataBind();
                    bindYearListDropDownList();
                    bindCategoryDropDownList();
                    if (ProductId == "-1")
                    {
                        // Add new book

                        btnEdit.Visible = false;
                        btnUpdate.Visible = true;
                        btnCancel.Visible = true;

                        btnUpdate.Text = "Add";

                        getNextProdcutId();
                    }
                    else
                    {
                        loadProductDetails();
                        btnEdit.Visible = true;
                        btnUpdate.Visible = false;
                        btnCancel.Visible = false;
                    }
                    txtCategoryId.Text = DropDownCategoryList.SelectedValue;
                }
            }                      
        }
        void bindYearListDropDownList()
        {
            for (int index = 1960; index <= 2014; index++)
            {
                DropDownYearList.Items.Add(index.ToString());
            }
            DropDownYearList.DataBind();
        }
        void bindCategoryDropDownList()
        {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT CategoryId,CategoryName FROM Categories", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem item   = new ListItem();
                    item.Value      = dr[0].ToString();
                    item.Text       = dr[1].ToString();                    
                    DropDownCategoryList.Items.Add(item);                           
                }
                dr.Close();
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

            DropDownCategoryList.DataBind();
        }

        String getNextId(String previousId)
        {
            String prefix = previousId.Substring(0, 1);
            int idNumber = Convert.ToInt32(previousId.Substring(1));
            idNumber += 1;
            return prefix + idNumber;
        }
        void getNextProdcutId(){
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            String query;
            SqlCommand cmd;
            //====================================================================================
            // Get last ProductId from database
            //====================================================================================
            String lastProductID = "";
            query = "SELECT TOP (1) ProductId FROM ProductList ORDER BY ProductId DESC";
            lblResult.Text = query;
            cmd = new SqlCommand(query, sqlCon);
            try
            {
                sqlCon.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lastProductID = dr[0].ToString();
                }
                dr.Close();

                if (lastProductID == null || lastProductID == "")
                {
                    lastProductID = "P01";
                }
                else
                {
                    lastProductID = getNextId(lastProductID);
                   //int nextId = Convert.ToInt32(lastProductID) + 1; 
                   // ProductId = nextId;
                }
                txtProductId.Text = lastProductID;
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
        void loadProductDetails()
        {
            txtProductId.Text = ProductId;
            String CategoryId = "";
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT CategoryId,ProductName,Price,AuthorName,Language,BookDescription,PublicationYear,PathToIcon,Rate FROM ProductList WHERE ProductId = '" + ProductId + "'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // lblResult.Text = "Able to read : " + dr[0].ToString() + "--" + dr[1].ToString() + "--" + dr[2].ToString() + "--" + dr[3].ToString() + "--" + dr[4].ToString() + "--" + dr[5].ToString() + "--" + dr[6].ToString();
                    CategoryId = dr[0].ToString();
                    txtCategoryId.Text = CategoryId;
                    DropDownCategoryList.Items.FindByValue(CategoryId).Selected = true;
                    txtProductName.Text = dr[1].ToString();
                    txtPrice.Text       = dr[2].ToString();
                    txtAuthorName.Text  = dr[3].ToString();
                    DropDownLanguageList.Items.FindByValue(dr[4].ToString()).Selected = true;
                    txtBookDescription.Text = dr[5].ToString();
                    DropDownYearList.Items.FindByValue(dr[6].ToString()).Selected = true;
                    imgBook.ImageUrl = dr[7].ToString();
                    DropDownRateList.Items.FindByValue(dr[8].ToString()).Selected = true;                     
                }
                else
                {
                    //  lblResult.Text = "Not able to read";
                }
                dr.Close(); 
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            String query;
            SqlCommand cmd;           
                        
            if (ProductId == "-1")
            {
                // Add new book
                query = "INSERT INTO ProductList (ProductId,CategoryId,ProductName,Price,AuthorName,Language,BookDescription,PublicationYear,PathToIcon,Rate) VALUES('" + txtProductId.Text + "','" + DropDownCategoryList.SelectedValue.ToString() + "','" + txtProductName.Text + "','" + txtPrice.Text + "','" + txtAuthorName.Text + "','" + DropDownLanguageList.SelectedValue.ToString() + "','" + txtBookDescription.Text + "','" + DropDownYearList.SelectedValue.ToString() + "','" + imgBook.ImageUrl.ToString() + "','" + DropDownRateList.SelectedValue.ToString() + "')";
                    
            }
            else
            {
               //  update book details
              //  CategoryId,ProductName,Price,AuthorName,Language,BookDescription,PublicationYear,PathToIcon,Rate
                query = "UPDATE ProductList SET CategoryId ='" + DropDownCategoryList.SelectedValue.ToString() + "',ProductName='" + txtProductName.Text + "',Price='" + txtPrice.Text + "',AuthorName='" + txtAuthorName.Text + "',Language='" +  DropDownLanguageList.SelectedValue.ToString() + "',BookDescription='" + txtBookDescription.Text + "',PublicationYear='" + DropDownYearList.SelectedValue.ToString() + "',PathToIcon='" + imgBook.ImageUrl.ToString() + "',Rate='" + DropDownRateList.SelectedValue.ToString() + "' WHERE ProductId = '" + ProductId + "'";
            }

            lblResult.Text = query;
           
            try
            {
                sqlCon.Open();
                cmd = new SqlCommand(query, sqlCon);                
                int success = cmd.ExecuteNonQuery();
                sqlCon.Close();
                if (success != 0)
                {
                    String msg = "alert('Yours details updated successfully!!!')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                  //  lblResult.Text = "update success";
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            enableControls(true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (ProductId == "-1")
            {
                // Add new book
                Response.Redirect("~/Admin/AdminHome.aspx");
            }
            else
            {
                enableControls(false);
            }
        }

        void enableControls(Boolean show)
        {

            btnEdit.Visible = !show;
            btnUpdate.Visible = show;
            btnCancel.Visible = show;

            btnUploadImage.Enabled = show;

            DropDownCategoryList.Enabled = show;
            txtProductName.Enabled = show;
            txtPrice.Enabled = show;
            txtAuthorName.Enabled = show;
            DropDownLanguageList.Enabled = show;
            txtBookDescription.Enabled = show;
            DropDownYearList.Enabled = show;
            DropDownRateList.Enabled = show;         

        }

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                String filePath = "~/Imageresources/";
                if (DropDownCategoryList.SelectedValue.ToString() == "C01")
                    filePath += "Educational/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C02")
                    filePath += "Childrenbooks/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C03")
                    filePath += "Comics_Graphics/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C04")
                    filePath += "Computer_Internet/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C05")
                    filePath += "Cookerypics/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C06")
                    filePath += "Festival_Holidays/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C07")
                    filePath += "Healthpics/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C08")
                    filePath += "Religious/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C09")
                    filePath += "Sports_Activities/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C10")
                    filePath += "Thrillers/";
                else if (DropDownCategoryList.SelectedValue.ToString() == "C11")
                    filePath += "Entetainment/";                
                try
                {                    
                    FileUpload1.SaveAs(Server.MapPath(filePath) + FileUpload1.FileName);
                    lblResult.Text = "Upload status: File uploaded!";
                    imgBook.ImageUrl = filePath + FileUpload1.FileName;
                }
                catch (Exception ex)
                {
                    lblResult.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
                
            }                                
        }

        protected void DropDownCategoryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCategoryId.Text = DropDownCategoryList.SelectedValue;
        }
    }
}