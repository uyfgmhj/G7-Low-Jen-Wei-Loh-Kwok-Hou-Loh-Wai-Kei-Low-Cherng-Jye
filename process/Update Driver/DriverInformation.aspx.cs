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
    public partial class DriverInformation : System.Web.UI.Page
    {
        string id = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            updateDriverDetails.Visible = false;
            updateDriverDetails2.Visible = false;
            updateDriverDetails3.Visible = false;
        }
        protected void UpdateDriver_Click(object sender, EventArgs e)
        {
            if (txtNewContact.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Contact Number is required for updating driver information!');", true);
            }
            else if (txtNewLicence.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','New expiry date is required for updating driver information!');", true);
            }
            else if (txtNewTaxiCompany.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','New Taxi Company is required for updating driver information!');", true);
            }
            else
            {
                SqlConnection conDriver;
                string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                conDriver = new SqlConnection(connStr);
                conDriver.Open();


                string strUpdate;
                SqlCommand cmdUpdate;
                strUpdate = "Update [Driver] Set PhoneNumber = @DriverContact , ExpiredLicence = @ExpiredLicence , TaxiCompany = @TaxiCompany Where DriverId = @DriverId";

                cmdUpdate = new SqlCommand(strUpdate, conDriver);

                cmdUpdate.Parameters.AddWithValue("@DriverContact", txtNewContact.Text);
                cmdUpdate.Parameters.AddWithValue("@ExpiredLicence", txtNewLicence.Text);
                cmdUpdate.Parameters.AddWithValue("@TaxiCompany", txtNewTaxiCompany.Text);
                cmdUpdate.Parameters.AddWithValue("@DriverId", GridView1.SelectedRow.Cells[1].Text);

                int n = cmdUpdate.ExecuteNonQuery();

                if (n > 0)
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                        "successAlert('Success','Driver details update successful!','DriverInformation.aspx');", true);
                else
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                        "errorAlert('Error','Update failed.','DriverInformation.aspx');", true);
                conDriver.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            id = row.Cells[1].Text;
            SqlConnection connDriver;
            string strConn = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            connDriver = new SqlConnection(strConn);
            connDriver.Open();

            string strSelect = "Select DriverName from [Driver] where DriverId = @DriverId";
            SqlCommand cmdSelect = new SqlCommand(strSelect, connDriver);
            cmdSelect.Parameters.AddWithValue("@DriverId", id);
            SqlDataReader dtr = cmdSelect.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    txtNewDriverName.Text = dtr["DriverName"].ToString();
                }
            }
            updateDriverDetails.Visible = true;
            updateDriverDetails2.Visible = true;
            updateDriverDetails3.Visible = true;
            dtr.Close();
            connDriver.Close();
        }
    }
}