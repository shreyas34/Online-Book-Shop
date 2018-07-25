<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="BookShopping.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style= "height:540px; overflow:scroll;" class="roundDiv">
    <table style="width: 100%">
        <tr>
          <td>
                   &nbsp;<asp:Image ID="Image2" runat="server" 
                       ImageUrl="~/Imageresources/Icons/edituser.png" />
                   </td>
          <td colspan="2">
                   <asp:Label ID="Label2" runat="server" CssClass="lblHeader" Text="My Account"></asp:Label>
                   </td>
        </tr>
        <tr>
            <td colspan="3">
              <hr class="hrCss"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
                    style="color: #FF0000"> </span>
                <asp:Label ID="Label3" runat="server" 
                    
                    Text="Fields marked * are mandatory, but please fill in as much information as possible" 
                    style="color: #FF0000; font-family: 'Comic Sans MS'"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="height:5px;"></td>
        </tr>
        <tr>
            <td style="width: 183px">
                <asp:Label ID="Label4" runat="server" 
                     Text="*First Name :" 
                     Height="30px" 
                    Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px">
                <asp:TextBox ID="txtFirstName" runat="server" Width="200px" 
                    CssClass="textfield"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtFirstName" 
                    ErrorMessage="*Please enter your First Name" 
                    style="color: #FF0000; font-family: 'Comic Sans MS'"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 183px; height: 26px;">
                <asp:Label ID="Label5" runat="server" Text="*Last Name :" Height="30px" 
                    Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px; height: 26px;">
                <asp:TextBox ID="txtLastName" runat="server" Width="200px" CssClass="textfield"></asp:TextBox>
            </td>
            <td style="height: 26px; color: #FF0000; font-family: 'Comic Sans MS'">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtLastName" 
                    ErrorMessage="*Please enter your Last Name "></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 183px; height: 26px;">
                <asp:Label ID="Label6" runat="server" Text="*Address :"  Height="30px" 
                    Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px; height: 26px;">
                <asp:TextBox ID="txtAddress" runat="server" Width="200px" CssClass="textfield"></asp:TextBox>
            </td>
            <td style="height: 26px; color: #FF0000; font-family: 'Comic Sans MS'">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="*Please enter your Address "></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 183px; height: 26px;">
                <asp:Label ID="Label16" runat="server" Text="PhoneNo:" Height="30px" Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px; height: 26px;">
                <asp:TextBox ID="txtPhoneNo" runat="server" Width="200px" CssClass="textfield"></asp:TextBox>
            </td>
            <td style="height: 26px; color: #FF0000; font-family: 'Comic Sans MS'">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 183px">
                <asp:Label ID="Label7" runat="server" Text="*State:"  Height="30px" 
                    Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="200px" 
                    CssClass="dropdownlist">
                    <asp:ListItem Text= "" Value="">Select State</asp:ListItem>
                    <asp:ListItem Text= "Andra Pradesh" Value="Andra Pradesh">Andra Pradesh</asp:ListItem>
                    <asp:ListItem Text= "Arunachal Pradesh" Value="Arunachal Pradesh">Arunachal Pradesh</asp:ListItem>
                    <asp:ListItem Text= "Assam" Value="Assam">Assam</asp:ListItem>
                    <asp:ListItem Text= "Bihar" Value="Bihar">Bihar</asp:ListItem>
                    <asp:ListItem Text= "Chhattisgarh" Value="Chhattisgarh">Chhattisgarh</asp:ListItem>
                    <asp:ListItem Text= "Goa" Value="Goa">Goa</asp:ListItem>
                    <asp:ListItem Text= "Gujarat" Value="Gujarat">Gujarat</asp:ListItem>
                    <asp:ListItem Text= "Haryana" Value="Haryana">Haryana</asp:ListItem>
                    <asp:ListItem Text= "Himachal Pradesh" Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                    <asp:ListItem Text= "Jammu and Kashmir" Value="Jammu and Kashmir">Jammu and Kashmir</asp:ListItem>
                    <asp:ListItem Text= "Jharkhand" Value="Jharkhand">Jharkhand</asp:ListItem>
                    <asp:ListItem Text= "Karnataka" Value="Karnataka">Karnataka</asp:ListItem>
                    <asp:ListItem Text= "Kerala" Value="Kerala">Kerala</asp:ListItem>
                    <asp:ListItem Text= "Madya Pradesh" Value="Madya Pradesh">Madya Pradesh</asp:ListItem>
                    <asp:ListItem Text= "Maharashtra" Value="Maharashtra">Maharashtra</asp:ListItem>
                    <asp:ListItem Text= "Manipur" Value="Manipur">Manipur</asp:ListItem>
                    <asp:ListItem Text= "Meghalaya" Value="Meghalaya">Meghalaya</asp:ListItem>
                    <asp:ListItem Text= "Mizoram" Value="Mizoram">Mizoram</asp:ListItem>
                    <asp:ListItem Text= "Nagaland" Value="Nagaland">Nagaland</asp:ListItem>
                    <asp:ListItem Text= "Orissa" Value="Orissa">Orissa</asp:ListItem>
                    <asp:ListItem Text= "Punjab" Value="Punjab">Punjab</asp:ListItem>
                    <asp:ListItem Text= "Rajasthan" Value="Rajasthan">Rajasthan</asp:ListItem>
                    <asp:ListItem Text= "Sikkim" Value="Sikkim">Sikkim</asp:ListItem>
                    <asp:ListItem Text= "Delhi" Value="Delhi">Delhi</asp:ListItem>
                    <asp:ListItem Text= "Chandigarh" Value="Chandigarh">Chandigarh</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="color: #FF0000; font-family: 'Comic Sans MS'">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="*Please select your State"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 183px; height: 26px;">
                <asp:Label ID="Label8" runat="server"  Text="*City:"  Height="30px" 
                    Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px; height: 26px;">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="40px" Width="200px" 
                    style="margin-bottom: 0px" CssClass="dropdownlist">
                    <asp:ListItem Text= "" Value="">Select City</asp:ListItem>
                    <asp:ListItem Text= "Agra" Value="Agra">Agra</asp:ListItem>
                    <asp:ListItem Text= "Ahmedpur" Value="Ahmedpur">Ahmedpur</asp:ListItem>
                    <asp:ListItem Text= "Ahmedabad" Value="Ahmedabad">Ahmedabad</asp:ListItem>
                    <asp:ListItem Text= "Ahmednagar" Value="Ahmednagar">Ahmednagar</asp:ListItem>
                    <asp:ListItem Text= "Ajra" Value="Ajra">Ajra</asp:ListItem>
                    <asp:ListItem Text= "Akot" Value="Akot">Akot</asp:ListItem>
                    <asp:ListItem Text= "Alibag" Value="Alibag">Alibag</asp:ListItem>
                    <asp:ListItem Text= "Alur" Value="Alur">Alur</asp:ListItem>
                    <asp:ListItem Text= "Ashok Nagar" Value="Ashok Nagar">Ashok Nagar</asp:ListItem>
                    <asp:ListItem Text= "Babaleshwar" Value="Babaleshwar">Babaleshwar</asp:ListItem>
                    <asp:ListItem Text= "Balasore" Value="Balasore">Balasore</asp:ListItem>
                    <asp:ListItem Text= "Baleshwar" Value="Baleshwar">Baleshwar</asp:ListItem>
                    <asp:ListItem Text= "Baramati" Value="Baramati">Baramati</asp:ListItem>
                    <asp:ListItem Text= "Bhopal" Value="Bhopal">Bhopal</asp:ListItem>
                    <asp:ListItem Text= "Bhuj" Value="Bhuj">Bhuj</asp:ListItem>
                    <asp:ListItem Text= "Brahmapur" Value="Brahmapur">Brahmapur</asp:ListItem>
                    <asp:ListItem Text= "Byasanagar" Value="Byasanagar">Byasanagar</asp:ListItem>
                    <asp:ListItem Text= "Chandil" Value="Chandil">Chandil</asp:ListItem>
                    <asp:ListItem Text= "Chatra" Value="Chatra">Chatra</asp:ListItem>
                    <asp:ListItem Text= "Chandrapur" Value="Chandrapur">Chandrapur</asp:ListItem>
                    <asp:ListItem Text= "Chennai" Value="Chennai">Chennai*</asp:ListItem>
                    <asp:ListItem Text= "Chockli" Value="Chockli">Chockli</asp:ListItem>
                    <asp:ListItem Text= "Dombivli" Value="Dombivli">Dombivli</asp:ListItem>
                    <asp:ListItem Text= "Durgapur" Value="Durgapur">Durgapur</asp:ListItem>
                    <asp:ListItem Text= "Edathua" Value="Edathua">Edathua</asp:ListItem>
                    <asp:ListItem Text= "Fatwah" Value="Fatwah">Fatwah</asp:ListItem>
                    <asp:ListItem Text= "Ghaziabad" Value="Ghaziabad">Ghaziabad</asp:ListItem>
                    <asp:ListItem Text= "Gunupur" Value="Gunupur">Gunupur</asp:ListItem>
                    <asp:ListItem Text= "Haldia" Value="Haldia">Haldia</asp:ListItem>
                    <asp:ListItem Text= "Harda" Value="Harda">Harda</asp:ListItem>
                    <asp:ListItem Text= "Hoshiarpur" Value="Hoshiarpur">Hoshiarpur</asp:ListItem>
                    <asp:ListItem Text= "Indore" Value="Indore">Indore</asp:ListItem>
                    <asp:ListItem Text= "Islampur" Value="Islampur">Islampur</asp:ListItem>
                    <asp:ListItem Text= "Jammu" Value="Jammu">Jammu</asp:ListItem>
                    <asp:ListItem Text= "Jodhpur" Value="Jodhpur">Jodhpur</asp:ListItem>
                    <asp:ListItem Text= "Latur" Value="Latur">Latur</asp:ListItem>
                    <asp:ListItem Text= "Lucknow" Value="Lucknow">Lucknow</asp:ListItem>
                    <asp:ListItem Text= "Mahabaleswar" Value="Mahabaleswar">Mahabaleswar</asp:ListItem>
                    <asp:ListItem Text= "Mahad" Value="Mahad">Mahad</asp:ListItem>
                    <asp:ListItem Text= "Mahuli" Value="Mahuli">Mahuli</asp:ListItem>
                    <asp:ListItem Text= "Manwath" Value="Manwath">Manwath</asp:ListItem>
                    <asp:ListItem Text= "Mumbai" Value="Mumbai">Mumbai</asp:ListItem>
                    <asp:ListItem Text= "Nagpur" Value="Nagpur">Nagpur</asp:ListItem>
                    <asp:ListItem Text= "Nashik" Value="Nashik">Nashik</asp:ListItem>
                    <asp:ListItem Text= "Navi Mumbai" Value="Navi Mumbai">Navi Mumbai</asp:ListItem>
                    <asp:ListItem Text= "Ottappalam" Value="Ottappalam">Ottappalam</asp:ListItem>
                    <asp:ListItem Text= "Palasa Kasibugga" Value="Palasa Kasibugga">Palasa Kasibugga</asp:ListItem>
                    <asp:ListItem Text= "Pachora" Value="Pachora">Pachora</asp:ListItem>
                    <asp:ListItem Text= "Palwancha" Value="Palwancha">Palwancha</asp:ListItem>
                    <asp:ListItem Text= "Patur" Value="Patur">Patur</asp:ListItem>
                    <asp:ListItem Text= "Pune" Value="Pune">Pune</asp:ListItem>
                    <asp:ListItem Text= "Satara" Value="Satara">Satara</asp:ListItem>
                    <asp:ListItem Text= "Seohara" Value="Seohara">Seohara</asp:ListItem>
                    <asp:ListItem Text= "Tamluk" Value="Tamluk">Tamluk</asp:ListItem>
                    <asp:ListItem Text= "Thoubal" Value="Thoubal">Thoubal</asp:ListItem>
                    <asp:ListItem Text= "Udgir" Value="Udgir">Udgir</asp:ListItem>
                    <asp:ListItem Text= "Zira" Value="Zira">Zira</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="color: #FF0000; font-family: 'Comic Sans MS'; height: 26px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="DropDownList2" ErrorMessage="*Please select your City"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 183px">
                <asp:Label ID="Label9" runat="server" Text="*Zipcode :"  Height="30px" 
                    Width="150px" CssClass="lblMedium"></asp:Label>
            </td>
            <td style="width: 59px">
                <asp:TextBox ID="txtZipcode" runat="server" Width="200px" CssClass="textfield"></asp:TextBox>
            </td>
            <td style="color: #FF0000; font-family: 'Comic Sans MS'">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtZipCode" ErrorMessage="*Please enter Your Zipcode"></asp:RequiredFieldValidator>
            </td>
        </tr>
          <tr>
            <td style="width: 148px">
                &nbsp;</td>
            <td style="width: 59px">
                &nbsp;</td>
            <td style="color: #FF0000; font-family: 'Comic Sans MS'">
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
            <td style="width: 183px">
                &nbsp;</td>
            <td style="width: 59px">
                <asp:Label ID="lblResult" runat="server" Width="200px"></asp:Label>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" CssClass="brownbtn" Text="Update" Height="40px" 
                    onclick="btnUpdate_Click" Width="150px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEdit" runat="server" CssClass="brownbtn"  Text="Edit" 
                     Height="40px" Width="200px" onclick="btnEdit_Click" 
                    CausesValidation="False"   />
                &nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" CssClass="graybtn" Text="Cancel" 
                    onclick="btnCancel_Click" CausesValidation="False" Height="40px" 
                    Width="150px"  />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
