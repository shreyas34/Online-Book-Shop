<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
 CodeBehind="AdminLogin.aspx.cs" Inherits="BookShopping.Admin.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style= "height:400px;" class="roundDiv">
    <table style="width:100%;">
        <tr>
            <td>
                    <asp:Image ID="Image2" runat="server" Height="121px" 
                        ImageUrl="~/Imageresources/Icons/lock-2.png" Width="104px" />
                </td>
            <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Admin Login" CssClass="lblHeader" 
                        Width="442px"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="3">
                    <hr class="hrCss" style="width: 637px"/>
                </td>
        </tr>
        <tr>
            <td>
                    <asp:Label ID="lblAdminEmailid" runat="server" 
                        Text="Username  :" CssClass="lblMedium"></asp:Label>
                </td>
            <td>
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px" CssClass="textfield"></asp:TextBox>
                </td>
            <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*Please enter valid username." style="color: #FF0000; font-family: 'Comic Sans MS';" 
                        ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                   
                    <asp:Label ID="Label3" runat="server" Text="Password :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
            <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="200px" 
                        TextMode="Password" CssClass="textfield"></asp:TextBox>
                </td>
            <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*Please enter valid password." style="color: #FF0000; font-family: 'Comic Sans MS';" 
                        ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 50px">
                    <asp:Label ID="lblResult" runat="server" Width="218px"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                    <asp:Button ID="btnAdminSubmit" runat="server" onclick="btnAdminSubmit_Click" 
                        Text="Login" Height="40px" 
                        Width="200px" CssClass="brownbtn" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
  </div>
</asp:Content>


