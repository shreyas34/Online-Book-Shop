 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.IO;
using System.Data.SqlClient;

namespace BookShopping
{
    public partial class FeedBack : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;            
            SqlCommand cmd;
            try
            {
                sqlCon.Open();
                String query = "INSERT INTO FeedBack(CustomerName,EmailId,Comments) VALUES('" + txtName.Text + "','" + txtEmailId.Text + "','" + txtComments.Text + "')";
                cmd = new SqlCommand(query, sqlCon);
                lblResult.Text = query;
                int insertSuccess = cmd.ExecuteNonQuery();
                if (insertSuccess != 0)
                {
                    String msg = "alert('Thanks for FeedBack!!!')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "error", msg, true);
                    lblResult.Text = "insert success";
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

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmailId.Text = "";
            txtComments.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

  

        

     
    }
}

