using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAssignment
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //sendMail();
            //sendPromo();
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Session["Username"] = String.Empty;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
        private void sendMail()
        {
            ArrayList emailList = new ArrayList();
            ArrayList timeList = new ArrayList();
            SqlConnection conDB;
            string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conDB = new SqlConnection(connStr);
            conDB.Open();

            string strRetrieve;
            SqlCommand cmdRetrieve;
            strRetrieve = "Select DISTINCT BookingDate From Booking";
            cmdRetrieve = new SqlCommand(strRetrieve, conDB);
            SqlDataReader dtr;
            dtr = cmdRetrieve.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {

                    timeList.Add(dtr.GetString(0));
                }
            }
            conDB.Close();
            strRetrieve = "Select DISTINCT Member.email From Booking, Member Where Booking.BookingDate = @BookDate AND Booking.MemberID = Member.MemberID";
            foreach (Object obj in timeList)
            {
                DateTime str= Convert.ToDateTime((String)obj);
                String date = str.ToShortDateString();
                //String timeStr = str.AddMinutes(-15).ToShortTimeString(); (15 minutes before booking time)
                if (DateTime.Now.ToShortDateString() == date)
                //if (DateTime.Now.ToShortDateString() == date && DateTime.Now.ToShortTimeString() == timeStr ) (Check date and time)
                {
                    conDB = new SqlConnection(connStr);
                    conDB.Open();
                    cmdRetrieve = new SqlCommand(strRetrieve, conDB);
                    cmdRetrieve.Parameters.AddWithValue("@BookDate", (String)obj);
                    dtr = cmdRetrieve.ExecuteReader();
                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            string from = "taximanagementsystemg7@gmail.com";
                            string to = dtr.GetString(0);

                            MailMessage mail = new MailMessage(from, to);
                            SmtpClient client = new SmtpClient();

                            mail.Subject = "Taxi Notification";
                            mail.Body = "Your taxi will be arriving in around 15 minutes.";


                            client.Host = "smtp.gmail.com";
                            client.Port = 587;
                            client.EnableSsl = true;
                            client.Credentials = new System.Net.NetworkCredential("taximanagementsystemg7@gmail.com", "taxig7123");
                            client.Send(mail);
                        }
                    }
                    conDB.Close();
                }
           }

        }
        private void sendPromo()
        {
            ArrayList emailList = new ArrayList();
            SqlConnection conDB;
            string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conDB = new SqlConnection(connStr);
            conDB.Open();

            string strRetrieve;
            SqlCommand cmdRetrieve;
            strRetrieve = "Select email From Member";
            cmdRetrieve = new SqlCommand(strRetrieve, conDB);
            SqlDataReader dtr;
            dtr = cmdRetrieve.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    emailList.Add(dtr.GetString(0));
                }
            }

            conDB.Close();
            conDB.Open();
            strRetrieve = "Select * From Promotion";
            cmdRetrieve = new SqlCommand(strRetrieve, conDB);
            dtr = cmdRetrieve.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    //Promo start date
                    String promoDate = dtr.GetString(3);
                    String now = DateTime.Now.ToShortDateString();
                    if (now == promoDate)
                    {
                        foreach (Object obj in emailList)
                        {
                            string from = "taximanagementsystemg7@gmail.com";
                            //email
                            string to = (String)obj;

                            MailMessage mail = new MailMessage(from, to);
                            SmtpClient client = new SmtpClient();

                            mail.Subject = "New Promotion Offered!";
                            mail.Body = "The following promotion has been offered to you!<br />" +
                                        dtr.GetString(1) + "<br />" + dtr.GetString(2) + "<br />" +
                                        "The promotion will be valid from: " + dtr.GetString(3) + " to " + dtr.GetString(4)+ ".";

                            client.Host = "smtp.gmail.com";
                            client.Port = 587;
                            client.EnableSsl = true;
                            client.Credentials = new System.Net.NetworkCredential("taximanagementsystemg7@gmail.com", "taxig7123");

                            client.Send(mail);
                        }
                    }
                }
            }

            conDB.Close();

        }
    }
}