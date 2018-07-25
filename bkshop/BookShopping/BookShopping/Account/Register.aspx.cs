using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace BookShopping.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            lblResult.Visible = false;
        }

        String getNextId(String previousId)
        {
            String prefix = previousId.Substring(0, 2);
            int idNumber = Convert.ToInt32(previousId.Substring(2));
            idNumber += 1;
            return prefix + idNumber;
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String lastCustomerID = "";

            //1. Create Connection
            SqlConnection sqlCon = new SqlConnection();
            //2.open your connection string and initiallize with connection object
            sqlCon.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;

            SqlCommand cmd;
            //====================================================================================
            // Get last orderid from database
            //====================================================================================
            cmd = new SqlCommand("SELECT TOP (1) CustomerId FROM Customer ORDER BY CustomerId DESC", sqlCon);
            try
            { 
                sqlCon.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lastCustomerID = dr[0].ToString();               
                }             
                dr.Close();

                if (lastCustomerID == null || lastCustomerID == "")
                {
                   // lastCustomerID = "C01";
                    lastCustomerID = "1";
                }
                else {
                    //lastCustomerID = getNextId(lastCustomerID);
                    int nextId = Convert.ToInt32(lastCustomerID) + 1; ;
                    lastCustomerID = nextId.ToString();
                }


                String query = "INSERT INTO Customer(CustomerId,FirstName,LastName,PhoneNo,Address,State,City,Zipcode,EmailId,Password,SecurityQuestion,Answer) values('" + lastCustomerID + "','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtPhoneNo.Text + "','" + txtAddress.Text + "','" + DropDownStateList.SelectedItem.ToString() + "','" + DropDownCityList.SelectedItem.ToString() + "','" + txtZipcode.Text + "','" + txtEmailId.Text + "','" + txtPassword.Text + "','" + DropDownQuestionList.SelectedItem.ToString() + "','" + txtAnswer.Text + "')";
                SqlCommand cmd1 = new SqlCommand(query, sqlCon);

                int insertSuccess = cmd1.ExecuteNonQuery();
                sqlCon.Close();
                //    string script = @"<script language=""javascript"">alert('Congrats!! You registered Successfully.'); </script>;";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Register", script);
                lblResult.Text = lastCustomerID + txtFirstName.Text + "--" + txtLastName.Text + "--" + txtPhoneNo.Text + "--" + txtAddress.Text + "--" + DropDownStateList.SelectedItem.ToString() + "--" + DropDownCityList.SelectedItem.ToString() + "--" + txtZipcode.Text;
                if (insertSuccess != 0)
                {
                   String name = txtFirstName.Text + " " + txtLastName.Text;
                    Session["CustomerId"]   = lastCustomerID;
                    Session["EmailId"]      = txtEmailId.Text ;
                    Session["Name"]         = name;

                    Label lblNewUser = (Label)Master.FindControl("lblNewUser");
                    HyperLink hlRegister = (HyperLink)Master.FindControl("hlRegister");
                    HyperLink hlForgot = (HyperLink)Master.FindControl("hlForgot");

                    lblNewUser.Visible = false;
                    hlRegister.Visible = false;
                    hlForgot.Visible = false;
                    FormsAuthentication.SetAuthCookie(name, true);

                    String msg = "alert('Congrats!! You are registered on our site successfully!!')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                    Response.Redirect("~/Home.aspx");
                }
                else { 
                    //show error
                    lblResult.Text = "insert failed";
                    String msg = "alert('Sorry, Something wrong happened. Please try again later.')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                }
                
            }
            catch (Exception error)
            {
                //   MsgBox.Show("Error: "+error);
                //      log.Write( "Error: "+error.Message  + error.StackTrace );
                lblResult.Text = "Error: " + error.Message + error.StackTrace;
            }
            finally {
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCon.Close();
                }
            }
         }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFirstName.Text                               = "";
            txtLastName.Text                                = "";
            txtLastName.Text                                = "";
            txtAddress.Text                                 = "";
            DropDownStateList.SelectedItem.Text = "";
            DropDownCityList.SelectedItem.Text = "";
            txtZipcode.Text                                 = "";
           
            txtEmailId.Text                                 = "";
            txtPassword.Text                                = "";            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void DropDownStateList_SelectedIndexChanged(object sender, EventArgs e)
        {

            
            if (DropDownStateList.SelectedItem.Text == "Andra Pradesh") {
                DropDownCityList.Items.Add("Agra");
                DropDownCityList.Items.Add("Ahmedpur");
                DropDownCityList.Items.Add("Ahmedabad");
                DropDownCityList.Items.Add("Ahmednagar");
            }
            else if (DropDownStateList.SelectedItem.Text == "Arunachal Pradesh")
            {
                DropDownCityList.Items.Add("Ajra");
                DropDownCityList.Items.Add("Akot");
                DropDownCityList.Items.Add("Alibag");
            }
            else if (DropDownStateList.SelectedItem.Text == "Assam")
            {
                DropDownCityList.Items.Add("Alur");
                DropDownCityList.Items.Add("Ashok Nagar");
            }
            else if (DropDownStateList.SelectedItem.Text == "Bihar")
            {
                DropDownCityList.Items.Add("Babaleshwar");
                DropDownCityList.Items.Add("Balasore");
                DropDownCityList.Items.Add("Baleshwar");
            }
            else if (DropDownStateList.SelectedItem.Text == "Chhattisgarh")
            {
                DropDownCityList.Items.Add("Bhopal");
                DropDownCityList.Items.Add("Bhuj");
                DropDownCityList.Items.Add("Brahmapur");
            }
            else if (DropDownStateList.SelectedItem.Text == "Goa")
            {
                DropDownCityList.Items.Add("Byasanagar");
                DropDownCityList.Items.Add("Chandil");
                DropDownCityList.Items.Add("Chatra");
            }
            else if (DropDownStateList.SelectedItem.Text == "Gujarat")
            {
                DropDownCityList.Items.Add("Chandrapur");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Haryana")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Himachal Pradesh")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");

            }
            else if (DropDownStateList.SelectedItem.Text == "Jammu and Kashmir")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Jharkhand")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Karnataka")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Kerala")
            {
                DropDownCityList.Items.Add("Chennai");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");

            }
            else if (DropDownStateList.SelectedItem.Text == "Madya Pradesh")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Maharashtra")
            {
                DropDownCityList.Items.Add("Baramati");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Meghalaya")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Orissa")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Punjab")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Rajasthan")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Delhi")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
            else if (DropDownStateList.SelectedItem.Text == "Chandigarh")
            {
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
                DropDownCityList.Items.Add("");
            }
        }

        protected void DropDownCityList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownQuestionList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    

      
     }
}
