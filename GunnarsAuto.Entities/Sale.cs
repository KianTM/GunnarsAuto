using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.Entities
{
    public class Sale
    {
        public int SaleId { get; set; }
        public bool Sold { get; set; }
        public SalesPerson SalesPerson { get; set; }
        public Car Car { get; set; }
        public decimal BuyPrice { get; set; }
        public decimal SalesPrice { get; set; }
        public decimal TransactionFee
        {
            get
            {
                return BuyPrice - SalesPrice;
            }
        }

        public Sale(int saleId, bool sold, SalesPerson salesPerson, Car car, decimal buyPrice, decimal salesPrice)
        {
            SaleId = saleId;
            Sold = sold;
            SalesPerson = salesPerson;
            Car = car;
            BuyPrice = buyPrice;
            SalesPrice = salesPrice;
        }
    }
}
