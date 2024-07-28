<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="New.aspx.cs" Inherits="New" EnableEventValidation="false" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <style>
        div.one{
            margin-top:40px;
            margin-bottom:40px;
        }
        .container{
            align-content:center;
        }
    </style>

</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="one">
        <section id="features" class="features">
            
          <asp:Repeater ID="rptcat" runat="server" OnItemCommand="rptcat_ItemCommand">
              <ItemTemplate>
        <div class="container section-title" data-aos="fade-up">
        <h2><%#Eval("name") %></h2>
            
      </div>
      <!--  Section Title -->
      <div class="container">

        <div class="row gy-4 align-items-stretch justify-content-between features-item ">
          <div class="col-lg-6 d-flex align-items-center features-img-bg" data-aos="zoom-out">
            <img src='Admin/Images/<%#Eval("image") %>' class="img-fluid" alt="" />
          </div>
          <div class="col-lg-5 d-flex justify-content-center flex-column" data-aos="fade-up">
            <h3><asp:Label ID="disp" runat="server" Text="Description"></asp:Label></h3>
            <p class="bi bi-arrow-right"><%#Eval("description")%></p>
            <ul>
              <li><i class="bi bi-currency-rupee"></i> <span><%#Eval("prise") %></span></li>
              <li><i class="bi bi-border-all"></i><span><%#Eval("size") %></span></li>
              <li><i class="bi bi-segmented-nav"></i> <span><%#Eval("beds") %></span>.</li>
            </ul>
            
            <asp:Button ID="btn_go" runat="server" class="btn btn-danger" Text="Book" OnClick="btn_go_Click"/>
          </div>
        </div><!-- Features Item -->
      </div>      
              </ItemTemplate>
          </asp:Repeater>
    </section>
        <div class="container">
        </div>
        </div>
</asp:Content>