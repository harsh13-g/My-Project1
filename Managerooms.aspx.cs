using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Managerooms : System.Web.UI.Page
{
    SqlConnection sql;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        sql = new SqlConnection(con);
        sql.Open();
        if(!IsPostBack)
        {
            da = new SqlDataAdapter("select rt_id,name from Roomtype",sql);
            ds = new DataSet();
            da.Fill(ds);
            ddlroom.DataSource = ds;
            ddlroom.DataTextField = "name";
            ddlroom.DataValueField = "rt_id";
            ddlroom.DataBind();
        }
    }
    protected void btn_select_Click(object sender, EventArgs e)
    {
        
        int rtid = Int32.Parse(ddlroom.SelectedValue);
        da = new SqlDataAdapter("select * from Roomtype where rt_id='" + rtid + "'", sql);
        ds = new DataSet();
        da.Fill(ds);
        txt_rname.Text = ds.Tables[0].Rows[0][1].ToString();
        txt_rdes.Text = ds.Tables[0].Rows[0][2].ToString();
        txt_rprise.Text = ds.Tables[0].Rows[0][3].ToString();
        txt_rsize.Text = ds.Tables[0].Rows[0][4].ToString();
        txt_rbeds.Text = ds.Tables[0].Rows[0][5].ToString();
        txt_fcharge.Text = ds.Tables[0].Rows[0][6].ToString();
        txt_ccharge.Text = ds.Tables[0].Rows[0][7].ToString();
        getimg();
        
    }
    protected void btn_upd_Click(object sender, EventArgs e)
    {
        int rtid = Int32.Parse(ddlroom.SelectedValue);
        cmd = new SqlCommand("update Roomtype set name=@name,description=@des,prise=@prise,size=@size,beds=@beds,fcharge=@fcharge,pcharge=@ccharge where rt_id="+rtid, sql);
        cmd.Parameters.AddWithValue("@name",txt_rname.Text);
        cmd.Parameters.AddWithValue("@des",txt_rdes.Text); 
        cmd.Parameters.AddWithValue("@prise",txt_rprise.Text);
        cmd.Parameters.AddWithValue("@size",txt_rsize.Text);
        cmd.Parameters.AddWithValue("@beds",txt_rbeds.Text);
        cmd.Parameters.AddWithValue("@fcharge",txt_fcharge.Text);
        cmd.Parameters.AddWithValue("@ccharge", txt_ccharge.Text);
        if(cmd.ExecuteNonQuery()>0)
        {
            txt_rname.Text = "";
            txt_rdes.Text = "";
            txt_rprise.Text = "";
            txt_rsize.Text = "";
            txt_rbeds.Text = "";
            txt_fcharge.Text = "";
            txt_ccharge.Text = "";
        }
        if (newroomimg.HasFile)
        {
            String tf = "Images/";
            String fl = Server.MapPath(tf);
            newroomimg.SaveAs(fl + newroomimg.FileName);
            cmd = new SqlCommand("update Roomtype set image=@newroom where rt_id='" + rtid + "'",sql);
            cmd.Parameters.AddWithValue("@newroom", newroomimg.FileName);
            int i = cmd.ExecuteNonQuery();
        }
    }
    public void getimg()
    {
        int rtid = Int32.Parse(ddlroom.SelectedValue);
        da = new SqlDataAdapter("select * from Roomtype where rt_Id='" + rtid + "'", sql);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            rptimg.DataSource = dt;
            rptimg.DataBind();
        }
    }
    protected void btn_delete_Click(object sender, EventArgs e)
    {
        int rtid = Int32.Parse(ddlroom.SelectedValue);
        cmd= new SqlCommand("DELETE FROM Roomtype WHERE rt_Id='"+rtid+"' " ,sql);
        if (cmd.ExecuteNonQuery() > 0)
        {
            Response.Write("<script> alert('Roomtype and Room both are deleted..');</script>");
        }
        else
        {
            Response.Write("<script> alert('Error..');</script>");
        }
    }
}