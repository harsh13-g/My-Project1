using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string ins = "insert into Roomtype values (@name,@des,@prise,@size,@beds,@fcharge,@ccharge,@img)";
        SqlCommand cmd = new SqlCommand(ins, sql);
        cmd.Parameters.AddWithValue("@name", txtrname.Text);
        cmd.Parameters.AddWithValue("@des", txtrdes.Text);
        cmd.Parameters.AddWithValue("@prise", txtrprise.Text);
        cmd.Parameters.AddWithValue("@size", txtrsize.Text);
        cmd.Parameters.AddWithValue("@beds", txtrbeds.Text);
        cmd.Parameters.AddWithValue("@fcharge", txtfcharge.Text);
        cmd.Parameters.AddWithValue("@ccharge", txtpickup.Text);
        cmd.Parameters.AddWithValue("@img", roomimg.FileName);
        if (cmd.ExecuteNonQuery() > 0)
        {
            lbl_m.Text = "Room Added...";
            txtrname.Text = "";
            txtrdes.Text = "";
            txtrprise.Text = "";
            txtrsize.Text = "";
            txtrbeds.Text = "";
            txtfcharge.Text = "";
            txtpickup.Text = "";
        }
        else
        {
            lbl_m.Text = "Room cant added..";
        }
        if (roomimg.HasFile)
        {
            String tf = "Images/";
            String fl = Server.MapPath(tf);
            roomimg.SaveAs(fl + roomimg.FileName);
        }
    }
}