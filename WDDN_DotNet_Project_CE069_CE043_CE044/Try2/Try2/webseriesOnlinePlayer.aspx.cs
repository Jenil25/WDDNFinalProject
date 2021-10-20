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
    public partial class webseriesOnlinePlayer : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        public string link;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Ids = Request.QueryString["Id"];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            cmd.Connection = con;

            int Id = int.Parse(Ids);
            string query = "SELECT series_rent FROM WebSeries WHERE Id = " + Id;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader Seriesdata = cmd.ExecuteReader();
            if (Seriesdata.Read())
            {
                link = Seriesdata.GetString(0);
            }
            con.Close();
        }
    }
}