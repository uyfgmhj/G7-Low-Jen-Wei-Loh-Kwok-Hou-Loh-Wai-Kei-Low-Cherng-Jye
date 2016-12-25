using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class CreateNewDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (txtDriverName.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Name is required');", true);
            }

            else if (txtDriverIC.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','IC Number is required');", true);
            }
            else if (txtDriverEmail.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Email is required');", true);
            }
            else if (txtGender.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Gender is required');", true);
            }
            else if (txtTaxiCompany.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Taxi Company is required');", true);
            }
            else if (txtDriverContact.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Contact Number is required');", true);
            }
            else if (txtDOB.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Date Of Birth is required');", true);
            }
            else if (txtExpiredLicence.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Expiry Date Of Driving Licence is required');", true);
            }
            else
            {
                    SqlConnection conDriver;
                    string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                    conDriver = new SqlConnection(connStr);
                    conDriver.Open();


                    string strInsert;
                    SqlCommand cmdInsert;
                    strInsert = "Insert Into [Driver] (DriverName, DriverEmail, Gender, PhoneNumber, DriverIC, DOB, TaxiCompany, ExpiredLicence, DriverStatus ) Values (@DriverName, @DriverEmail, @Gender, @DriverContact, @DriverIC, @DOB, @TaxiCompany, @ExpiredLicence, 'Available' )";

                    cmdInsert = new SqlCommand(strInsert, conDriver);

                    cmdInsert.Parameters.AddWithValue("@DriverName", txtDriverName.Text);
                    cmdInsert.Parameters.AddWithValue("@DriverEmail", txtDriverEmail.Text);
                    cmdInsert.Parameters.AddWithValue("@Gender", txtGender.Text);
                    cmdInsert.Parameters.AddWithValue("@DriverContact", txtDriverContact.Text);
                    cmdInsert.Parameters.AddWithValue("@DriverIC", txtDriverIC.Text);
                    cmdInsert.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    cmdInsert.Parameters.AddWithValue("@TaxiCompany", txtTaxiCompany.Text);
                    cmdInsert.Parameters.AddWithValue("@ExpiredLicence", txtExpiredLicence.Text);


                    int n = cmdInsert.ExecuteNonQuery();


                    if (n > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                            "successAlert('Success','New driver added!','CreateNewDriver.aspx');", true);
                    }


                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                            "errorAlert('Error','New Driver add failed');", true);
                    }

                    conDriver.Close();
            }

        }
    }
}