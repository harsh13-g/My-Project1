<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="Myprofile.aspx.cs" Inherits="Myprofile" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <style>
        div.one{
            margin-top:80px;
        }
        div.col{
            text-align:center;
        }
        h3{
            color:red;
        }
       hr{
           color:blueviolet;
       }
       .two{
           margin-left:620px;
           margin-bottom:20px;
       }
        
    </style>
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
        <div class="one">

            <div class="container align-content-center pt-4">
            <asp:Repeater ID="rptprofile" runat="server">
                <ItemTemplate>
                <div class="container section-title pt-4" data-aos="fade-up">
                        <h2>HELLO..<%#Eval("c_name") %></h2>
                </div>
                <div class="row pt-0 px-4">
                    <div class="col">
                        <img class="h-75 w-25 rounded-circle" src='Admin/Images/<%#Eval("c_image") %>'/>
                    </div>
                </div>
                <div class="row pt-4 px-4">
                    <div class="col">
                        <asp:Label  Id="Label5" runat="server">Name..:<%#Eval("c_name") %></asp:Label>
                    </div>
                </div>          
                <div class="row pt-2 px-4">
                        <div class="col">
                            <asp:Label Id="lblrdes" runat="server">Email..:<%#Eval("c_email") %></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label Id="Label1" runat="server">Mobile..:<%#Eval("c_mobile") %></asp:Label>
                        </div>
                </div>
                    </ItemTemplate>
                </asp:Repeater>
                <hr />
                <div class="row pt-4 px-4">
                    <div class="col">
                            <h3>Update Your Details</h3>
                        </div>
                </div>
                <div class="row pt-0 px-4">
                    <div class="col" style="margin-left:400px; margin-right:400px;">
                        <asp:FileUpload ID="flupro" runat="server" CssClass="form-control"/>
                    </div>  
                </div>
                <div class="row pt-2 px-4">
                        
                        <div class="col">
                            <asp:TextBox ID="txtnewname" runat="server" placeholder="Type new Email" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage ="PLZ Enter name" ForeColor="Red" ControlToValidate="txtnewname" />
                        </div>
                        <div class="col">
                            <asp:TextBox ID="txtnewmob" runat="server" placeholder="Type new Contact Number" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage ="PLZ Enter name" ForeColor="Red" ControlToValidate="txtnewmob" />
                            <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="PLZ Enter Proper Mobile Number" ForeColor="Red" ValidationExpression="[0-9]{10}" ControlToValidate="txtnewmob"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                <div class="row pt-2 px-4">
                        <div class="col">
                            <asp:TextBox ID="txtnewpass" runat="server" placeholder="Type new password" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                <div class="row pt-4 px-4">
                        <div class="col">
                            <asp:Button ID="user_update" runat="server" Text="Update" CssClass="btn btn-info" OnClick="user_update_Click"/>
                        </div>
                </div>
                
                    <hr />
                <div class="row pt-4 px-4">
                        <div class="col">
                            <h3>Feedback</h3>
                        </div>
                </div>
                <div class="row pt-4 px-4">
                        <div class="col">
                            <asp:TextBox ID="txtfcname" runat="server" placeholder="Enter Your Name" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage ="PLZ Enter name" ForeColor="Red" ControlToValidate="txtfcname" />
                        </div>
                </div>
                <div class="row pt-4 px-4">
                        <div class="col">
                            <asp:TextBox ID="txtfcmsg" runat="server" placeholder="Enter your Feedback Message" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4">
                        <div class="col">
                            <asp:Button ID="btn_send_feedback" runat="server" Text="Send-Feedback" CssClass="btn btn-info" OnClick="btn_send_feedback_Click"/>
                        </div>
                </div>
                <hr />
                <div class="row pt-4 px-4">
                        <div class="col">
                            <h3>Previous Bookings</h3>
                        </div>
                </div>

                <div class="row pt-4 px-4">
                    <table class="table">
                        <thead class="table-danger">
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Booking-Date</th>
                                <th scope="col">Chekin-Date</th>
                                <th scope="col">CheckOut-Date</th>
                                <th scope="col">Status</th>
                                <th scope="col">View</th>
                            </tr>
                       </thead>
                            <tbody>
                                <asp:Repeater ID="rptbooking" runat="server" OnItemCommand="rptbooking_ItemCommand">
                                    <ItemTemplate>

                                <tr>
                                    <td><%#Eval("b_name") %></td>
                                    <td><%#Eval("bdt") %></td>
                                    <td><%#Eval("checkin") %></td>
                                    <td><%#Eval("checkout") %></td>
                                    <td><%#Eval("status") %></td>
                                    <td><asp:Button ID="btn_cnl" runat="server" Text="View" CommandArgument='<%#Eval("b_id") %>' CommandName="viewbook" CssClass="btn btn-info" /></td>
                                </tr>
                                        
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    
                        
                    </div>
                <hr />
                      
            </div>
                </div>
            <!-- Button trigger modal -->
    <div class="two">
<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Delete Account
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">DELETE</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Do you want to delete the your account
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <asp:Button ID="btn_del" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btn_del_Click"/>
      </div>
    </div>
  </div>
</div></div>
</asp:Content>