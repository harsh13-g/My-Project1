using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Index : System.Web.UI.Page
{
    static int currentposition = 0;
    static int totalrows = 0;
    SqlCommand cmd;
    DataSet ds;
    SqlConnection sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getcat();
            getdata();
            getreview();
        }
           
    }
    public void getcat()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Roomtype";
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            rptcatdisp.DataSource = dt;
            rptcatdisp.DataBind();
        }
    }
    public void getdata()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "select * from Hotel_Details where hd_Id='" + 1 + "'";
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        lbl_name.Text = ds.Tables[0].Rows[0][1].ToString();
        lbl_des.Text = ds.Tables[0].Rows[0][2].ToString();
        rptscroll.DataSource = ds;
        rptscroll.DataBind();
    }
    public void getreview()
    {
        string con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string sel = "SELECT rv.rv_name,rv.rv_message,format(rv.rv_date,'dd/MM/yyyy') as date,c.c_image FROM Review rv LEFT JOIN Coustomer c ON rv.cid=c.c_id ";
        SqlCommand cmd = new SqlCommand(sel, sql);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        totalrows = ds.Tables[0].Rows.Count;
        DataTable dt = ds.Tables[0];
        PagedDataSource pg = new PagedDataSource();
        pg.DataSource = dt.DefaultView;
        pg.AllowPaging = true;
        pg.CurrentPageIndex = currentposition;
        pg.PageSize = 1;
        btn_three.Enabled = !pg.IsFirstPage;
        btn_one.Enabled = !pg.IsFirstPage;
        btn_two.Enabled = !pg.IsLastPage;
        btn_four.Enabled = !pg.IsLastPage;
        ddl_rev.DataSource = pg;
        ddl_rev.DataBind();
    }
    protected void btn_one_Click(object sender, EventArgs e)
    {
        currentposition = 0;
        getreview();
    }
    protected void btn_two_Click(object sender, EventArgs e)
    {
        if (currentposition == 0)
        {

        }
        else
        {
            currentposition = currentposition + 1;
            getreview();
        }
    }
    protected void btn_three_Click(object sender, EventArgs e)
    {
        if (currentposition == 0)
        {

        }
        else
        {
            currentposition = currentposition - 1;
            getreview();
        }
    }
    protected void btn_four_Click(object sender, EventArgs e)
    {
        currentposition = totalrows - 1;
        getreview();
    }
}