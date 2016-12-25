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
    public partial class RegisterForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(txtusername.Text);
            string username = Membership.GetUserNameByEmail(txtEmail.Text);

            if (user != null)
            {
                txtusername.Text = "";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','Username has been used','" + txtusername.ClientID + "');", true);
            }
            else if (username != null)
            {
                txtEmail.Text = "";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                    "errorAlert('Please fix these error','e-mail has been used','" + txtEmail.ClientID + "');", true);
            }
            else
            {
                Membership.CreateUser(txtusername.Text, txtPassword.Text, txtEmail.Text);
                Roles.AddUserToRole(txtusername.Text, "user");


                SqlConnection conMember;
                string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                conMember = new SqlConnection(connStr);
                conMember.Open();


                string strInsert;
                SqlCommand cmdInsert;
                strInsert = "Insert Into Member (Name, email, Gender, ContactNumber, ICNumber, DOB, Address, Username ) Values (@Name, @email, @Gender, @ContactNumber, @ICNumber, @DOB, @Address, @Username )";

                cmdInsert = new SqlCommand(strInsert, conMember);

                cmdInsert.Parameters.AddWithValue("@Name", txtName.Text);
                cmdInsert.Parameters.AddWithValue("@email", txtEmail.Text);
                cmdInsert.Parameters.AddWithValue("@Gender", rbtnGender.SelectedItem.ToString());
                cmdInsert.Parameters.AddWithValue("@ContactNumber", txtContact.Text);
                cmdInsert.Parameters.AddWithValue("@ICNumber", txtIC.Text);
                cmdInsert.Parameters.AddWithValue("@DOB", calDOB.SelectedDate);
                cmdInsert.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmdInsert.Parameters.AddWithValue("@Username", txtusername.Text);

                int n = cmdInsert.ExecuteNonQuery();

                if (n > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                   "successAlert('Success','New member added!','LoginForm.aspx');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                        "errorAlert('Error','Sorry, insertion failed.');", true);
                }
                conMember.Close();
            }
        }
    }
}