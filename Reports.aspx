<%@ Page Language="C#" MasterPageFile="~/Admin/navbar2.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" %>


<asp:Content ID="content1"  ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="one" style="margin-bottom:20px;">
        <h4 class="text-center pt-5">Reports</h4>
                <div class="row pt-4 px-4">
                        <div class="col">
                            <asp:Label ID="lbl1" runat="server" Text="Income Report (Monthly)" CssClass="form-check bg-danger"></asp:Label>
                        </div>
                            <label>Enter From Date</label>
                        <div class="col">
                            <asp:TextBox ID="txtfdt" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>  
                    
                            <label>Enter To Date</label>
                        <div class="col">
                            <asp:TextBox ID="txttdt" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>  
                        <div class="col">
                            <asp:Button ID="btn_generate" runat="server" Text="Generate" CssClass="form-control btn btn-info" OnClick="btn_generate_Click"/> 
                        </div>
                        <br /> <br />    
                </div>

                <!--<div class="row pt-4 px-4">
                        <div class="col">
                            <asp:Label ID="Label1" runat="server" Text="Income Report (Daily)" CssClass="form-check bg-danger"></asp:Label>
                        </div>
                        
                            <label>Enter To Date</label>
                        <div class="col">
                            <asp:TextBox ID="txtdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>  
                            
                        <div class="col">
                            <asp:Button ID="btn_d_gen" runat="server" Text="Generate" CssClass="form-control btn btn-info" /> 
                        </div>
                        <br /> <br />    
                </div>

                <div class="row pt-4 px-4">
                        <div class="col">
                            <asp:Label ID="Label2" runat="server" Text="Booking Report" CssClass="form-check bg-danger"></asp:Label>
                        </div>
                            <label>Enter Date</label>
                        <div class="col">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>  
                        
                            <label>Enter Date</label>
                        <div class="col">
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>  
                            
                        <div class="col">
                            <asp:Button ID="Button2" runat="server" Text="Generate" CssClass="form-control btn btn-info" /> 
                        </div>
                        <br /> <br />    
                </div> -->
        
    </div>
        
</asp:Content>