using GunnarsAuto.DAL;
using GunnarsAuto.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.BIZ
{
    public class Biz
    {
        CarRepository carRepository;
        SalesPersonRepository salesPersonRepository;
        public Biz()
        {
            carRepository = new CarRepository();
            salesPersonRepository = new SalesPersonRepository();
        }

        #region Cars
        public Car GetSingleCar(int carId)
        {
            return carRepository.GetSingleCar(carId);
        }

        public List<Car> GetAllCars()
        {
            return carRepository.GetAll();
        }

        public void AddCar(Car car)
        {
            carRepository.AddCar(car);
        }

        public void UpdateCar(Car car)
        {
            carRepository.UpdateCar(car);
        }

        public List<Car> GetCarsBasedOnSalesPersonId(int salesPersonId)
        {
            return carRepository.GetCarsBasedOnSalesPersonId(salesPersonId);
        }
        #endregion

        #region SalesPerson
        public SalesPerson GetSingleSalesPerson(int salesPersonId)
        {
            return salesPersonRepository.GetSingleSalesPerson(salesPersonId);
        }

        public List<SalesPerson> GetAllSalesPersons()
        {
            return salesPersonRepository.GetAll();
        }

        public void AddSalesPerson(SalesPerson person)
        {
            salesPersonRepository.AddSalesPerson(person);
        }

        public void UpdateSalesPerson(SalesPerson person)
        {
            salesPersonRepository.UpdateSalesPerson(person);
        }
        #endregion

        #region Sales
        public Sale GetSingleSale(int salesId)
        {
            throw new NotImplementedException();
        }

        public List<Sale> GetAllSales()
        {
            throw new NotImplementedException();
        }

        public void AddSale(Sale sale)
        {
            throw new NotImplementedException();
        }

        public void UpdateSale(Sale sale)
        {
            throw new NotImplementedException();
        }

        public List<Sale> GetSalesBasedOnSalesPerson(int salesPersonId)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
