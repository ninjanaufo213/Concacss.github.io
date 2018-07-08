using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        int x, y = 0;
        bool mousedowns;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel2_MouseLeave(object sender, EventArgs e)
        {

        }

        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            mousedowns = true;
        }

        private void panel2_MouseMove(object sender, MouseEventArgs e)
        {
            if (mousedowns)
            {
                x = MousePosition.X ;
                y = MousePosition.Y ;
                this.SetDesktopLocation(x, y);
            }
        }

        private void panel2_MouseUp(object sender, MouseEventArgs e)
        {
            mousedowns = false;
        }

        private void panel1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop, false) == true) {
                e.Effect = DragDropEffects.All;
            }
        }

        private void panel1_DragDrop(object sender, DragEventArgs e)
        {
            string[] dfile = (string[])e.Data.GetData(DataFormats.FileDrop);
            label1.Text = "Start...";
            int step = 0;
            foreach (string file in dfile) {
                step++;
                Process.Start("C:\\Users\\Administrator\\Downloads\\Senior Software\\ModelEdit\\LTB2LTA.exe",file);
            }
            label1.Text = "Done "+step+"/"+step;
        }
    }
}
