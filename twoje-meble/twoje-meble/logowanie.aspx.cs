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
    public partial class logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            div_bledy.Style["display"] = "none";
        }

        protected void Zaloguj_Click(object sender, EventArgs e)
        {

            Login_text.Style["color"] = "black";
            Haslo_text.Style["color"] = "black";
            List<String> bledy = new List<String>();

            SqlConnection log_con;
            SqlCommand log_cmd_Sel, log_cmd_sel2;
            SqlDataReader rd;


            String login2 = login.Text;  //\/\/\/\/\//

            log_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            log_con.Open();
            log_cmd_Sel = new SqlCommand("Select * from uzytkownicy where login = '"+login.Text+"' AND haslo = '"+haslo.Text+"'");

 
            SqlParameter param1,param2;
            param1 = new SqlParameter("login", SqlDbType.VarChar);
            param2 = new SqlParameter("haslo", SqlDbType.VarChar);
            param1.Value = login.Text;
            param2.Value = haslo.Text;
            log_cmd_Sel.Parameters.Add(param1);
            log_cmd_Sel.Parameters.Add(param2);
            

            log_cmd_Sel.Connection = log_con;
            rd = log_cmd_Sel.ExecuteReader();

            if (rd.HasRows)
            {
                while (rd.Read())
                {


                        Session["userID"] = rd.GetValue(0);
                        Session["login"] = rd.GetValue(4);
                        Session["haslo"] = rd.GetValue(5);

                        Session["Imie"] = rd.GetValue(1);
                        Session["Nazwisko"] = rd.GetValue(2);
                        Session["mail"] = rd.GetValue(3);
                        Session["uprawnienia"] = rd.GetValue(7);
                        Session["koszyk_ile"] = 0;

                        Session.Timeout = 60;

                    if (checkbox_zapamietaj.Checked)
                    {

                        Session.Timeout = 30 * 60;
                    }
                }


            }
            else
            {
                bledy.Add("Haslo lub login niepoprawne!");
                Login_text.Style["color"] = "red";
                Haslo_text.Style["color"] = "red";
            }



            log_con.Close();

            ////
            if (Session.Count > 0 && Session["login"].ToString() != null)
            {
                SqlConnection logxx_con;
                SqlCommand logxx_cmd_Sel;
                SqlDataReader rdxx;


                logxx_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                logxx_con.Open();
                logxx_cmd_Sel = new SqlCommand("Select COUNT(*) from Koszyk where userID = '" + Convert.ToInt32(Session["userID"].ToString()) + "'");


                logxx_cmd_Sel.Connection = logxx_con;
                rdxx = logxx_cmd_Sel.ExecuteReader();

                if (rdxx.HasRows)
                {
                    while (rdxx.Read())
                    {

                        Session["koszyk_ile"] = rdxx.GetValue(0);
                    }
                }

                logxx_con.Close();
            }
            ////
            if (login.Text.Length == 0)
            {

                bledy.Add("Pole \"login\" nie może być puste!");
                Login_text.Style["color"] = "red";

            }
            if (haslo.Text.Length == 0)
            {

                bledy.Add("Pole \"haslo\" nie może być puste!");
                Haslo_text.Style["color"] = "red";

            }
         
            Label1_b.Text = "";
            if (bledy.Count > 0)
            {
                div_bledy.Style["display"] = "block";
                for (int z = 0; z < bledy.Count; z++)
                {

                    Label1_b.Text += "" + bledy[z] + "<br />";
                }

            }
            else
            {



                Response.Redirect("/");
            }
        }


    }
}