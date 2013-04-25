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
    public partial class administracja : System.Web.UI.Page
    {
        protected void niewidoczne_opcje()
        {
            uzytkownicy_admin.Visible = false;
            produkty_admin.Visible = false;
            magazyn_admin.Visible = false;
        }
        protected void opcja_wybrana(int opcja)
        {

            switch(opcja){
                case 1:
            niewidoczne_opcje();
            produkty_admin.Visible = true;
                    break;
                case 2:
            niewidoczne_opcje();
            uzytkownicy_admin.Visible = true;
                    break;
               case 3:
                    niewidoczne_opcje();
                    magazyn_admin.Visible = true;
                  break;

                default:
            niewidoczne_opcje();
            produkty_admin.Visible = true;
                    break;
            }


        }
        protected void Sprawdz_opcje_menu_admina()
        {

            if (Page.RouteData.Values["menu_admin"] != null)
            {

                switch (int.Parse(Page.RouteData.Values["menu_admin"].ToString()))
                {

                    case 1:
                        m_a_1.Attributes.Add("class", "label_menu_admin wybrany");
                        opcja_wybrana(1);
                        break;

                    case 2:
                        m_a_2.Attributes.Add("class", "label_menu_admin wybrany");
                        opcja_wybrana(2);
                        break;

                    case 3:
                        m_a_3.Attributes.Add("class", "label_menu_admin wybrany");
                        opcja_wybrana(3);
                        break;

                    default:
                        m_a_1.Attributes.Add("class", "label_menu_admin wybrany");
                        opcja_wybrana(1);
                        break;

                }
            }
            else
            {
                m_a_1.Attributes.Add("class", "label_menu_admin wybrany");
                opcja_wybrana(1);
            }

         


        }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session.Count == 0)
            {
                Response.Redirect("/");
            }
            else if (Session.Count>0 && Session["uprawnienia"].ToString()!="admin")
            {
                Response.Redirect("/");

            }



            Sprawdz_opcje_menu_admina();
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection prod_con;
            SqlCommand prod_cmd_insert;
            prod_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            prod_con.Open();
            prod_cmd_insert = new SqlCommand("INSERT INTO "
                +"produkty(nazwa, model, cena,kategoria, grupa, podgrupa, dostepnosc)"
                +"VALUES (@nazwa, @model, @cena,@kategoria, @grupa, @podgrupa, @dostepnosc)");

            SqlParameter param1, param2, param3, param4;
            param1 = new SqlParameter("nazwa", SqlDbType.VarChar);
            param2 = new SqlParameter("model", SqlDbType.VarChar);
            param3 = new SqlParameter("cena", SqlDbType.VarChar);
            param4 = new SqlParameter("kategoria", SqlDbType.Int);
            param1.Value = TextBoxnazwa.Text;
            param2.Value = TextBoxmodel.Text;
            param3.Value = TextBoxcena.Text;
            param4.Value = DropDownkat.SelectedValue;

            String nazwa=Convert.ToString(param1.Value);

            prod_cmd_insert.Parameters.Add(param1);
            prod_cmd_insert.Parameters.Add(param2);
            prod_cmd_insert.Parameters.Add(param3);
            prod_cmd_insert.Parameters.Add(param4);

            prod_cmd_insert.Connection = prod_con;
            prod_cmd_insert.ExecuteNonQuery();


            
            prod_con.Close();

            String idx = "1";
             SqlConnection log_con;
            SqlCommand log_cmd_Sel, log_cmd_sel2;
            SqlDataReader rd;


            log_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            log_con.Open();
            log_cmd_Sel = new SqlCommand("select top 1 * from produkty order by produktID desc");


            log_cmd_Sel.Connection = log_con;
            rd = log_cmd_Sel.ExecuteReader();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                        idx = Convert.ToString(rd.GetValue(0));
                }


            }
            log_con.Close();

            if (FileUploadmin.HasFile)
            {

                FileUploadmin.SaveAs(Server.MapPath("~/zdjecia/produkty/") + nazwa + idx +".jpg");

            }
        }
    }
}