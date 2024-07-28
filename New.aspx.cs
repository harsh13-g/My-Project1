using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class New : System.Web.UI.Page
{
    string roomtype;
    protected void Page_Load(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Roomtype where rt_Id=" + Request.QueryString["id".ToString()];
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        da.Fill(dt);
        
            rptcat.DataSource = dt;
            rptcat.DataBind();
            roomtype = dt.Tables[0].Rows[0]["rt_Id"].ToString();
    }

    
    protected void rptcat_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "gobook")
        {
            Response.Redirect("Booking.aspx?id="+e.CommandArgument.ToString());
        }
        else
        {
            Response.Redirect("New.aspx");
        }
    }
    protected void btn_go_Click(object sender, EventArgs e)
    {
        Response.Redirect("Booking.aspx?rr_id=" + roomtype);
    }
}