using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Roomnumbers : System.Web.UI.Page
{
    SqlConnection sql;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
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
            ddlroom.DataSource = ds;
            ddlroom.DataTextField = "name";
            ddlroom.DataValueField = "rt_id";
            ddlroom.DataBind();
            disproom();
        }    
    }
    protected void btn_add_room_number_Click(object sender, EventArgs e)
    {
        int rtid = Int32.Parse(ddlroom.SelectedValue);
        int rnum = Int32.Parse(txtnumofroom.Text);
        
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        da =new SqlDataAdapter("SELECT * FROM Rooms Where rt_id="+rtid+" And room_number="+rnum+" ",sql);
        ds=new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            disp_res.Text="Room is already added..";
        }
        else{
            cmd = new SqlCommand("INSERT INTO Rooms VALUES(" + rtid + "," + rnum + ")", sql);
            if (cmd.ExecuteNonQuery() > 0)
            {
                txtnumofroom.Text = "";
                disp_res.Text = "Room added sucsessfully..";
                disproom();
            }
            else
            {
                disp_res.Text = "Error in insert.";
                txtnumofroom.Text = "0";
            }
        }
        
    }
    public void disproom()
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        da = new SqlDataAdapter("select rt.name,rt.prise,COUNT(r.r_id) AS Total from Roomtype rt LEFT JOIN Rooms r ON rt.rt_Id=r.rt_id GROUP BY rt.name,rt.prise ", sql);
        dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            rpt_roomdet.DataSource = dt;
            rpt_roomdet.DataBind();
        }
    }
    protected void btn_del_room_number_Click(object sender, EventArgs e)
    {
        int rtid = Int32.Parse(ddlroom.SelectedValue);
        int rnum = Int32.Parse(txtnumofroom.Text);

        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        cmd = new SqlCommand("DELETE FROM Rooms WHERE rt_id=" + rtid + " AND room_number=" + rnum + " ", sql);
        if (cmd.ExecuteNonQuery() > 0)
        {
            txtnumofroom.Text = "";
            disp_res.Text = "Room Deleted sucsessfully..";
            disproom();
        }
        else
        {
            disp_res.Text = "Entered Room number not found";
            txtnumofroom.Text = "0";
        }
        
    }
}