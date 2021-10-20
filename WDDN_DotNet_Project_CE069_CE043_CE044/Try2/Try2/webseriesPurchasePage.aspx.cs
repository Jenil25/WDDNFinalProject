using Microsoft.AspNet.Identity;
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
    public partial class webseriesPurchasePage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        public int price;
        protected void Page_Load(object sender, EventArgs e)
        {
            var uid = User.Identity.GetUserId();
            var Ids = Request.QueryString["Id"];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            cmd.Connection = con;

            int Id = int.Parse(Ids);
            string query = "SELECT purchase_price FROM WebSeries WHERE Id = " + Id;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader Seriesdata = cmd.ExecuteReader();
            if (Seriesdata.Read())
            {
                price = Seriesdata.GetInt32(0);
            }
            con.Close();
        }

        protected void Button_Click1(object sender, EventArgs e)
        {
            var uid = User.Identity.GetUserId();
            var Ids = Request.QueryString["Id"];
            string query = "INSERT INTO WebSeriesPurchases (series_id,user_id) VALUES (" + Ids + ", '" + uid + "')";
            cmd.CommandText = query;
            con.Open();
            cmd.ExecuteReader();
            con.Close();
            int Id = int.Parse(Ids);
            string download = "/webseriesDownloadPage.aspx?Id=" + Id;
            Response.Redirect(download);
        }
    }
}