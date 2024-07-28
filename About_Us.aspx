<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="About_Us.aspx.cs" Inherits="About_Us" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main_div{
            margin-top:80px;
        }
    </style>
</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="main_div">
    <section id="about" class="about">
        <div class="container section-title" data-aos="fade-up">
        <h2>About</h2>
        
      </div>
      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row align-items-xl-center gy-5">
          <div class="col-xl-5 content">
            <h3>About Us</h3>
            <h2><asp:Label ID="lbl_name" runat="server"></asp:Label></h2>
            <p><asp:Label ID="lbl_det" runat="server"></asp:Label></p>
            <a href="#" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a>
          </div>

          <div class="col-xl-7">
            <div class="row gy-4 icon-boxes">


              <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
                <div class="icon-box">
                  <i class="bi bi-command"></i>
                  <h3>Categories</h3>
                  <p>We have six well designed room in our hotel</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
                <div class="icon-box">
                  <i class="bi bi-graph-up-arrow"></i>
                  <h3>Facilities</h3>
                  <p>We have Gaeden area, play ground, gym and many more</p>
                </div>
              </div> <!-- End Icon Box -->

            </div>
          </div>

        </div>
      </div>

    </section>
            </div>

</asp:Content>
