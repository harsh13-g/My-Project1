using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Customers : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            da = new SqlDataAdapter("select c_id,c_name,c_email,c_mobile,c_image,format(reg_date,'dd-MM-yyyy') as r_date from Coustomer", sql);
            ds = new DataSet();
            da.Fill(ds);
            rptcus.DataSource = ds;
            rptcus.DataBind();
        }
    }
}