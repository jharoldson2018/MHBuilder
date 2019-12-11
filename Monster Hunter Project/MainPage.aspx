<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Monster_Hunter_Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="mainframe">
                <div id="weaponequip" class="equippieceui" style="visibility: visible;"> 
                    <div id="wepname" class="equipname" style="cursor: pointer">Chrome Razor II</div> 
                    <!--<img id="wabrd1" class="equipborder" src="img/border/armorborder.bmp">--> 
                   <!-- <img id="wicon1" class="equipicon" src="img/icon/equip/Great Sword/6.png"> -->
                    <div id="wepstatcont" class="statcont">
                        <div class="damageblockequip"> 
                        <!-- <img id="wepdmg" class="buttonimgs" src="img/icon/ui/dmg.png"> -->
                        <span id="wepdmgtext" class="buttontxt">864</span> 

                                                            </div>
                        <div class="damageblockequip"> 
                           <!-- <img id="wepaff" class="buttonimgs" src="img/icon/ui/aff.png"> -->
                            <span id="wepafftext" class="buttontxt">0%</span>

                        </div> <div class="damageblockequip"> 
                            <!--<img id="wepelem" class="buttonimgs" src="img/icon/ui/poison.png" style="position: relative; visibility: visible;"> -->
                            <span id="wepelemtext" class="buttontxt" style="position: relative; visibility: visible; color: rgb(170, 170, 170);">420</span> 

                               </div> </div> 
                    <div id="wepaugcont" class="augcont">
                        <div id="a1brd" class="augmentbtn"> 
                            <p id="aug1text" class="augmenttext">- - - - -</p> 

                        </div> <div id="a2brd" class="augmentbtn" style="visibility: visible;">
                            <p id="aug2text" class="augmenttext">- - - - -</p>

                               </div> 
                        <div id="a3brd" class="augmentbtn" style="visibility: visible;">
                            <p id="aug3text" class="augmenttext">- - - - -</p> 

                        </div> </div>
                    <div id="wepgemcont" class="gemcontequipweapon">
                        <div id="wsbrd1" class="slotborder" style="visibility: visible;">
                           <!-- <img id="ws1icon" class="sloticon" src="img/icon/slot/gem1.png" style="visibility: visible;"> -->
                            <p id="ws1name" class="slotname" style="color: rgb(255, 255, 255);">No Jewel</p>

                        </div> 
                        <div id="wsbrd2" class="slotborder" style="visibility: visible;"> 
                           <!-- <img id="ws2icon" class="sloticon" src="img/icon/slot/gem1.png" style="visibility: visible;"> -->
                            <p id="ws2name" class="slotname" style="color: rgb(255, 255, 255);">No Jewel</p>

                        </div> 
                        <div id="wsbrd3" class="slotborder" style="visibility: hidden;"> 
                          <!--  <img id="ws3icon" class="sloticon" src="img/icon/slot/gem3.bmp" style="visibility: hidden;"> -->
                            <p id="ws3name" class="slotname" style="color: rgb(255, 255, 255);">No Jewel</p> 

                        </div> </div> 
                    <div id="wepsharpcont" class="sharpcont" style="padding-bottom: 5px; display: block;"> 
                        <div id="sharpbartooltip" class="sharpbar" style="opacity: 0;">60 base points of red</div> 
                        <div id="sharpbar" class="sharpbar"><div class="sharpvalue" style="background: red; width: 27px; left: 0px;"></div>
                            <div class="sharpvalue" style="background: orange; width: 27px; left: 27px;"></div>
                            <div class="sharpvalue" style="background: yellow; width: 9px; left: 54px;"></div>
                            <div class="sharpvalue" style="background: green; width: 69px; left: 63px;"></div>
                            <div class="sharpvalue" style="background: blue; width: 27px; left: 132px;"></div></div> 
                        <span class="wepsharpinfo">60 hit(s) of blue</span>
                        <span class="wepsharpinfo">150 hit(s) of green</span></div> 
                    <div id="wepbowguncont" class="bowguncont" style="padding-bottom: 5px; display: none;"> 
                        <table class="bowguntable"> <tbody><tr> <td>Clip size</td> <td> <select id="clipcombo" class="bowguncombo"> <option>1</option> <option>2</option> <option selected="">3</option> <option>4</option> <option>5</option> <option>6</option> <option>7</option> <option>8</option> <option>9</option> <option>10</option> <option>11</option> <option>12</option> <option>13</option> <option>14</option> <option>15</option> </select> </td> </tr> <tr> <td>Recoil</td> <td> <select id="recoilcombo" class="bowguncombo"> <option>Recoil +1</option> <option selected="">Recoil +2</option> <option>Recoil +3</option> <option>Recoil +4</option> <option>Cluster +1</option> <option>Cluster +2</option> <option>Cluster +3</option> <option>Rapid +1</option> <option>Rapid +2</option> <option>Rapid +3</option> </select> </td> </tr> <tr> <td>Reload</td> <td> <select id="reloadcombo" class="bowguncombo"> <option>Fast</option> <option selected="">Normal</option> <option>Slow</option> <option>Very Slow</option> </select> </td> </tr> </tbody></table> </div> <div id="wqsbrd" class="skillscont"> <div id="bgmech" class="classmech" style="display: none;"> <div id="bgmodcont1" class="bgmodcont"> <img id="bgmodpic1" class="bgmodpic" src="img\icon\class\shield.png"> <span id="bgmod1text1" class="bgmodtext">Empty</span> </div> <div id="bgmodcont2" class="bgmodcont"> <img id="bgmodpic2" class="bgmodpic" src="img\icon\class\shield.png"> <span id="bgmod1text2" class="bgmodtext">Empty</span> </div> <div id="bgmodcont3" class="bgmodcont"> <img id="bgmodpic3" class="bgmodpic" src="img\icon\class\shield.png"> <span id="bgmod1text3" class="bgmodtext">Empty</span> </div> </div> <span class="smfmech">No special mechanic</span></div> <div id="bowgunequipwrap"></div> 
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                </div>
            </div>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="weapon_type" DataValueField="weapon_type">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectDistinctWeaponType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
