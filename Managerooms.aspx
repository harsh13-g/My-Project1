<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Navbar2.master" CodeFile="Managerooms.aspx.cs" Inherits="Admin_Managerooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="container align-content-center pt-4">
               <div class="row pt-4 px-4">
                   <div class="col">
                       <h4 class="text-center" style="color:red">Manage Room Category</h4>
                   </div>
               </div>
                <div class="row pt-4 px-4">
                            <label>Select Room Type</label>
                        <div class="col">
                            <asp:DropDownList ID="ddlroom" runat="server" AutoPostBack="true" CssClass="form-control form-select"></asp:DropDownList>
                        </div>
                            <div class="col">
                            <asp:Button ID="btn_select" runat="server" CssClass="btn btn-info" Text="Select" OnClick="btn_select_Click" />  
                            </div>  
                        <div class="col">
                            <asp:Button ID="btn_delete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btn_delete_Click" />
                        </div>
                                       
                </div>
                <div class="row pt-5 px-4 ">
                    <div class="col">
                            <asp:Label ID="lbl_rname" runat="server">Room Name</asp:Label>
                            <asp:TextBox id="txt_rname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lbl_rdes" runat="server">Description</asp:Label>
                            <asp:TextBox ID="txt_rdes" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                    <div class="col">
                            <asp:Label ID="lbl_rprise" runat="server">Room Prise</asp:Label>
                            <asp:TextBox id="txt_rprise" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="col">
                            <asp:Label ID="lbl_rsize" runat="server">Room Size</asp:Label>
                            <asp:TextBox ID="txt_rsize" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="lbl_rbeds" runat="server">No of Beds</asp:Label>
                            <asp:TextBox id="txt_rbeds" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                    
                        <div class="col">
                            <asp:Label ID="lbl_fcharge" runat="server">Food Catering Service Charges</asp:Label>
                            <asp:TextBox ID="txt_fcharge" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="lbl_pickup" runat="server">Pickup & Drop Charges</asp:Label>
                            <asp:TextBox id="txt_ccharge" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4">
                   <div class="col">
                       <asp:Label ID="lblimg" runat="server">Add Room Image</asp:Label>
                       <asp:FileUpload ID="newroomimg" runat="server" CssClass="form-control" />
                       
                   </div>
                    <div class="col">
                        <asp:Repeater ID="rptimg" runat="server">
                            <HeaderTemplate></HeaderTemplate>
                            <ItemTemplate>
                        Old..: <img src="Images/<%#Eval("image") %>" style="height:70px; width:70px;" />
                                <asp:Label ID="lbl_oldimg" runat="server" Text='<%#Eval("image") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:Repeater>
                    </div>
               </div>
                <div class="row pt-5 px-4 align-content-center">
                    <asp:Button ID="btn_upd" runat="server" CssClass="btn btn-info" Text="Update" OnClick="btn_upd_Click"/>
                </div>
        </div>
</asp:Content>
    

