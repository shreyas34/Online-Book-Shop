<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="BookShopping.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:600px;overflow:scroll;" class="roundDiv">
<table style="width:100%;">
                <tr>
                    <td>
                        <asp:Image ID="Image6" runat="server" 
                            ImageUrl="~/Imageresources/Icons/shopppingcart.png" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" CssClass="lblHeader" Text="Shopping Cart"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                         <hr class="hrCss" style="width: 661px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
            <asp:Label ID="Label7" runat="server" Text="For urgent orders via courier please contact our distributors, Bookpoint, direct for a quote:  "
                Width="690px" style="position: static" Font-Size="Medium" Font-Bold="True" 
                            Font-Names="Andalus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#990000" style="position: static" 
                            Font-Bold="True" Font-Size="Medium" Font-Names="Andalus">idealbookhome@books.com</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                            ForeColor="#333333" GridLines="None" 
                            Height="181px" HorizontalAlign="Left" PageSize="4" Width="502px"                            
                            OnPageIndexChanging = "GridView1_PageIndexChanging" > <%--onrowediting="EditOrder"
onrowupdating="UpdateEdit"  onrowcancelingedit="CancelEdit" >--%>
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>                                
                                <asp:BoundField DataField="ShoppingCartItemId" HeaderText="ShoppingCartItemId" 
                                    SortExpression="ShoppingCartItemId" >
                                <ItemStyle Font-Names="Andalus"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="ProductId" HeaderText="ProductId" 
                                    SortExpression="ProductId" >
                                <ItemStyle Font-Names="Andalus"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                                    SortExpression="ProductName" >
                                <ItemStyle Font-Names="Andalus"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                    SortExpression="Quantity" >
                                <ItemStyle Font-Names="Andalus"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" >
                                <ItemStyle Font-Names="Andalus" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SubTotalPrice" HeaderText="SubTotalPrice" 
                                    SortExpression="SubTotalPrice" >                             
                                <ItemStyle Font-Names="Andalus"/>
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                    <asp:Button ID="btnDelete" runat="server" Height="40px" Text="Delete" 
                                    Width="80px" CommandArgument = '<%# Bind("ShoppingCartItemId") %>' 
                                    onclick="btnDelete_Click" CausesValidation="False" CssClass="redbtn" 
                                            Font-Names="Andalus"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" HorizontalAlign="Center" VerticalAlign="Middle" 
                                ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 548px">
                         <i style="font-family: Andalus; font-size: medium"> You are viewing page <%=GridView1.PageIndex + 1%>of <%=GridView1.PageCount%> </i>

                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 49px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image5" runat="server" Height="50px" 
                            ImageUrl="~/Imageresources/Icons/LOGO.png" Width="50px" />
                    </td>
                    <td style="width: 548px; height: 49px;">
                        &nbsp;<asp:Label ID="Label6" runat="server" Style="position: static" 
                            Text="  *Order total price: " Height="25px" CssClass="lblMedium"></asp:Label>
                        <asp:Label ID="lblTotal" 
                            runat="server"
                            Width="191px" CssClass="lblMedium" Height="25px"></asp:Label>
                    </td>
                    <td style="height: 49px; ">
                        </td>
                </tr>
             <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image3" runat="server" Height="50px" 
                    ImageUrl="~/Imageresources/Icons/transport.png" Width="50px" />
            </td>
            <td style="width: 491px">
                <asp:Label ID="Label3" runat="server" CssClass="lblMedium" 
                    Text="Shipping Charge : " Height="25px"></asp:Label>
                <asp:Label ID="lblShippingPrice" runat="server" CssClass="lblMedium" 
                    Height="25px"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
          </tr>
             <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image4" runat="server" Height="50px" 
                    ImageUrl="~/Imageresources/Icons/wallet.png" Width="50px" />
                 </td>
            <td style="width: 491px">
                <asp:Label ID="Label9" runat="server" CssClass="lblHeaderMedium" 
                    Text="Total Price : "></asp:Label>
                <asp:Label ID="lblTotalPrice" runat="server" CssClass="lblHeaderMedium"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
          </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 548px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="continueShoppingBtn" 
                            runat="server" Text="Continue Shopping" onclick="continueShoppingBtn_Click" 
                            CssClass="brownbtn" Height="40px" Width="200px" Font-Names="Andalus" Font-Size="Large" 
                   />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="confirmOrderBtn" runat="server" Text="Confirm Order" Width="200px" 
                            onclick="confirmOrderBtn_Click" CssClass="greenbtn" Height="40px" 
                            Font-Names="Andalus" Font-Size="Large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 548px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
    </table>
    </div>
</asp:Content>
