using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManageBooking : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    SqlConnection sql;
    double tamt;
    double ccharge;
    double ramt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        getdata();
    }
    public void getdata()
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        da = new SqlDataAdapter("SELECT b_id,b_name,b_email,r_no,name,format(b_date,'dd-MM-yyyy') as bdt ,format(b_checkin,'dd-MM-yyyy') as checkin, format(b_checkout,'dd-MM-yyyy') as checkout,b_amount,tr_id, CASE when getdate() between b_checkin and b_checkout then 'Checked-in' when getdate() < b_checkin then 'Booked' when getdate() > b_checkout then 'Complated' else 'aaa' end as status FROM Bookings INNER JOIN Roomtype ON Bookings.rt_id = Roomtype.rt_Id WHERE Bookings.b_id =" + Request.QueryString["id".ToString()], sql);
        ds = new DataSet();
        da.Fill(ds);
        txtname.Text = ds.Tables[0].Rows[0]["b_name"].ToString();
        txtemail.Text = ds.Tables[0].Rows[0]["b_email"].ToString();
        txtrtype.Text = ds.Tables[0].Rows[0]["name"].ToString();
        txtrno.Text = ds.Tables[0].Rows[0]["r_no"].ToString();
        txtchin.Text = ds.Tables[0].Rows[0]["checkin"].ToString();
        txtchout.Text = ds.Tables[0].Rows[0]["checkout"].ToString();
        txtbdate.Text = ds.Tables[0].Rows[0]["bdt"].ToString();
        txtbamount.Text = ds.Tables[0].Rows[0]["b_amount"].ToString();
        txtsts.Text = ds.Tables[0].Rows[0]["status"].ToString();
        txt_trid.Text = ds.Tables[0].Rows[0]["tr_id"].ToString();
        if (txtsts.Text == "Booked")
        {
            lbl_ms.Text = "Do you want to cancel booking ?";
            btn_cnl_booking.Visible = true;
        }
        else
        {
            lbl_ms.Text = "You cant able to cancel booking because yor booking is completed";
        }
    }
    

    public void cancelbooking()
    {
        tamt=Double.Parse(txtbamount.Text);
        ccharge = ((double)30 / (double)100) * (double)tamt;
        ramt = (double)tamt - (double)ccharge;
        string rnm=txtrtype.Text.ToString();
        string no=txtrno.Text.ToString();
        string nm=txtname.Text.ToString();
        string eml=txtemail.Text.ToString();
        string cin=txtchin.Text.ToString();
        string cout=txtchout.Text.ToString();
        string bdt=txtbdate.Text.ToString();
        string cdt = DateTime.Now.ToString("MM/dd/yyyy");
        string trid = txt_trid.Text.ToString();

        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("insert into Cancel_Bookings (rt_name,r_no,c_name,c_email,chin_date,chout_date,b_date,c_date,b_amount,c_charge,r_amount,status,tr_id) values(@rtname,@rno,@cnm,@cem,@cin,@cout,@bdt,@cdt,@bamt,@cchg,@ramt,@sts,@trid)",sql);
        cmd.Parameters.AddWithValue("@rtname", txtrtype.Text);
        cmd.Parameters.AddWithValue("@rno", txtrno.Text);
        cmd.Parameters.AddWithValue("@cnm", txtname.Text);
        cmd.Parameters.AddWithValue("@cem", txtemail.Text);
        cmd.Parameters.AddWithValue("@cin", txtchin.Text);
        cmd.Parameters.AddWithValue("@cout", txtchout.Text);
        cmd.Parameters.AddWithValue("@bdt", txtbdate.Text);
        cmd.Parameters.AddWithValue("@cdt", DateTime.Now.ToString("MM/dd/yyyy"));
        cmd.Parameters.AddWithValue("@bamt", tamt);
        cmd.Parameters.AddWithValue("@cchg", ccharge);
        cmd.Parameters.AddWithValue("@ramt", ramt);
        cmd.Parameters.AddWithValue("@sts", "Cancelled");
        cmd.Parameters.AddWithValue("trid", txt_trid.Text);
        if (cmd.ExecuteNonQuery() > 0)
        {
            Response.Redirect("CancelReciept.aspx?rname=" + rnm + "&rno=" + no + "&nm=" + nm + "&em=" + eml + "&cin=" + cin + "&cout=" + cout + "&bdt=" + bdt + "&cdt=" + cdt + "&bamt=" + tamt + "&cch=" + ccharge + "&ramt=" + ramt);
        }
    }
    public void deletebooking()
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("delete from Bookings where b_id=" + Request.QueryString["id".ToString()], sql);
        if (cmd.ExecuteNonQuery() > 0)
        {
            cancelbooking();
        }
    }
    
    protected void btn_cnl_booking_Click(object sender, EventArgs e)
    {
        deletebooking();
    }
}