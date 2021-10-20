using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Try2.MoviePage
{
    public partial class moviePage : System.Web.UI.Page
    {
        public SqlDataReader Moviedata, Genredata, alreadyPurchased;
        public string title="",genre="",desc="",rating="",poster="",trailer="",rent="",movie="";

        protected void BuyBtn_Click1(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated) // if the user is already logged in
            {
                var Ids = Request.QueryString["Id"];
                int Id = int.Parse(Ids);
                var uid = User.Identity.GetUserId();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                cmd.Connection = con;

                string checkpurchase = "SELECT * FROM Purchases WHERE movie_id = " + Id + " AND user_id = '" + uid+"'";
                cmd.CommandText = checkpurchase;
                con.Open();
                alreadyPurchased = cmd.ExecuteReader();
                if (alreadyPurchased.Read())
                {
                    string download = "/downloadPage.aspx?Id=" + Id;
                    Response.Redirect(download);
                }
                con.Close();
                string buypage = "/purchasePage.aspx?Id=" + Ids;
                Response.Redirect(buypage);
            }
            else
            {
                Response.Redirect("/Account/Login.aspx");
            }
        }

        SqlConnection con,genrecon;
        SqlCommand cmd = new SqlCommand();
        SqlCommand genrecmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Ids = Request.QueryString["Id"];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            genrecon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            
            cmd.Connection = con;
            genrecmd.Connection = genrecon;

            int Id = int.Parse(Ids);
            string query = "SELECT * FROM Movie WHERE Id = " + Id;
            cmd.CommandText = query;
            con.Open();
            Moviedata = cmd.ExecuteReader();
            if (Moviedata.Read())
            {
                title = Moviedata.GetString(1);
                desc = Moviedata.GetString(2);
                int genreId = Moviedata.GetInt32(3);
                query = "SELECT genre FROM Genre WHERE Id = " + genreId;
                genrecmd.CommandText = query;
                genrecon.Open();
                Genredata = genrecmd.ExecuteReader();
                if (Genredata.Read())
                    genre = Genredata.GetString(0);
                genrecon.Close();
                rating = Moviedata.GetString(4);
                poster = Moviedata.GetString(5);
                trailer = Moviedata.GetString(6);
                rent = Moviedata.GetString(7);
                movie = Moviedata.GetString(8);
            }
            con.Close();
            query = "SELECT * FROM MovieImages WHERE movie_id = " + Id;
            cmd.CommandText = query;
            con.Open();
            ImagesRepeater.DataSource = cmd.ExecuteReader();
            ImagesRepeater.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated) // if the user is already logged in
            {
                var Ids = Request.QueryString["Id"];
                int Id = int.Parse(Ids);
                var uid = User.Identity.GetUserId();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                cmd.Connection = con;

                string checkpurchase = "SELECT * FROM Rents WHERE movie_id = " + Id + " AND user_id = '" + uid + "'";
                cmd.CommandText = checkpurchase;
                con.Open();
                alreadyPurchased = cmd.ExecuteReader();
                if (alreadyPurchased.Read())
                {
                    string player = "/onlinePlayer.aspx?Id=" + Id;
                    Response.Redirect(player);
                }
                con.Close();
                string rentpage = "/rentPage.aspx?Id=" + Ids;
                Response.Redirect(rentpage);
            }
            else
            {
                Response.Redirect("/Account/Login.aspx");
            }
        }
    }
}