<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InReport.aspx.cs" Inherits="Report1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="~/assets/css/invoice.css" rel="stylesheet" />
    <style>
        thead{
            background-color:black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
    <div class="one">
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
                    <img src='Images/<%#Eval("h_logo") %>' class="rounded-circle" style="height:75px;width:75px;margin-left:30px;" />
                  <div class="text-center">
                    <h1><%#Eval("h_name") %> Income Report</h1>
                  </div>
                      </ItemTemplate>
                  </asp:Repeater>
                </div>

                <div class="row">
                  <div class="col-xl-8">
                    <ul class="list-unstyled">
                        
                  <p style="color: #7e8d9f;font-size: 15px;">Creation Date :- <strong><asp:Label ID="cre_date" runat="server" /></strong></p>
                      
                    </ul>
                  </div>
                  <div class="col-xl-4">
                    <ul class="list-unstyled">
                      <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                          class="fw-bold">From Date: </span><asp:Label ID="from_date" runat="server" /></li>
                      <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                          class="fw-bold">To Date: </span><asp:Label ID="to_date" runat="server" /></li>
                      
                    </ul>
                  </div>
                </div>

                <div class="row my-2 mx-1 justify-content-center">
                  <table class="table table-striped table-borderless">
                    <thead class="text-white">
                      <tr>
                        <th scope="col">Service</th>
                        <th scope="col">Total Bookings</th>
                        <th scope="col">Prise(INR)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">Confirm Bookings</th>
                        <td><asp:Label ID="lbl_totb" runat="server" /></td>
                        <td><asp:Label ID="lbl_totp" runat="server" /></td>
                      </tr>
                      <tr>
                        <th scope="row">Cancelled Bookings</th>
                        <td><asp:Label ID="lblc_tot" runat="server"></asp:Label></td>
                        <td><asp:Label ID="lblc_pr" runat="server"></asp:Label></td>
                      </tr>
                    </tbody>

                  </table>
                </div>
                <div class="row">
                  <div class="col-xl-8">

                  </div>
                  <div class="col-xl-3">
                   
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
