using System;
using GunnarsAuto.BIZ;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using GunnarsAuto.Entities;

namespace GunnarsAuto.GUI.Controls
{
    /// <summary>
    /// Interaction logic for CreateNewView.xaml
    /// </summary>
    public partial class CreateNewView : UserControl
    {
        Biz biz = new Biz();

        public CreateNewView()
        {
            InitializeComponent();
            confirmButton.IsEnabled = false;
            vinTextBox.Background = Brushes.LightGray;
        }

        private void CheckAllBoxRequirements()
        {
            if (string.IsNullOrEmpty(brandTextBox.Text) ||
                string.IsNullOrEmpty(modelTextBox.Text) ||
                string.IsNullOrEmpty(vinTextBox.Text) ||
                string.IsNullOrEmpty(registryTextBox.Text) ||
                string.IsNullOrEmpty(buyPriceTextBox.Text) ||
                vinTextBox.Text.Length != 17)
            {
                confirmButton.IsEnabled = false;
            }
            else
            {
                confirmButton.IsEnabled = true;
            }

            if (vinTextBox.Text.Length != 17)
            {
                vinTextBox.Background = Brushes.LightGray;
            }
            else
            {
                vinTextBox.Background = Brushes.White;
            }

        }

        private void buyPriceTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("^[.][0-9]+$|^[0-9]*[.]{0,1}[0-9]*$");
            e.Handled = !regex.IsMatch((sender as TextBox).Text.Insert((sender as TextBox).SelectionStart, e.Text));
        }

        private void confirmButton_Click(object sender, RoutedEventArgs e)
        {
            Car car = new Car(brandTextBox.Text, modelTextBox.Text, vinTextBox.Text, registryTextBox.Text, (bool)usedCheckBox.IsChecked);
            Sale sale = new Sale() { BuyPrice = decimal.Parse(buyPriceTextBox.Text), Car = car, SalesPerson = Shared.LoggedInPerson };
            biz.AddCar(car);
            biz.AddSale(sale);
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            CheckAllBoxRequirements();
        }
    }
}
