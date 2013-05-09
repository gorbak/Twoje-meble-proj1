using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace komp
{
    public class Sprawdz_magazyn
    {

        static public void sprawdz()
        {
            // uruchamia procedure update na magazynie i produktach która zmienia dostepność produktów
            SqlConnection magazyn_conn;
            SqlCommand magazyn_procedura;

            magazyn_conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            magazyn_conn.Open();
            magazyn_procedura = new SqlCommand("exec sprawdz_magazyn 0");

            magazyn_procedura.Connection = magazyn_conn;
            magazyn_procedura.ExecuteNonQuery();
            magazyn_conn.Close();
        }

    }
}