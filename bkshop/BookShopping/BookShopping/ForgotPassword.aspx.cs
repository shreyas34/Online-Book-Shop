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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        String sqlConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookShoppingSQL"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = sqlConnectionString;
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT Password FROM Customer WHERE EmailId = '" + txtEmailId.Text + "' AND SecurityQuestion = '" + DropDownQuestionList.SelectedItem.ToString() + "' AND Answer= '" + txtAnswer.Text +"'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    String password = dr[0].ToString();
                    lblResult.Text = "Your Password is " + password;
                }
                else
                {
                    lblResult.Text = "Not able to read";
                }
                dr.Close();
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

        protected void DropDownQuestionList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}