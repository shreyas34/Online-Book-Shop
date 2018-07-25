<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="BookShopping.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style= "height:580px;" class="roundDiv">
    <table style="width:100%; height: 290px;">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Imageresources/Icons/lock-2.png" />
            </td>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Forgot Password" 
                    CssClass="lblHeader"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3"> <hr class="hrCss"/></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="lblMedium" Text="EmailId :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailId" runat="server" CssClass="textfield"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
       
        <tr>
            <td style="width: 148px">
                <asp:Label ID="lblQues" runat="server" Text="*Security Question" 
                    CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px">
                <asp:DropDownList ID="DropDownQuestionList" runat="server" Height="40px" 
                    style="margin-bottom: 0px" Width="300px" 
                    onselectedindexchanged="DropDownQuestionList_SelectedIndexChanged" 
                    CssClass="dropdownlistquestion">
                    <asp:ListItem Text="Select Question" Value= "Select Question"></asp:ListItem>
                    <asp:ListItem Text="What is your Pet name?" Value= "What is your Pet name?"></asp:ListItem>
                    <asp:ListItem Text="Which is your native place?" Value= "Which is your native place?"></asp:ListItem>
                    <asp:ListItem Text="What is your  favorite teacher name?" Value= "What is your favorite  teacher name?"></asp:ListItem>
                    <asp:ListItem Text="Which is your favorite dish?" Value= "Which is your favorite dish?"></asp:ListItem>
                    <asp:ListItem Text="Which is your birth place?" Value= "Which is your birth place?"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="color: #FF0000; font-family: 'Comic Sans MS'">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="*Please enter Security Question" 
                    ControlToValidate="DropDownQuestionList"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 148px">
                <asp:Label ID="lblAns" runat="server" Text="*Answer" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px">
                <asp:TextBox ID="txtAnswer" runat="server" CssClass="textfield" Width="200px"></asp:TextBox>
            </td>
            <td style="color: #FF0000; font-family: 'Comic Sans MS'">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ErrorMessage="*Please enter your Security Answer" 
                    ControlToValidate="txtAnswer"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 148px">
                &nbsp;</td>
            <td style="width: 59px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" CssClass="brownbtn" Text="Submit" 
                    Width="200px" onclick="btnSubmit_Click" Height="40px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblResult" runat="server" CssClass="lblHeaderMedium" 
                    ForeColor="#006600"></asp:Label>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
