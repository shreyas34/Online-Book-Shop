<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="BookShopping.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style= "height:550px;" class="roundDiv">
        <table style="width:100%;">
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image8" runat="server" 
                        ImageUrl="~/Imageresources/Icons/businessman.png" />
&nbsp;&nbsp;&nbsp;
                </td>
                <td><asp:Label ID="Label3" runat="server" CssClass="lblHeader" Text="Contact Us" 
                        Width="200px" Height="70px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                     <hr class="hrCss" style="width: 637px; margin-left: 0px; margin-bottom: 0px;"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 404px; width: 200px;">
                    <div style="height: 378px; width: 351px">
                        <font name = "Andalus" size = "4" 
                            style="font-family: Andalus; font-size: medium; color: #000000">                    
                        <asp:Label ID="Label2" runat="server" 
                            Text="IDEAL BOOK HOME" ForeColor="#990000" Font-Names="Andalus" 
                            Font-Size="X-Large"></asp:Label>
                        <br />
                        <br />
                        <asp:Image ID="Image7" runat="server" 
                            ImageUrl="~/Imageresources/Icons/location.png" Height="23px" 
                            Width="29px" />
                    Address&nbsp; :&nbsp;&nbsp;&nbsp;Shop no.2 , CN Colony , &nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Chhedanagar, Chembur ;<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Mumbai - 400 089 &nbsp; &nbsp;<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                    <br />
                        <asp:Image ID="Image3" runat="server" Height="23px" 
                            ImageUrl="~/Imageresources/Icons/phone-2.png" Width="24px" />
&nbsp;Tel.no &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;022-2224444 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <br />
                    <br />
                        <asp:Image ID="Image4" runat="server" Height="21px" 
                            ImageUrl="~/Imageresources/Icons/telephone.png" Width="22px" />
&nbsp;Mobile(Mr. SHREYAS) &nbsp;: &nbsp;98888 00000 &nbsp;<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                        <asp:Image ID="Image5" runat="server" Height="20px" 
                            ImageUrl="~/Imageresources/Icons/email-2.png" Width="32px" />
&nbsp;Email Id:&nbsp;<font face = "Andalus" size = "3"><a href="mailto:idealbookhome@BookSite.com">idealbookhome@BookSite.com</a></font></font></div>
                </td>
                <td style="height: 404px">
                    <div style="height: 369px">
                        <asp:Image ID="Image2" runat="server" Height="337px" 
                            ImageUrl="~/Imageresources/Icons/BOOKMAGIC.PNG" Width="270px" 
                            CssClass="roundImage" />
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 1018px" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>
