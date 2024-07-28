<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Addrooms.aspx.cs" Inherits="Admin_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                
           <div class="container align-content-center pt-4">
                <div class="row pt-3 px-4">
                    <h4 class="text-center" style="color:skyblue">Add Room Category</h4>

                </div>
                <div class="row pt-5 px-4 ">
                    <div class="col">
                            <asp:Label ID="lblrname" runat="server">Room Name</asp:Label>
                            <asp:TextBox id="txtrname" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd1" runat="server" ControlToValidate="txtrname" ErrorMessage="Enter Room Type Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrdes" runat="server">Description</asp:Label>
                            <asp:TextBox ID="txtrdes" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd2" runat="server" ControlToValidate="txtrdes" ErrorMessage="Enter Description" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                    <div class="col">
                            <asp:Label ID="lblrprise" runat="server">Room Prise</asp:Label>
                            <asp:TextBox id="txtrprise" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd3" runat="server" ControlToValidate="txtrprise" ErrorMessage="Enter Room Price" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                        <div class="col">
                            <asp:Label ID="lbl_rsize" runat="server">Room Size</asp:Label>
                            <asp:TextBox ID="txtrsize" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd4" runat="server" ControlToValidate="txtrsize" ErrorMessage="Enter Room Size" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblrbeds" runat="server">No of Beds</asp:Label>
                            <asp:TextBox id="txtrbeds" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd5" runat="server" ControlToValidate="txtrbeds" ErrorMessage="Enter Beds" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblfcharge" runat="server">Food Catering Service Charges</asp:Label>
                            <asp:TextBox ID="txtfcharge" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd6" runat="server" ControlToValidate="txtfcharge" ErrorMessage="Enter Catering Cahrges" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblcab" runat="server">Pickup & Drop Charges</asp:Label>
                            <asp:TextBox id="txtpickup" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfd7" runat="server" ControlToValidate="txtpickup" ErrorMessage="Enter Pickup Charges" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                </div>
               <div class="row pt-4 px-4">
                   <div class="col">
                       <asp:Label ID="lblimg" runat="server">Add Room Image</asp:Label>
                       <asp:FileUpload ID="roomimg" runat="server" CssClass="form-control" />
                   </div>
               </div>
               
                <div class="row pt-5 px-4 align-content-center">
                    <asp:Button ID="btn_add" runat="server" CssClass="btn btn-info" Text="Add" OnClick="btn_add_Click"/>
                    <asp:Label ID="lbl_m" runat="server" ></asp:Label>
                </div>
        </div>
</asp:Content>
