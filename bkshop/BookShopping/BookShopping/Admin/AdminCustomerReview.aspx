<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminCustomerReview.aspx.cs" Inherits="BookShopping.Admin.AdminCustomerReview" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style= "height:540px; overflow:scroll;" class="roundDiv">
   <table style="width:100%;">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Imageresources/Icons/distributor-report.png" />
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="lblHeader" Text="User Reviews" 
                    Width="500px"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                 <hr class="hrCss"/></td>
        </tr>
        <tr>
            <td colspan="3">
   
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        GridLines="None" OnPageIndexChanging = "GridView1_PageIndexChanging" 
        ForeColor="#333333" Width="635px" PageSize="5" CssClass="lblSmall">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="UserRates" HeaderText="UserRates" 
                SortExpression="UserRates">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:ImageField>
            <asp:BoundField DataField="UserReview" HeaderText="UserReview" 
                SortExpression="UserReview" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ProductId" HeaderText="ProductId" 
                SortExpression="ProductId" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Height="40px" Text="Delete" 
                        Width="80px" CommandArgument = '<%# Bind("ReviewId") %>' 
                        onclick="btnDelete_Click" CssClass="redbtn"/>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>    
            </td>
        </tr>
    </table>   
  </div>
</asp:Content>
