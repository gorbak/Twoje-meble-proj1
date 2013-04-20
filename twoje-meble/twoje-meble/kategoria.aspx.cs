using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace komp
{
    public partial class kategoria : System.Web.UI.Page
    {
        String nazwa_kat;
        protected void Pobierz_nazwe_kategorii()
        {

            SqlConnection katxx_con;
            SqlCommand katxx_cmd_Sel;
            SqlDataReader rdkatxx;


            katxx_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            katxx_con.Open();
            katxx_cmd_Sel = new SqlCommand("Select nazwa from Kategoria where KategoriaID = '" + Convert.ToInt32(Page.RouteData.Values["kategoria"]) + "'");


            katxx_cmd_Sel.Connection = katxx_con;
            rdkatxx = katxx_cmd_Sel.ExecuteReader();

            if (rdkatxx.HasRows)
            {
                while (rdkatxx.Read())
                {

                    nazwa_kat = rdkatxx.GetValue(0).ToString();
                }
            }

            katxx_con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            nazwa_kat = "Brak Kategorii";
            Pobierz_nazwe_kategorii();

            if (nazwa_kat == "Brak Kategorii")
            {
                Labelglowny.InnerText = "Nie wybrano kategorii!!!";
            }
            else
            {
                Labelglowny.InnerText = "Produkty z kategorii \"" + nazwa_kat + "\"";
            }

        }
        protected void Koszyk_dodaj_Click(object sender, EventArgs e)
        {
            int koszyk_ile = 0;
            if (Session.Count > 0 && Session["koszyk_ile"].ToString() != null)
            {
                koszyk_ile = int.Parse(Session["koszyk_ile"].ToString());
            }
            if (Session.Count > 0 && Session["login"].ToString() != null)
            {

                koszyk_ile += 1;
                Session["koszyk_ile"] = koszyk_ile;
                //

                Button btn = sender as Button;
                DataListItem item = btn.NamingContainer as DataListItem;
                Label lab = item.FindControl("produktIDLabel") as Label;

                SqlConnection kosz_con;
                SqlCommand kosz_cmd_insert;
                kosz_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                kosz_con.Open();
                kosz_cmd_insert = new SqlCommand("INSERT INTO Koszyk"
                    + "  (Login,produktID)"
                    + "VALUES "
                    + "  ('" + Session["login"].ToString() + "','" + lab.Text + "')");


                kosz_cmd_insert.Connection = kosz_con;
                kosz_cmd_insert.ExecuteNonQuery();
                kosz_con.Close();

                //


            }

            Response.Redirect("/produkty.aspx");
        }
    }
}