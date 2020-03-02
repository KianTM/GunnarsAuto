using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GunnarsAuto.Entities
{
    public class Car
    {
        public int CarId { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string Vin { get; set; }
        public string RegistreNumber { get; set; }
        public bool IsUsed { get; set; }

        public Car(int carId, string brand, string model, string vin, string registreNumber, bool isUsed)
        {
            CarId = carId;
            Brand = brand;
            Model = model;
            Vin = vin;
            RegistreNumber = registreNumber;
            IsUsed = isUsed;
        }

        public Car(string brand, string model, string vin, string registreNumber, bool isUsed)
        {            
            Brand = brand;
            Model = model;
            Vin = vin;
            RegistreNumber = registreNumber;
            IsUsed = isUsed;
        }
    }
}
