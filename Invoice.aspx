<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/css/invoice.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="card">
          <div class="card-body">
            <div class="container mb-5 mt-3">
              <div class="row d-flex align-items-baseline">
                <hr>
              </div>

              <div class="container">
                  

                <div class="col-md-12 my-5">
                    <asp:Repeater ID="rpthtl" runat="server">
                      <ItemTemplate>
                    <img src='Admin/Images/<%#Eval("h_logo") %>' class="rounded-circle" style="height:75px;width:75px;margin-left:30px;" />
                  <div class="text-center">
                    <h1><%#Eval("h_name") %></h1>
                  </div>
                      </ItemTemplate>
                  </asp:Repeater>
                </div>

                <div class="row">
                  <div class="col-xl-8">
                    <ul class="list-unstyled">
                        
                  <p style="color: #7e8d9f;font-size: 15px;">Invoice <strong>ID:- #<asp:Label ID="invoice_id" runat="server" /></strong></p>
                  <p style="color: #7e8d9f;font-size: 15px;">Creation Date :- <strong><asp:Label ID="invoice_date" runat="server" /></strong></p>
                      <li class="text-muted">To: <span style="color:#5d9fc5 ;"><asp:Label ID="lbl_name" runat="server" /></span></li>
                      <li class="text-muted"><i class="fa fa-phone"></i> <asp:Label ID="lbl_mobile" runat="server" /></li>
                      <li class="text-muted"><i class="fa fa-envelope"></i> <asp:Label ID="lbl_email" runat="server" /></li>
                    </ul>
                  </div>
                  <div class="col-xl-4">
                    <ul class="list-unstyled">
                      <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                          class="fw-bold">Booking Date:</span><asp:Label ID="lbl_bdate" runat="server" /></li>
                      <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                          class="fw-bold">Checkin Date: </span><asp:Label ID="lbl_checkin" runat="server" /></li>
                      <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                          class="fw-bold">Checkout Date: </span><asp:Label ID="lbl_checkout" runat="server" /></li>
                      <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                          class="me-1 fw-bold">Status:</span>Paid</li>
                    </ul>
                  </div>
                </div>

                <div class="row my-2 mx-1 justify-content-center">
                  <table class="table table-striped table-borderless">
                    <thead style="background-color:red ;" class="text-white">
                      <tr>
                        <th scope="col">Service</th>
                        <th scope="col">No of Guest</th>
                        <th scope="col">Nights</th>
                        <th scope="col">Prise(INR)</th>
                        <th scope="col">Total</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><asp:Label ID="lbl_room" runat="server"></asp:Label></th>
                        <td><asp:Label ID="lbl_guest" runat="server" /></td>
                        <td><asp:Label ID="lbl_nights" runat="server" /></td>
                        <td><asp:Label ID="lbl_rpice" runat="server" /></td>
                        <td><asp:Label ID="lbl_rtotal" runat="server" /></td>
                      </tr>
                      <tr>
                        <th scope="row">Food & Catering Service Charges</th>
                        <td><asp:Label ID="lbl_fguest" runat="server" /></td>
                        <td><asp:Label ID="lbl_fnights" runat="server" /></td>
                        <td><asp:Label ID="lbl_fprise" runat="server" /></td>
                        <td><asp:Label ID="lbl_ftotal" runat="server" /></td>
                      </tr>
                      <tr>
                        <th scope="row">Pick-up & Drop Service Charges</th>
                        <td>-</td>
                        <td>-</td>
                        <td><asp:Label ID="lbl_pprise" runat="server" /></td>
                        <td><asp:Label ID="lbl_ptotal" runat="server" /></td>
                      </tr>
                    </tbody>

                  </table>
                </div>
                <div class="row">
                  <div class="col-xl-8">

                  </div>
                  <div class="col-xl-3">
                    <ul class="list-unstyled">
                      <li class="text-muted ms-3"><span class="text-black me-4">SubTotal</span> ₹<asp:Label ID="lbl_subtotal" runat="server" /></li>
                      <li class="text-muted ms-3 mt-2"><span class="text-black me-4">Tax(18%)</span> ₹<asp:Label ID="lbl_tax" runat="server" /></li>
                    </ul>
                    <p class="text-black float-start"><span class="text-black me-3"> Total Amount</span><span
                        style="font-size: 25px;"> ₹<asp:Label ID="lbl_total" runat="server" /></span></p>
                  </div>
                </div>
                  
                <div class="row">
                  <div class="col-xl-14 align-content-center">
                    
                <div class="col-xl-3 float-end d-print-none">
                  <a class="btn btn-light text-capitalize border-0" onclick="print()" data-mdb-ripple-color="dark"><i
                      class="btn btn-primary"></i> Print</a>
			          <script>
			              print(){
			                  windows.print();
			              }
			          </script>
                  <a href="Index.aspx" class="btn btn-light text-capitalize" data-mdb-ripple-color="dark"><i
                      class="btn btn-danger"></i> Back To Home</a>
                </div>
                  </div>
                <hr>

                <div class="row">
                  <div class="col-xl-10 text-center">
                    <p>Thank you!!</p>
                      <h6>Note:-Keep your at least 1 identity card with you</h6>
                      <h6>&nbsp&nbsp&nbsp The pickup and drop charge is applicable for in only (20km) Radius</h6>
                  </div>

              </div>
            </div>
          </div>
                </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
