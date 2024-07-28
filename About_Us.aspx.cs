using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class About_Us : System.Web.UI.Page
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
            lbl_name.Text = ds.Tables[0].Rows[0][1].ToString();
            lbl_det.Text = ds.Tables[0].Rows[0][3].ToString();
        }
    }
}