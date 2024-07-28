using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Report1 : System.Web.UI.Page
{

    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    SqlConnection sql;
    double btot;
    double ctot;
    double total;
    protected void Page_Load(object sender, EventArgs e)
    {
        gettotal();
        gethoteldet();
        getcanbooking();
        from_date.Text = Request.QueryString["tdf".ToString()];
        to_date.Text = Request.QueryString["tdt".ToString()];
        cre_date.Text = DateTime.Now.ToString("dd/MM/yyyy");
    }
    public void gethoteldet()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Hotel_Details where hd_Id='" + 1 + "'";
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        rpthtl.DataSource = ds;
        rpthtl.DataBind();
    }

    public void gettotal()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        string sel = "SELECT COUNT(b_id) AS Book, SUM(b_amount) AS Total FROM Bookings WHERE b_date BETWEEN '" + Request.QueryString["tdf".ToString()] + "' AND '" + Request.QueryString["tdt".ToString()] + "'";
        cmd = new SqlCommand(sel, sql);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        lbl_totb.Text = ds.Tables[0].Rows[0]["Book"].ToString();
        lbl_totp.Text = ds.Tables[0].Rows[0]["Total"].ToString();

        btot = (double)ds.Tables[0].Rows[0]["Total"];
    }
    public void getcanbooking()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        string sel = "SELECT COUNT(cb_id) AS cbid, SUM(c_charge) AS Totalc FROM Cancel_Bookings WHERE c_date BETWEEN '" + Request.QueryString["tdf".ToString()] + "' AND '" + Request.QueryString["tdt".ToString()] + "'";
        cmd = new SqlCommand(sel, sql);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        lblc_tot.Text = ds.Tables[0].Rows[0]["cbid"].ToString();
        lblc_pr.Text = ds.Tables[0].Rows[0]["Totalc"].ToString();

        ctot = (double)ds.Tables[0].Rows[0]["Totalc"];

        total = (double)btot + (double)ctot;

        lbl_total.Text = total.ToString();
    }
}