using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CancelReciept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        lbl_cnm.Text = Request.QueryString["nm".ToString()];
        lbl_rmt.Text = Request.QueryString["rnm".ToString()];
        lbl_rno.Text = Request.QueryString["rno".ToString()];
        cdt.Text = Request.QueryString["cdt".ToString()];
        bdt.Text = Request.QueryString["bdt".ToString()];
        cin.Text = Request.QueryString["cin".ToString()];
        cout.Text = Request.QueryString["cout".ToString()];
        bamt.Text = Request.QueryString["bamt".ToString()];
        camt.Text = Request.QueryString["cch".ToString()];
        ramt.Text = Request.QueryString["ramt".ToString()];
    }
    protected void btn_goback_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyProfile.aspx");
    }
}