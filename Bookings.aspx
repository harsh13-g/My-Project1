<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="Admin_Bookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="text-center pt-5">Bookings</h4>
                    <div class="col-12 p-4">
                        <div class="bg-light rounded h-100 p-4">
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
                                            <th scope="col">Paid Amount</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <asp:Repeater ID="rptbook" runat="server">
                                            <ItemTemplate>
                                    <tbody style="color:#0dcaf0;">
                                        

                                        <tr>
                                            <td><%#Eval("b_name") %></td>
                                            <td><%#Eval("name") %></td>
                                            <td><%#Eval("r_no") %></td>
                                            <td><%#Eval("bdt") %></td>
                                            <td><%#Eval("checkin") %></td>
                                            <td><%#Eval("checkout") %></td>
                                            <td><%#Eval("b_amount") %></td>
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
