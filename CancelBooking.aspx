<%@ Page Language="C#" MasterPageFile="~/Admin/navbar2.master" AutoEventWireup="true" CodeFile="CancelBooking.aspx.cs" Inherits="Admin_CancelBooking" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">

</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h4 class="text-center pt-5">Cancelled Bookings</h4>
                    <div class="col-12 p-4">
                        <div class="bg-dark rounded h-100 p-4">
                            <div class="table-responsive p-2">
                                <table class="table">
                                    <thead style="color:red">
                                        <tr>
                                            <th scope="col">Customer Details</th>
                                            <th scope="col">Room Details</th>
                                            <th scope="col">Room Number</th>
                                            <th scope="col">Booking Date</th>
                                            <th scope="col">Checkin-Date</th>
                                            <th scope="col">Checkout-Date</th>
                                            <th scope="col">Canellation Date</th>
                                            <th scope="col">Paid Amount</th>
                                            <th scope="col">Return Amount</th>
                                            <th scope="col">Transaction id</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <asp:Repeater ID="rptbook" runat="server">
                                            <ItemTemplate>
                                    <tbody style="color:#0dcaf0;">
                                        

                                        <tr>
                                            <td><%#Eval("c_name") %></td>
                                            <td><%#Eval("rt_name") %></td>
                                            <td><%#Eval("r_no") %></td>
                                            <td><%#Eval("b_date") %></td>
                                            <td><%#Eval("chin_date") %></td>
                                            <td><%#Eval("chout_date") %></td>
                                            <td><%#Eval("c_date") %></td>
                                            <td><%#Eval("b_amount") %></td>
                                            <td><%#Eval("r_amount") %></td>
                                            <td><%#Eval("tr_id") %></td>
                                            <td><%#Eval("status") %></td>
                                        </tr>
                                                
                                    </tbody>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                </table>
                            </div>
                        </div>
                    </div>
</asp:Content>
