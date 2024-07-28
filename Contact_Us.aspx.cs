using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Contact_Us : System.Web.UI.Page
{
    SqlCommand cmd;
    DataSet ds;
    SqlConnection sql;
    protected void Page_Load(object sender, EventArgs e)
    {
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
            lbl_addr.Text = ds.Tables[0].Rows[0][4].ToString();
            lbl_email.Text = ds.Tables[0].Rows[0][6].ToString();
            lbl_mob.Text = ds.Tables[0].Rows[0][5].ToString();
            lbl_time.Text = ds.Tables[0].Rows[0][7].ToString();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        string ins = "insert into Queries values(@name,@email,@sub,@msg)";
        cmd = new SqlCommand(ins, sql);
        cmd.Parameters.AddWithValue("@name",txtname.Text);
        cmd.Parameters.AddWithValue("@email",txtemail.Text);
        cmd.Parameters.AddWithValue("@sub",txtsub.Text);
        cmd.Parameters.AddWithValue("@msg",txtmsg.Text);
        if(cmd.ExecuteNonQuery()>0){
            
            Response.Write("<script> alert('Your Message is successfully sent to the admin pls check your email for answer');</script>");
            txtname.Text = "";
            txtemail.Text = "";
            txtsub.Text = "";
            txtmsg.Text = "";
        }
        else{
            
            Response.Write("<script> alert('Erro..');</script>");
            Response.Redirect("Contact_Us.aspx");
        }
    }
}