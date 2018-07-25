using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace BookShopping
{
    public partial class MyAccount : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        String CustomerId;
        protected void Page_Load(object sender, EventArgs e)
        {
            CustomerId = (string)Session["CustomerId"];
            if(!IsPostBack){
                lblResult.Text = CustomerId;
                enableControls(false);
                if (CustomerId == null || CustomerId == "")
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
                else
                {
                    DropDownList1.DataBind();
                    DropDownList2.DataBind();
                    DropDownQuestionList.DataBind();
                    loadCustomerDetails();
                }
            }
        }
        String getNextId(String previousId)
        {
            String prefix = previousId.Substring(0, 1);
            int idNumber = Convert.ToInt32(previousId.Substring(1));
            idNumber += 1;
            return prefix + idNumber;
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
                String query = "UPDATE Customer SET FirstName ='" + txtFirstName.Text + "',LastName='" + txtLastName.Text + "',PhoneNo='" + txtPhoneNo.Text + "',Address='" + txtAddress.Text + "',State='" + DropDownList1.SelectedItem.ToString() + "',City='" + DropDownList2.SelectedItem.ToString() + "',Zipcode='" + txtZipcode.Text + "', SecurityQuestion ='"+ DropDownQuestionList.SelectedItem.ToString() + "', Answer ='"+ txtAnswer.Text +"' WHERE CustomerId = '" + CustomerId + "'";
                cmd = new SqlCommand(query, sqlCon);
                lblResult.Text = query;
                int updateSuccess = cmd.ExecuteNonQuery();
                sqlCon.Close();
                //    string script = @"<script language=""javascript"">alert('Congrats!! You registered Successfully.'); </script>;";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Register", script);
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            enableControls(true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            enableControls(false);
        }

        void enableControls(Boolean show) {

            btnEdit.Visible = !show;
            btnUpdate.Visible = show;
            btnCancel.Visible = show;

            txtFirstName.Enabled = show;
            txtLastName.Enabled = show;

            txtAddress.Enabled = show;
            txtPhoneNo.Enabled = show;
            DropDownList1.Enabled = show;
            DropDownList2.Enabled = show;
            txtZipcode.Enabled = show;

            DropDownQuestionList.Enabled = show;
            txtAnswer.Enabled = show;
        }

        void loadCustomerDetails() {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT FirstName,LastName,PhoneNo,Address,State,City,Zipcode,SecurityQuestion,Answer FROM Customer WHERE CustomerId = '" + CustomerId + "'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // lblResult.Text = "Able to read : " + dr[0].ToString() + "--" + dr[1].ToString() + "--" + dr[2].ToString() + "--" + dr[3].ToString() + "--" + dr[4].ToString() + "--" + dr[5].ToString() + "--" + dr[6].ToString();
                    txtFirstName.Text = dr[0].ToString();
                    txtLastName.Text = dr[1].ToString();
                    txtPhoneNo.Text = dr[2].ToString();
                    txtAddress.Text = dr[3].ToString();
                    DropDownList1.Items.FindByValue(dr[4].ToString()).Selected = true;
                    DropDownList2.Items.FindByValue(dr[5].ToString()).Selected = true;
                    txtZipcode.Text = dr[6].ToString();
                    DropDownQuestionList.Items.FindByValue(dr[7].ToString()).Selected = true;
                    txtAnswer.Text = dr[8].ToString();
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
        protected void DropDownQuestionList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}