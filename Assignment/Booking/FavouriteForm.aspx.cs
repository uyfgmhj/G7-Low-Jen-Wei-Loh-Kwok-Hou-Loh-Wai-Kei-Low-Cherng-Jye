using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Map
{
    public partial class FavouriteForm : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnDeleteAll_Click(object sender, EventArgs e)
        {
            createConnection(); 
            string strDelete;
            SqlCommand cmdDelete;
            strDelete = "Delete from Favourites where MemberID=@memberId";
            cmdDelete = new SqlCommand(strDelete, conn);
            cmdDelete.Parameters.AddWithValue("@memberId", Session["MemberID"].ToString());
            int n = cmdDelete.ExecuteNonQuery();
            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "jAlert('success', 'Delete All Successful.', 'Success', 'FavouriteForm.aspx',null);", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "jAlert('error', 'Delete All Failed.', 'Error', null,null);", true);
            }
            conn.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            createConnection();
            string strDelete;
            SqlCommand cmdDelete;
            strDelete = "Delete from Favourites where FavouriteId=@Id";
            cmdDelete = new SqlCommand(strDelete, conn);
            cmdDelete.Parameters.AddWithValue("@Id", favouriteId.Text);
            int n = cmdDelete.ExecuteNonQuery();
            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "jAlert('success', 'Delete Successful.', 'Success', 'FavouriteForm.aspx',null);", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "jAlert('error', 'Delete Failed.', 'Error', null,null);", true);
            }
            conn.Close();
        }

        protected void btnAddFavourite_Click(object sender, EventArgs e)
        {
            createConnection();
            string strAdd = "Insert into Favourites (FavouriteName,FavouriteAddress,MemberID,PlaceId) values (@favouriteName,@favouriteAddress,@memberId,@placeId)";
            SqlCommand cmdAdd = new SqlCommand(strAdd, conn);
            cmdAdd.Parameters.AddWithValue("@favouriteName", name.Text);
            cmdAdd.Parameters.AddWithValue("@favouriteAddress", address.Text);
            cmdAdd.Parameters.AddWithValue("@memberID", Session["MemberID"].ToString());
            cmdAdd.Parameters.AddWithValue("@placeId", placeId.Text);
            int n = cmdAdd.ExecuteNonQuery();
            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "jAlert('success', 'Add Successful.', 'Success', 'FavouriteForm.aspx',null);", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "jAlert('error', 'Add Failed.', 'Error', null,null);", true);
            }
            conn.Close(); 
        }
        public void createConnection() {
            string strCon = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            conn = new SqlConnection(strCon);
            conn.Open();
        }
    }
}