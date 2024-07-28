<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Roomnumbers.aspx.cs" Inherits="Admin_Roomnumbers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row pt-4 px-4">
                            <label>Select Room Type</label>
                        <div class="col">
                            <asp:DropDownList ID="ddlroom" runat="server" CssClass="form-control form-select"></asp:DropDownList>
                        </div>
                            
                        <div class="col">
                            <asp:TextBox ID="txtnumofroom" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                            <div class="col">
                            <asp:Button ID="btn_add_room_number" runat="server" CssClass="btn btn-info" Text="Add Room" OnClick="btn_add_room_number_Click" />  
                            </div> 
                            
                         <div class="col">
                             <asp:Button ID="btn_del_room_number" runat="server" CssClass="btn btn-danger" Text="Delete Room" OnClick="btn_del_room_number_Click" />
                         </div> 
                        <div class="col">
                                <asp:Label ID="disp_res" runat="server"></asp:Label>
                            </div>                     
                </div>
          <h4 class="text-center pt-5">Rooms</h4>
                <div class="col-12 p-4">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="table-responsive p-2">
                                <table class="table">
                                    <thead style="color:red">
                                        <tr>
                                            
                                            <th scope="col">Name</th>
                                            <th scope="col">Prise</th>
                                            <th scope="col">Number's of Room</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody style="color:#0dcaf0;">
                                        <asp:Repeater ID="rpt_roomdet" runat="server">
                                            <ItemTemplate>
                                        <tr>
                                            <td><asp:Label ID="r_name" runat="server" Text='<%#Eval("name") %>'></asp:Label></td>
                                            <td><asp:Label ID="r_prise" runat="server" Text='<%#Eval("prise") %>'></asp:Label></td>   
                                            <td><asp:Label ID="r_noofr" runat="server" Text='<%#Eval("Total") %>'></asp:Label></td>
                                        </tr>
                                                </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
</asp:Content>