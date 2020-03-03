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
    public class CarRepository
    {
        public CarRepository()
        {

        }

        public List<Car> GetAll()
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<Car>("GetAllCars").ToList();
            }
        }

        public Car GetSingleCar(int carId)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<Car>("GetCar @CarId", carId) as Car;
            }
        }

        public void AddCar(Car car)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                connection.Execute("CreateCar @Brand, @Model, @Vin, @RegisterNumber, @IsUsed", car);
            }
        }

        public void UpdateCar(Car car)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                connection.Execute("UpdateCar @CarId @Brand, @Model, @Vin, @RegisterNumber, @IsUsed", car);
            }
        }

        public List<Car> GetCarsBasedOnSalesPersonId(int salesPersonId)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(helper.CnnVal("GunnarsAuto")))
            {
                return connection.Query<Car>("GetCarsBySalesPerson @SalesPersonId", salesPersonId).ToList();
            }
        }
    }
}
