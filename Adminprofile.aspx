<%@ Page Language="C#" MasterPageFile="~/Admin/Navbar2.master" AutoEventWireup="true" CodeFile="Adminprofile.aspx.cs" Inherits="Admin_Adminprofile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<section style="background-color: #eee;">
  <div class="container py-5 pt-0">
    <div class="row">
        <div class="row p-3 px-4 pt-0">
                    <h2 class="text-center" style="color:skyblue">Profile</h2>
                </div>
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
              <asp:Repeater ID="proimg3" runat="server">
                  <HeaderTemplate>
                  </HeaderTemplate>
                  <ItemTemplate>
            <img src="Images/<%#Eval("a_img") %>" alt="Admin"
              class="rounded-circle img-fluid" style="width: 150px;" />
                      </ItemTemplate>
              </asp:Repeater>
            <h5 class="my-3"><asp:Label ID="lbln3" runat="server"></asp:Label></h5>
            <div class="d-flex justify-content-center mb-2">
                <asp:Label ID="lbl" runat="server"></asp:Label>
            </div>
              <div style="max-height:38px;">
              <asp:FileUpload ID="fluimg" runat="server" CssClass="form-check"/>
                  <asp:Button ID="btn_upd" runat="server" CssClass="btn btn-danger" Text="UPDATE" OnClick="btn_upd_Click" />
              </div>

          </div>
        </div>
        <div class="card mb-4 mb-lg-0">
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-center align-items-center p-3">
                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                <p class="mb-0">Update Password</p>
                  <hr />
              </li>
              <li class="list-group-item d-flex justify-content-center align-items-center p-3">
                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                <asp:TextBox ID="txt_name" runat="server" placeholder="Name"></asp:TextBox>
              </li>
              <li class="list-group-item d-flex justify-content-center align-items-center p-3">
                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                <asp:TextBox ID="txt_newpass" runat="server" placeholder="Enter New Password"></asp:TextBox>
              </li>
              <li class="list-group-item d-flex justify-content-center align-items-center p-3">
                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                <asp:Button ID="btn_pass_upd" runat="server" Text="Update" CssClass="btn btn-danger" OnClick="btn_pass_upd_Click" />
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
              
              <asp:Repeater ID="admin" runat="server">
              <ItemTemplate>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%#Eval("a_name") %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%#Eval("a_email") %></p>
              </div>
            </div>
            
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%#Eval("a_mobile") %></p>
              </div>
            </div>
            
                  </ItemTemplate>
            </asp:Repeater>
          </div>
        </div>
          <div class="card mb-4">
          <div class="card-body justify-content-center">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Upadate Details</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <asp:TextBox ID="txtnewemail" runat="server" placeholder="Enter New Email"></asp:TextBox>
              </div>
            </div>
            
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <asp:TextBox ID="txtnewmobile" runat="server" placeholder="Enter New Mobile"></asp:TextBox>
              </div>
            </div>
                  <hr />
            <div class="row">
              <div class="col ">
                <asp:Button ID="btn_det_upd" runat="server" Text="Update Details" CssClass="btn btn-info" OnClick="btn_det_upd_Click" />
              </div>
            </div>
          </div>
        </div>
          </div>

      </div>       
    </div>
  
</section>
</asp:Content>
