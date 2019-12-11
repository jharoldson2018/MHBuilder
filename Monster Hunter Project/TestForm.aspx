<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestForm.aspx.cs" Inherits="Monster_Hunter_Project.TestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
<body>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <!-- Brand -->
  

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">

      <li class="nav-item">
        <a class="nav-link" href="LoginPage.aspx">Logout</a>
      </li>
    </ul>
  </div>
</nav>

    
    <form id="form1" runat="server">
        <asp:ScriptManager  EnablePageMethods="true"   EnablePartialRendering="true" runat="server"></asp:ScriptManager>
          
        <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-row my-5">
               <div class="card-body" type="button" data-toggle="modal" data-target="#mymodal">

                   <asp:Label runat="server" id="weapon_name">Name: Current Name </asp:Label>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
                   <asp:Label runat="server" ID="jewel1">No Jewel</asp:Label>
                   <asp:Label runat="server" ID="jewel2">No Jewel</asp:Label>
                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
                   
                   <br />
                   <div class="container-fluid">
                    <asp:Label runat="server" ID="atk_value">Attack: 846</asp:Label>
                   
                   <asp:Label runat="server" ID="aff_value">Affinity: 0%</asp:Label>
                   <asp:Label runat="server" ID="def_value">Defense: 0</asp:Label>
                   <asp:Label runat="server" ID="element1_type">Element 1: ---</asp:Label> 
                   
                   <asp:Label runat="server" ID="element2_type">Element 2: ---</asp:Label>
                   
                   <asp:Label runat="server" ID="elderseal" Visible="false"></asp:Label>
                   &nbsp;</div> 
                   <br />

                   
               </div>
           
               
           </div>
            <div class="modal fade" id="mymodal" data-keyboard="false" data-backdrop="static">
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                         <ContentTemplate>
              <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">

                    <div class="modal-header">
                        <h4 class="modal-title">Weapon List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                     
                    <div class="modal-body">
                    
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="weapon_type" DataValueField="weapon_type" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            
                        </asp:DropDownList><asp:Button id="refresh_button1" runat="server" Text="Button" />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectDistinctWeaponType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllWeaponsSpecific" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="weapon_type" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel1" runat ="server">
            <asp:GridView ID="GridView1"  runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource2" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound = "OnRowDataBound">
               
                <Columns>
                   
                    <asp:BoundField DataField="name_en" HeaderText="Name" SortExpression="name_en" />
                    <asp:BoundField DataField="weapon_type" HeaderText="Weapon Type" SortExpression="weapon_type" />
                    <asp:BoundField DataField="rarity" HeaderText="Rarity" SortExpression="rarity" />
                    <asp:BoundField DataField="attack" HeaderText="Attack" SortExpression="attack" />
                    <asp:BoundField DataField="affinity" HeaderText="Affinity" SortExpression="affinity" />
                    <asp:BoundField DataField="defense" HeaderText="Defense" SortExpression="defense" />
                    <asp:BoundField DataField="element_hidden" HeaderText="element_hidden" SortExpression="element_hidden" />
                    <asp:BoundField DataField="element1" HeaderText="element1" SortExpression="element1" />
                    <asp:BoundField DataField="element1_attack" HeaderText="element1_attack" SortExpression="element1_attack" />
                    <asp:BoundField DataField="element2" HeaderText="element2" SortExpression="element2" />
                    <asp:BoundField DataField="element2_attack" HeaderText="element2_attack" SortExpression="element2_attack" />
                    <asp:BoundField DataField="elderseal" HeaderText="elderseal" SortExpression="elderseal" />
                    <asp:BoundField DataField="slot_1" HeaderText="slot_1" SortExpression="slot_1" />
                    <asp:BoundField DataField="slot_2" HeaderText="slot_2" SortExpression="slot_2" />
                    <asp:BoundField DataField="slot_3" HeaderText="slot_3" SortExpression="slot_3" />
                    <asp:BoundField DataField="kinsect_bonus" HeaderText="kinsect_bonus" SortExpression="kinsect_bonus" />
                    <asp:BoundField DataField="phial" HeaderText="phial" SortExpression="phial" />
                    <asp:BoundField DataField="phial_power" HeaderText="phial_power" SortExpression="phial_power" />
                    <asp:BoundField DataField="shelling" HeaderText="shelling" SortExpression="shelling" />
                    <asp:BoundField DataField="shelling_level" HeaderText="shelling_level" SortExpression="shelling_level" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource4" GridLines="None" AllowPaging="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" OnRowDataBound = "OnRowDataBound2">
            <Columns>
                <asp:BoundField DataField="name_en" HeaderText="name_en" SortExpression="name_en" />
                <asp:BoundField DataField="weapon_type" HeaderText="weapon_type" SortExpression="weapon_type" />
                <asp:BoundField DataField="rarity" HeaderText="rarity" SortExpression="rarity" />
                <asp:BoundField DataField="attack" HeaderText="attack" SortExpression="attack" />
                <asp:BoundField DataField="affinity" HeaderText="affinity" SortExpression="affinity" />
                <asp:BoundField DataField="defense" HeaderText="defense" SortExpression="defense" />
                <asp:BoundField DataField="element_hidden" HeaderText="element_hidden" SortExpression="element_hidden" />
                <asp:BoundField DataField="element1" HeaderText="element1" SortExpression="element1" />
                <asp:BoundField DataField="element1_attack" HeaderText="element1_attack" SortExpression="element1_attack" />
                <asp:BoundField DataField="element2" HeaderText="element2" SortExpression="element2" />
                <asp:BoundField DataField="element2_attack" HeaderText="element2_attack" SortExpression="element2_attack" />
                <asp:BoundField DataField="elderseal" HeaderText="elderseal" SortExpression="elderseal" />
                <asp:BoundField DataField="slot_1" HeaderText="slot_1" SortExpression="slot_1" />
                <asp:BoundField DataField="slot_2" HeaderText="slot_2" SortExpression="slot_2" />
                <asp:BoundField DataField="slot_3" HeaderText="slot_3" SortExpression="slot_3" />
                <asp:BoundField DataField="kinsect_bonus" HeaderText="kinsect_bonus" SortExpression="kinsect_bonus" />
                <asp:BoundField DataField="phial" HeaderText="phial" SortExpression="phial" />
                <asp:BoundField DataField="phial_power" HeaderText="phial_power" SortExpression="phial_power" />
                <asp:BoundField DataField="shelling" HeaderText="shelling" SortExpression="shelling" />
                <asp:BoundField DataField="shelling_level" HeaderText="shelling_level" SortExpression="shelling_level" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView></asp:Panel>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllWeapons" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllWeaponsXML" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                            
      
                          
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

                    </div>
                 
                </div>
                              </ContentTemplate>
              <Triggers>
                
                <asp:AsyncPostBackTrigger ControlID="refresh_button1" />
                <asp:PostBackTrigger ControlID="GridView1" />
                <asp:PostBackTrigger ControlID="GridView3" />
            </Triggers>
            </asp:UpdatePanel>
       
           </div>
            
        </div>
        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br />
        
                <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-row my-5">
               <div class="card-body" type="button" data-toggle="modal" data-target="#mymodal2">
                   <asp:Label runat="server" id="helm_name">Name: Current Name </asp:Label>
                   <br /> 
                   <div class="container-fluid">
                    <asp:Label runat="server" ID="flat_defense1">Defense: 0</asp:Label>                 
                   <asp:Label runat="server" ID="vs_fire1">Vs Fire: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_water1">Vs Water: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_thunder1">Vs Thunder: 0</asp:Label> 
                   <asp:Label runat="server" ID="vs_ice1">Vs Ice: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_dragon1">Vs Dragon: 0</asp:Label>
                   </div>
                   <br />      
           </div>             
           </div>
            <div class="modal fade" id="mymodal2" data-keyboard="false" data-backdrop="static">
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                         <ContentTemplate>
              <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Helm List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>                   
                    <div class="modal-body">
                                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ArmorDataSourceHelmet" GridLines="Vertical" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDataBound = "OnRowDataBoundHelm">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="name_en" HeaderText="Name" SortExpression="name_en" />
                    <asp:BoundField DataField="rarity" HeaderText="Rarity" SortExpression="rarity" />
                    <asp:BoundField DataField="defense_base" HeaderText="Defense: Base" SortExpression="defense_base" />
                    <asp:BoundField DataField="defense_max" HeaderText="Defense: Max" SortExpression="defense_max" />
                    <asp:BoundField DataField="defense_augment_max" HeaderText="Defense: Augment Max" SortExpression="defense_augment_max" />
                    <asp:BoundField DataField="defense_fire" HeaderText="Defense: Fire" SortExpression="defense_fire" />
                    <asp:BoundField DataField="defense_water" HeaderText="Defense: Water" SortExpression="defense_water" />
                    <asp:BoundField DataField="defense_thunder" HeaderText="Defense: Thunder" SortExpression="defense_thunder" />
                    <asp:BoundField DataField="defense_ice" HeaderText="Defense: Ice" SortExpression="defense_ice" />
                    <asp:BoundField DataField="defense_dragon" HeaderText="Defense: Dragon" SortExpression="defense_dragon" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ArmorDataSourceHelmet" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllHelmets" SelectCommandType="StoredProcedure"></asp:SqlDataSource>                                                                 
                        <asp:Panel ID="Panel3" runat ="server">
                        </asp:Panel>                      
                        </div>                                    
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
                    </div>              
                </div>
                              </ContentTemplate>
              <Triggers>

                <asp:PostBackTrigger ControlID="GridView2" />
            </Triggers>
            </asp:UpdatePanel>
                
           </div>
   
        </div>

        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br />
        
                <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-row my-5">
               <div class="card-body" type="button" data-toggle="modal" data-target="#mymodal3">
                   <asp:Label runat="server" id="name2">Name: Current Name </asp:Label>
                   <br />    
                   <div class="container-fluid">
                    <asp:Label runat="server" ID="flat_defense2">Defense: 0</asp:Label>                 
                   <asp:Label runat="server" ID="vs_fire2">Vs Fire: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_water2">Vs Water: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_thunder2">Vs Thunder: 0</asp:Label> 
                   <asp:Label runat="server" ID="vs_ice2">Vs Ice: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_dragon2">Vs Dragon: 0</asp:Label>
                   &nbsp;</div>
                   <br />      
           </div>             
           </div>
            <div class="modal fade" id="mymodal3" data-keyboard="false" data-backdrop="static">
                <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                         <ContentTemplate>
              <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Chest List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>                   
                    <div class="modal-body">
                                 <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" GridLines="Vertical" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" OnRowDataBound = "OnRowDataBoundChest">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="name_en" HeaderText="Name" SortExpression="name_en" />
                    <asp:BoundField DataField="rarity" HeaderText="Rarity" SortExpression="rarity" />
                    <asp:BoundField DataField="defense_base" HeaderText="Defense: Base" SortExpression="defense_base" />
                    <asp:BoundField DataField="defense_max" HeaderText="Defense: Max" SortExpression="defense_max" />
                    <asp:BoundField DataField="defense_augment_max" HeaderText="Defense: Augment Max" SortExpression="defense_augment_max" />
                    <asp:BoundField DataField="defense_fire" HeaderText="Defense: Fire" SortExpression="defense_fire" />
                    <asp:BoundField DataField="defense_water" HeaderText="Defense: Water" SortExpression="defense_water" />
                    <asp:BoundField DataField="defense_thunder" HeaderText="Defense: Thunder" SortExpression="defense_thunder" />
                    <asp:BoundField DataField="defense_ice" HeaderText="Defense: Ice" SortExpression="defense_ice" />
                    <asp:BoundField DataField="defense_dragon" HeaderText="Defense: Dragon" SortExpression="defense_dragon" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllChests" SelectCommandType="StoredProcedure"></asp:SqlDataSource>                                                                 
                        <asp:Panel ID="Panel4" runat ="server">
                        </asp:Panel>                      
                        </div>                                    
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
                    </div>              
                </div>
                              </ContentTemplate>
              <Triggers>

                <asp:PostBackTrigger ControlID="GridView4" />
            </Triggers>
            </asp:UpdatePanel>
                
           </div>
   
        </div>

                ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br />
        
                <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-row my-5">
               <div class="card-body" type="button" data-toggle="modal" data-target="#mymodal4">
                   <asp:Label runat="server" id="name3">Name: Current Name </asp:Label>
                   <br /> 
                   <div class="container-fluid">
                    <asp:Label runat="server" ID="flat_defense3">Defense: 0</asp:Label>                 
                   <asp:Label runat="server" ID="vs_fire3">Vs Fire: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_water3">Vs Water: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_thunder3">Vs Thunder: 0</asp:Label> 
                   <asp:Label runat="server" ID="vs_ice3">Vs Ice: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_dragon3">Vs Dragon: 0</asp:Label>
                   &nbsp;</div>
                   <br />      
           </div>             
           </div>
            <div class="modal fade" id="mymodal4" data-keyboard="false" data-backdrop="static">
                <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                         <ContentTemplate>
              <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Arms List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>                   
                    <div class="modal-body">
                                 <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource6" GridLines="Vertical" OnSelectedIndexChanged="GridView5_SelectedIndexChanged" OnRowDataBound = "OnRowDataBoundArms">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="name_en" HeaderText="Name" SortExpression="name_en" />
                    <asp:BoundField DataField="rarity" HeaderText="Rarity" SortExpression="rarity" />
                    <asp:BoundField DataField="defense_base" HeaderText="Defense: Base" SortExpression="defense_base" />
                    <asp:BoundField DataField="defense_max" HeaderText="Defense: Max" SortExpression="defense_max" />
                    <asp:BoundField DataField="defense_augment_max" HeaderText="Defense: Augment Max" SortExpression="defense_augment_max" />
                    <asp:BoundField DataField="defense_fire" HeaderText="Defense: Fire" SortExpression="defense_fire" />
                    <asp:BoundField DataField="defense_water" HeaderText="Defense: Water" SortExpression="defense_water" />
                    <asp:BoundField DataField="defense_thunder" HeaderText="Defense: Thunder" SortExpression="defense_thunder" />
                    <asp:BoundField DataField="defense_ice" HeaderText="Defense: Ice" SortExpression="defense_ice" />
                    <asp:BoundField DataField="defense_dragon" HeaderText="Defense: Dragon" SortExpression="defense_dragon" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllArms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>                                                                 
                        <asp:Panel ID="Panel5" runat ="server">
                        </asp:Panel>                      
                        </div>                                    
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
                    </div>              
                </div>
                              </ContentTemplate>
              <Triggers>

                <asp:PostBackTrigger ControlID="GridView5" />
            </Triggers>
            </asp:UpdatePanel>
                
           </div>
   
        </div>

                        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br />
        
                <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-row my-5">
               <div class="card-body" type="button" data-toggle="modal" data-target="#mymodal5">
                   <asp:Label runat="server" id="name4">Name: Current Name </asp:Label>
                   <br />  
                   <div class="container-fluid">
                    <asp:Label runat="server" ID="flat_defense4">Defense: 0</asp:Label>                 
                   <asp:Label runat="server" ID="vs_fire4">Vs Fire: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_water4">Vs Water: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_thunder4">Vs Thunder: 0</asp:Label> 
                   <asp:Label runat="server" ID="vs_ice4">Vs Ice: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_dragon4">Vs Dragon: 0</asp:Label>
                   &nbsp;</div>
                   <br />      
           </div>             
           </div>
            <div class="modal fade" id="mymodal5" data-keyboard="false" data-backdrop="static">
                <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                         <ContentTemplate>
              <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Waists List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>                   
                    <div class="modal-body">
                                 <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource7" GridLines="Vertical" OnSelectedIndexChanged="GridView6_SelectedIndexChanged" OnRowDataBound = "OnRowDataBoundWaist">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="name_en" HeaderText="Name" SortExpression="name_en" />
                    <asp:BoundField DataField="rarity" HeaderText="Rarity" SortExpression="rarity" />
                    <asp:BoundField DataField="defense_base" HeaderText="Defense: Base" SortExpression="defense_base" />
                    <asp:BoundField DataField="defense_max" HeaderText="Defense: Max" SortExpression="defense_max" />
                    <asp:BoundField DataField="defense_augment_max" HeaderText="Defense: Augment Max" SortExpression="defense_augment_max" />
                    <asp:BoundField DataField="defense_fire" HeaderText="Defense: Fire" SortExpression="defense_fire" />
                    <asp:BoundField DataField="defense_water" HeaderText="Defense: Water" SortExpression="defense_water" />
                    <asp:BoundField DataField="defense_thunder" HeaderText="Defense: Thunder" SortExpression="defense_thunder" />
                    <asp:BoundField DataField="defense_ice" HeaderText="Defense: Ice" SortExpression="defense_ice" />
                    <asp:BoundField DataField="defense_dragon" HeaderText="Defense: Dragon" SortExpression="defense_dragon" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllWaists" SelectCommandType="StoredProcedure"></asp:SqlDataSource>                                                                 
                        <asp:Panel ID="Panel6" runat ="server">
                        </asp:Panel>                      
                        </div>                                    
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
                    </div>              
                </div>
                              </ContentTemplate>
              <Triggers>

                <asp:PostBackTrigger ControlID="GridView6" />
            </Triggers>
            </asp:UpdatePanel>
                
           </div>
   
        </div>

                        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br />
        
                <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-column my-5">
               <div class="card-body" type="button" data-toggle="modal" data-target="#mymodal6">
                   <asp:Label runat="server" id="name5">Name: Current Name </asp:Label>
                   <br />   
                   <div class="container-fluid">
                    <asp:Label runat="server" ID="flat_defense5">Defense: 0</asp:Label>                 
                   <asp:Label runat="server" ID="vs_fire5">Vs Fire: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_water5">Vs Water: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_thunder5">Vs Thunder: 0</asp:Label> 
                   <asp:Label runat="server" ID="vs_ice5">Vs Ice: 0</asp:Label>
                   <asp:Label runat="server" ID="vs_dragon5">Vs Dragon: 0</asp:Label>
                   &nbsp;</div>
                   <br />      
           </div>             
           </div>
            <div class="modal fade" id="mymodal6" data-keyboard="false" data-backdrop="static">
                <asp:UpdatePanel ID="UpdatePanel6" UpdateMode="Conditional" runat="server">
                         <ContentTemplate>
              <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Legs List</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>                   
                    <div class="modal-body">
                                 <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource8" GridLines="Vertical" OnSelectedIndexChanged="GridView7_SelectedIndexChanged" OnRowDataBound = "OnRowDataBoundLegs">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="name_en" HeaderText="Name" SortExpression="name_en" />
                    <asp:BoundField DataField="rarity" HeaderText="Rarity" SortExpression="rarity" />
                    <asp:BoundField DataField="defense_base" HeaderText="Defense: Base" SortExpression="defense_base" />
                    <asp:BoundField DataField="defense_max" HeaderText="Defense: Max" SortExpression="defense_max" />
                    <asp:BoundField DataField="defense_augment_max" HeaderText="Defense: Augment Max" SortExpression="defense_augment_max" />
                    <asp:BoundField DataField="defense_fire" HeaderText="Defense: Fire" SortExpression="defense_fire" />
                    <asp:BoundField DataField="defense_water" HeaderText="Defense: Water" SortExpression="defense_water" />
                    <asp:BoundField DataField="defense_thunder" HeaderText="Defense: Thunder" SortExpression="defense_thunder" />
                    <asp:BoundField DataField="defense_ice" HeaderText="Defense: Ice" SortExpression="defense_ice" />
                    <asp:BoundField DataField="defense_dragon" HeaderText="Defense: Dragon" SortExpression="defense_dragon" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectAllLegs" SelectCommandType="StoredProcedure"></asp:SqlDataSource>                                                                 
                        <asp:Panel ID="Panel7" runat ="server">
                        </asp:Panel>                      
                        </div>                                    
                    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
                    </div>              
                </div>
                              </ContentTemplate>
              <Triggers>

                <asp:PostBackTrigger ControlID="GridView7" />
            </Triggers>
            </asp:UpdatePanel>
                
           </div>
   
        </div>

                              ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        <br />
        
                <div class="col-lg-10, col-xl-9 mx-auto">
           <div class="card flex-column my-5">
               <div class="card-body" data-toggle="modal" data-target="#mymodal6">
                   <asp:Label runat="server" id="Label1">Current Totals </asp:Label>
                   <br />   
                   <div class="container-fluid">
                       <asp:HiddenField ID="helm_def" runat="server" Value="0" />
                       <asp:HiddenField ID="chest_def" runat="server" Value="0"/>
                       <asp:HiddenField ID="arm_def" runat="server" Value="0"/>
                       <asp:HiddenField ID="waist_def" runat="server" Value="0"/>
                       <asp:HiddenField ID="leg_def" runat="server" Value="0"/>
                       <asp:HiddenField ID="helm_fire" runat="server" Value="0"/>
                       <asp:HiddenField ID="helm_water" runat="server" Value="0"/>
                       <asp:HiddenField ID="helm_thunder" runat="server" Value="0"/>
                       <asp:HiddenField ID="helm_ice" runat="server" Value="0"/>
                       <asp:HiddenField ID="helm_dragon" runat="server" Value="0"/>
                       <asp:HiddenField ID="chest_fire" runat="server" Value="0"/>
                       <asp:HiddenField ID="chest_water" runat="server" Value="0"/>
                       <asp:HiddenField ID="chest_thunder" runat="server" Value="0"/>
                       <asp:HiddenField ID="chest_ice" runat="server" Value="0"/>
                       <asp:HiddenField ID="chest_dragon" runat="server" Value="0"/>
                       <asp:HiddenField ID="arm_fire" runat="server" Value="0"/>
                       <asp:HiddenField ID="arm_water" runat="server" Value="0"/>
                       <asp:HiddenField ID="arm_thunder" runat="server" Value="0"/>
                       <asp:HiddenField ID="arm_ice" runat="server" Value="0"/>
                       <asp:HiddenField ID="arm_dragon" runat="server" Value="0"/>
                       <asp:HiddenField ID="waist_dragon" runat="server" Value="0"/>
                       <asp:HiddenField ID="waist_fire" runat="server" Value="0"/>
                       <asp:HiddenField ID="waist_water" runat="server" Value="0"/>
                       <asp:HiddenField ID="waist_thunder" runat="server" Value="0"/>
                       <asp:HiddenField ID="waist_ice" runat="server" Value="0"/>
                       <asp:HiddenField ID="leg_fire" runat="server" Value="0"/>
                       <asp:HiddenField ID="leg_water" runat="server" Value="0"/>
                       <asp:HiddenField ID="leg_thunder" runat="server" Value="0"/>
                       <asp:HiddenField ID="leg_ice" runat="server" Value="0"/>
                       <asp:HiddenField ID="leg_dragon" runat="server" Value="0"/>
                    <asp:Label runat="server" ID="Label2">Defense Max Total: 0</asp:Label>                 
                   <asp:Label runat="server" ID="Label3">Fire Defense Total: 0</asp:Label>
                   <asp:Label runat="server" ID="Label4">Water Defense Total: 0</asp:Label>
                   <asp:Label runat="server" ID="Label5">Thunder Defense Total: 0</asp:Label> 
                   <asp:Label runat="server" ID="Label6">Ice Defense Total: 0</asp:Label>
                   <asp:Label runat="server" ID="Label7">Dragon Defense Total: 0</asp:Label>
                   &nbsp;</div>
                   <br />      
           </div>             
           </div>
                        </div>                                    
         
                                             
    </form>
</body>
</html>
