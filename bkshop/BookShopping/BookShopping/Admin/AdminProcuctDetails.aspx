<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminProcuctDetails.aspx.cs" Inherits="BookShopping.Admin.AdminProcuctDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style= "height:540px; overflow:scroll;" class="roundDiv">
        <table style="width: 100%">
            <tr>
                <td colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label 
                    ID="Label2" runat="server" 
                    Text="Product Details" CssClass="lblHeader"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td colspan="4">
                     <hr class="hrCss"/></td>
            </tr>
            <tr>
                <td style="width: 189px">
                    &nbsp;</td>
                <td style="width: 16px">
                    <asp:Label ID="lblResult" runat="server" Text="Label" Width="200px" 
                        Visible="False"></asp:Label>
                </td>
                <td style="width: 231px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label17" runat="server" Text="Product CategoryId :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:TextBox ID="txtCategoryId" runat="server" Width="200px" 
                    Enabled="False" CssClass="textfield"></asp:TextBox>
                </td>
                <td style="width: 231px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label19" runat="server" Text="ProductId :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:TextBox ID="txtProductId" runat="server" Width="200px" 
                    Enabled="False" CssClass="textfield"></asp:TextBox>
                </td>
                <td style="width: 231px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    &nbsp;</td>
                <td style="width: 231px" colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label14" runat="server" Text="Product Category :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:DropDownList ID="DropDownCategoryList" runat="server" Height="30px" 
                    Width="200px" 
                        onselectedindexchanged="DropDownCategoryList_SelectedIndexChanged" 
                        CssClass="dropdownlist">                        
                    </asp:DropDownList>
                </td>
                <td style="width: 231px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*Please select Category"  
                        style="color: #FF0000; font-family: 'Comic Sans MS'"                       
                        ControlToValidate="DropDownCategoryList"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label20" runat="server" Text="Product Name :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:TextBox ID="txtProductName" runat="server" Width="200px" 
                        CssClass="textfield"></asp:TextBox>
                </td>
                <td style="width: 231px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*Please select Product Name" 
                        style="color: #FF0000; font-family: 'Comic Sans MS'"
                        ControlToValidate="txtProductName"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px; height: 152px;">
                    <asp:Label ID="Label6" runat="server" Text="Book Image  :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 231px; height: 152px;" colspan="2">
                    <asp:Image ID="imgBook" runat="server" Height="140px" Width="150px" 
                        CssClass="roundImage" />
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="32px" 
                        Font-Names="Tahoma" />
                    <asp:Button ID="btnUploadImage" runat="server" Height="40px" Text="Save Image" 
                        Width="150px" onclick="btnUploadImage_Click" CssClass="brownbtn" 
                        style="font-size: medium; font-weight: 700" CausesValidation="False" />
                </td>
                <td style="height: 152px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label22" runat="server" Text="Author Name:" CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:TextBox ID="txtAuthorName" runat="server" Width="200px" 
                        CssClass="textfield"></asp:TextBox>
                </td>
                <td style="width: 231px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*Please enter Auther Name" 
                        style="color: #FF0000; font-family: 'Comic Sans MS'" 
                        ControlToValidate="txtAuthorName"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label4" runat="server" Text="Language :" CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:DropDownList ID="DropDownLanguageList" runat="server" Height="30px" 
                        Width="200px" CssClass="dropdownlist">
                        <asp:ListItem>English</asp:ListItem>
                        <asp:ListItem>Marathi</asp:ListItem>
                        <asp:ListItem>Hindi</asp:ListItem>
                        <asp:ListItem>Spanish</asp:ListItem>
                        <asp:ListItem>French</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 231px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="*Select Language" 
                        style="font-family: 'Comic Sans MS'; color: #FF0000" 
                        ControlToValidate="DropDownLanguageList"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label5" runat="server" Text="Publication Year :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:DropDownList ID="DropDownYearList" runat="server" Height="30px" 
                        Width="200px" CssClass="dropdownlist">                        
                    </asp:DropDownList>
                </td>
                <td style="width: 231px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="*Select Year" 
                        style="font-family: 'Comic Sans MS'; color: #FF0000" 
                        ControlToValidate="DropDownYearList"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label21" runat="server" Text="Price :" CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 16px">
                    <asp:TextBox ID="txtPrice" runat="server" Width="200px" CssClass="textfield"></asp:TextBox>
                </td>
                <td style="width: 231px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px">
                    <asp:Label ID="Label7" runat="server" Text="Rate :" CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 231px" colspan="2">
                    <asp:DropDownList ID="DropDownRateList" runat="server" Height="30px" 
                        Width="200px" CssClass="dropdownlist">
                        <asp:ListItem Text= "5 stars" Value= "~/Imageresources/Stars/5star.png">5 stars</asp:ListItem>
                        <asp:ListItem Text= "4 stars" Value= "~/Imageresources/Stars/4star.png">4 stars</asp:ListItem>
                        <asp:ListItem Text= "3 stars" Value= "~/Imageresources/Stars/3star.png">3 stars</asp:ListItem>
                        <asp:ListItem Text= "2 stars" Value= "~/Imageresources/Stars/2star.png">2 stars</asp:ListItem>
                        <asp:ListItem Text= "1 star" Value= "~/Imageresources/Stars/1star.png">1 star</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 189px; height: 26px;">
                    <asp:Label ID="Label13" runat="server" Text="BookDescription :" 
                        CssClass="lblMedium"></asp:Label>
                </td>
                <td style="width: 231px; height: 26px;" colspan="2">
                    <asp:TextBox ID="txtBookDescription" runat="server" Width="400px" Height="80px" 
                        TextMode="MultiLine" CssClass="textfield"></asp:TextBox>
                </td>
                <td style="height: 26px; color: #FF0000; font-family: 'Comic Sans MS'">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
                <td style="color: #FF0000; font-family: 'Comic Sans MS'">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button 
                    ID="btnUpdate" runat="server" CssClass="brownbtn" Text="Update" Height="50px" 
                    onclick="btnUpdate_Click" Width="150px" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="btnEdit" runat="server" CssClass="brownbtn" Text="Edit" 
                     Height="50px" Width="150px" onclick="btnEdit_Click" 
                    CausesValidation="False" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" CssClass="graybtn" Text="Cancel" 
                    onclick="btnCancel_Click" CausesValidation="False" Height="50px" 
                    Width="150px" Visible="False" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
