<%@ Page Title="Gemba Audit Node Form" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="GembaAuditNodeForm.aspx.vb" Inherits="GembaAuditNodeForm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<asp:Table ID="PageTable" runat="server" Width="1250px"  Height ="800px" align = "center">
<asp:TableRow><asp:TableCell><h2>Gemba Audit Node - New</h2></asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
<asp:TableRow>
<asp:TableCell Width="400px" BorderColor="#0099CC" BorderStyle="Solid" BorderWidth="1">

<%-- ***************--%> 
  <%-- AUDIT LEFT SIDE--%>  
<%-- ***************--%>   

        <asp:Table ID="Table3" runat="server" CellPadding="10" Width="400px" Height ="80px" BorderWidth="10" BorderColor="#CCEEFF"  BackColor="#CCEEFF" >
            <asp:TableRow Height="10"><asp:TableCell Width="100px"><img src="img/Bluebin_logo-inline.png" width="150" /></asp:TableCell><asp:TableCell Width="250px"></asp:TableCell></asp:TableRow>
            </asp:Table>
        <asp:Table ID="Table1" runat="server" CellPadding="10" Width="400px"  Height ="885px" BorderWidth= "10" BorderColor="#CCEEFF" BackColor="#CCEEFF">

         
            <asp:TableRow Height="10"></asp:TableRow>
            
 <%-- Date --%>   
                <asp:TableRow Width="40px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label1" runat="server" Text="Date" Width="100px" BackColor="#CCEEFF"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="300px">
                    <asp:TextBox ID="CurrentTimeTB" runat="server"  ReadOnly="True" BackColor="#CCEEFF" DataFormatString="{0:d}" Width="100px"></asp:TextBox>
                </asp:TableCell>
                 </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
 <%-- Location --%>   
                 <asp:TableRow Width="400px">    
                <asp:TableCell Width="100px" >
                    <asp:Label ID="Location" runat="server" Text="Location" TextMode="MultiLine" Width="100px"></asp:Label>
                    
                     </asp:TableCell>
                <asp:TableCell Width="300px">
                    <asp:DropDownList ID="LocationDD"   Width="200px" AppendDataBoundItems="true" runat="server" DataSourceID="GembaAuditNodeFormLocationSource" DataTextField="LocationName" DataValueField="LocationID">
                <asp:ListItem Selected = "True" Text = "" Value = ""></asp:ListItem>
                          </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorLocation" ControlToValidate="LocationDD" runat="server" ForeColor="Red" ErrorMessage="Required" Font-Size="X-Small"></asp:RequiredFieldValidator>
  
                </asp:TableCell>
                 </asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
<%-- Auditer --%> 
                <asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label7" runat="server" Text="Auditer" TextMode="MultiLine" Width="100px"></asp:Label>
                                  
                </asp:TableCell>
                           <asp:TableCell Width="300px">
                    <asp:TextBox ID="AuditerTB" runat="server"  ReadOnly="True" BackColor="#CCEEFF"  Width="200px" ></asp:TextBox>                                               
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>


 <%-- Pull Standard Score --%>
<asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label3" runat="server" Text="Pull Standard Score"  TextMode="MultiLine" Width="100px"></asp:Label>
                </asp:TableCell><asp:TableCell Width="300px">
                    <asp:TextBox ID="PullStandardTB" runat="server" Height="50px" Width="50px"  BackColor="#CCEEFF" style="text-align:center"  Font-Size="Large" ReadOnly="True" Wrap="False"> </asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
 <%-- Replenishment Score --%>
<asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label4" runat="server" Text="Replenishment Score"  TextMode="MultiLine" Width="100px"></asp:Label>
                </asp:TableCell><asp:TableCell Width="300px">
                    <asp:TextBox ID="ReplenishmentTB" runat="server" Height="50px"  BackColor="#CCEEFF" style="text-align:center"  Font-Size="Large"  Width="50px"  ReadOnly="True"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
<%-- Stage Score --%>
<asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label8" runat="server" Text="Stage Score"  TextMode="MultiLine" Width="100px"></asp:Label>
                </asp:TableCell><asp:TableCell Width="300px">
                    <asp:TextBox ID="StageTB" runat="server" Height="50px"  BackColor="#CCEEFF" style="text-align:center"  Font-Size="Large"  Width="50px"  ReadOnly="True"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
 <%-- Node Integrity Score --%>
<asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label5" runat="server" Text="Node Integrity Score"  TextMode="MultiLine" Width="100px"></asp:Label>
                </asp:TableCell><asp:TableCell Width="300px">
                    <asp:TextBox ID="NodeIntegrityTB" runat="server" Height="50px"  BackColor="#CCEEFF" style="text-align:center"  Font-Size="Large"  Width="50px"  ReadOnly="True"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
 
 <%-- Total Score --%>
<asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label6" runat="server" Text="Total Score"  TextMode="MultiLine" Width="100px"></asp:Label>
                </asp:TableCell><asp:TableCell Width="300px">
                    <asp:TextBox ID="TotalScoreTB" runat="server" Height="75px"  BackColor="#CCEEFF" style="text-align:center"  Font-Size="XX-Large"  Width="75px" ReadOnly="True"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>

 <%-- Addtl Comments --%>
<asp:TableRow Width="400px">    
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label2" runat="server" Text="Addt. Comments"  TextMode="MultiLine" Width="100px"></asp:Label>
                </asp:TableCell><asp:TableCell Width="300px">
                    <asp:TextBox ID="AdditionalCommentsTB" runat="server" Height="150px" Width="250px" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow Height="10"></asp:TableRow>
  
            
          <asp:TableRow Height="10"></asp:TableRow>
        </asp:Table>
 </asp:TableCell> 

<%-- ***************--%> 
  <%-- AUDIT RIGHT SIDE--%>  
<%-- ***************--%>    
     <asp:TableCell Width="850px" BorderColor="#0099CC" BorderStyle="Solid" BorderWidth="1">

        
        <asp:Table ID="Table2" runat="server" CellPadding="0" Width="850px"  Height ="900px" CellSpacing="0"  BorderWidth="10" BorderColor="#0099CC" BackColor="#0099CC">
         <asp:TableRow Height="10"></asp:TableRow>
       
 <%-- Pull Standards --%>   

            <asp:TableRow Width="850px" BackColor="#333333">    

                <asp:TableCell Width ="325">
                    &nbsp;<asp:Label runat ="server" ForeColor="White" Font-Bold="True" ToolTip="Clinical Compliance; How are the Nurses Doing?">PULL STANDARDS</asp:Label></asp:TableCell>
                <asp:TableCell Width ="525" Height="5"></asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow Height="10"></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label15" runat="server" Text="Empty Bins Sitting In Sequence"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList id=PS_EmptyBinsRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="6">
                            <asp:ListItem Value="0" Selected="True">5 or More</asp:ListItem>
                            <asp:ListItem Value="1">4</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">2</asp:ListItem>
                            <asp:ListItem Value="4">1</asp:ListItem>
                            <asp:ListItem Value="5">None</asp:ListItem>
                        </asp:RadioButtonList>
                    
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label16" runat="server" Text="Back Bins Not Pulled Forward"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=PS_BackBinsRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="6">
                            <asp:ListItem Value="0" Selected="True">5 or More</asp:ListItem>
                            <asp:ListItem Value="1">4</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">2</asp:ListItem>
                            <asp:ListItem Value="4">1</asp:ListItem>
                            <asp:ListItem Value="5">None</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label18" runat="server" Text="Returns Bin Volume (vol and items)"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=PS_ReturnVolumeRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="6">
                            <asp:ListItem Value="0" Selected="True">Overflow&nbsp;&nbsp;&nbsp;</asp:ListItem>
                            <asp:ListItem Value="1">100%</asp:ListItem>
                            <asp:ListItem Value="2">75%</asp:ListItem>
                            <asp:ListItem Value="3">50%</asp:ListItem>
                            <asp:ListItem Value="4">25%</asp:ListItem>
                            <asp:ListItem Value="5">0%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label19" runat="server" Text="Non BBT Supplies Found"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=PS_NonBBTRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="6">
                            <asp:ListItem Value="0" Selected="True">5 or More</asp:ListItem>
                            <asp:ListItem Value="1">4</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">2</asp:ListItem>
                            <asp:ListItem Value="4">1</asp:ListItem>
                            <asp:ListItem Value="5">None</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label17" runat="server" Text="Stockouts (both Bins Gone)"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=PS_StockOutsRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="6">
                            <asp:ListItem Value="0" Selected="True">5 or More</asp:ListItem>
                            <asp:ListItem Value="1">4</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">2</asp:ListItem>
                            <asp:ListItem Value="4">1</asp:ListItem>
                            <asp:ListItem Value="5">None</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                
                
               <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label21" runat="server" Text="Tagged Orange Cones (to check Stage)"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:DropDownList ID="PS_OrangeConesDD"  runat="server" AutoPostBack="False">
                        <asp:ListItem Selected = "True" Text = "--Select--" Value = "0"></asp:ListItem>
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                    </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow Height="10"></asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label20" runat="server" Text="Comments"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="PSCommentsTB" runat="server" Height="50px" Width="300px" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
             </asp:TableRow>
                <asp:TableRow Height="10"></asp:TableRow>   
 <%-- Replenishment Standards --%>   

            <asp:TableRow Width="850px" BackColor="#333333" Height="15">    

                <asp:TableCell Width ="250">
                    &nbsp;<asp:Label runat ="server" ForeColor="White" Font-Bold="True" ToolTip="How are the Striders/Tech Doing?">REPLENISHMENT STANDARDS</asp:Label></asp:TableCell>
                <asp:TableCell Width ="250"></asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow Height="5"></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label9" runat="server" Text="Bins Filled to Par - FIFO Replenishment"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=RS_BinsFilledRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label29" runat="server" Text="Empties Collected (bins and cards)"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=RS_EmptiesCollectedRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label11" runat="server" Text="Node Visually Swept and Corrected"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=RS_NodeSweptRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">In Need</asp:ListItem>
                            <asp:ListItem Value="2">Acceptable</asp:ListItem>
                            <asp:ListItem Value="5">Perfect</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label10" runat="server" Text="Returns Bin Serviced"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=RS_BinServicesRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label12" runat="server" Text="Other Node Service Corrections"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=RS_NodeCorrectionsRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="6">
                            <asp:ListItem Value="0" Selected="True">5 or More</asp:ListItem>
                            <asp:ListItem Value="1">4</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">2</asp:ListItem>
                            <asp:ListItem Value="4">1</asp:ListItem>
                            <asp:ListItem Value="5">None</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow Height="10">    
                    <asp:TableCell>&nbsp;<asp:Label ID="Label28" runat="server" Text="Service Tech Shadowed"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:DropDownList ID="ShadowedUserDD"  AppendDataBoundItems="true" runat="server" DataSourceID="GembaAuditNodeFormShadowResourceSource" DataTextField="FullName" DataValueField="FullName">
                    <asp:ListItem Selected = "True" Text = "" Value = ""></asp:ListItem>

                    </asp:DropDownList></asp:TableCell>
             </asp:TableRow>
                <asp:TableRow Height="10"></asp:TableRow>  
            <asp:TableRow Height="10">    
                    <asp:TableCell>&nbsp;<asp:Label ID="Label14" runat="server" Text="Comments"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="RSCommentsTB" runat="server" Height="50px" Width="300px" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
             </asp:TableRow>
                <asp:TableRow Height="10"></asp:TableRow>   

 <%-- Stage Standards --%>   

            <asp:TableRow Width="850px" BackColor="#333333" Height="15">    

                <asp:TableCell Width ="250">
                    &nbsp;<asp:Label runat ="server" ForeColor="White" Font-Bold="True" ToolTip="How does the Staging Area Look?">STAGE STANDARDS</asp:Label></asp:TableCell>
                <asp:TableCell Width ="250"></asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow Height="5"></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label13" runat="server" Text="Stage Area Properly Supplied"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=SS_SuppliedRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label30" runat="server" Text="Kanbans Properly Positioned"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=SS_KanbansPPRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label31" runat="server" Text="Day Of Stockouts Pulled & Tagged"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=SS_StockoutsPTRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label32" runat="server" Text="Cone Stockouts Match Tags in Node"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=SS_StockoutsMatchRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label33" runat="server" Text="Huddle Board reflects Orange Cones"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=SS_HuddleBoardMatchRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">< 100%</asp:ListItem>
                            <asp:ListItem Value="5">100%</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow Height="10"></asp:TableRow>  
            <asp:TableRow Height="10">    
                    <asp:TableCell>&nbsp;<asp:Label ID="Label35" runat="server" Text="Comments"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="SS_CommentsTB" runat="server" Height="50px" Width="300px" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
             </asp:TableRow>
                <asp:TableRow Height="10"></asp:TableRow>   

<%-- Node Integrity Standards --%>   

            <asp:TableRow Width="850px" BackColor="#333333" Height="15">    

                <asp:TableCell Width ="250">
                    &nbsp;<asp:Label runat ="server" ForeColor="White" Font-Bold="True" ToolTip="How are the BlueBelts doing?">NODE INTEGRITY STANDARDS</asp:Label></asp:TableCell>
                <asp:TableCell Width ="250"></asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow Height="5"></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label22" runat="server" Text="Labels Clean and to Standard"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=NIS_LabelsRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth17b" RepeatColumns="3">
                            <asp:ListItem Value="1" Selected="True">In Need</asp:ListItem>
                            <asp:ListItem Value="3">Good</asp:ListItem>
                            <asp:ListItem Value="5">Perfect</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label23" runat="server" Text="Card Holders Functioning"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=NIS_CardHoldersRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth17b" RepeatColumns="3">
                            <asp:ListItem Value="1" Selected="True">In Need</asp:ListItem>
                            <asp:ListItem Value="3">Good</asp:ListItem>
                            <asp:ListItem Value="5">Perfect</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label24" runat="server" Text="Bins, Racks, and Other Hardware"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=NIS_BinsRacksRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth17b" RepeatColumns="3">
                            <asp:ListItem Value="1" Selected="True">In Need</asp:ListItem>
                            <asp:ListItem Value="3">Good</asp:ListItem>
                            <asp:ListItem Value="5">Perfect</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label25" runat="server" Text="General Appearance"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=NIS_GeneralAppearanceRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth17b" RepeatColumns="3">
                            <asp:ListItem Value="1" Selected="True">In Need</asp:ListItem>
                            <asp:ListItem Value="3">Good</asp:ListItem>
                            <asp:ListItem Value="5">Perfect</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;<asp:Label ID="Label26" runat="server" Text="Signage, Item Locator, and QCN"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                    <asp:RadioButtonList id=NIS_SignageRL runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="fixWidth18" RepeatColumns="3">
                            <asp:ListItem Value="0" Selected="True">Outdated</asp:ListItem>
                            <asp:ListItem Value="5">Current</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="10">    
                    <asp:TableCell>&nbsp;<asp:Label ID="Label27" runat="server" Text="Comments"></asp:Label></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="NISCommentsTB" runat="server" Height="50px" Width="300px" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
             </asp:TableRow>
                <asp:TableRow Height="10"></asp:TableRow>   

        </asp:Table>



                 
 </asp:TableCell>  



    </asp:TableRow> 
 <asp:TableRow Height="10"></asp:TableRow>
 <asp:TableRow>
     <asp:TableCell>
         <asp:Button ID="GembaAuditNodeFormSubmit" runat="server" Text="Submit" />&nbsp;
         <asp:Button ID="GembaAuditNodeFormCancel" runat="server" Text="Cancel" CausesValidation="false"/>&nbsp;
         <asp:Button ID="GembaAuditNodeFormCalculate" runat="server" Text="Calculate" />&nbsp;
         <br /></asp:TableCell></asp:TableRow>       
        </asp:Table>
  
        
        
        
        
        
        <br />&nbsp;&nbsp; <br /><br /><br /><br /><br /><asp:SqlDataSource ID="GembaAuditNodeFormLocationSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="exec sp_SelectLocation"></asp:SqlDataSource>      
        <asp:SqlDataSource ID="GembaAuditNodeFormShadowResourceSource" runat="server" ConnectionString="<%$ ConnectionStrings:Site_ConnectionString %>" SelectCommand="exec sp_SelectGembaShadow"></asp:SqlDataSource>
        

    
   

</asp:Content>
