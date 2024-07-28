<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CancelReciept.aspx.cs" Inherits="CancelReciept" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Source Sans Pro', sans-serif;
}

.container {
    display: block;
    width: 100%;
    background: #fff;
    max-width: 350px;
    padding: 25px;
    margin: 50px auto 0;
    box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);
}

.receipt_header {
    padding-bottom: 20px;
    border-bottom: 1px dashed #000;
    text-align: center;
}

.receipt_header h1 {
    font-size: 20px;
    margin-bottom: 5px;
    text-transform: uppercase;
}

.receipt_header h1 span {
    display: block;
    font-size: 25px;
}

.receipt_header h2 {
    font-size: 14px;
    color: #727070;
    font-weight: 300;
}

.receipt_header h2 span {
    display: block;
}

.receipt_body {
    margin-top: 10px;
}

table {
    width: 100%;
}

thead, tfoot {
    position: relative;
}

thead th:not(:last-child) {
    text-align: left;
}

thead th:last-child {
    text-align: right;
}

thead::after {
    content: '';
    width: 100%;
    border-bottom: 1px dashed #000;
    display: block;
    position: absolute;
}

tbody td:not(:last-child), tfoot td:not(:last-child) {
    text-align: left;
}

tbody td:last-child, tfoot td:last-child{
    text-align: right;
}

tbody tr:first-child td {
    padding-top: 15px;
}

tbody tr:last-child td {
    padding-bottom: 15px;
}

tfoot tr:first-child td {
    padding-top: 15px;
}

tfoot::before {
    content: '';
    width: 100%;
    border-top: 1px dashed #000;
    display: block;
    position: absolute;
}

tfoot tr:first-child td:first-child, tfoot tr:first-child td:last-child {
    font-weight: bold;
    font-size: 20px;
}

.date_time_con {
    display: flex;
    justify-content: center;
    column-gap: 25px;
}

.items {
    margin-top: 25px;
}

h3 {
    border-top: 1px dashed #000;
    padding-top: 10px;
    margin-top: 25px;
    text-align: center;
    text-transform: uppercase;
}
.on1{
    margin-top:20px;
    margin-left:630px;
}
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                <div class="container">
    
    <div class="receipt_header">
    <h1>Receipt for Cancellation<span>AR_Hotel</span></h1>
    <h5>To:<span><asp:Label ID="lbl_cnm" runat="server"></asp:Label></span></h5>
        <h5>Room:<span><asp:Label ID="lbl_rmt" runat="server"></asp:Label></span></h5>
        <h5>Room_no:<span><asp:Label ID="lbl_rno" runat="server"></asp:Label></span></h5>
    </div>
    
    <div class="receipt_body">

        <div class="date_time_con">
           <h5>Cancellation Date..: </h5> <div class="date"><asp:Label ID="cdt" runat="server"></asp:Label></div>
        </div>
        <div class="date_time_con">
           <h5>Booking Date.......: </h5> <div class="date"><asp:Label ID="bdt" runat="server"></asp:Label></div>
        </div>
        <div class="date_time_con">
           <h5>Check-in Date.....: </h5> <div class="date"><asp:Label ID="cin" runat="server"></asp:Label></div>
        </div>
        <div class="date_time_con">
           <h5>Check-out Date....: </h5> <div class="date"><asp:Label ID="cout" runat="server"></asp:Label></div>
        </div>

        <div class="items">
            <table>
        
                <thead>
                    <th>No</th>
                    <th>Details</th>
                    <th>Amount</th>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Booking Amount</td>
                        <td><asp:Label ID="bamt" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Cancellation </td>
                        <td><asp:Label ID="camt" runat="server"></asp:Label></td>
                    </tr>
                </tbody>

                <tfoot>
                    <tr>
                        <td>Amount</td>
                        <td></td>
                        <td><asp:Label ID="ramt" runat="server"></asp:Label></td>
                    </tr>
                </tfoot>

            </table>
        </div>

    </div>


    <h3>Thank You!</h3>

</div>
        <div class="on1">
        <div class="col-xl-3 float-end d-print-none">
                  <a class="btn btn-light text-capitalize border-0" onclick="print()" data-mdb-ripple-color="dark"><i
                      class="btn btn-primary"></i> Print</a>
			          <script>
			              print(){
			                  windows.print();
			              }
			          </script> &nbsp &nbsp
                    <asp:Button ID="btn_goback" runat="server" Text="Back to home" OnClick="btn_goback_Click" />
                    
                </div>
            <p>You amount will be credited in your account with in 4-7 working days</p>
            </div>
        
    </div>
    </form>
</body>
</html>
