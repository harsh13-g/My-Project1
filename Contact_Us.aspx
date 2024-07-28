<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="Contact_Us.aspx.cs" Inherits="Contact_Us" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div.no{
            margin-top: 45px;
        }
    </style>
</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="no">
        <a href="Contact_Us.aspx">Contact_Us.aspx</a>
        <section id="contact" class="contact">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Contact</h2>
        
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-6">

            <div class="row gy-4">
              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="200">
                  <i class="bi bi-geo-alt"></i>
                  <h3>Address</h3>
                  <p><asp:Label ID="lbl_addr" runat="server"></asp:Label></p>
                  
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>Call Us</h3>
                  <p class="pt-4"><asp:Label ID="lbl_mob" runat="server"></asp:Label></p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="400">
                  <i class="bi bi-envelope"></i>
                  <h3>Email Us</h3>
                  <p><asp:Label ID="lbl_email" runat="server"></asp:Label></p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="500">
                  <i class="bi bi-clock"></i>
                  <h3>Open</h3>
                  <p><asp:Label ID="lbl_time" runat="server"></asp:Label></p>
                </div>
              </div><!-- End Info Item -->

            </div>

          </div>

          <div class="col-lg-6">
              <div class="row gy-4">

                <div class="col-md-6 pt-4">
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage ="PLZ Enter name" ForeColor="Red" ControlToValidate="txtname" />
                </div>

                <div class="col-md-6 pt-4">
                  <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="PLZ Enter Proper Email" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
                </div>

                <div class="col-md-12 pt-4">
                  <asp:TextBox ID="txtsub" runat="server" CssClass="form-control" placeholder="Enter Subject"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage ="Enter Subject" ForeColor="Red" ControlToValidate="txtsub" />
                </div>
                <div class="col-md-12 pt-4">
                  <asp:TextBox ID="txtmsg" runat="server" CssClass="form-control" placeholder="Enter Message"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage ="PLZ Enter message" ForeColor="Red" ControlToValidate="txtmsg" />
                </div>
                <div class="col-md-12 pt-4 text-center">
                  <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-info" Text="Send Message" OnClick="btn_submit_Click"/>
                </div>
              </div>
            
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section>
        </div>
</asp:Content>