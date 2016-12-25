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
    public partial class OnlineReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFrom.Text = Request.QueryString["from"];
            lblTo.Text = Request.QueryString["to"];
            lblPrice.Text = Request.QueryString["price"];
            lblPlateNumber.Text = Session["plateNumber"].ToString();
            lblDriverName.Text = Session["driverName"].ToString();
            lblWaitingTime.Text = Session["duration"].ToString();

            SqlConnection conReceipt;
            string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conReceipt = new SqlConnection(connStr);
            conReceipt.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select * From Payment Where BookingID = @BookingID";
            cmdSelect = new SqlCommand(strSelect, conReceipt);
            cmdSelect.Parameters.AddWithValue("@BookingID", Session["BookingId"].ToString());

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            if(dtr.HasRows)
            {
                if (dtr.Read())
                {
                    lblPaymentDate.Text = dtr["PaymentDate"].ToString();
                    lblPaymentTime.Text = dtr["PaymentTime"].ToString();
                    lblTotalAmount.Text = dtr["TotalAmount"].ToString();
                }
            }

            conReceipt.Close();
            dtr.Close();
        }
    }
}