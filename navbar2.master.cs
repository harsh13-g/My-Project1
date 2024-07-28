using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_navbar2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            lblnm2.Text = Session["uname"].ToString();
            lblnm1.Text = Session["uname"].ToString();
            getproimage();
            getdet();
        }
        
    }
    public void getproimage()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection scon = new SqlConnection(con);
        scon.Open();
        string sel = "select * from Admin where id='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(sel, scon);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            rptpro1.DataSource = dt;
            rptpro1.DataBind();
            rptpro2.DataSource = dt;
            rptpro2.DataBind();
        }
        string sel2 = "select * from Hotel_Details where hd_Id='" + 1 + "'";
        cmd = new SqlCommand(sel, scon);
        da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        lbln.Text = ds.Tables[0].Rows[0][1].ToString();
    }
    public void getdet()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection scon = new SqlConnection(con);
        scon.Open();
        string sel2 = "select * from Hotel_Details where hd_Id='" + 1 + "'";
        SqlCommand cmd = new SqlCommand(sel2, scon);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        lbln.Text = ds.Tables[0].Rows[0][1].ToString();

    }
}
