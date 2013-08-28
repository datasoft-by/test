using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ArtumDesignLab.Utils
{
    public static class DateTimeHelper
    {
        public static string GetMonthName(int iMonth)
        {
            string[] months = {"января", "февраля", "марта", "апреля", "мая", "июня",
                               "июля", "августа", "сентября", "октября", "ноября", "декабря"};

            if (iMonth >= 1 && iMonth <= 12)
                return months[iMonth - 1];

            return string.Empty;
        }

        public static string GetDateInReadableFormat(DateTime date)
        {
            return date.Day + " " + DateTimeHelper.GetMonthName(date.Month) + " " + date.Year;
        }
    }
}
