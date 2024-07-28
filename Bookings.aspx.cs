using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Bookings : System.Web.UI.Page
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
        getbooking();
    }
    public void getbooking()
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        da = new SqlDataAdapter("SELECT b_id,b_name,r_no,name,format(b_date,'dd-MM-yyyy') as bdt ,format(b_checkin,'dd-MM-yyyy') as checkin, format(b_checkout,'dd-MM-yyyy') as checkout,b_amount, CASE when getdate() between b_checkin and b_checkout then 'Checked-in' when getdate() < b_checkin then 'Booked' when getdate() > b_checkout then 'Complated' else 'aaa' end as status FROM Bookings INNER JOIN Roomtype ON Bookings.rt_id = Roomtype.rt_Id", sql);
        ds = new DataSet();
        da.Fill(ds);
        rptbook.DataSource = ds;
        rptbook.DataBind();
    }
}