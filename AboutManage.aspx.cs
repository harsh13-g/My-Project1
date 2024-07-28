using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AboutManage : System.Web.UI.Page
{
    SqlCommand cmd;
    DataSet ds;
    SqlConnection sql;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        if (!IsPostBack)
        {
            string sel = "select * from Hotel_Details where hd_Id='"+1+"'";
            SqlCommand cmd = new SqlCommand(sel, sql);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            txthname.Text = ds.Tables[0].Rows[0][1].ToString();
            txthdes.Text = ds.Tables[0].Rows[0][2].ToString();
            txthdet.Text = ds.Tables[0].Rows[0][3].ToString();
            txthaddr.Text = ds.Tables[0].Rows[0][4].ToString();
            txthcon.Text = ds.Tables[0].Rows[0][5].ToString();
            txthemail.Text = ds.Tables[0].Rows[0][6].ToString();
            txthtime.Text = ds.Tables[0].Rows[0][7].ToString();
            rptimgs.DataSource = ds;
            rptimgs.DataBind();
        }
    }
    protected void btn_upd_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("update Hotel_Details set h_name=@name,h_description=@des,h_details=@det,h_address=@addr,h_contact=@cont,h_email=@email,h_time=@time where hd_Id='" + 1 + "'", sql);
        cmd.Parameters.AddWithValue("@name",txthname.Text);
        cmd.Parameters.AddWithValue("@des",txthdes.Text);
        cmd.Parameters.AddWithValue("@det",txthdet.Text);
        cmd.Parameters.AddWithValue("@addr",txthaddr.Text);
        cmd.Parameters.AddWithValue("@cont",txthcon.Text);
        cmd.Parameters.AddWithValue("@email",txthemail.Text);
        cmd.Parameters.AddWithValue("@time", txthtime.Text);
        if (cmd.ExecuteNonQuery() > 0)
        {
            lbl_msg.Text = "updated sucessfully..";
        }
        else
        {
            lbl_msg.Text = "not updated..";
        }
        if (fluscroll.HasFile)
        {
            String tf = "Images/";
            String fl = Server.MapPath(tf);
            fluscroll.SaveAs(fl + fluscroll.FileName);
            cmd = new SqlCommand("update Hotel_Details set h_scrolling=@newimg where hd_Id='" + 1 + "'", sql);
            cmd.Parameters.AddWithValue("@newimg", fluscroll.FileName);
            int i = cmd.ExecuteNonQuery();
        }
        else
        {
            lbl_msg.Text = "not updated..";
        }
        if (flulogo.HasFile)
        {
            String tf = "Images/";
            String fl = Server.MapPath(tf);
            flulogo.SaveAs(fl + flulogo.FileName);
            cmd = new SqlCommand("update Hotel_Details set h_logo=@newlogo where hd_Id='" + 1 + "'", sql);
            cmd.Parameters.AddWithValue("@newlogo", flulogo.FileName);
            int i = cmd.ExecuteNonQuery();
        }
        else
        {
            lbl_msg.Text = "not updated..";
        }
    }
}