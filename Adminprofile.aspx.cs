using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Adminprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection scon= new SqlConnection(con);
        scon.Open();
        if (!IsPostBack)
        {
            string sel = "select * from Admin where id='" + Session["id"] + "'";
            SqlCommand cmd = new SqlCommand(sel, scon);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            admin.DataSource = ds;
            admin.DataBind();
            proimg3.DataSource = ds;
            proimg3.DataBind();
            lbl.Text = ds.Tables[0].Rows[0][1].ToString();
            txt_name.Text = ds.Tables[0].Rows[0][1].ToString();
            txtnewemail.Text = ds.Tables[0].Rows[0][3].ToString();
            txtnewmobile.Text = ds.Tables[0].Rows[0][4].ToString();
        }
    }
    protected void btn_det_upd_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection scon = new SqlConnection(con);
        scon.Open();
        string upd = "update Admin set a_email=@email, a_mobile=@mobile where id='" + Session["id"] + "' ";
        SqlCommand cmd = new SqlCommand(upd, scon);
        cmd.Parameters.AddWithValue("@email", txtnewemail.Text);
        cmd.Parameters.AddWithValue("@mobile", txtnewmobile.Text);
        if (cmd.ExecuteNonQuery() > 0)
        {
            Response.Redirect("Adminprofile.aspx");
        }

        
    }
    protected void btn_pass_upd_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection scon = new SqlConnection(con);
        scon.Open();
        string pass = "update Admin set a_pass=@pass where id='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(pass, scon);
        cmd.Parameters.AddWithValue("@pass", txt_newpass.Text);
        if (cmd.ExecuteNonQuery() > 0)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            Response.Write("Not Updated...");
        }
    }
    protected void btn_upd_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection scon = new SqlConnection(con);
        scon.Open();
        if (fluimg.HasFile)
        {
            String tf = "Images/";
            String fl = Server.MapPath(tf);
            fluimg.SaveAs(fl + fluimg.FileName);
            SqlCommand cmd = new SqlCommand("update Admin set a_img=@new where id='" + Session["id"] + "'", scon);
            cmd.Parameters.AddWithValue("@new", fluimg.FileName);
            int i = cmd.ExecuteNonQuery();
            Response.Redirect("Adminprofile.aspx");
        }
    }
}   