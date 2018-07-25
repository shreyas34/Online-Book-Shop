<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="BookShopping.ThankYou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style= "height:500px;" class="roundDiv">
    <table style="width:99%; height: 499px;">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: Andalus">
    <strong style="font-size: 18pt; color: #990000">
                Thank you for your order. It will be shipped as soon as possible.</strong></td>
        </tr>
        <tr>
            <td> <hr class="hrCss"/></td>
        </tr>
        <tr>
            <td class="style1" style="height: 223px">
                
                <div style="height: 334px; width: 626px">
                    <asp:Image ID="Image2" runat="server" Height="298px" 
                        ImageUrl="~/Imageresources/Icons/thankyou_large.jpg" Width="585px" />
                    <br />
                    <hr class="hrCss"/>
                </div>
                
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnHome" runat="server" Height="40px" 
                    Text="Go to Home" Width="200px" onclick="btnHome_Click" 
                    CssClass="brownbtn" Font-Names="Andalus" Font-Size="Large" />
            </td>
        </tr>
    </table>
 </div>
</asp:Content>
