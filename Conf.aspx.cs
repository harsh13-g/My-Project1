using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Conf : System.Web.UI.Page
{
    SqlConnection sql;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    double full_total;
    double ftl;
    int ttotal = 0;
    int foodt = 0;
    int roomn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        String con = ConfigurationManager.ConnectionStrings["hotel"].ConnectionString;
        sql = new SqlConnection(con);
        sql.Open();

        da = new SqlDataAdapter("SELECT rt_id,name,prise,fcharge,pcharge FROM Roomtype WHERE rt_Id = " + Request.QueryString["room"], sql);
        ds = new DataSet();
        da.Fill(ds);

        int price = Int32.Parse(ds.Tables[0].Rows[0][2].ToString());
        int foodch = Int32.Parse(ds.Tables[0].Rows[0][3].ToString());
        int pickch = Int32.Parse(ds.Tables[0].Rows[0][4].ToString());
        int nights = Int32.Parse(Request.QueryString["nights"].ToString());
        int guests = Int32.Parse(Request.QueryString["guest"].ToString());

        roomn = Int32.Parse(Request.QueryString["roomno"].ToString());

        b_cname.Text = Request.QueryString["name"];
        b_email.Text = Request.QueryString["email"];
        b_cmobile.Text = Request.QueryString["mobile"];
        b_nights.Text = Request.QueryString["nights"];
        b_guest.Text = guests.ToString();
        rps.Text = price.ToString();
        int total = price * nights;
        r_total.Text = total.ToString();
        b_rtype.Text = ds.Tables[0].Rows[0][1].ToString();


        if (Request.QueryString["food"] == "Yes")
        {
            f_guest.Text = guests.ToString();
            f_night.Text = nights.ToString();
            foodt = (guests * nights * foodch);
            f_rps.Text = foodch.ToString();
            f_total.Text = foodt.ToString();
        }
        else
        {
            f_guest.Text = "-";
            f_night.Text = "-";
            f_rps.Text = "0";
            f_total.Text = "0";
        }


        if (Request.QueryString["pickup"] == "Yes")
        {
            t_guest.Text = guests.ToString();
            ttotal = (guests * pickch);
            t_rps.Text = pickch.ToString();
            t_total.Text = ttotal.ToString();
        }
        else
        {
            t_guest.Text = "-";
            t_rps.Text = "0";
            t_total.Text = "0";
            
        }

        int subtotal = total + foodt + ttotal;

        sub_total.Text = subtotal.ToString();

        double tax = ((double)18 / (double)100) * (double)subtotal;
        gst.Text = tax.ToString();
        
        full_total=(double)subtotal+tax;
        final_total.Text = full_total.ToString();

        ftl = full_total / 80;
        lbl_tot.Text = ftl.ToString();
    }
    protected void btn_pay_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        int rid = r.Next();
        String con = ConfigurationManager.ConnectionStrings["hotel"].ConnectionString;
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("INSERT INTO Bookings(c_id,rt_id,r_no,b_name,b_mobile,b_email,b_checkin,b_checkout,b_noofnights,b_noofguest,b_fcharge,b_ccharge,b_payment,b_amount,b_status,b_date,tr_id) VALUES(@cid,@rtid,@rno,@bname,@mob,@bemail,@bchin,@bchout,@bnit,@bgust,@bfch,@bpch,@bpay,@amnt,@bsts,@bdate,@trid)", sql);
        cmd.Parameters.AddWithValue("@cid", Session["u_id"]);
        cmd.Parameters.AddWithValue("@rtid", Request.QueryString["room"]);
        cmd.Parameters.AddWithValue("@rno", Request.QueryString["roomno"]);
        cmd.Parameters.AddWithValue("@bname", Request.QueryString["name"]);
        cmd.Parameters.AddWithValue("@mob", Request.QueryString["mobile"]);
        cmd.Parameters.AddWithValue("@bemail", Request.QueryString["email"]);
        cmd.Parameters.AddWithValue("@bchin",Request.QueryString["chekin"]);
        cmd.Parameters.AddWithValue("@bchout",Request.QueryString["checkout"]);
        cmd.Parameters.AddWithValue("@bnit",Request.QueryString["nights"]);
        cmd.Parameters.AddWithValue("@bgust",Request.QueryString["guest"]);
        cmd.Parameters.AddWithValue("@bfch",foodt);
        cmd.Parameters.AddWithValue("@bpch",ttotal);
        cmd.Parameters.AddWithValue("@bpay","Done");
        cmd.Parameters.AddWithValue("@amnt",full_total);
        cmd.Parameters.AddWithValue("@bsts","Bookes");
        cmd.Parameters.AddWithValue("@bdate", DateTime.Now.ToString("MM/dd/yyyy"));
        cmd.Parameters.AddWithValue("trid", rid);
        if (cmd.ExecuteNonQuery() > 0)
        {
            Response.Redirect("Invoice.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        int rid = r.Next();
        int rrid = rid;

        int room=Int32.Parse(Request.QueryString["room"].ToString());
        int num=Int32.Parse(Request.QueryString["roomno"].ToString());
        string name = b_cname.Text.ToString();
        string mob = b_cmobile.Text.ToString();
        string eml = b_email.Text.ToString();
        string cin = Request.QueryString["chekin"].ToString();
        string cout = Request.QueryString["checkout"].ToString();
        int nit = Int32.Parse(b_nights.Text);
        int guest = Int32.Parse(b_guest.Text);
        int fch=Int32.Parse(foodt.ToString());
        int pch=Int32.Parse(ttotal.ToString());
        double total=Double.Parse(full_total.ToString());

        Response.Write("<form action='https://www.sandbox.paypal.com/cgi-bin/webscr' method='post' name='buyCredits' id='buyCredits'>");
        Response.Write("<input type='hidden' name='cmd' value='_xclick'>");
        Response.Write("<input type='hidden' name='business' value='sb-vwgsc29714131@business.example.com'>");
        Response.Write("<input type='hidden' name='currency_code' value='USD'>");
        Response.Write("<input type='hidden' name='item_name' value='payment for booking'>");
        Response.Write("<input type='hidden' name='item_number' value='0'>");
        Response.Write("<input type='hidden' name='amount' value='" + ftl + "'>");
        Response.Write("<input type='hidden' name='return' value='http://localhost:18024/Payment.aspx?room=" + room + "&num=" + roomn + "&name=" + name + "&mob=" + mob + "&eml=" + eml + "&cin=" + cin + "&cout=" + cout + "&nit=" + nit + "&guest=" + guest + "&fch=" + fch + "&pch=" + pch + "&total=" + total + "&trid=" + rrid + "'>");
        Response.Write("</form>");
        Response.Write("<script type='text/javascript'>");
        Response.Write("document.getElementById('buyCredits').submit();");
        Response.Write("</script>");
    }
}
