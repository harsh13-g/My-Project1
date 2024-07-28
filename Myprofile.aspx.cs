using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Myprofile : System.Web.UI.Page
{
    SqlDataAdapter da,da2;
    DataSet ds,ds2;
    SqlCommand cmd;
    SqlConnection sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("Index.aspx");
        }   
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        if(!Page.IsPostBack)
        {
            string sel = "select * from Coustomer where c_id='" + Session["u_id"] + "'";
            SqlCommand cmd = new SqlCommand(sel, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            rptprofile.DataSource = ds;
            rptprofile.DataBind();
            txtnewname.Text = ds.Tables[0].Rows[0][1].ToString();
            txtnewmob.Text = ds.Tables[0].Rows[0][3].ToString();
            txtfcname.Text = ds.Tables[0].Rows[0][1].ToString();
            getprevbooking();
        }
        
    }
    protected void user_update_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("update Coustomer set c_name=@name,c_mobile=@mob where c_id='" + Session["u_id"] + "'", sql);
        cmd.Parameters.AddWithValue("@name", txtnewname.Text);
        cmd.Parameters.AddWithValue("@mob", txtnewmob.Text);
        if (cmd.ExecuteNonQuery() > 0)
        {
            txtnewname.Text = "";
            txtnewmob.Text = "";
        }
        if (flupro.HasFile)
        {
            String tf = "Admin/Images/";
            String fl = Server.MapPath(tf);
            flupro.SaveAs(fl + flupro.FileName);
            cmd = new SqlCommand("update Coustomer set c_image=@newimg where c_id='" + Session["u_id"] + "'", sql);
            cmd.Parameters.AddWithValue("@newimg", flupro.FileName);
            int i = cmd.ExecuteNonQuery();
        }
    }
    protected void btn_send_feedback_Click(object sender, EventArgs e)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string name = txtfcname.Text;
        string msg = txtfcmsg.Text;
        string date = DateTime.Now.ToString("MM/dd/yyyy");
        cmd = new SqlCommand("INSERT INTO Review VALUES('" + Session["u_id"] + "','" + name + "','" + msg + "','" + date + "')", sql);
        if ((cmd.ExecuteNonQuery()) > 0)
        {
            txtfcmsg.Text = "";
            txtfcname.Text = "";
        }
    }

    public void getprevbooking()
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        da = new SqlDataAdapter("SELECT b_id,b_name,r_no,name,format(b_date,'dd-MM-yyyy') as bdt ,format(b_checkin,'dd-MM-yyyy') as checkin, format(b_checkout,'dd-MM-yyyy') as checkout,b_amount, CASE when getdate() between b_checkin and b_checkout then 'Checked-in' when getdate() < b_checkin then 'Booked' when getdate() > b_checkout then 'Complated' else 'aaa' end as status FROM Bookings INNER JOIN Roomtype ON Bookings.rt_id = Roomtype.rt_Id WHERE Bookings.c_id =" + Session["u_id"], sql);
        ds = new DataSet();
        da.Fill(ds);
        rptbooking.DataSource = ds;
        rptbooking.DataBind();
    }
    protected void rptbooking_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "viewbook")
        {
            Response.Redirect("ManageBooking.aspx?id=" + e.CommandArgument.ToString());
        }
    }
    protected void btn_del_Click(object sender, EventArgs e)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("DELETE FROM Coustomer WHERE c_id='" + Session["u_id"] + "'", sql);
        if ((cmd.ExecuteNonQuery()) > 0)
        {
            Response.Redirect("login.aspx");
        }
    }
}