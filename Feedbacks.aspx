<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Feedbacks.aspx.cs" Inherits="Admin_Feedbacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="text-center pt-5">Feedbacks</h4>
        <div class="col-12 p-4">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="table-responsive p-2">
                                <table class="table">
                                    <thead style="color:red">
                                        <tr>
                                            <th scope="col">Customer Name</th>
                                            <th scope="col">Feedback Message</th>
                                            <th scope="col">Date</th>
                                        </tr>
                                    </thead>
                                    <tbody style="color:#0dcaf0;">
                                        
                                            <asp:Repeater ID="rptrev" runat="server">
                                                <ItemTemplate>
                                        <tr>

                                            <td><%#Eval("rv_name") %></td>
                                            <td><%#Eval("rv_message") %></td>
                                            <td><%#Eval("rvd") %></td>
                                                    
                                        </tr>
                                                    
                                                </ItemTemplate>
                                            </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
</asp:Content>

