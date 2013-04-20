using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace komp
{
    public partial class produkty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Koszyk_dodaj_Click(object sender, EventArgs e)
        {
            int koszyk_ile = 0;
            if (Session.Count > 0 && Session["koszyk_ile"].ToString() !=null)
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
                    + "  (userID,produktID)"
                    + "VALUES "
                    + "  ('" + int.Parse(Session["userID"].ToString()) + "','" + lab.Text + "')");


                kosz_cmd_insert.Connection = kosz_con;
                kosz_cmd_insert.ExecuteNonQuery();
                kosz_con.Close();

                //


            }
            
            Response.Redirect("/produkty.aspx");
        }
    }
}