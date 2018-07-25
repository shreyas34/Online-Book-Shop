<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdvanceSearch.aspx.cs" Inherits="BookShopping.AdvanceSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div style="height:580px;" class="roundDiv">
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Imageresources/Icons/search-2.png" />
            </td>
            <td colspan="2">
                <asp:Label ID="Label5" runat="server" CssClass="lblHeader" 
                    Text="Advance Search" Width="457px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
               <hr class="hrCss"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                    &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 215px; height: 26px;">
                <asp:Label ID="Label3" runat="server" Text="*Book Name :" CssClass="lblMedium" 
                    ></asp:Label>
            </td>
            <td style="height: 26px; width: 142px;">
                <asp:TextBox ID="txtBookName" runat="server" Width="200px" CssClass="textfield" 
                    ></asp:TextBox>
            </td>
            <td style="height: 26px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtBookName" ErrorMessage="*Please enter book name" 
                        style="color: #FF0000; font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 215px">
                <asp:Label ID="Label4" runat="server" 
                        Text="Auther Name :" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 142px">
                <asp:TextBox ID="txtAuthorName" runat="server" Width="200px" 
                    CssClass="textfield"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtAuthorName" ErrorMessage="*please enter valid name" 
                    style="color: #FF0000" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 215px">
                &nbsp;</td>
            <td style="width: 142px">
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<br />
                <asp:Label ID="lblResult" runat="server" Width="200px"></asp:Label>
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="style12" style="height: 55px">
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSubmit" runat="server" 
                         
                        Text="Search"  Height="40px" Width="150px" onclick="btnSubmit_Click" 
                    CssClass="brownbtn" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    <asp:Button ID="btnReset" runat="server" 
                         
                        Text="Reset" CausesValidation="False" Height="40px" Width="150px" 
                    onclick="btnReset_Click" CssClass="graybtn" 
                         />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" 
                       
                        Text="Cancel"  CausesValidation="False" 
                        Height="40px" Width="150px" onclick="btnCancel_Click" 
                    CssClass="graybtn" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br />
                <br />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
