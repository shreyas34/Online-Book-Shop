using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace BookShopping.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // forgotHyperLink.NavigateUrl = "~/Account/ForgotPassword.aspx" +HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection();
            sqlcon.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;

            string query = "select CustomerId,EmailId, Password,FirstName,LastName from Customer where  EmailId = '" + txtUsername.Text + "' and Password ='" + txtPassword.Text + "'";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataReader reader;

           
                sqlcon.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Customer Exists
                    String CustomerId   = reader[0].ToString();
                    String EmailId      = reader[1].ToString();
                    String Name         = reader[3].ToString() + " " + reader[4].ToString();

                    Session["CustomerId"] = CustomerId;
                    Session["EmailId"] = EmailId;
                    Session["Name"] = Name;


                    Label lblNewUser = (Label)Master.FindControl("lblNewUser");
                    HyperLink hlRegister = (HyperLink)Master.FindControl("hlRegister");
                    HyperLink hlForgot = (HyperLink)Master.FindControl("hlForgot");
                    
                    lblNewUser.Visible = false;
                    hlRegister.Visible = false;
                    hlForgot.Visible = false;

                    FormsAuthentication.SetAuthCookie(Name, true);
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    // New Customer
                    //string script = @"<script language=""javascript"">alert('Are you new Customer? then Please register yourself first!!'); </script>;";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Register", script);
                    Response.Redirect("~/Account/Register.aspx");
                }
                reader.Close();
                sqlcon.Close();   
            }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("~/Account/ForgotPassword.aspx");
        }              
   }
 }          
         
                   
           
                      