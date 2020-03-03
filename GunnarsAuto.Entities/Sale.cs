using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.Entities
{
    public class Sale
    {
        public int SalesId { get; set; }
        public bool Sold { get; set; }
        public SalesPerson SalesPerson { get; set; }
        public Car Car { get; set; }
        public decimal BuyPrice { get; set; }
        public decimal SalesPrice { get; set; }
        public DateTime BuyDate { get; set; }
        public DateTime SalesDate { get; set; }
        public decimal TransactionFee
        {
            get
            {
                return BuyPrice - SalesPrice;
            }
        }

        public Sale()
        {

        }
        public Sale(int salesId, bool sold, SalesPerson salesPerson, Car car, decimal buyPrice, decimal salesPrice)
        {
            SalesId = salesId;
            Sold = sold;
            SalesPerson = salesPerson;
            Car = car;
            BuyPrice = buyPrice;
            SalesPrice = salesPrice;
            BuyDate = DateTime.Today;
        }

        public Sale(bool sold, SalesPerson salesPerson, Car car, decimal buyPrice, decimal salesPrice)
        {            
            Sold = sold;
            SalesPerson = salesPerson;
            Car = car;
            BuyPrice = buyPrice;
            SalesPrice = salesPrice;
            BuyDate = DateTime.Today;
        }

        public override string ToString()
        {
            string solgt = "nej";
            if (Sold)
            {
                solgt = "ja";
            }
            return $"Salg DB Id: {SalesId}\nEr bilen solgt: {solgt}\nSælger: {SalesPerson}\nBil: {Car}\nIndkøbspris: {BuyPrice}\nSalgspris: {SalesPrice}\nKøbt: {BuyDate}\nSolgt: {SalesDate}";
        }
    }
}
