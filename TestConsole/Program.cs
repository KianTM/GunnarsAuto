using GunnarsAuto.DAL;
using GunnarsAuto.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            CarRepositoryTest.GetAllCars();
            CarRepositoryTest.GetSingleCar();

            Console.WriteLine("Tryk Enter for at afslutte");
            Console.ReadLine();
        }
    }
}
