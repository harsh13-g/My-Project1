<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Hero Section - Home Page -->
    <section id="hero" class="hero">
        <asp:Repeater ID="rptscroll" runat="server">
            <ItemTemplate>

      <img src='Admin/Images/<%#Eval("h_scrolling") %>' alt="" data-aos="fade-in" />
                </ItemTemplate>
        </asp:Repeater>
        <a href="Index.aspx">Index.aspx</a>
            
      <div class="container">
        <div class="row">
          <div class="col-lg-10">
            <h2 data-aos="fade-up" data-aos-delay="100">Welcome to <asp:Label ID="lbl_name" runat="server"></asp:Label></h2>
            <p data-aos="fade-up" data-aos-delay="200"><asp:Label ID="lbl_des" runat="server"></asp:Label></p>
          </div>
        </div>
      </div>

    </section><!-- End Hero Section -->

    <!-- Clients Section - Home Page -->
    <!-- End Clients Section -->

    <!-- About Section - Home Page -->

    <!-- End About Section -->

    <!-- Stats Section - Home Page -->
    <!-- End Stats Section -->

    <!-- Services Section - Home Page -->
    <!-- End Services Section -->

    <!-- Features Section - Home Page -->
    <!-- End Features Section -->

    <!-- Portfolio Section - Home Page -->
    <!-- End Portfolio Section -->

    <!-- Pricing Section - Home Page -->
    <!-- End Pricing Section -->

    <!-- Faq Section - Home Page -->
    <!-- End Faq Section -->

    <!-- Team Section - Home Page -->
    <section id="team" class="team">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Room Categories</h2>
        
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-5">

            <asp:Repeater ID="rptcatdisp" runat="server">
                <ItemTemplate>
          <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src='Admin/Images/<%#Eval("image") %>' class="img-fluid h-auto" alt="">
              <div class="social">
                   
              </div>
            </div>
            <div class="member-info text-center">
              <h4><asp:Label ID="disp_name" runat="server" Text='<%#Eval("name") %>'></asp:Label></h4>
              
              
            </div>
          </div><!-- End Team Member -->
                    </ItemTemplate>
            </asp:Repeater>





        </div>

      </div>

    </section>
    <!-- End Team Section -->

    <!-- Call-to-action Section - Home Page -->

    <!-- End Call-to-action Section -->

    <!-- Testimonials Section - Home Page -->
    

    <section id="testimonials" class="testimonials">
        <div class="container section-title" data-aos="fade-up">
        <h2>Visitors Reviews</h2>
        
      </div>
      <div class="container">

        <div class="row align-items-center">



          <div class="col" data-aos="fade-up" data-aos-delay="200">

            <div class="swiper">
              
              <div class="swiper-wrapper">

                <div class="swiper-slide">
                    <asp:DataList ID="ddl_rev" runat="server">
                        <ItemTemplate>

                  <div class="testimonial-item">
                    <div class="d-flex">
                      <img src='Admin/Images/<%#Eval("c_image") %>' class="testimonial-img flex-shrink-0" alt="" />
                      <div>
                        <h3><%#Eval("rv_name")%></h3>
                        <h4><%#Eval("date")%></h4>
                        <div class="stars">
                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                      </div>
                    </div>
                    <p>
                      <i class="bi bi-quote quote-icon-left"></i>
                      <span><%#Eval("rv_message") %></span>
                      <i class="bi bi-quote quote-icon-right"></i>
                    </p>
                  </div>
                </div><!-- End testimonial item -->
                  
                        </ItemTemplate>
                    </asp:DataList>

              </div>
                  
            </div>
                
                  <div class="align-content-center" style="margin-left:470px;">
                      <asp:Button ID="btn_one" runat="server" Text="<<" OnClick="btn_one_Click"/>
                      <asp:Button ID="btn_two" runat="server" Text=">" OnClick="btn_two_Click"/>
                      <asp:Button ID="btn_three" runat="server" Text="<" OnClick="btn_three_Click"/>
                      <asp:Button ID="btn_four" runat="server" Text=">>" OnClick="btn_four_Click"/>
                  </div>
                
              <div class="swiper-pagination"></div>
          </div>

        </div>

      </div>

    </section>
</asp:Content>
