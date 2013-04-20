using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace komp
{
    public partial class szukaj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

                Label155.InnerText = "Wyniki wyszukiwania dla \"" + Request.QueryString["q"] + "\"";

                div_labelxx.Visible = false;
                if (DataList1.Items.Count == 0)
                {
                    div_labelxx.Visible = true;
                    Labelxx.InnerText = "Brak wyników!";

                }
                
        }
    }
}