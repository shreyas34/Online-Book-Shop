<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="BookShopping.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div style="height:580px;  overflow:scroll;"  class="roundDiv">
    <table style="width: 103%; height: 490px;">
            <tr>
                 <td colspan="3">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Label ID="Label2" runat="server" CssClass="lblHeader" Text="Product Details"></asp:Label>
                   </td>
                
            </tr>
            <tr>
                <td colspan="3">
                    <hr class="hrCss"/>
                 </td>
            </tr>
        <tr><td rowspan="3" style="width: 244px">
                    <asp:Image ID="imgBook" runat="server" Height="366px" Width="245px" 
                        BorderColor="Gray" BorderWidth="3px" CssClass="roundImage" />
              
            </td>
            <td class="style1" style="height: 20px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Height="203px" Width="381px" Font-Names="Andalus" 
                    Font-Size="Medium">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                            SortExpression="ProductName" />
                        <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" 
                            SortExpression="AuthorName" />
                        <asp:BoundField DataField="Language" HeaderText="Language" 
                            SortExpression="Language" />
                        <asp:BoundField DataField="PublicationYear" HeaderText="PublicationYear" 
                            SortExpression="PublicationYear" />
                        <asp:ImageField DataImageUrlField="Rate" HeaderText="Rate">
                        </asp:ImageField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    </Fields>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td style="height: 149px" class="style19">
                <br />
                <div>
                    <asp:Label ID="Label6" runat="server" Height="34px" Text="Quantity" 
                    Width="60px" Font-Names="Tahoma" Font-Size="Large"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="txtQty" runat="server" Width="40px" 
                    Font-Names="Tahoma" CssClass="textfield"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnAddToCart" runat="server" Height="40px" Text="Add To Cart" 
                    onclick="btnAddToCart_Click" Font-Names="Tahoma" Width="150px" CssClass="brownbtn" 
                   />
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtQty" ErrorMessage="Enter quantity in digits" 
                    Font-Names="Tahoma" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                </div>
                
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 163px">
                <asp:Button ID="btnDescription" runat="server" Text="Description" 
                    onclick="btnDescription_Click" CssClass="graybtn"
                     Width="150px" 
                    CausesValidation="False" Height="30px" />
                <asp:Button ID="btnReview" runat="server" Text="Review" 
                    onclick="btnReview_Click" CssClass="graybtn"
                    Width="150px" CausesValidation="False" Height="30px" />
                <br />
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:TextBox ID="txtDescription" runat="server" Height="110px" Width="659px" 
                            TextMode="MultiLine" Font-Names="Andalus" Font-Size="Medium"></asp:TextBox>
                    </asp:View>                    
                     <asp:View ID="View2" runat="server">
                         <table style="width:100%; height: 131px;">
                             <tr>
                                 <td colspan="3">
                                     &nbsp;
                                     <asp:Image ID="Image4" runat="server" Height="36px" 
                                         ImageUrl="~/Imageresources/Icons/rate.png" Width="32px" />
                                     &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Font-Names="Andalus" 
                                         Font-Size="X-Large" style="font-weight: 700; text-align: center" 
                                         Text="WRITE A REVIEW :"></asp:Label>
                                     &nbsp;</td>
                             </tr>
                             <tr> 
                                 <td style="width: 223px">
                                     <asp:Label ID="Label8" runat="server" Text="Your Name :" Font-Names="Andalus" 
                                         Font-Size="Medium"></asp:Label>
                                 </td>
                                 <td style="width: 174px" class="style30">
                                     <asp:TextBox ID="txtUserName" runat="server" Font-Names="Andalus" 
                                         Width="200px" CssClass="textfield" Font-Size="Medium"></asp:TextBox>
                                 </td>
                                 <td>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                         ControlToValidate="txtUserName" ErrorMessage="Please enter your name." 
                                         Font-Names="Andalus" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="width: 223px">
                                     <asp:Label ID="Label10" runat="server" Text="Rate :" Font-Names="Andalus" 
                                         Font-Size="Medium"></asp:Label>
                                 </td>
                                 <td style="width: 174px" class="style30">
                                     <asp:DropDownList ID="DropDownRateList" runat="server" Font-Names="Andalus" 
                                         Height="30px" Width="200px" CssClass="dropdownlist" Font-Size="Medium">
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
                                 <td style="width: 223px; height: 32px;">
                                     <asp:Label ID="Label9" runat="server" Text="Your Review :" Font-Names="Andalus" 
                                         Font-Size="Medium"></asp:Label>
                                 </td>
                                 <td style="width: 174px; height: 32px;">
                                     <asp:TextBox ID="txtUserReview" runat="server" Font-Names="Andalus" 
                                         Height="100px" TextMode="MultiLine" Width="200px" CssClass="textfield" 
                                         Font-Size="Medium" style="margin-left: 0px"></asp:TextBox>
                                 </td>
                                 <td style="height: 32px">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                         ControlToValidate="txtUserReview" ErrorMessage="Please enter your review." 
                                         Font-Names="Andalus" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="width: 223px">
                                     &nbsp;</td>
                                 <td style="width: 174px" class="style30"><br />
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnSubmitRate" runat="server" Text="Submit" Font-Names="Andalus" 
                                         Height="40px" Width="200px" onclick="btnSubmitRate_Click" 
                                         CssClass="brownbtn" Font-Size="Large" />
                                 </td>
                                 <td>
                                     <asp:Label ID="lblResult" runat="server"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="width: 223px">
                                     &nbsp;</td>
                                 <td style="width: 174px" class="style30">
                                     &nbsp;</td>
                                 <td>
                                     &nbsp;</td>
                             </tr>
                             <tr>
                                 <td style="width: 223px">
                                     <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Andalus" 
                                         Font-Size="Large" Text="User Reviews:"></asp:Label>
                                 </td>
                                 <td style="width: 174px" class="style30">
                                     &nbsp;</td>
                                 <td>
                                     &nbsp;</td>
                             </tr>
                             <tr>
                                 <td colspan="3">
                                     <hr class ="hrCss"/>
                                 </td>
                             </tr>
                             <tr>
                                 <td class="style19" colspan="3" style="height: 225px;">
                                    &nbsp; 
                                     <asp:Label ID="lblReviewResult" runat="server" Font-Names="Andalus" 
                                         Font-Size="Large" Text="No reviews found." Visible="False"></asp:Label>
                                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                         AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                         ForeColor="#333333" GridLines="None" 
                                         ShowHeader="False" Width="645px" PageSize="4" 
                                         OnPageIndexChanging = "GridView1_PageIndexChanging" Font-Names="Andalus" >
                                         <AlternatingRowStyle BackColor="White" />
                                         <Columns>
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <asp:Image ID="Image3" runat="server" Height="27px" 
                                                         ImageUrl="~/Imageresources/Icons/man.png" Width="28px" />
&nbsp;<asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="Medium" Height="33px" 
                                                         Text='<%# Eval("UserName") %>' Width="314px"></asp:Label>
                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <asp:Label ID="Label15" runat="server" Font-Bold="False" Font-Names="Andalus" 
                                                         Height="20px" Text='<%# Eval("Date") %>' Width="200px" Font-Size="Small"></asp:Label>                                                         
                                                     <br />
                                                     <asp:Image ID="Image2" runat="server" Height="25px" 
                                                         ImageUrl='<%# Eval("UserRates") %>' Width="170px" />
                                                     <br />
                                                     <asp:Label ID="Label14" runat="server" Font-Names="Andalus" Height="30px" 
                                                         Text='<%# Eval("UserReview") %>' Width="650px" Font-Size="Medium"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                         <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                         <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                         <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                         <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                         <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                         <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                         <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                         <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                         <SortedDescendingHeaderStyle BackColor="#820000" />
                                     </asp:GridView>                                    
                                 </td>
                             </tr>
                             <tr>
                                 <td style="width: 223px">
                                     &nbsp;</td>
                                 <td style="width: 174px" class="style30">
                                     &nbsp;</td>
                                 <td>
                                     &nbsp;</td>
                             </tr>
                         </table>
                    </asp:View>                    
                </asp:MultiView>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
