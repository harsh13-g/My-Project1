<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="ManageBooking.aspx.cs" Inherits="ManageBooking" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <style>
        .one{
            margin-left:300px;
            margin-right:300px;
            margin-top:80px;
            margin-bottom:40px;
        }
         .two{
           margin-left:620px;
           margin-bottom:20px;
       }
    </style>
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="one"> 
        <asp:Label ID="lbl_info" runat="server"></asp:Label>
                <div class="row pt-4 px-4">
                    <div class="container section-title pt-4 p-1" data-aos="fade-up">
                        <h2>View Booking</h2>
                </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label3" runat="server">Name</asp:Label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label2" runat="server">Email</asp:Label>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrdes" runat="server">Room Type</asp:Label>
                            <asp:TextBox ID="txtrtype" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                        <div class="col">
                            <asp:Label ID="Label1" runat="server">Room Number</asp:Label>
                            <asp:TextBox ID="txtrno" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrprise" runat="server">Check-in Date</asp:Label>
                            <asp:TextBox id="txtchin" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="lbl_rsize" runat="server">Check-out Date</asp:Label>
                            <asp:TextBox ID="txtchout" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrbeds" runat="server">Booking Date</asp:Label>
                            <asp:TextBox id="txtbdate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label4" runat="server">Booking Amount</asp:Label>
                            <asp:TextBox id="txtbamount" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label5" runat="server">Status</asp:Label>
                            <asp:TextBox id="txtsts" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                </div>
                
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label6" runat="server">Transaction id</asp:Label>
                            <asp:TextBox id="txt_trid" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                </div>
    </div>
    <div class="two">
<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Cancel Booking
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">CANCEL BOOKING</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <asp:Label ID="lbl_ms" runat="server"></asp:Label>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
        <asp:Button ID="btn_cnl_booking" Visible="false" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btn_cnl_booking_Click"/>
      </div>
    </div>
  </div>
</div></div>
</asp:Content>