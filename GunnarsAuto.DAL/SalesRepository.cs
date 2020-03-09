using Dapper;
using GunnarsAuto.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.DAL
{
    public class SalesRepository
    {
        public SalesRepository()
        {

        }

        public List<Sale> GetAll()
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<Sale>("GetAllSales").ToList();
            }
        }

        public Sale GetSingleSale(int saleId)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<Sale>("GetCar @CarId", saleId) as Sale;
            }
        }

        public void AddSale(Sale sale)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                connection.Execute("CreateSales @Sold, @SalesPerson, @Car, @BuyPrice, @SalesPrice, @BuyDate, @SalesDate", new { Sold = sale.Sold, SalesPerson = 1, Car = sale.Car.CarId, BuyPrice = sale.BuyPrice, SalesPrice = sale.SalesPrice, BuyDate = DateTime.Today, SalesDate = DateTime.Today});
            }
        }

        public void UpdateSale(Sale sale)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                connection.Execute("UpdateSales @SalesId @Sold, @SalesPerson, @Car, @BuyPrice, @SalesPrice", sale);
            }
        }

        public List<Sale> GetSalesBasedOnSalesPersonId(int salesPersonId)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<Sale>("GetSalesBySalesPerson @SalesPersonId", salesPersonId).ToList();
            }
        }
    }
}
