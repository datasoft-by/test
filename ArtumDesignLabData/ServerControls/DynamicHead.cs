using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace ArtumDesignLab.ServerControls
{
    public class DynamicHead : Control
    {
        protected override void Render(HtmlTextWriter output)
        {
            output.Write(String.Format("<meta name=\"description\" content=\"{0} \"/>", Description));
            output.Write(String.Format("<meta name=\"keywords\" content=\"{0} \"/>", KeyWords));
            base.Render(output);
        }
        public string Description
        {
            get; set;
        }
        public string KeyWords
        {
            get;
            set;
        }
    }
}
