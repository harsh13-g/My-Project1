using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Queries : System.Web.UI.Page
{
    SqlConnection sql;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        if (!IsPostBack)
        {
            da = new SqlDataAdapter("select * from Queries", sql);
            ds = new DataSet();
            da.Fill(ds);
            rptqer.DataSource = ds;
            rptqer.DataBind();
        }
    }
}