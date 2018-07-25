<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="BookShopping.Account.Login" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style= "height:400px;" class="roundDiv">
    <table style="width: 100%; height: 267px">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Imageresources/Icons/lock-2.png" />
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" CssClass="lblHeader" Text="Login"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: left">
                <hr class="hrCss"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; font-size: medium; width: 164px">
                <asp:Label ID="Label4" runat="server" 
                    Text="Email Id :" CssClass="lblMedium"></asp:Label>
                <span style="font-family: Tahoma">&nbsp; </span>
            </td>
            <td style="text-align: left; width: 209px;">
                <asp:TextBox ID="txtUsername" runat="server" Width="217px" CssClass="textfield"></asp:TextBox>
            </td>
            <td style="color: #FF0000">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="*Invalid Email Id" ControlToValidate="txtUsername" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    style="font-family: 'Comic Sans MS'"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*Please enter Email Id" ControlToValidate="txtUsername" 
                    style="font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; font-size: medium; width: 164px">
                <asp:Label ID="Label5" runat="server" 
                    Text="Password  :" CssClass="lblMedium"></asp:Label>
                </td>
            <td style="width: 209px">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="217px" 
                    CssClass="textfield"></asp:TextBox>
            </td>
            <td style="color: #FF0000">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*Please enter your Password" ControlToValidate="txtPassword" 
                    style="font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; width: 164px">
                &nbsp;</td>
            <td style="width: 209px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left">
              <asp:Button ID="btnForgotPassword" runat="server" BorderColor="White" 
                    BorderStyle="None" CausesValidation="False" CssClass="lblMedium" 
                    onclick="btnForgotPassword_Click" Text="Forgot password?" 
                    UseSubmitBehavior="False" CommandName = "Forgot" Width="132px" 
                    Visible="False"/>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left; " colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSubmit" runat="server" 
                    Text="Login" onclick="btnSubmit_Click" CssClass="brownbtn" Height="40px" 
                    Width="200px" UseSubmitBehavior="False"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" 
                    Text="Cancel" CausesValidation="False" 
                    CssClass="graybtn" Height="40px" Width="200px"/>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
