using GunnarsAuto.DAL;
using GunnarsAuto.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestConsole
{
    public static class CarRepositoryTest
    {
        static CarRepository carRepository = new CarRepository();

        public static void GetAllCars()
        {
            List<Car> cars = carRepository.GetAll();
            foreach (Car item in cars)
            {
                Console.WriteLine(item.Brand);
            }
        }
        public static void CreateNewCar()
        {
            Car car = new Car { Brand = "Ford", Model = "Focus", RegisterNumber = "DK12345678", IsUsed = false, Vin = "01234567891234567" };
            carRepository.AddCar(car);
        }

        public static void GetSingleCar()
        {
            Car newCar = carRepository.GetSingleCar(1);

            Console.WriteLine(newCar.Brand);

            Console.ReadLine();
        }
            
        public static void UpdateCar()
        {
            Car newCar = carRepository.GetSingleCar(1);
            newCar.IsUsed = true;
            carRepository.UpdateCar(newCar);
        }
    }
}
