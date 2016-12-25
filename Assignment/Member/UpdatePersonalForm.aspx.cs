using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;


namespace Assignment
{
    public partial class UpdatePersonalForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            if (txtContactNumber.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                          "errorAlert('Please fix these error','Contact Number is required for updating personal information!');", true);
            }
            else if (txtAddress.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                          "errorAlert('Please fix these error','Address is required for updating personal information!);", true);
            }
            else
            {
                SqlConnection conMember;
                string connStr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                conMember = new SqlConnection(connStr);
                conMember.Open();


                string strUpdate;
                SqlCommand cmdUpdate;
                strUpdate = "Update Member Set ContactNumber = @ContactNumber , Address = @Address Where Username = @Username";

                cmdUpdate = new SqlCommand(strUpdate, conMember);

                cmdUpdate.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text);
                cmdUpdate.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmdUpdate.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                int n = cmdUpdate.ExecuteNonQuery();

                if (n > 0)
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                   "successAlert('Success','Member details update successful!');", true);
                else
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script",
                              "errorAlert('Error','Update failed.');", true);

                conMember.Close();
            }
        }

        //protected void btnChange_Click(object sender, EventArgs e)
        //{
        //    //MembershipUser user = Membership.GetUser(Session["Username"].ToString());
        //    //string password = user.GetPassword();

        //    //if (txtNewPassword.Text.Equals(""))
        //    //{
        //    //    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
        //    //                 "err_msg",
        //    //                 "alert('New Password is required for updating personal information!');",
        //    //                 true);
        //    //}
        //    //else if (txtConfirmPassword.Text.Equals(""))
        //    //{
        //    //    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
        //    //                 "err_msg",
        //    //                 "alert('Confirm New Password is required for updating personal information!');",
        //    //                 true);
        //    //}
        //    //else
        //    //{
        //    //    try
        //    //    {
        //    //        user.ChangePassword(password, txtNewPassword.Text);
        //    //        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
        //    //                 "err_msg",
        //    //                 "alert('Password change successful!');",
        //    //                 true);
        //    //    }
        //    //    catch (Exception)
        //    //    {
        //    //        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
        //    //                 "err_msg",
        //    //                 "alert('Old Password does not match with Original Password');",
        //    //                 true);
        //    //    }

        //    //}
        //}

        protected void ChangePassword2_ContinueButtonClick(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/UpdatePersonalForm.aspx");
        }
    }
}