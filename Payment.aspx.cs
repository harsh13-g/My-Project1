using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Payment : System.Web.UI.Page
{
    SqlConnection sql;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ConnectionString;
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("INSERT INTO Bookings(c_id,rt_id,r_no,b_name,b_mobile,b_email,b_checkin,b_checkout,b_noofnights,b_noofguest,b_fcharge,b_ccharge,b_payment,b_amount,b_status,b_date,tr_id) VALUES(@cid,@rtid,@rno,@bname,@mob,@bemail,@bchin,@bchout,@bnit,@bgust,@bfch,@bpch,@bpay,@amnt,@bsts,@bdate,@trid)", sql);
        cmd.Parameters.AddWithValue("@cid", Session["u_id"]);
        cmd.Parameters.AddWithValue("@rtid", Request.QueryString["room"]);
        cmd.Parameters.AddWithValue("@rno", Request.QueryString["num"]);
        cmd.Parameters.AddWithValue("@bname", Request.QueryString["name"]);
        cmd.Parameters.AddWithValue("@mob", Request.QueryString["mob"]);
        cmd.Parameters.AddWithValue("@bemail", Request.QueryString["eml"]);
        cmd.Parameters.AddWithValue("@bchin", Request.QueryString["cin"]);
        cmd.Parameters.AddWithValue("@bchout", Request.QueryString["cout"]);
        cmd.Parameters.AddWithValue("@bnit", Request.QueryString["nit"]);
        cmd.Parameters.AddWithValue("@bgust", Request.QueryString["guest"]);
        cmd.Parameters.AddWithValue("@bfch", Request.QueryString["fch"]);
        cmd.Parameters.AddWithValue("@bpch", Request.QueryString["pch"]);
        cmd.Parameters.AddWithValue("@bpay", "Done");
        cmd.Parameters.AddWithValue("@amnt", Request.QueryString["total"]);
        cmd.Parameters.AddWithValue("@bsts", "Bookes");
        cmd.Parameters.AddWithValue("@bdate", DateTime.Now.ToString("MM/dd/yyyy"));
        cmd.Parameters.AddWithValue("@trid", Request.QueryString["trid"]);
        if (cmd.ExecuteNonQuery() > 0)
        {
            Response.Redirect("Invoice.aspx");
        }

    }
}