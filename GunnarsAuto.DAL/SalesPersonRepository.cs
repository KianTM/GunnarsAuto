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
    class SalesPersonRepository
    {
        public SalesPersonRepository()
        {

        }

        public List<SalesPerson> GetAll()
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<SalesPerson>("GetAllSalesPersons").ToList();
            }
        }

        public Car GetSingleSalesPerson(int salesPersonId)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<SalesPerson>("GetSalesPerson @CarId", salesPersonId) as Car;
            }
        }
    }
}
