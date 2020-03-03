using GunnarsAuto.DAL;
using GunnarsAuto.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.BIZ
{
    class Biz
    {
        CarRepository carRepository;
        public Biz()
        {
            carRepository = new CarRepository();
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

    }
}
