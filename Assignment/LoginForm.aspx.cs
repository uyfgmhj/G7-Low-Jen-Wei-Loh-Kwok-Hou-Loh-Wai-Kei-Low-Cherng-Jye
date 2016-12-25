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
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection conMember;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Username"] = String.Empty;
            }

        }

        protected void login(object sender, EventArgs e)
        {
            createConnection();
            Session["Username"] = Login1.UserName;
            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select * From Member Where Username = @Username";
            cmdSelect = new SqlCommand(strSelect, conMember);
            cmdSelect.Parameters.AddWithValue("@Username", Login1.UserName);

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                if (dtr.Read())
                {
                    Session["MemberID"] = dtr["MemberID"].ToString();
                }

            }
            conMember.Close();
            dtr.Close();
            if (Roles.IsUserInRole(Login1.UserName, "admin"))
            {
                HttpContext.Current.Response.Redirect("~/Maintenance/CreateNewDriver.aspx");
            }
            else 
            {
                HttpContext.Current.Response.Redirect("~/Booking/BookingForm.aspx");
            }
        }
        public void createConnection() {
            string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conMember = new SqlConnection(connStr);
            conMember.Open();
        }
    }
}