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

        public SalesPerson(int salesPersonId, string firstName, string lastName, string initials, bool hired)
        {
            SalesPersonId = salesPersonId;
            FirstName = firstName;
            LastName = lastName;
            Initials = initials;
            Hired = hired;
        }

        public SalesPerson(string firstName, string lastName, string initials, bool hired)
        {
            FirstName = firstName;
            LastName = lastName;
            Initials = initials;
            Hired = hired;
        }

        public override string ToString()
        {
            string isHired = "nej";
            if (Hired)
            {
                isHired = "ja";
            }
            return $"Fornavn: {FirstName}\nEfternavn: {LastName}\nInitialer: {Initials}\nAnsat: {isHired}";
        }
    }
}
