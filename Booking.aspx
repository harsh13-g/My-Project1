<%@ Page Language="C#" MasterPageFile="~/Menubar.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <style>
        div.one{
            margin-top:60px;
            margin-bottom:40px;
        }
    </style>
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="one">
    <div class="container align-content-center pt-4">
                <div class="container section-title pt-4" data-aos="fade-up">
                        <h2>Book your room</h2>
                </div>
                <div class="row pt-0 px-4 ">
                    <div class="col">
                            <asp:Label ID="lblrname" runat="server">Select Room Type</asp:Label>
                            <asp:DropDownList ID="ddlroomtype" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlroomtype_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>--Selsect-Roomtype--</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label2" runat="server">Check-In Date</asp:Label>
                            <asp:TextBox ID="txtcin" runat="server" CssClass="form-control" TextMode="Date" OnTextChanged="txtcin_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label3" runat="server">Check-Out Date</asp:Label>
                            <asp:TextBox ID="txtcout" runat="server" CssClass="form-control" TextMode="Date" OnTextChanged="txtcout_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrdes" runat="server">First Name</asp:Label>
                            <asp:TextBox ID="txtfanme" runat="server" placeholder="EX: Arjun" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage ="PLZ Enter First name" ForeColor="Red" ControlToValidate="txtfanme" />
                        </div>
                        <div class="col">
                            <asp:Label ID="Label1" runat="server">Last Name</asp:Label>
                            <asp:TextBox ID="txtlname" runat="server" placeholder="EX: Boricha" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage ="PLZ Enter Last name" ForeColor="Red" ControlToValidate="txtlname" />
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label4" runat="server">Email</asp:Label>
                            <asp:TextBox ID="txtemail" runat="server" placeholder="EX: arjun@gmail.com" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="PLZ Enter Proper Email" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label5" runat="server">Contact Number</asp:Label>
                            <asp:TextBox ID="txtmob" runat="server" placeholder="EX: 00000000" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="PLZ Enter Proper Mobile Number" ForeColor="Red" ValidationExpression="[0-9]{10}" ControlToValidate="txtmob"></asp:RegularExpressionValidator>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label6" runat="server">Select Room Number</asp:Label>
                            <asp:DropDownList ID="ddlroomnumber" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                            <asp:Label ID="knowroom" runat="server"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label7" runat="server">Number of Guest.</asp:Label>
                            <asp:DropDownList ID="ddlnoofguest" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblfcharge" runat="server">Do you have Food Catering Service ?</asp:Label>
                        </div>
                        <div class="col">
                            <asp:RadioButton ID="rdb_fyes" runat="server" Text="Yes" GroupName="barvages" Checked="true" CssClass="mr-4" />                     
                            <asp:RadioButton ID="rdb_fno" runat="server" Text="No" GroupName="barvages" />
                        </div>
                            
                        
                        <div class="col">
                            <asp:Label ID="lblcab" runat="server">Do you have Pickup & Drop Service ?</asp:Label>
                        </div>
                        <div class="col">
                            <asp:RadioButton ID="rdb_pyes" runat="server" Text="Yes" GroupName="avservice" Checked="true" CssClass="mr-4" />                     
                            <asp:RadioButton ID="rdb_pno" runat="server" Text="No" GroupName="avservice" />
                        </div>
                </div>
                <div class="row pt-5 px-4 align-content-center">
                    <asp:Button ID="btn_add" runat="server" CssClass="btn btn-danger" Text="Book" OnClick="btn_add_Click"/>
                    <asp:Label ID="lbl_m" runat="server" ></asp:Label>
                </div>
        </div>
        </div>
</asp:Content>
