<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Admin_Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <h4 class="text-center pt-5">Customer</h4>
                
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    
                    
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th> Image </th>
                          <th> Name </th>
                          <th> Mobile </th>
                          <th> Email </th>
                          <th> Reg_Date </th>
                        </tr>
                      </thead>
                      <tbody>
                          <asp:Repeater ID="rptcus" runat="server">
                              <ItemTemplate>

                        <tr>
                          <td class="py-1">
                            <img src='Images/<%#Eval("c_image") %>' alt="image" />
                          </td>
                          <td> <%#Eval("c_name") %> </td>
                          <td>
                              <%#Eval("c_mobile") %>
                          </td>
                          <td> <%#Eval("c_email") %> </td>
                          <td> <%#Eval("r_date") %> </td>
                        </tr>
                        <tr>
                        
                              </ItemTemplate>
                          </asp:Repeater>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
</asp:Content>
