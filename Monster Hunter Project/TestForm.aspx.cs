using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monster_Hunter_Project
{
    public partial class TestForm : System.Web.UI.Page
    {
 

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnRowDataBound2(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView3, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnRowDataBoundHelm(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView2, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnRowDataBoundChest(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView4, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnRowDataBoundArms(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView5, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnRowDataBoundWaist(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView6, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnRowDataBoundLegs(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView7, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal').modal('show')", true);
            weapon_name.Text = "Name: " + GridView1.SelectedRow.Cells[0].Text;
            atk_value.Text = "Attack: " + GridView1.SelectedRow.Cells[3].Text;
            aff_value.Text = "Affinity: " + GridView1.SelectedRow.Cells[4].Text + "%";
            def_value.Text = "Defense: " + GridView1.SelectedRow.Cells[5].Text;
            if(GridView1.SelectedRow.Cells[7].Text == "Dragon")
            {
                elderseal.Text = "Elderseal: " + GridView1.SelectedRow.Cells[11].Text;
                elderseal.Visible = true;
            }
            else
            {
                elderseal.Visible = false;
            }

            if (GridView1.SelectedRow.Cells[8].Text == "&nbsp;")
            {
                element1_type.Visible = false;
                
            }
            else
            {
                element1_type.Visible = true;
                
                element1_type.Text = GridView1.SelectedRow.Cells[7].Text + ": " + GridView1.SelectedRow.Cells[8].Text;
               
            }
            if (GridView1.SelectedRow.Cells[10].Text == "&nbsp;")
            {
                element2_type.Visible = false;
                
            }
            else
            {
                element2_type.Visible = true;
                
                element2_type.Text = GridView1.SelectedRow.Cells[9].Text + ": " + GridView1.SelectedRow.Cells[10].Text;
                
            }

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal2').modal('show')", true);
            helm_name.Text = "Name: " +  GridView2.SelectedRow.Cells[0].Text;
            flat_defense1.Text = "Defense: " + GridView2.SelectedRow.Cells[3].Text;
            vs_fire1.Text = "Vs Fire: " + GridView2.SelectedRow.Cells[5].Text;
            vs_water1.Text = "Vs Water: " + GridView2.SelectedRow.Cells[6].Text;
            vs_thunder1.Text = "Vs Thunder: " + GridView2.SelectedRow.Cells[7].Text;
            vs_ice1.Text = "Vs Ice: " + GridView2.SelectedRow.Cells[8].Text;
            vs_dragon1.Text = "Vs Dragon: " + GridView2.SelectedRow.Cells[9].Text;
            helm_def.Value = GridView2.SelectedRow.Cells[3].Text;
            helm_fire.Value = GridView2.SelectedRow.Cells[5].Text;
            helm_water.Value = GridView2.SelectedRow.Cells[6].Text;
            helm_thunder.Value = GridView2.SelectedRow.Cells[7].Text;
            helm_ice.Value = GridView2.SelectedRow.Cells[8].Text;
            helm_dragon.Value = GridView2.SelectedRow.Cells[9].Text;

            int def_total = Int32.Parse(helm_def.Value) + Int32.Parse(chest_def.Value) + Int32.Parse(arm_def.Value) + Int32.Parse(waist_def.Value) + Int32.Parse(leg_def.Value);
            int fire_total = Int32.Parse(helm_fire.Value) + Int32.Parse(chest_fire.Value) + Int32.Parse(arm_fire.Value) + Int32.Parse(waist_fire.Value) + Int32.Parse(leg_fire.Value);
            int water_total = Int32.Parse(helm_water.Value) + Int32.Parse(chest_water.Value) + Int32.Parse(arm_water.Value) + Int32.Parse(waist_water.Value) + Int32.Parse(leg_water.Value);
            int thunder_total = Int32.Parse(helm_thunder.Value) + Int32.Parse(chest_thunder.Value) + Int32.Parse(arm_thunder.Value) + Int32.Parse(waist_thunder.Value) + Int32.Parse(leg_thunder.Value);
            int ice_total = Int32.Parse(helm_ice.Value) + Int32.Parse(chest_ice.Value) + Int32.Parse(arm_ice.Value) + Int32.Parse(waist_ice.Value) + Int32.Parse(leg_ice.Value);
            int dragon_total = Int32.Parse(helm_dragon.Value) + Int32.Parse(chest_dragon.Value) + Int32.Parse(arm_dragon.Value) + Int32.Parse(waist_dragon.Value) + Int32.Parse(leg_dragon.Value);

            Label2.Text = "Max Defense Total: " + def_total.ToString();
            Label3.Text = "Fire Defense Total: " + fire_total.ToString();
            Label4.Text = "Water Defense Total: " + water_total.ToString();
            Label5.Text = "Thunder Defense Total: " + thunder_total.ToString();
            Label6.Text = "Ice Defense Total: " + ice_total.ToString();
            Label7.Text = "Dragon Defense Total: " + dragon_total.ToString();

            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowIndex == GridView2.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal3').modal('show')", true);
            name2.Text = "Name: " + GridView4.SelectedRow.Cells[0].Text;
            flat_defense2.Text = "Defense: " + GridView4.SelectedRow.Cells[3].Text;
            vs_fire2.Text = "Vs Fire: " + GridView4.SelectedRow.Cells[5].Text;
            vs_water2.Text = "Vs Water: " + GridView4.SelectedRow.Cells[6].Text;
            vs_thunder2.Text = "Vs Thunder: " + GridView4.SelectedRow.Cells[7].Text;
            vs_ice2.Text = "Vs Ice: " + GridView4.SelectedRow.Cells[8].Text;
            vs_dragon2.Text = "Vs Dragon: " + GridView4.SelectedRow.Cells[9].Text;
            chest_def.Value = GridView4.SelectedRow.Cells[3].Text;
            chest_fire.Value = GridView4.SelectedRow.Cells[5].Text;
            chest_water.Value = GridView4.SelectedRow.Cells[6].Text;
            chest_thunder.Value = GridView4.SelectedRow.Cells[7].Text;
            chest_ice.Value = GridView4.SelectedRow.Cells[8].Text;
            chest_dragon.Value = GridView4.SelectedRow.Cells[9].Text;

            int def_total = Int32.Parse(helm_def.Value) + Int32.Parse(chest_def.Value) + Int32.Parse(arm_def.Value) + Int32.Parse(waist_def.Value) + Int32.Parse(leg_def.Value);
            int fire_total = Int32.Parse(helm_fire.Value) + Int32.Parse(chest_fire.Value) + Int32.Parse(arm_fire.Value) + Int32.Parse(waist_fire.Value) + Int32.Parse(leg_fire.Value);
            int water_total = Int32.Parse(helm_water.Value) + Int32.Parse(chest_water.Value) + Int32.Parse(arm_water.Value) + Int32.Parse(waist_water.Value) + Int32.Parse(leg_water.Value);
            int thunder_total = Int32.Parse(helm_thunder.Value) + Int32.Parse(chest_thunder.Value) + Int32.Parse(arm_thunder.Value) + Int32.Parse(waist_thunder.Value) + Int32.Parse(leg_thunder.Value);
            int ice_total = Int32.Parse(helm_ice.Value) + Int32.Parse(chest_ice.Value) + Int32.Parse(arm_ice.Value) + Int32.Parse(waist_ice.Value) + Int32.Parse(leg_ice.Value);
            int dragon_total = Int32.Parse(helm_dragon.Value) + Int32.Parse(chest_dragon.Value) + Int32.Parse(arm_dragon.Value) + Int32.Parse(waist_dragon.Value) + Int32.Parse(leg_dragon.Value);
            Label2.Text = "Max Defense Total: " + def_total.ToString();
            Label3.Text = "Fire Defense Total: " + fire_total.ToString();
            Label4.Text = "Water Defense Total: " + water_total.ToString();
            Label5.Text = "Thunder Defense Total: " + thunder_total.ToString();
            Label6.Text = "Ice Defense Total: " + ice_total.ToString();
            Label7.Text = "Dragon Defense Total: " + dragon_total.ToString();
            foreach (GridViewRow row in GridView4.Rows)
            {
                if (row.RowIndex == GridView4.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal4').modal('show')", true);
            name3.Text = "Name: " + GridView5.SelectedRow.Cells[0].Text;
            flat_defense3.Text = "Defense: " + GridView5.SelectedRow.Cells[3].Text;
            vs_fire3.Text = "Vs Fire: " + GridView5.SelectedRow.Cells[5].Text;
            vs_water3.Text = "Vs Water: " + GridView5.SelectedRow.Cells[6].Text;
            vs_thunder3.Text = "Vs Thunder: " + GridView5.SelectedRow.Cells[7].Text;
            vs_ice3.Text = "Vs Ice: " + GridView5.SelectedRow.Cells[8].Text;
            vs_dragon3.Text = "Vs Dragon: " + GridView5.SelectedRow.Cells[9].Text;
            arm_def.Value = GridView5.SelectedRow.Cells[3].Text;
            arm_fire.Value = GridView5.SelectedRow.Cells[5].Text;
            arm_water.Value = GridView5.SelectedRow.Cells[6].Text;
            arm_thunder.Value = GridView5.SelectedRow.Cells[7].Text;
            arm_ice.Value = GridView5.SelectedRow.Cells[8].Text;
            arm_dragon.Value = GridView5.SelectedRow.Cells[9].Text;

            int def_total = Int32.Parse(helm_def.Value) + Int32.Parse(chest_def.Value) + Int32.Parse(arm_def.Value) + Int32.Parse(waist_def.Value) + Int32.Parse(leg_def.Value);
            int fire_total = Int32.Parse(helm_fire.Value) + Int32.Parse(chest_fire.Value) + Int32.Parse(arm_fire.Value) + Int32.Parse(waist_fire.Value) + Int32.Parse(leg_fire.Value);
            int water_total = Int32.Parse(helm_water.Value) + Int32.Parse(chest_water.Value) + Int32.Parse(arm_water.Value) + Int32.Parse(waist_water.Value) + Int32.Parse(leg_water.Value);
            int thunder_total = Int32.Parse(helm_thunder.Value) + Int32.Parse(chest_thunder.Value) + Int32.Parse(arm_thunder.Value) + Int32.Parse(waist_thunder.Value) + Int32.Parse(leg_thunder.Value);
            int ice_total = Int32.Parse(helm_ice.Value) + Int32.Parse(chest_ice.Value) + Int32.Parse(arm_ice.Value) + Int32.Parse(waist_ice.Value) + Int32.Parse(leg_ice.Value);
            int dragon_total = Int32.Parse(helm_dragon.Value) + Int32.Parse(chest_dragon.Value) + Int32.Parse(arm_dragon.Value) + Int32.Parse(waist_dragon.Value) + Int32.Parse(leg_dragon.Value);
            Label2.Text = "Max Defense Total: " + def_total.ToString();
            Label3.Text = "Fire Defense Total: " + fire_total.ToString();
            Label4.Text = "Water Defense Total: " + water_total.ToString();
            Label5.Text = "Thunder Defense Total: " + thunder_total.ToString();
            Label6.Text = "Ice Defense Total: " + ice_total.ToString();
            Label7.Text = "Dragon Defense Total: " + dragon_total.ToString();

            foreach (GridViewRow row in GridView5.Rows)
            {
                if (row.RowIndex == GridView5.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void GridView6_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal5').modal('show')", true);
            name4.Text = "Name: " + GridView6.SelectedRow.Cells[0].Text;
            flat_defense4.Text = "Defense: " + GridView6.SelectedRow.Cells[3].Text;
            vs_fire4.Text = "Vs Fire: " + GridView6.SelectedRow.Cells[5].Text;
            vs_water4.Text = "Vs Water: " + GridView6.SelectedRow.Cells[6].Text;
            vs_thunder4.Text = "Vs Thunder: " + GridView6.SelectedRow.Cells[7].Text;
            vs_ice4.Text = "Vs Ice: " + GridView6.SelectedRow.Cells[8].Text;
            vs_dragon4.Text = "Vs Dragon: " + GridView6.SelectedRow.Cells[9].Text;
            waist_def.Value = GridView6.SelectedRow.Cells[3].Text;
            waist_fire.Value = GridView6.SelectedRow.Cells[5].Text;
            waist_water.Value = GridView6.SelectedRow.Cells[6].Text;
            waist_thunder.Value = GridView6.SelectedRow.Cells[7].Text;
            waist_ice.Value = GridView6.SelectedRow.Cells[8].Text;
            waist_dragon.Value = GridView6.SelectedRow.Cells[9].Text;

            int def_total = Int32.Parse(helm_def.Value) + Int32.Parse(chest_def.Value) + Int32.Parse(arm_def.Value) + Int32.Parse(waist_def.Value) + Int32.Parse(leg_def.Value);
            int fire_total = Int32.Parse(helm_fire.Value) + Int32.Parse(chest_fire.Value) + Int32.Parse(arm_fire.Value) + Int32.Parse(waist_fire.Value) + Int32.Parse(leg_fire.Value);
            int water_total = Int32.Parse(helm_water.Value) + Int32.Parse(chest_water.Value) + Int32.Parse(arm_water.Value) + Int32.Parse(waist_water.Value) + Int32.Parse(leg_water.Value);
            int thunder_total = Int32.Parse(helm_thunder.Value) + Int32.Parse(chest_thunder.Value) + Int32.Parse(arm_thunder.Value) + Int32.Parse(waist_thunder.Value) + Int32.Parse(leg_thunder.Value);
            int ice_total = Int32.Parse(helm_ice.Value) + Int32.Parse(chest_ice.Value) + Int32.Parse(arm_ice.Value) + Int32.Parse(waist_ice.Value) + Int32.Parse(leg_ice.Value);
            int dragon_total = Int32.Parse(helm_dragon.Value) + Int32.Parse(chest_dragon.Value) + Int32.Parse(arm_dragon.Value) + Int32.Parse(waist_dragon.Value) + Int32.Parse(leg_dragon.Value);
            Label2.Text = "Max Defense Total: " + def_total.ToString();
            Label3.Text = "Fire Defense Total: " + fire_total.ToString();
            Label4.Text = "Water Defense Total: " + water_total.ToString();
            Label5.Text = "Thunder Defense Total: " + thunder_total.ToString();
            Label6.Text = "Ice Defense Total: " + ice_total.ToString();
            Label7.Text = "Dragon Defense Total: " + dragon_total.ToString();

            foreach (GridViewRow row in GridView6.Rows)
            {
                if (row.RowIndex == GridView6.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void GridView7_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal6').modal('show')", true);
            name5.Text = "Name: " + GridView7.SelectedRow.Cells[0].Text;
            flat_defense5.Text = "Defense: " + GridView7.SelectedRow.Cells[3].Text;
            vs_fire5.Text = "Vs Fire: " + GridView7.SelectedRow.Cells[5].Text;
            vs_water5.Text = "Vs Water: " + GridView7.SelectedRow.Cells[6].Text;
            vs_thunder5.Text = "Vs Thunder: " + GridView7.SelectedRow.Cells[7].Text;
            vs_ice5.Text = "Vs Ice: " + GridView7.SelectedRow.Cells[8].Text;
            vs_dragon5.Text = "Vs Dragon: " + GridView7.SelectedRow.Cells[9].Text;
            leg_def.Value = GridView7.SelectedRow.Cells[3].Text;
            leg_fire.Value = GridView7.SelectedRow.Cells[5].Text;
            leg_water.Value = GridView7.SelectedRow.Cells[6].Text;
            leg_thunder.Value = GridView7.SelectedRow.Cells[7].Text;
            leg_ice.Value = GridView7.SelectedRow.Cells[8].Text;
            leg_dragon.Value = GridView7.SelectedRow.Cells[9].Text;

            int def_total = Int32.Parse(helm_def.Value) + Int32.Parse(chest_def.Value) + Int32.Parse(arm_def.Value) + Int32.Parse(waist_def.Value) + Int32.Parse(leg_def.Value);
            int fire_total = Int32.Parse(helm_fire.Value) + Int32.Parse(chest_fire.Value) + Int32.Parse(arm_fire.Value) + Int32.Parse(waist_fire.Value) + Int32.Parse(leg_fire.Value);
            int water_total = Int32.Parse(helm_water.Value) + Int32.Parse(chest_water.Value) + Int32.Parse(arm_water.Value) + Int32.Parse(waist_water.Value) + Int32.Parse(leg_water.Value);
            int thunder_total = Int32.Parse(helm_thunder.Value) + Int32.Parse(chest_thunder.Value) + Int32.Parse(arm_thunder.Value) + Int32.Parse(waist_thunder.Value) + Int32.Parse(leg_thunder.Value);
            int ice_total = Int32.Parse(helm_ice.Value) + Int32.Parse(chest_ice.Value) + Int32.Parse(arm_ice.Value) + Int32.Parse(waist_ice.Value) + Int32.Parse(leg_ice.Value);
            int dragon_total = Int32.Parse(helm_dragon.Value) + Int32.Parse(chest_dragon.Value) + Int32.Parse(arm_dragon.Value) + Int32.Parse(waist_dragon.Value) + Int32.Parse(leg_dragon.Value);
            Label2.Text = "Max Defense Total: " + def_total.ToString();
            Label3.Text = "Fire Defense Total: " + fire_total.ToString();
            Label4.Text = "Water Defense Total: " + water_total.ToString();
            Label5.Text = "Thunder Defense Total: " + thunder_total.ToString();
            Label6.Text = "Ice Defense Total: " + ice_total.ToString();
            Label7.Text = "Dragon Defense Total: " + dragon_total.ToString();

            foreach (GridViewRow row in GridView7.Rows)
            {
                if (row.RowIndex == GridView7.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mymodal').modal('show')", true);
            weapon_name.Text = "Name: " + GridView3.SelectedRow.Cells[0].Text;
            atk_value.Text = "Attack: " + GridView3.SelectedRow.Cells[3].Text;
            aff_value.Text = "Affinity: " + GridView3.SelectedRow.Cells[4].Text + "%";
            def_value.Text = "Defense: " + GridView3.SelectedRow.Cells[5].Text;
            if (GridView3.SelectedRow.Cells[8].Text == "&nbsp;")
            {
                element1_type.Visible = false;
                
            }
            else
            {
                element1_type.Visible = true;
                
                element1_type.Text = GridView3.SelectedRow.Cells[7].Text + ": " + GridView3.SelectedRow.Cells[8].Text;
                
            }
            if (GridView3.SelectedRow.Cells[10].Text == "&nbsp;")
            {
                element2_type.Visible = false;
                
            }
            else
            {
                element2_type.Visible = true;
                
                element2_type.Text = GridView3.SelectedRow.Cells[9].Text + ": " + GridView3.SelectedRow.Cells[10].Text;
                
            }


            foreach (GridViewRow row in GridView3.Rows)
            {
                if (row.RowIndex == GridView3.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void refresh_button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }
}