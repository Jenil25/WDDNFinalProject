using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Try2
{
    public partial class _Default : Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP 3 * FROM Movie";
            con.Open();
            Repeater1.DataSource = cmd.ExecuteReader();
            Repeater1.DataBind();
            con.Close();

            cmd.CommandText = "SELECT TOP 3 * FROM Movie";
            con.Open();
            Repeater2.DataSource = cmd.ExecuteReader();
            Repeater2.DataBind();
            con.Close();

            cmd.CommandText = "SELECT TOP 3 * FROM WebSeries";
            con.Open();
            Repeater3.DataSource = cmd.ExecuteReader();
            Repeater3.DataBind();
            con.Close();
        }
    }
}