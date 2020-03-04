using GunnarsAuto.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace GunnarsAuto.GUI
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        private List<SalesPerson> salesPeople = new List<SalesPerson>
        {
            new SalesPerson("User", "One", "USON", true),
            new SalesPerson("Bob", "Thoo", "BOTH", true),
            new SalesPerson("Ohn", "Haiyad", "OHHA", false)

        };

        private List<SalesPerson> hiredPeople = new List<SalesPerson>();

        public LoginWindow()
        {
            InitializeComponent();

            loginButton.IsEnabled = false;
            hiredPeople = GetHiredSalesPeople(salesPeople);
            userComboBox.ItemsSource = hiredPeople;
        }

        private List<SalesPerson> GetHiredSalesPeople(List<SalesPerson> people)
        {
            List<SalesPerson> output = new List<SalesPerson>();

            foreach (SalesPerson sp in people)
            {
                if (sp.Hired)
                {
                    output.Add(sp);
                }
            }

            return output;
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            // Temporary until a login system is properly implemented
            MainWindow mainWindow = new MainWindow();
            Shared.LoggedInPerson = userComboBox.SelectedItem as SalesPerson;
            mainWindow.Show();
            this.Close();
        }

        private void UserComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (e != null)
            {
                loginButton.IsEnabled = true;
            }
            else
            {
                loginButton.IsEnabled = false;
            }
        }
    }
}
