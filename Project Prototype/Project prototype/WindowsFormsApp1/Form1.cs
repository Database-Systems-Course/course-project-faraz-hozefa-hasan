using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        List<KFC> kfc = new List<KFC>();
        List<McDonalds> mcd=new List<McDonalds>();
        List<Kaybees> kb = new List<Kaybees>();
        public Form1()
        {
            InitializeComponent();
        }

        private void Label2_Click(object sender, EventArgs e)
        {

        }

        private void Label4_Click(object sender, EventArgs e)
        {

        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.ShowDialog();
        }

        private void ComboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            kfc.Add(new KFC("Chicken Bucket", 12, 1000));
            kfc.Add(new KFC("Chicken Wings", 23, 800));
            kfc.Add(new KFC("Chicken Tenders", 40, 600));

            mcd.Add(new McDonalds("McChicken", 13, 900));
            mcd.Add(new McDonalds("Chocolate Sundae", 12, 250));

            kb.Add(new Kaybees("Roasted Club Sandwich", 45, 400));
            kb.Add(new Kaybees("Qtr. Broast", 67, 150));
        }

        public class KFC
        {
            public string ItemName;
            public int ItemID;
            public float ItemPrice;
            
            public KFC(string Name, int ID, float Price )
            {
                ItemName = Name;
                ItemID = ID;
                ItemPrice = Price;
            }
        }
        public class McDonalds
        {
            public string ItemName;
            public int ItemID;
            public float ItemPrice;

            public McDonalds(string Name, int ID, float Price)
            {
                ItemName = Name;
                ItemID = ID;
                ItemPrice = Price;
            }
        }
        public class Kaybees
        {
            public string ItemName;
            public int ItemID;
            public float ItemPrice;

            public Kaybees(string Name, int ID, float Price)
            {
                ItemName = Name;
                ItemID = ID;
                ItemPrice = Price;
            }
        }

        private void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0)
            {
                comboBox2.Items.Clear();
                for (int i = 0; i < kfc.Count(); i++)
                {
                    comboBox2.Items.Add(kfc[i].ItemName);
                }
            }
            else if (comboBox1.SelectedIndex == 1)
            {
                comboBox2.Items.Clear();
                for (int i = 0; i < mcd.Count(); i++)
                {
                    comboBox2.Items.Add(mcd[i].ItemName);
                }
            }
            else if (comboBox1.SelectedIndex == 2)
            {
                comboBox2.Items.Clear();
                for (int i = 0; i < kb.Count(); i++)
                {
                    comboBox2.Items.Add(kb[i].ItemName);
                }
            }
        }
    }
}
