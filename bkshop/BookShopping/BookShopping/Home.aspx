<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="BookShopping._Default" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="Styles/nivo-slider.css" type="text/css" media="screen" />
  <%--  <link rel="stylesheet" href="Styles/slider.css" type="text/css" media="screen" />--%>
    <script type="text/javascript" src="Scripts/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
<div style="height:550px" class="roundDiv">
        <table style="width: 116%; height: 492px;">
            <tr>
                <td style="height: 29px" class="style31">
                    <asp:Label ID="Label2" runat="server" CssClass="lblHeaderMedium" Text="WELCOME TO  THE IDEAL BOOK HOME"></asp:Label>
                 </td>
            </tr>
            <tr>
                <td style="height: 115px;">
              <table style="width:100%; height: 244px;">
                        <tr>
                            <td style="width: 425px; height: 227px; font-family: Andalus; font-size: large; color: #990000;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Each year IdealHome 
                                publishes more than 700 new books across fifteen subject areas in the Social 
                                Sciences and Humanities, representing the best academic research from around the 
                                world. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDEALBOOKHOME provides a complete online bookstore solution that can 
                                be tailored to your needs.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" CssClass="brownbtn" Height="50px" 
                                    Text="More Details" Width="150px" onclick="Button1_Click" />
                            </td>
                            <td style="height: 227px">
                 <asp:Image ID="Image2" runat="server" Height="249px" 
                        ImageUrl="~/Imageresources/Icons/BOOKHOME.jpg" Width="239px" CssClass="roundImage" />
                
                
                            </td>
                        </tr>
                        </table>
                </td>
                 
            </tr>

            <tr>
                <td style="height: 240px">

                 <%-- <div style="height: 200px;" class="slideshow" data-pagination="true" data-loop="true" data-transition="crossfade">
        --%>
                   <%-- <div style="height: 200px;" class="slideshow" data-visible="4" data-loop="true" data-pagination="true">
                     <ul class="carousel">
                        <li class="slide"><img src="Imageresources/Gallery/Chrysanthemum.jpg"  
                                height = "200"></li>
                        <li class="slide"><img src="Imageresources/Gallery/Desert.jpg" height = "200" width= "266"></li>                        
                        <li class="slide"><img src="Imageresources/Gallery/Hydrangeas.jpg" height = "200" width= "266"></li>
                        <li class="slide"><img src="Imageresources/Gallery/Koala.jpg" height = "200" width= "266"></li>
                        <li class="slide"><img src="Imageresources/Gallery/Lighthouse.jpg"  height = "200" width= "266"></li>
                        <li class="slide"><img src="Imageresources/Gallery/Tulips.jpg" height = "200" width= "266"></li>
                    </ul>
                 </div>--%>
                      
                <div id="slider" class="nivoSlider">
                   <%-- <img src="images/toystory.jpg" alt= ""/>
                    <img src="images/up.jpg"/>
                    <img src="images/walle.jpg"/>
                    <img src="images/nemo.jpg"/>--%>
                    <a href="ProductList.aspx?ProductCategoryID=C02"><img src="Imageresources/Banner/banner1.jpg"/></a>
                    <a href="ProductList.aspx?ProductCategoryID=C01"><img src="Imageresources/Banner/banner2.jpg"/></a>
                    <a href="ProductList.aspx"><img src="Imageresources/Banner/banner3.jpg"/></a>
                    <a href="ProductList.aspx?ProductCategoryID=C03"><img src="Imageresources/Banner/banner4.jpg"/></a>
                    <a href="ProductList.aspx?ProductCategoryID=C07"><img src="Imageresources/Banner/banner5.jpg"/></a>
                </div> 
               </td>
            </tr>
   </table>
</div>
</asp:Content>
