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
    public partial class CreditCardPayment : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFrom.Text = Session["originInput"].ToString();
            lblTo.Text = Session["destinationInput"].ToString();
            lblPrice.Text = Session["cost"].ToString();
            lblTotal.Text = Session["cost"].ToString();
        }
        protected void rblCardType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblCardType.SelectedIndex == 0)
            {
                ExpressionValidatorCardNumber.ValidationExpression = @"[4]\d{1,13}";
            }

            else
                ExpressionValidatorCardNumber.ValidationExpression = @"[5]\d{1,13}";
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {

            
            SqlConnection conPayment;
            string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conPayment = new SqlConnection(connStr);
            conPayment.Open();

            string strInsert;
            SqlCommand cmdInsert;
            strInsert = "Insert into [Payment] (CardType, CardNumber, TotalAmount, PaymentDate, PaymentStatus, PaymentTime, BookingID) Values (@CardType, @CardNumber, @TotalAmount, @PaymentDate, @PaymentStatus, @PaymentTime, @BookingID)";

            cmdInsert = new SqlCommand(strInsert, conPayment);

            cmdInsert.Parameters.AddWithValue("@CardType", rblCardType.SelectedItem.Value);
            cmdInsert.Parameters.AddWithValue("@CardNumber", txtCardNumber.Text);
            cmdInsert.Parameters.AddWithValue("@TotalAmount", Session["cost"].ToString());
            cmdInsert.Parameters.AddWithValue("@PaymentStatus", "Paid");
            cmdInsert.Parameters.AddWithValue("@PaymentDate", DateTime.Now.ToShortDateString());
            cmdInsert.Parameters.AddWithValue("@PaymentTime", DateTime.Now.ToShortTimeString());
            cmdInsert.Parameters.AddWithValue("@BookingID", Session["BookingId"].ToString());

            int n = cmdInsert.ExecuteNonQuery();
            if(n > 0)
            {
                Response.Redirect("OnlineReceipt.aspx?from=" + lblFrom.Text + "&to=" + lblTo.Text + "&price=" + lblPrice.Text + "&total=" + lblTotal.Text);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            createConnection();
            string strDelete;
            SqlCommand cmdDelete;
            strDelete = "Update Booking Set BookingStatus=@bookingStatus where BookingId=@bookingId";
            cmdDelete = new SqlCommand(strDelete, conn);
            cmdDelete.Parameters.AddWithValue("@bookingStatus", "Cancelled");
            cmdDelete.Parameters.AddWithValue("@bookingId",Session["BookingId"].ToString());
            int n = cmdDelete.ExecuteNonQuery();
            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "successAlert('Success','Cancel Successful.','Booking/BookingForm.aspx');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Success','Cancel Failed.');", true);
            }
            conn.Close();
        }

        public void createConnection()
        {
            string strCon = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
        }
    }
}