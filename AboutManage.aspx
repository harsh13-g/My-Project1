<%@ Page Language="C#" MasterPageFile="~/Admin/navbar2.master" AutoEventWireup="true" CodeFile="AboutManage.aspx.cs" Inherits="Admin_AboutManage" %>

<asp:Content ID="content1"  ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container align-content-center pt-2">
                <div class="row pt-1 px-4">
                    <h2 class="text-center" style="color:skyblue">About Add</h2>
                </div>
                <div class="row pt-4 px-4" style="align-content:center">
                    <asp:Repeater ID="rptimgs" runat="server">
                        <ItemTemplate>

                    <div class="col">
                            <asp:Label ID="lblimg" runat="server">Upadate Scroller Image</asp:Label>
                            <img src="Images/<%#Eval("h_scrolling") %>" class="form-control" style="height:200px; width:400px;"/>
                    </div>
                    <div class="col">
                            <asp:Label ID="Label1" runat="server">Update Logo</asp:Label>
                            <img src="Images/<%#Eval("h_logo") %>" class="form-control" style="height:200px; width:400px;"/>
                    </div> 
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="row pt-4 px-4" style="align-content:center">
                    <div class="col">
                            <asp:FileUpload ID="fluscroll" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col">
                            <asp:FileUpload ID="flulogo" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="Label3" runat="server">Name</asp:Label>
                            <asp:TextBox ID="txthname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label2" runat="server">Description</asp:Label>
                            <asp:TextBox ID="txthdes" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrdes" runat="server">Details</asp:Label>
                            <asp:TextBox ID="txthdet" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrprise" runat="server">Address</asp:Label>
                            <asp:TextBox id="txthaddr" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="lbl_rsize" runat="server">Contact No</asp:Label>
                            <asp:TextBox ID="txthcon" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        
                </div>
                <div class="row pt-4 px-4 ">
                        <div class="col">
                            <asp:Label ID="lblrbeds" runat="server">Email</asp:Label>
                            <asp:TextBox id="txthemail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Label ID="Label4" runat="server">Timing</asp:Label>
                            <asp:TextBox id="txthtime" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                </div>

                <div class="row pt-5 px-4 align-content-center">
                    <asp:Button ID="btn_upd" runat="server" CssClass="btn btn-info" Text="Upadte Details" OnClick="btn_upd_Click"/>
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>
                </div>
        </div>
</asp:Content>