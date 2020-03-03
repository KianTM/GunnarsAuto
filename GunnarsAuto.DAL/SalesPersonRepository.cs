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
                return connection.Query<SalesPerson>("GetSalesPerson @SalesPersonId", salesPersonId) as Car;
            }
        }

        public void AddSalesPerson(SalesPerson person)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                connection.Execute("CreateSalesPerson @FirstName, @LastName, @Initials, @Hired", person);
            }
        }

        public void UpdateSalesPerson(SalesPerson person)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                connection.Execute("UpdateSalesPerson @SalesPersonId @FirstName, @LastName, @Initials, @Hired", person);
            }
        }
    }
}
