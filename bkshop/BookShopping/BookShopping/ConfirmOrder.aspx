<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="BookShopping.ConfirmOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:580px;" class="roundDiv">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Imageresources/Icons/packing.png" />
            </td>
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" ClientIDMode="Predictable" 
                    CssClass="lblHeader" Text="Confirm Order"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                 <hr class="hrCss"/>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
                &nbsp;</td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Height="233px" Width="355px" Font-Bold="False" 
                    Font-Names="Andalus" Font-Size="Medium"  >
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="OrderId" HeaderText="OrderId" 
                            SortExpression="OrderId" >
                        <ItemStyle Font-Names="Andalus" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                            SortExpression="CustomerId" >
                        <ItemStyle Font-Names="Andalus" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalQuantity" HeaderText="TotalQuantity" 
                            SortExpression="TotalQuantity" >
                        <ItemStyle Font-Names="Andalus" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" 
                            SortExpression="TotalPrice" >
                        <ItemStyle Font-Names="Andalus" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
                        <ItemStyle Font-Names="Andalus" />
                        </asp:BoundField>
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
            </td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
                &nbsp;</td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
                &nbsp;</td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnOrder" runat="server" Height="40px" onclick="btnOrder_Click" 
                    Text="Place Order" Width="200px" CssClass="brownbtn" Font-Names="Andalus" 
                    Font-Size="Large" />
            </td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
                &nbsp;</td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="width: 491px">
                <asp:Label ID="lblResult" runat="server" Width="200px" Visible="False"></asp:Label>
            </td>
            <td style="width: 72px">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
