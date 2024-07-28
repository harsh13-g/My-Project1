using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Menubar : System.Web.UI.MasterPage
{

    SqlCommand cmd;
    DataSet ds;
    SqlConnection sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["u_id"]==null)
        {
            btn_login.Visible = true;
            link_bookings.Visible = false;
            link_profile.Visible = false;
        }
        else
        {
            btn_logout.Visible = true;
            link_profile.Visible = true;
            link_bookings.Visible = true;
        }
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        if (!IsPostBack)
        {
            string sel = "select * from Hotel_Details where hd_Id='" + 1 + "'";
            SqlCommand cmd = new SqlCommand(sel, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            lbl_name.Text = ds.Tables[0].Rows[0][1].ToString();
            lbl_name2.Text = ds.Tables[0].Rows[0][1].ToString();
            lbl_email.Text = ds.Tables[0].Rows[0][6].ToString();
            lbl_det.Text = ds.Tables[0].Rows[0][3].ToString();
            lbl_addr.Text = ds.Tables[0].Rows[0][4].ToString();
            lbl_mob.Text = ds.Tables[0].Rows[0][5].ToString();
            rptlogo.DataSource = ds;
            rptlogo.DataBind();
        }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logout.aspx");
    }
}
