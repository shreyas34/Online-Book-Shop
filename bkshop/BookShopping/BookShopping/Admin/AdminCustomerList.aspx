<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminCustomerList.aspx.cs" Inherits="BookShopping.Admin.AdminCustomerList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style= "height:580px; overflow:scroll;" class="roundDiv">
     <table style="width:100%;">
         <tr>
             <td>
                 <asp:Image ID="Image2" runat="server" 
                     ImageUrl="~/Imageresources/Icons/distributor-report.png" />
             </td>
             <td>
                 <asp:Label ID="Label8" runat="server" Text="Customer List" CssClass="lblHeader" 
                     Width="500px"></asp:Label>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td colspan="3">
                <hr class="hrCss"/></td>
         </tr>
         <tr>
             <td colspan="3">
                 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                     AutoGenerateColumns="False" CellPadding="4" CssClass="lblSmall" 
                     ForeColor="#333333" GridLines="None" PageSize="5">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                             SortExpression="CustomerId" />
                         <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                             SortExpression="FirstName" />
                         <asp:BoundField DataField="LastName" HeaderText="LastName" 
                             SortExpression="LastName" />
                         <asp:BoundField DataField="Address" HeaderText="Address" 
                             SortExpression="Address" />
                         <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                         <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                         <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" 
                             SortExpression="Zipcode" />
                          <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Height="40px" Text="Delete" 
                        Width="80px" CommandArgument = '<%# Bind("CustomerId") %>' 
                        onclick="btnDelete_Click" CssClass="redbtn"/>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDetails" runat="server" Height="40px" Text="Details" 
                        Width="80px" CommandArgument ='<%# Bind("CustomerId") %>' 
                        onclick="btnDetails_Click" CssClass="graybtn" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
     </table>
    </div>
    </asp:Content>
