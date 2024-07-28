<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="Conf.aspx.cs" Inherits="Conf" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <style>
        body{
             background:#eee;
        }

.card { 
    box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: 1rem;
}

.card-body {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.5rem 1.5rem;
}
.one{
    margin-top:100px;
    margin-bottom:100px;
}

    </style>
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="one">
    <div class="container">
        <div class="row pt-1 px-4">
            <h2 class="section-title">Confirm Booking</h2>
            </div>
    <div class="row">
      <!-- Left -->
      <div class="col-lg-9">
            <div class="col-sm">
        <div class="row pt-0 px-4">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <address>
                            <strong>AR_Hotel</strong>
                            <br />
                            near xyz Shooping,
                            <br />
                            Amreli, Gujrat 365610
                            <br />
                            <abbr>Phone:</abbr> 9090909090
                        </address>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                        <address>
                            <strong><asp:Label ID="b_cname" runat="server" /></strong>
                            <br />
                            <asp:Label ID="b_email" runat="server" />
                            <br />
                            <abbr>Phone:</abbr> <asp:Label ID="b_cmobile" runat="server" />
                        </address>
                    </div>
                </div>
        <div class="row pt-4 px-4">
                    <table class="table">
                        <thead class="table-info">
                            <tr>
                                <th scope="col">Service</th>
                                <th scope="col">No.of Guest</th>
                                <th scope="col">Nights</th>
                                <th scope="col">Prise(INR)</th>
                                <th scope="col">Total</th>
                            </tr>
                       </thead>
                            <tbody>
                                <tr>
                                    <td><asp:Label ID="b_rtype" runat="server"></asp:Label> </td>
                                    <td><asp:Label ID="b_guest" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="b_nights" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="rps" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="r_total" runat="server"></asp:Label></td>
                                </tr>

                            </tbody>
                            
                            <tbody>
                                <tr>
                                    <td>Food & Catering</td>
                                    <td><asp:Label ID="f_guest" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="f_night" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="f_rps" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="f_total" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                            
                            <tbody>
                                <tr>
                                    <td>Transportation</td>
                                    <td><asp:Label ID="t_guest" runat="server"></asp:Label></td>
                                    <td>-</td>
                                    <td><asp:Label ID="t_rps" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="t_total" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                            
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Sub-Total</td>
                                    <td><asp:Label ID="sub_total" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                            
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>GST(+18%)</td>
                                    <td><asp:Label ID="gst" runat="server"></asp:Label> </td>
                                </tr>
                            </tbody>

                            
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Total</td>
                                    <td><asp:Label ID="final_total" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                 <div class="row pt-4 px-4">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info w-100" Text="Pay Another Way" OnClick="Button1_Click"/>
            </div>
            </div>
      </div>
      <!-- Right -->
      <div class="col-lg-3">
        <div class="card position-sticky top-0">
          <div class="p-3 bg-light bg-opacity-10">
            <h4 class="card-title">PAY NOW</h4>
            <div class="d-flex justify-content-between mb-1 small pt-2">
              <span><asp:TextBox ID="txt_card_name" runat="server" CssClass="form-control" placeholder="Enter Card Holder Name"></asp:TextBox></span>
            </div>
            <div class="d-flex justify-content-between mb-1 small pt-2" >
              <span><asp:TextBox ID="txt_card_number" runat="server" CssClass="form-control" placeholder="Enter Card Number" TextMode="Number"></asp:TextBox></span>
            </div>
            <div class="d-flex justify-content-between mb-1 small pt-2">
              <span><asp:TextBox ID="txtexdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></span>
            </div>
            <div class="d-flex justify-content-between mb-1 small pt-2">
              <span><asp:TextBox ID="txtcvv" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter CVV"></asp:TextBox></span>
                <asp:RegularExpressionValidator ID="rgx1" runat="server" ValidationExpression="^[0-9]{3}$" ErrorMessage="Enter proper cvv" ForeColor="Red" ControlToValidate="txtcvv"></asp:RegularExpressionValidator>
            </div>
            <hr>
            <div class="d-flex justify-content-between mb-4 small">
              <span>TOTAL</span> <strong class="text-dark"><asp:Label ID="lbl_tot" runat="server"></asp:Label></strong>
            </div>      
            <asp:Button ID="btn_pay" runat="server" CssClass="btn btn-primary w-100 mt-2" Text="Pay" OnClick="btn_pay_Click" />
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
</asp:Content>