using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Viewrooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select rt.name,rt.description,rt.prise,rt.size,rt.beds,rt.fcharge,rt.pcharge,rt.image,COUNT(r.r_id) AS Total from Roomtype rt LEFT JOIN Rooms r ON rt.rt_Id=r.rt_id GROUP BY rt.name,rt.description,rt.prise,rt.size,rt.beds,rt.fcharge,rt.pcharge,rt.image";
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            rpt_rview.DataSource = dt;
            rpt_rview.DataBind();
        }
    }
}