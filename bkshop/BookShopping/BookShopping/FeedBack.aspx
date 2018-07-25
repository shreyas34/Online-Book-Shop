<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="BookShopping.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style= "height:550px;" class="roundDiv">
        <table style="width: 98%">
            <tr>
              <td>
                   <asp:Image ID="Image2" runat="server" 
                       ImageUrl="~/Imageresources/Icons/document_write.png" />
                   </td>               
              <td colspan="2">
                   <asp:Label ID="Label2" runat="server" CssClass="lblHeader" Text="Feedback"></asp:Label>
                   </td>               
            </tr>
            <tr>
                <td colspan="3">
                   <hr class="hrCss"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label6" runat="server" 
                        Text="Feedback Your Comments for Our Better Performance." 
                        CssClass = "lblMedium" Height="24px" Width="625px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 141px; height: 26px;">
                    <asp:Image ID="Image3" runat="server" Height="20px" 
                        ImageUrl="~/Imageresources/Icons/user.png" Width="20px" />
&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" 
                        Text="*Name :" 
                        Font-Names="Andalus" CssClass = "lblMedium"></asp:Label>
                </td>
                <td style="height: 26px; width: 67px;">
                    <asp:TextBox ID="txtName" runat="server" Width="200px" 
                        CssClass="textfield"></asp:TextBox>
                </td>
                <td style="height: 26px; width: 268px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="*Please enter your Name" 
                        style="color: #FF0000; font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 141px">
                    <asp:Image ID="Image4" runat="server" Height="20px" 
                        ImageUrl="~/Imageresources/Icons/email-2.png" Width="25px" />
&nbsp;
                    <asp:Label ID="Label4" runat="server" 
                        Text="*Email Id :" CssClass = "lblMedium"></asp:Label>
                </td>
                <td style="width: 67px">
                    <asp:TextBox ID="txtEmailId" runat="server" Width="200px" 
                        CssClass="textfield"></asp:TextBox>
                </td>
                <td style="width: 268px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtEmailId" ErrorMessage="*Please enter vaid Email Id" 
                        style="color: #FF0000; font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 141px">
                    <asp:Image ID="Image5" runat="server" Height="20px" 
                        ImageUrl="~/Imageresources/Icons/comment_write.png" Width="25px" />
                    <asp:Label ID="Label5" runat="server" Text="*Comments :" CssClass = "lblMedium"></asp:Label>
                </td>
                <td style="width: 67px">
                    &nbsp;</td>
                <td style="width: 268px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtComments" runat="server" Height="100px" Width="485px" 
                        CssClass="textfield" Rows="4" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtComments" ErrorMessage="*Please enter your Comments" 
                        style="color: #FF0000; font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="lblResult" runat="server" Width="200px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style12" style="height: 55px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSubmit" runat="server"                       
                        Text="Submit"  Height="40px" Width="150px" onclick="btnSubmit_Click" 
                        CssClass="brownbtn"  />
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button 
                        ID="btnReset" runat="server"
                        Text="Reset" CausesValidation="False" Height="40px" Width="150px" 
                        onclick="btnReset_Click" CssClass="graybtn" 
                         />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" 
                        Text="Cancel"  CausesValidation="False" 
                        Height="40px" Width="150px" onclick="btnCancel_Click" CssClass="graybtn" />
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
