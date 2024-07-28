<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="Rooms.aspx.cs" Inherits="Rooms"  EnableEventValidation="false"%>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div.one{
            align-content: center;
            margin-top: 140px;
            margin-bottom: 80px;
            margin-left: 250px;
            margin-right: 250px;
        }
    </style>
</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="one">
        <div class="container section-title" data-aos="fade-up">
        <h2>Room Categories</h2>
      </div>
        <div class="row m-3">
            <asp:Repeater ID="rptcatdisp" runat="server" OnItemCommand="rptcatdisp_ItemCommand">
                <ItemTemplate>

            <div class="col-md-4 h-15 w-15 mt-3 align-content-center">
                <div class="card align-content-center">
                    <asp:Label ID="lbl" runat="server"></asp:Label>
                    <input type="hidden" id="hd_id"/>
                    <img class="card-img-top h-50" src='Admin/Images/<%#Eval("image")%>' alt="" />
                    <h4 class="card-title text-center"><asp:Label ID="dispname" runat="server" Text='<%#Eval("name") %>'></asp:Label></h4>
                    <h5 class="card-title text-center"><asp:Label ID="diapprise" runat="server" Text='<%#Eval("prise") %>'></asp:Label></h5>
                    <h5 class="card-title text-center"><asp:Textbox ID="txt_id" runat="server" Text='<%#Eval("rt_Id") %>' Visible="false"></asp:Textbox></h5>
                    <div class="btn">
                        <asp:LinkButton ID="btn_go" runat="server" Text="View" CssClass="btn btn-danger w-100" CommandArgument='<%#Eval("rt_Id") %>' CommandName="view"/>
                    </div>
                </div>
            </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
