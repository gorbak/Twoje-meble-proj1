using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace komp
{
    public partial class tlo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            linki_admin.Visible = false;
            if (Session.Count > 0 && Session["login"].ToString() != null)
            {
                linki_user.Visible = true;
                linki_logowanie.Visible = false;
                login_usera.InnerText = "" + Session["login"].ToString() + "";
            }
            else
            {
                linki_user.Visible = false;
                linki_admin.Visible = false;
                linki_logowanie.Visible = true;

            }
            if (Session.Count > 0 && Session["koszyk_ile"].ToString() != null)
            {
                label_koszyk.InnerText = Session["koszyk_ile"].ToString();
            }
            else if (Session.Count > 0 && Session["koszyk_ile"].ToString() == null)
            {
                Session["koszyk_ile"] = 0;
                label_koszyk.InnerText = Session["koszyk_ile"].ToString();
            }
            if (Session.Count > 0 && Session["uprawnienia"].ToString() == "admin")
            {
                linki_admin.Visible = true;
            }


        }
    }
}