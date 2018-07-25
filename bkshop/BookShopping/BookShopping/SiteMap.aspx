<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="BookShopping.SiteMap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style= "height:580px;" class="roundDiv">
    <table style="width:100%;">
        <tr>
            <td style="width: 35px">
                    &nbsp;</td>
            <td style="width: 73px">
                    &nbsp;</td>
            <td style="width: 1018px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="SiteMap" CssClass="lblHeader"></asp:Label>
                </td>
            <td style="width: 67px">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <hr class="hrCss"/>
            </td>
        </tr>
        <tr>
            <td style="width: 35px">
                    &nbsp;</td>
            <td style="width: 73px">
                    &nbsp;</td>
            <td style="width: 1018px">
                    &nbsp;</td>
            <td style="width: 67px">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 404px; width: 35px">
            </td>
            <td colspan="3" style="height: 404px">
                <font name = "Andalus" size = "4"><br />
                <br />
                <table style="width: 100%; height: 356px;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="width: 270px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Home.aspx" 
                                ForeColor="#990000">Home</asp:HyperLink>
                            </font>
                        </td>
                        <td style="width: 270px">
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/ProductList.aspx" 
                                ForeColor="#990000">Products</asp:HyperLink>
                            </font>
                        </td>
                        <td>
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/MyAccount.aspx" 
                                ForeColor="#990000">MyAccount</asp:HyperLink>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="width: 270px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/About.aspx" 
                                ForeColor="#990000">About Us</asp:HyperLink>
                            </font>
                        </td>
                        <td style="width: 270px">
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/ContactUs.aspx" 
                                ForeColor="#990000">Contact Us</asp:HyperLink>
                            </font>
                        </td>
                        <td>
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/FAQ.aspx" 
                                ForeColor="#990000">FAQ&#39;s</asp:HyperLink>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="width: 270px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Privacy.aspx" 
                                ForeColor="#990000">Privacy Policy</asp:HyperLink>
                            </font>
                        </td>
                        <td style="width: 270px">
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink17" runat="server" 
                                NavigateUrl="~/TermsConditions.aspx" ForeColor="#990000">Terms and Conditions</asp:HyperLink>
                            </font>
                        </td>
                        <td>
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/FeedBack.aspx" 
                                ForeColor="#990000">Feedback</asp:HyperLink>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="width: 270px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="width: 270px">
                            <font name = "Andalus" size = "4">
                            <asp:HyperLink ID="HyperLink19" runat="server" 
                                NavigateUrl="~/ShoppingCart.aspx" ForeColor="#990000">Shopping Cart</asp:HyperLink>
                            </font>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="width: 270px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                </font>
            </td>
            <td style="height: 404px">
            </td>
        </tr>
        <tr>
            <td style="width: 35px">
                    &nbsp;</td>
            <td style="width: 73px">
                    &nbsp;</td>
            <td style="width: 1018px">
                    &nbsp;</td>
            <td style="width: 67px">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
