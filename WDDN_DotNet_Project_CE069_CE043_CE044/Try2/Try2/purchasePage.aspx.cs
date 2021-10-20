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
    public partial class purchasePage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        public int price;

        protected void Button_Click1(object sender, EventArgs e)
        {
            var uid = User.Identity.GetUserId();
            var Ids = Request.QueryString["Id"];
            string query = "INSERT INTO Purchases (movie_id,user_id) VALUES ("+Ids+", '"+uid+"')";
            cmd.CommandText = query;
            con.Open();
            cmd.ExecuteReader();
            con.Close();
            int Id = int.Parse(Ids);
            string download = "/downloadPage.aspx?Id=" + Id;
            Response.Redirect(download);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var uid = User.Identity.GetUserId();
            var Ids = Request.QueryString["Id"];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            cmd.Connection = con;

            int Id = int.Parse(Ids);
            string query = "SELECT purchase_price FROM Movie WHERE Id = " + Id;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader Moviedata = cmd.ExecuteReader();
            if (Moviedata.Read())
            {
                price = Moviedata.GetInt32(0);
            }
            con.Close();
        }
    }
}