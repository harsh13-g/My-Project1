using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Rooms : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Roomtype";
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            rptcatdisp.DataSource = dt;
            rptcatdisp.DataBind();
        }
    }

    protected void rptcatdisp_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            Response.Redirect("New.aspx?id="+e.CommandArgument.ToString());
        }
    }
    
}