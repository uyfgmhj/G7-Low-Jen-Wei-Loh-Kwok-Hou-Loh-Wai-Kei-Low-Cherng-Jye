using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class PersonalForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection conMember;
            string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conMember = new SqlConnection(connStr);
            conMember.Open();


            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select * From Member Where Username = @Username";
            cmdSelect = new SqlCommand(strSelect, conMember);
            cmdSelect.Parameters.AddWithValue("@Username", Session["Username"].ToString());


            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();


            if (dtr.HasRows)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                       "successAlert('Success','Customer ID retrieved!');", true);

                while (dtr.Read())
                {

                    lblName.Text = dtr["Name"].ToString();
                    lblGender.Text = dtr["Gender"].ToString();
                    lblIC.Text = dtr["ICNumber"].ToString();
                    lblEmail.Text = dtr["email"].ToString();
                    lblContact.Text = dtr["ContactNumber"].ToString();
                    lblAddress.Text = dtr["Address"].ToString();
                    lblDOB.Text = Convert.ToDateTime(dtr["DOB"]).ToString("dd/MM/yyyy");
                }

            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                       "errorAlert('Please fix these error','Customer ID does not existed');", true);


            conMember.Close();
            dtr.Close();
        }

        protected void btnSetting_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/Member/UpdatePersonalForm.aspx");
        }
    }
}