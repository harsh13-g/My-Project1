using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }
    
    protected void btn_generate_Click(object sender, EventArgs e)
    {
        Response.Redirect("InReport.aspx?tdf="+txtfdt.Text+"&tdt="+txttdt.Text);
    }
    //protected void btn_d_gen_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("DInReport.aspx?dt=" + txtdate.Text);
    //}
}