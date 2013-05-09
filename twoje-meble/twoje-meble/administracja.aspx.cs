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
        protected void utworz_magazyn(int jaki)
        {
            SqlConnection mag_con,prod_con_upd2;
            SqlCommand mag_cmd_insert, prod_cmd_upd2;
            mag_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            mag_con.Open();
            mag_cmd_insert = new SqlCommand("INSERT INTO "
                + "Stan_magazynu "
                + "VALUES ('"+jaki+"','1')");

            SqlParameter param;
            param = new SqlParameter("jaki", SqlDbType.Int);
            param.Value = int.Parse(jaki.ToString());

            mag_cmd_insert.Parameters.Add(param);

            mag_cmd_insert.Connection = mag_con;
            mag_cmd_insert.ExecuteNonQuery();
            mag_con.Close();


            prod_con_upd2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            prod_con_upd2.Open();
            prod_cmd_upd2 = new SqlCommand("UPDATE produkty "
                + "SET ID_Magazynu=@jaki "
                + "WHERE ( produktID = '" + jaki + "')");

            SqlParameter param_mag;
            param_mag = new SqlParameter("jaki", SqlDbType.Int);
            param_mag.Value = jaki;

            prod_cmd_upd2.Parameters.Add(param_mag);

            prod_cmd_upd2.Connection = prod_con_upd2;
            prod_cmd_upd2.ExecuteNonQuery();
            prod_con_upd2.Close();

        }
        protected void dodaj_galerie(int gdzie,String nazwa)
        {
            SqlConnection prod_con_upd;
            SqlCommand prod_cmd_upd;
            prod_con_upd = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            prod_con_upd.Open();
            prod_cmd_upd = new SqlCommand("UPDATE produkty "
                + "SET galeria=@galeria "
                + "WHERE ( produktID = '"+gdzie+"')");

            SqlParameter param_galeria;
            param_galeria = new SqlParameter("galeria", SqlDbType.VarChar);
            param_galeria.Value = gdzie+nazwa;

            prod_cmd_upd.Parameters.Add(param_galeria);

            prod_cmd_upd.Connection = prod_con_upd;
            prod_cmd_upd.ExecuteNonQuery();
            prod_con_upd.Close();
        }


        protected void niewidoczne_opcje()
        {
            uzytkownicy_admin.Visible = false;
            produkty_admin.Visible = false;
            magazyn_admin.Visible = false;
            kategorie_admin_menu.Visible = false;
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
               case 4:
                  niewidoczne_opcje();
                  kategorie_admin_menu.Visible = true;
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

                    case 4:
                        m_a_4.Attributes.Add("class", "label_menu_admin wybrany");
                        opcja_wybrana(4);
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

            Sprawdz_magazyn.sprawdz();
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

        protected void button_dodaj_produkt_Click(object sender, EventArgs e)
        {
            SqlConnection prod_con;
            SqlCommand prod_cmd_insert;
            prod_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            prod_con.Open();
            prod_cmd_insert = new SqlCommand("INSERT INTO "
                +"produkty(nazwa, model, cena,KategoriaID,opis)"
                +"VALUES (@nazwa, @model, @cena,@kategoria,@opis)");

            SqlParameter param1, param2, param3, param4, param_opis;
            param1 = new SqlParameter("nazwa", SqlDbType.VarChar);
            param2 = new SqlParameter("model", SqlDbType.VarChar);
            param3 = new SqlParameter("cena", SqlDbType.VarChar);
            param4 = new SqlParameter("kategoria", SqlDbType.Int);
            param_opis = new SqlParameter("opis", SqlDbType.VarChar);
            param1.Value = TextBoxnazwa.Text;
            param2.Value = TextBoxmodel.Text;
            param3.Value = TextBoxcena.Text;
            param4.Value = DropDownkat.SelectedValue;
            param_opis.Value = text_opis_admin.Text;

            String nazwa=Convert.ToString(param1.Value);

            prod_cmd_insert.Parameters.Add(param1);
            prod_cmd_insert.Parameters.Add(param2);
            prod_cmd_insert.Parameters.Add(param3);
            prod_cmd_insert.Parameters.Add(param4);
            prod_cmd_insert.Parameters.Add(param_opis);

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

            dodaj_galerie(int.Parse(idx),TextBoxnazwa.Text);
            utworz_magazyn(int.Parse(idx.ToString()));
            Response.Redirect("/admin/");

        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1_magazyn.EditItemIndex = e.Item.ItemIndex;
            DataList1_magazyn.DataBind();
        }

        protected void DataList1_magazyn_UpdateCommand(object source, DataListCommandEventArgs e)
        {

            String ProduktID =
                  DataList1_magazyn.DataKeys[e.Item.ItemIndex].ToString();
            Int32 ilosc =
                 int.Parse(((TextBox)e.Item.FindControl("iloscLabel_e")).Text);

            DS_magazyn_admin.UpdateParameters["ProduktID_org"].DefaultValue
               = ProduktID;
            DS_magazyn_admin.UpdateParameters["ilosc"].DefaultValue
                = ilosc.ToString();
            DS_magazyn_admin.Update();

            DataList1_magazyn.EditItemIndex = -1;
            DataList1_magazyn.DataBind();
        }

        protected void DS_Produkty_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList_produkty.EditItemIndex = e.Item.ItemIndex;
            DataList_produkty.DataBind();
        }

        protected void DS_Produkty_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            String ProduktID =
      DataList_produkty.DataKeys[e.Item.ItemIndex].ToString();
            Int32 ilosc =
                 int.Parse(((TextBox)e.Item.FindControl("iloscLabel_e")).Text);

            SqlDataSource_produkty.UpdateParameters["ProduktID_org"].DefaultValue
               = ProduktID;
            SqlDataSource_produkty.UpdateParameters["ilosc"].DefaultValue
                = ilosc.ToString();
            SqlDataSource_produkty.Update();

            DataList_produkty.EditItemIndex = -1;
            DataList_produkty.DataBind();
        }
    }
}