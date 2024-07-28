using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        String con = ConfigurationManager.ConnectionStrings["hotel"].ToString();
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        string name = txtname.Text;
        string email = txtemail.Text;
        string mobile = txtmobile.Text;
        string pass = txtpass.Text;
        string img = "null.jpg";
        string date = DateTime.Now.ToString("MM/dd/yyyy");

        da = new SqlDataAdapter("SELECT * FROM Coustomer WHERE c_email = '" + email + "'", sql);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_motion.Text = "This email is registred.";
        }
        else
        {
            cmd = new SqlCommand("INSERT INTO Coustomer VALUES('" + name + "','" + email + "','" + mobile + "','" + pass + "','" + img + "','" + date + "')", sql);
            if ((cmd.ExecuteNonQuery()) > 0)
            {
                Response.Redirect("Login.aspx");
                txtemail.Text = "";
                lbl_motion.Text = "";
                
            }
        }
    }
}