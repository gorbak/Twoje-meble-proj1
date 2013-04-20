using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace komp
{
    public partial class koszyk : System.Web.UI.Page
    {
        protected void usun_z_koszyka(object sender, EventArgs e)
        {

            SqlConnection kosz_xcon;
            SqlCommand kosz_cmd_del;

            String polecenie = "DELETE FROM Koszyk WHERE  (userID = '"+int.Parse(Session["userID"].ToString())+"')";

            kosz_xcon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            kosz_cmd_del = new SqlCommand(polecenie,kosz_xcon);
            kosz_xcon.Open();

            kosz_cmd_del.ExecuteNonQuery();
            kosz_xcon.Close();
            Session["koszyk_ile"] = 0;
            Response.Redirect("koszyk.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("/");
            }
            else
            {

                List<String> produkty = new List<String>();

                SqlConnection kosz_con;
                SqlCommand kosz_cmd_Sel, kosz_cmd_Sel2;
                SqlDataReader rd,rdx;


                kosz_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                kosz_con.Open();
                kosz_cmd_Sel = new SqlCommand("Select * from Koszyk where userID = '" + Convert.ToInt32(Session["userID"].ToString()) + "'");



                kosz_cmd_Sel.Connection = kosz_con;
                rd = kosz_cmd_Sel.ExecuteReader();

                if (rd.HasRows)
                {
                    while (rd.Read())
                    {


                        produkty.Add(""+rd.GetValue(2));

                    }
                }

                kosz_con.Close();
                //////////////////////////////////
                int cena = 0;
                zawartosc_koszyka.InnerHtml = "";
                for (int z = 0; z < produkty.Count; z++)
                {
                    kosz_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                    kosz_con.Open();
                    kosz_cmd_Sel = new SqlCommand("Select * from produkty where produktID = '" + produkty[z] + "'");



                    kosz_cmd_Sel.Connection = kosz_con;
                    rd = kosz_cmd_Sel.ExecuteReader();

                    if (rd.HasRows)
                    {
                        while (rd.Read())
                        {


                            zawartosc_koszyka.InnerHtml += "<div style='width:120px;background:#fc6;margin:4px;padding:3px;'>nazwa: " + rd.GetValue(1) + "<br />"
                            + "model: " + rd.GetValue(6) + "<br />"
                            + "cena: " + rd.GetValue(4) + " ZŁ</div>";
                            cena += int.Parse(Convert.ToString(rd.GetValue(4)));
                        }
                    }

                    kosz_con.Close();
                }

                Div11111.InnerHtml = "Łączna cena: " + cena + " ZŁ <br />";
                div2222.Visible = true;
            }
        }
    }
}