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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("/");
            }
            else
            {


            }
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

            SqlParameter param1, param2, param3, param4, param4_1, param5, param6;
            param1 = new SqlParameter("nazwa", SqlDbType.VarChar);
            param2 = new SqlParameter("model", SqlDbType.VarChar);
            param3 = new SqlParameter("cena", SqlDbType.VarChar);
            param4 = new SqlParameter("kategoria", SqlDbType.VarChar);
            param4_1 = new SqlParameter("grupa", SqlDbType.VarChar);
            param5 = new SqlParameter("podgrupa", SqlDbType.VarChar);
            param6 = new SqlParameter("dostepnosc", SqlDbType.VarChar);
            param1.Value = TextBoxnazwa.Text;
            param2.Value = TextBoxmodel.Text;
            param3.Value = TextBoxcena.Text;
            param4.Value = TextBoxkat.Text;
            param4_1.Value = TextBoxgrp.Text;
            param5.Value = TextBoxpgrp.Text;
            param6.Value = TextBoxdost.Text;
            String nazwa=Convert.ToString(param1.Value);

            prod_cmd_insert.Parameters.Add(param1);
            prod_cmd_insert.Parameters.Add(param2);
            prod_cmd_insert.Parameters.Add(param3);
            prod_cmd_insert.Parameters.Add(param4);
            prod_cmd_insert.Parameters.Add(param4_1);
            prod_cmd_insert.Parameters.Add(param5);
            prod_cmd_insert.Parameters.Add(param6);

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