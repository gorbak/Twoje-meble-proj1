using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace komp
{
    public class Global : System.Web.HttpApplication
    {


        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("",
                "szukaj",
                "~/szukaj.aspx");
            routes.MapPageRoute("x",
            "kategoria/{kategoria}",
            "~/kategoria.aspx");
            routes.MapPageRoute("",
            "konsultant",
            "~/konsultant.aspx");
            routes.MapPageRoute("y",
            "produkt/{produkt}",
            "~/produkt.aspx");
            routes.MapPageRoute("",
            "rezerwuj/",
            "~/rezerwuj.aspx");
            routes.MapPageRoute("",
            "admin/",
            "~/administracja.aspx");
            routes.MapPageRoute("",
            "admin/{menu_admin}",
            "~/administracja.aspx");
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}