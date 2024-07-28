using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Invoice : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataAdapter da2;
    DataSet ds;
    DataSet ds2;
    SqlConnection sql;

      
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        gethoteldet();
        getbookingdet();
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
    public void getbookingdet()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();

        da = new SqlDataAdapter("SELECT top 1 b_id,c_id,rt_id,r_no,b_name,b_mobile,b_email,format(b_checkin,'dd-MMM-yy') as bcheckin,format(b_checkout,'dd-MMM-yy') as bcheckout,format(b_date,'dd-MMM-yy') as bdate,b_noofnights,b_noofguest,b_fcharge,b_ccharge,b_amount FROM Bookings WHERE c_id = " + Session["u_id"] + " ORDER BY b_id desc", sql);
        ds = new DataSet();
        da.Fill(ds);


        invoice_date.Text = DateTime.Now.ToString("dd MMM yyyy hh:m:sstt");

        invoice_id.Text = ds.Tables[0].Rows[0][0].ToString();
        lbl_name.Text = ds.Tables[0].Rows[0]["b_name"].ToString();
        lbl_mobile.Text = ds.Tables[0].Rows[0]["b_mobile"].ToString();
        lbl_email.Text = ds.Tables[0].Rows[0]["b_email"].ToString();

        lbl_bdate.Text = ds.Tables[0].Rows[0]["bdate"].ToString();
        lbl_checkin.Text = ds.Tables[0].Rows[0]["bcheckin"].ToString();
        lbl_checkout.Text = ds.Tables[0].Rows[0]["bcheckout"].ToString();

        lbl_guest.Text = ds.Tables[0].Rows[0]["b_noofguest"].ToString();
        lbl_nights.Text = ds.Tables[0].Rows[0]["b_noofnights"].ToString();


        lbl_fguest.Text = ds.Tables[0].Rows[0]["b_noofguest"].ToString();
        lbl_fnights.Text = ds.Tables[0].Rows[0]["b_noofnights"].ToString();
        

        lbl_ptotal.Text = ds.Tables[0].Rows[0]["b_ccharge"].ToString();

        lbl_total.Text = ds.Tables[0].Rows[0]["b_amount"].ToString();


        da2 = new SqlDataAdapter("SELECT * FROM Roomtype WHERE rt_Id = " + Int32.Parse(ds.Tables[0].Rows[0]["rt_id"].ToString()), sql);
        ds2 = new DataSet();
        da2.Fill(ds2);

        lbl_fprise.Text = ds2.Tables[0].Rows[0]["fcharge"].ToString();

        lbl_room.Text = ds2.Tables[0].Rows[0]["name"].ToString();
        int room = Int32.Parse(ds2.Tables[0].Rows[0]["prise"].ToString());
        int person = Int32.Parse(ds.Tables[0].Rows[0]["b_noofguest"].ToString());
        int car = Int32.Parse(ds.Tables[0].Rows[0]["b_ccharge"].ToString());
        int food = Int32.Parse(ds.Tables[0].Rows[0]["b_fcharge"].ToString());
        int day = Int32.Parse(ds.Tables[0].Rows[0]["b_noofnights"].ToString());

        int rtotal = room * day;

        lbl_rtotal.Text = rtotal.ToString();

        int subtotal = food + car + room;

        int ftotal=food*person;



        double tax = ((double)18 / (double)100) * (double)subtotal;
        lbl_rpice.Text = room.ToString();
        lbl_pprise.Text = car.ToString();
        lbl_ftotal.Text = food.ToString();

        lbl_subtotal.Text = subtotal.ToString();
        lbl_tax.Text = tax.ToString();
        
    }
}