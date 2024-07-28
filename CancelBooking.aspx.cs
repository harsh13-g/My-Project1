using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_CancelBooking : System.Web.UI.Page
{

    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        getcancelbooking();
    }
   public void  getcancelbooking()
   {
       String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
       SqlConnection sql = new SqlConnection(con);
       sql.Open();
       da = new SqlDataAdapter("SELECT * FROM Cancel_Bookings",sql);
       ds = new DataSet();
       da.Fill(ds);
       rptbook.DataSource = ds;
       rptbook.DataBind();
   }
}