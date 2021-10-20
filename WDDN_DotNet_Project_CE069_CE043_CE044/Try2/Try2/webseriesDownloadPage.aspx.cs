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
    public partial class webseriesDownloadPage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        public string filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            var Ids = Request.QueryString["Id"];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            cmd.Connection = con;

            int Id = int.Parse(Ids);
            string query = "SELECT series FROM WebSeries WHERE Id = " + Id;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader Moviedata = cmd.ExecuteReader();
            if (Moviedata.Read())
            {
                filepath = Moviedata.GetString(0);
            }
            con.Close();
        }
    }
}