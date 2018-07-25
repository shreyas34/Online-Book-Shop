<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="BookShopping.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:580px;  overflow:scroll;"  class="roundDiv">
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Label ID="Label2" runat="server" CssClass="lblHeader" Text="ProductList"></asp:Label></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr class="hrCss"/>
                 </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblResult" runat="server"></asp:Label></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" Width="480px" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Height="23px" 
        PageSize="4" OnPageIndexChanging = "GridView1_PageIndexChanging" 
                    style="margin-left: 0px" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image3" runat="server" Height="150px" 
                        ImageUrl='<%# Eval("PathToIcon") %>' Width="120px" BorderColor="Gray" 
                        BorderWidth="3px" CssClass="roundImage" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("ProductName") %>' 
                        Width="300px" Font-Bold= "True" Font-Names = "Andalus" Font-Size="Large"></asp:Label>
                    <br />
                     <asp:TextBox style="OVERFLOW:hidden" ID="lblDescription" runat="server" 
                        Height="80px" Width="300px" Font-Names="Andalus" Wrap= "true" TextMode = "multiline"
BorderStyle = "None" BorderWidth = "0" ReadOnly = "true" Rows= "4" BackColor="Transparent"  
                        Text='<%# Eval("BookDescription") %>' Font-Size="Medium"></asp:TextBox>
                     </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate> 

                    <br />

                    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Names="Andalus" 
                        Text="Price : " Font-Size="Medium" Height="20px"></asp:Label>

                    <asp:Label ID="Label3" runat="server" Height="20px" Text='<%# Eval("Price") %>' 
                        Width="77px" Font-Names="Andalus" Font-Size="Medium"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />                   
                    <asp:Image ID="Image4" runat="server" Height="20px" 
                        ImageUrl='<%# Eval("Rate") %>' Width="120px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />                    
                    <asp:Button ID="btnAddToCart" runat="server" Height="40px" Text="Add To Cart" 
                        onclick="btnAddToCart_Click" CommandArgument = '<%# Eval("ProductId") %>' 
                        CausesValidation="False" Width="120px" Font-Names="Andalus" 
                        CssClass="brownbtn" Font-Size="Medium"/>
                    <%--<a href='ProductDetails.aspx?ProductID=<%# Eval("ProductId") %>&ProductCategoryID=<%# Eval("CategoryId") %>'>
                    <span class="ProductListHead">Details </span></a>--%>
                &nbsp;<br />
                    <asp:Button ID="btnDetails" runat="server" CausesValidation="False" 
                        Height="40px" Text="Details" Width="120px" onclick="btnDetails_Click" 
                        CommandArgument = '<%# Eval("ProductId") %>' Font-Names="Andalus" 
                        CssClass="graybtn" Font-Bold="False" Font-Size="Medium"/>
                    <%--<a href='ProductDetails.aspx?ProductID=<%# Eval("ProductId") %>&ProductCategoryID=<%# Eval("CategoryId") %>'>
                    <span class="ProductListHead">Details </span></a>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" Wrap="True" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>                
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    <br /> <br /> <br /> <br />


   
    </div>
</asp:Content>
