using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace Jobeet.Models
{
    public static class Utils
    {
        public static string Slugify(string text)
        {
            // replace all non letters or digits by -
            text = Regex.Replace(text, "[^\\w]+", "-");

            // trim and lowercase
            text = text.Replace(' ', '-').ToLower();

            return text;
        }
    }
}