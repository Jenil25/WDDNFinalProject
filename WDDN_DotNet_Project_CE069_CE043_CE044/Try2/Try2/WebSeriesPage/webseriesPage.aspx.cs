using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Try2.WebSeriesPage
{
    public partial class webseriesPage : System.Web.UI.Page
    {
        public SqlDataReader Seriesdata, Genredata, alreadyPurchased;
        public string title = "", genre = "", desc = "", rating = "", poster = "",
            trailer = "", rent = "", series = "";

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated) // if the user is already logged in
            {
                var Ids = Request.QueryString["Id"];
                int Id = int.Parse(Ids);
                var uid = User.Identity.GetUserId();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                cmd.Connection = con;

                string checkpurchase = "SELECT * FROM WebSeriesRents WHERE series_id = " + Id + " AND user_id = '" + uid + "'";
                cmd.CommandText = checkpurchase;
                con.Open();
                alreadyPurchased = cmd.ExecuteReader();
                if (alreadyPurchased.Read())
                {
                    string player = "/webseriesOnlinePlayer.aspx?Id=" + Id;
                    Response.Redirect(player);
                }
                con.Close();
                string rentpage = "/webseriesRentPage.aspx?Id=" + Ids;
                Response.Redirect(rentpage);
            }
            else
            {
                Response.Redirect("/Account/Login.aspx");
            }
        }

        protected void BuyBtn_Click1(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated) // if the user is already logged in
            {
                var Ids = Request.QueryString["Id"];
                int Id = int.Parse(Ids);
                var uid = User.Identity.GetUserId();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                cmd.Connection = con;

                string checkpurchase = "SELECT * FROM WebSeriesPurchases WHERE series_id = " + Id + " AND user_id = '" + uid + "'";
                cmd.CommandText = checkpurchase;
                con.Open();
                alreadyPurchased = cmd.ExecuteReader();
                if (alreadyPurchased.Read())
                {
                    string download = "/webseriesDownloadPage.aspx?Id=" + Id;
                    Response.Redirect(download);
                }
                con.Close();
                string buypage = "/webseriesPurchasePage.aspx?Id=" + Ids;
                Response.Redirect(buypage);
            }
            else
            {
                Response.Redirect("/Account/Login.aspx");
            }
        }

        SqlConnection con, genrecon;
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
            string query = "SELECT * FROM WebSeries WHERE Id = " + Id;
            cmd.CommandText = query;
            con.Open();
            Seriesdata = cmd.ExecuteReader();
            if (Seriesdata.Read())
            {
                title = Seriesdata.GetString(1);
                desc = Seriesdata.GetString(2);
                int genreId = Seriesdata.GetInt32(3);
                query = "SELECT genre FROM Genre WHERE Id = " + genreId;
                genrecmd.CommandText = query;
                genrecon.Open();
                Genredata = genrecmd.ExecuteReader();
                if (Genredata.Read())
                    genre = Genredata.GetString(0);
                genrecon.Close();
                rating = Seriesdata.GetString(4);
                poster = Seriesdata.GetString(5);
                trailer = Seriesdata.GetString(6);
                rent = Seriesdata.GetString(7);
                series = Seriesdata.GetString(8);
            }
            con.Close();
            query = "SELECT * FROM WebSeriesImages WHERE series_id = " + Id;
            cmd.CommandText = query;
            con.Open();
            ImagesRepeater.DataSource = cmd.ExecuteReader();
            ImagesRepeater.DataBind();
            con.Close();
        }

    }
}