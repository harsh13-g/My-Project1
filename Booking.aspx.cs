using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Booking : System.Web.UI.Page
{

    SqlConnection sql;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        if (!IsPostBack)
        {
                da = new SqlDataAdapter("select rt_id,name from Roomtype", sql);
                ds = new DataSet();
                da.Fill(ds);
                ddlroomtype.DataSource = ds;
                ddlroomtype.DataTextField = "name";
                ddlroomtype.DataValueField = "rt_id";
                ddlroomtype.DataBind();
                
        }

    }
    public void chechkavailability()
    {
        if ((txtcin.Text != "") && (txtcout.Text != ""))
        {
            int room = Int32.Parse(ddlroomtype.SelectedValue);
            DateTime checkindate = DateTime.Parse(txtcin.Text);
            DateTime checkoutdate = DateTime.Parse(txtcout.Text);
            string checkin = checkindate.ToString("MM/dd/yyyy");
            string checkout = checkoutdate.ToString("MM/dd/yyyy");
            da = new SqlDataAdapter("select r.r_id,r.room_number,rt.name from Rooms r INNER JOIN Roomtype rt on r.rt_id = rt.rt_Id  where r.room_number not in (select r_no from Bookings where (b_checkout >= '" + checkin + "' AND b_checkin <= '" + checkout + "') OR (b_checkout <= '" + checkin + "' AND b_checkin >= '" + checkout + "') ) AND (rt.rt_id = " + room + ") ORDER BY room_number", sql);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                btn_add.Enabled = true;
                ddlroomnumber.DataSource = ds;
                ddlroomnumber.DataTextField = "room_number";
                ddlroomnumber.DataValueField = "room_number";
                ddlroomnumber.DataBind();
                knowroom.Text = "";
                selectguest();
            }
            else
            {
                knowroom.Text = "Room Not Available In this dates";
            }
        }
        else
        {
            txtcin.Focus();
        }
    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        string name = txtfanme.Text + "" + txtlname.Text;
        string email = txtemail.Text;
        string mobile = txtmob.Text;
        DateTime checkindate = DateTime.Parse(txtcin.Text);
        DateTime checkoutdate = DateTime.Parse(txtcout.Text);
        string checkin = checkindate.ToString("MM/dd/yyyy");
        string checkout = checkoutdate.ToString("MM/dd/yyyy");
        int noofnights = Int32.Parse(checkoutdate.ToString("dd")) - Int32.Parse(checkindate.ToString("dd"));
        string roomtype = ddlroomtype.SelectedValue;
        string roomno = ddlroomnumber.SelectedValue;
        string guest = ddlnoofguest.SelectedValue;
        string food = (rdb_fyes.Checked) ? rdb_fyes.Text : rdb_fno.Text;
        string pickup = (rdb_pyes.Checked) ? rdb_pyes.Text : rdb_pno.Text;
        Response.Redirect("Conf.aspx?name="+name+"&email="+email+"&chekin="+checkin+"&checkout="+checkout+"&nights="+noofnights+"&room="+roomtype+"&roomno="+roomno+"&guest="+guest+"&food="+food+"&pickup="+pickup+"&mobile="+mobile);
    }
    protected void ddlroomtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        chechkavailability();
        selectguest();
    }
    protected void txtcin_TextChanged(object sender, EventArgs e)
    {
        chechkavailability();
    }
    protected void txtcout_TextChanged(object sender, EventArgs e)
    {
        chechkavailability();
    }

    public void selectguest()
    {
        if (ddlroomtype.DataValueField == "Quad Room")
        {
            ddlnoofguest.Items.Clear();
            ddlnoofguest.Items.Add("1");
            ddlnoofguest.Items.Add("2");
            ddlnoofguest.Items.Add("3");
            ddlnoofguest.Items.Add("4");
        }
        else if (ddlroomtype.DataValueField == "Family Suit")
        {
            ddlnoofguest.Items.Clear();
            ddlnoofguest.Items.Add("1");
            ddlnoofguest.Items.Add("2");
            ddlnoofguest.Items.Add("3");
            ddlnoofguest.Items.Add("4");
        }
        else
        {
            ddlnoofguest.Items.Clear();
            ddlnoofguest.Items.Add("1");
            ddlnoofguest.Items.Add("2");
        }
    }


    //public void getroombyload()
    //{
    //}
    //public void getroombyid()
    //{
    //    da = new SqlDataAdapter("select * from Roomtype where rt_id='" + Request.QueryString["rr_id"] + "'", sql);
    //    ds = new DataSet();
    //    da.Fill(ds);
    //    ddlroomtype.SelectedValue = ds.Tables[0].Rows[0]["name"].ToString();
    //}
}