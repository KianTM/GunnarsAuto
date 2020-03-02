using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.Entities
{
    public class SalesPerson
    {
        public int SalesPersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Initials { get; set; }
        public bool Hired { get; set; }

        public override string ToString()
        {
            string isHired = "nej";
            if (Hired == true)
            {
                isHired = "ja";
            }
            return $"Fornavn: {FirstName}\nEfternavn: {LastName}\nInitialer: {Initials}\nAnsat: {isHired}";
        }
    }
}
