using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void btn_login_Click1(object sender, EventArgs e)
    {
        string name = txtname.Text.Trim();
        string pass = txtpass.Text.Trim();
        if (IsAdmin(name, pass))
        {
            Response.Redirect("Admin/Index.aspx");
        }
        else if(IsUser(name,pass))
        {
            Response.Redirect("Index.aspx");
        }
        else
        {
            Response.Write("<script> alert('Username & Password incorrect..');</script>");
        }
    }
    protected bool IsAdmin(string name,string pass)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Admin where a_name=@name and a_pass=@pass";
        SqlCommand cmd = new SqlCommand(sel, sql);
        cmd.Parameters.AddWithValue("@name", txtname.Text);
        cmd.Parameters.AddWithValue("@pass", txtpass.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        int i = cmd.ExecuteNonQuery();
        da.Fill(dt);
        if (dt.Tables[0].Rows.Count > 0)
        {
            Session["id"] = dt.Tables[0].Rows[0]["id"];
            Session["uname"] = txtname.Text;
            return true;
        }
        else
        {
            return false;
        }
    }
    protected bool IsUser(string name,string pass)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Coustomer where c_email=@name and c_pass=@pass";
        SqlCommand cmd = new SqlCommand(sel, sql);
        cmd.Parameters.AddWithValue("@name", txtname.Text);
        cmd.Parameters.AddWithValue("@pass", txtpass.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        da.Fill(dt);
        int i = cmd.ExecuteNonQuery();
        if (dt.Tables[0].Rows.Count > 0)
        {
            Session["u_id"] = dt.Tables[0].Rows[0]["c_id"];
            return true;
        }
        else
        {
            return false;
        }
    }
}