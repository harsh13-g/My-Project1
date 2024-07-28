<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Viewrooms.aspx.cs" Inherits="Admin_Viewrooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container align-content-center pt-4">
       
        <h4 class="text-center pt-4">Rooms</h4>
        <asp:Repeater ID="rpt_rview" runat="server">
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate>
        <div class="row pt-3 px-4">
            
             <div class="col">
                <div class="card mb-3" style="max-width:1000px; border-bottom-color:black;">
                    <div class="row g-0">
                        <div class="col md-4">
                            <img src="Images/<%#Eval("image") %>" class="img-fluid rounded-start p-3" style="height:220px; width:300px"  />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h4 class="card-title p-0"><asp:Label ID="lbl_name" runat="server" Text='<%#Eval("name") %>'></asp:Label></h4>
                                <p class="card-title"><small><asp:Label ID="lbl_dis" runat="server" Text='<%#Eval("description") %>'></asp:Label></small></p>
                                <p class="card-text p-0" style="color:#EE3B3B;">Prise.:<small style="color:#47a7ce;"><asp:Label ID="lbl_prise" runat="server" Text='<%#Eval("prise") %>'></asp:Label></small><br />
                                    Size..:<small style="color:#47a7ce;"><asp:Label ID="lbl_size" runat="server" Text='<%#Eval("size") %>'></asp:Label></small> &nbsp &nbsp No.Of.Beds..:<small style="color:#47a7ce;"><asp:Label ID="lbl_beds" runat="server" Text='<%#Eval("beds") %>'></asp:Label></small>
                                    &nbsp &nbsp Total No Of Rooms..:<small style="color:#47a7ce"><asp:Label ID="lbl_num" runat="server" Text='<%#Eval("Total") %>'></asp:Label></small> <br />
                                    Food & Catering Charges..:<small style="color:#47a7ce;"><asp:Label ID="lbl_fcharge" runat="server" Text='<%#Eval("fcharge") %>'></asp:Label></small> &nbsp &nbsp Pickup & Drop Charges..:
                                   <small style="color:#47a7ce;"><asp:Label ID="lbl_echarge" runat="server" Text='<%#Eval("pcharge") %>'></asp:Label></small> 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
                    </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
                </asp:Repeater>
    </div>
</asp:Content>
