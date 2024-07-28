<%@ Page Language="C#" MasterPageFile="~/Admin/navbar2.master" AutoEventWireup="true" CodeFile="Queries.aspx.cs" Inherits="Admin_Queries" %>

<asp:Content ID="content1"  ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="text-center pt-5">User Queries</h4>
        <div class="col-12 p-4">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="table-responsive p-2">
                                <table class="table">
                                    <thead style="color:red">
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Subject</th>
                                            <th scope="col">Message</th>
                                        </tr>
                                    </thead>
                                    <tbody style="color:#0dcaf0;">
                                        
                                            <asp:Repeater ID="rptqer" runat="server">
                                                <ItemTemplate>
                                        <tr>

                                            <td><%#Eval("name") %></td>
                                            <td><%#Eval("email") %></td>
                                            <td><%#Eval("subject") %></td>
                                            <td><%#Eval("message") %></td>
                                                    
                                        </tr>
                                                    
                                                </ItemTemplate>
                                            </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
</asp:Content>