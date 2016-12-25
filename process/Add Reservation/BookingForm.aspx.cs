using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Xml;
using System.Data;
using System.IO;
using System.Xml.XPath;

namespace Map
{
    public partial class BookingForm : System.Web.UI.Page
    {
        SqlConnection conn;
        DateTime dt;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            TimeSpan span = dt.Subtract(DateTime.Now);
            if (span.Hours >= 2)
            {
                createConnection();
                string strSelect = "SELECT * FROM [Driver] INNER JOIN Taxi ON Driver.DriverID =Taxi.DriverID WHERE DriverStatus ='Available'";
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                SqlDataReader dtr = cmdSelect.ExecuteReader();
                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        getDistance(dtr["Location"].ToString(), origin_input.Value, dtr["DriverID"].ToString());
                    }
                }
                dtr.Close();
                conn.Close();
                SqlDataAdapter da = new SqlDataAdapter(cmdSelect);
                DataSet ds = new DataSet();
                da.Fill(ds);
                driverSelect.DataSource = ds.Tables[0];
                driverSelect.DataBind();
                driverSelect.AllowPaging = true;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "openModal()", true);
            }
            else {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Please fix these error','Booking have to make 2 hours advance');", true);
            }
        }
        protected void ValidateInput(object source, ServerValidateEventArgs args)
        {
            string errMsg = "";
            if (origin_input.Value == string.Empty)
            {
                errMsg = "Origin location is require";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Please fix these error','" + errMsg + "','" + origin_input.ClientID + "');", true);
                args.IsValid = false;
            }
            else if (destination_input.Value == string.Empty)
            {
                errMsg = "Destination location is require";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Please fix these error','" + errMsg + "','" + destination_input.ClientID + "');", true);
                args.IsValid = false;
            }
            else if (datetimepicker4.Value == string.Empty)
            {
                errMsg = "Pick up date and time is require";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Please fix these error','" + errMsg + "');", true);
                args.IsValid = false;
            }
            if (errMsg == string.Empty) { 
                 dt= Convert.ToDateTime(datetimepicker4.Value);
            }
        }
        public void getDistance(string originInput,string destinationInput,string driverId) {
            //Declare variable to store XML result
            string xmlResult = null;

            //Pass request to google api with orgin and destination details
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://maps.googleapis.com/maps/api/distancematrix/xml?origins=" + originInput + "&destinations=" + destinationInput + "&mode=Car&language=us-en&sensor=false");

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            //Get response as stream from httpwebresponse
            StreamReader resStream = new StreamReader(response.GetResponseStream());

            //Create instance for xml document
            XmlDocument doc = new XmlDocument();

            //Load response stream in to xml result
            xmlResult = resStream.ReadToEnd();

            //Load xmlResult variable value into xml documnet
            doc.LoadXml(xmlResult);

            try
            {
                //Get specified element value using select single node method and verify it return OK (success ) or failed
                if (doc.DocumentElement.SelectSingleNode("/DistanceMatrixResponse/row/element/status").InnerText.ToString().ToUpper() != "OK")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Please fix these error','Invalid City Name please try again');", true);
                    return;
                }

                //Get DistanceMatrixResponse element and its values
                XmlNodeList xnList = doc.SelectNodes("/DistanceMatrixResponse");
                foreach (XmlNode xn in xnList)
                {
                    if (xn["status"].InnerText.ToString() == "OK")
                    {
                        createConnection();
                        string strUpdate = "Update Driver set Duration=@duration,Distance=@distance where DriverID=@driverId";
                        SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);
                        cmdUpdate.Parameters.AddWithValue("@duration", doc.DocumentElement.SelectSingleNode("/DistanceMatrixResponse/row/element/duration/text").InnerText);
                        cmdUpdate.Parameters.AddWithValue("@distance", doc.DocumentElement.SelectSingleNode("/DistanceMatrixResponse/row/element/distance/text").InnerText);
                        cmdUpdate.Parameters.AddWithValue("@driverId", driverId);
                        cmdUpdate.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "errorAlert('Please fix these error','Error during processing');", true);
                return;
            }
        }
        public void createConnection(){
            string strConn = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                conn = new SqlConnection(strConn);
                conn.Open();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            Session["originInput"] = origin_input.Value;
            Session["destinationInput"] = destination_input.Value;
            Session["cost"] = travel_cost_txt.Text;
            Session["bookingDate"] = datetimepicker4.Value;

            var lb = (LinkButton)sender;
            var row = (GridViewRow)lb.NamingContainer;
            if (row != null)
            {
                var duration = row.FindControl("lblDuration") as Label;
                var driverName = row.FindControl("lblDriverName") as Label;
                var plateNumber = row.FindControl("lblPlateNumber") as Label;
                if (duration != null && driverName!=null&&plateNumber!=null)
                {
                    Session["duration"] = duration.Text;
                    Session["driverName"] = driverName.Text;
                    Session["plateNumber"] = plateNumber.Text;
                }

            }
            createConnection();
            string strAdd = "Insert into Booking (BookingDate,OriginName,DestinationName,MemberID,BookingStatus,TodayDate) values "
                            + "(@BookingDate,@OriginName,@DestinationName,@MemberID,@bookingStatus,@TodayDate) " 
                            + "Select Scope_Identity()";
            SqlCommand cmdAdd = new SqlCommand(strAdd, conn);
            cmdAdd.Parameters.AddWithValue("@BookingDate", datetimepicker4.Value);
            cmdAdd.Parameters.AddWithValue("@OriginName", origin_input.Value);
            cmdAdd.Parameters.AddWithValue("@DestinationName", destination_input.Value);
            cmdAdd.Parameters.AddWithValue("@MemberID", Session["MemberID"].ToString());
            cmdAdd.Parameters.AddWithValue("@bookingStatus", "Paid");
            cmdAdd.Parameters.AddWithValue("@todayDate", DateTime.Now);
            Session["BookingId"]=cmdAdd.ExecuteScalar().ToString();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "successAlert('Success','Booking Successful','../CreditCardPayment.aspx');", true);
            conn.Close();
        }

    }
}