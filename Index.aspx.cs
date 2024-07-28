using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_index2 : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    SqlConnection sql;
    double in1;
    double in2;
    double tot;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        getcustomer();
        getbookings();
        getin1();
        getin2();
    }

    public void getbookings()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("SELECT COUNT(b_id) AS book FROM Bookings", sql);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        lbl_totalbookings.Text = ds.Tables[0].Rows[0]["book"].ToString();
    }

    public void getin1()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("SELECT SUM(b_amount) AS in1 FROM Bookings", sql);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        in1 = (double)ds.Tables[0].Rows[0]["in1"];
    }

    public void getin2()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("SELECT SUM(c_charge) AS in2 FROM Cancel_Bookings", sql);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        in2 = (double)ds.Tables[0].Rows[0]["in2"];
        tot = (double)in1 + (double)in2;
        lbl_totalinc.Text = tot.ToString();

    }
    public void getcustomer()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("SELECT COUNT(c_id) AS cus FROM Coustomer", sql);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        lbl_totalcoust.Text = ds.Tables[0].Rows[0]["cus"].ToString();
    }
}