<%@ Page Title="Блог | студия дизайна «Artum»" Language="C#" 
         AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="TitleContent" Runat="Server">
<asp:Label Font-Size="Medium" runat="server" ID="litPlaceholder" Text="Блог студии дизайна интерьера"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">

<at:OurWorks ID="OurWorks" runat="server" />
                <at:CallOrderSidebar id="callOrderSidebar" runat="server" />
                <at:Interiors ID="interiors" runat="server" />
                <at:ResponseControl ID="response" runat="server" />
                 <at:Portfolio ID="Portfolio1" runat="server" />
                 <at:ContactInfo ID="contactInfo" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">

    <h1 runat="server" id="mainH1">Блог студии</h1>
    <asp:Panel ID="pnlBlogList" runat="server">
        <asp:ListView ID="lvwItems" runat="server" 
            onpagepropertieschanging="lvwItems_PagePropertiesChanging" 
            ondatabound="lvwItems_DataBound">
            <LayoutTemplate>
                <ul class="blog-list">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li style="margin-bottom: 10px;">
                    <table>
                        <tr>
                            <td class="nowrap"><p class="date"><%# DateTimeHelper.GetDateInReadableFormat((DateTime)Eval("CreateDate")) %></p></td>
                            <td><h3><a href="<%# SiteHelper.GetWebPath("~/Blog.aspx/") + Eval("Url") %>"><%# SiteHelper.ParseTextWithCustomTag(Eval("Header").ToString()) %></a></h3></td>
                        </tr>
                    </table>                                
                    <img src="<%# SiteHelper.GetWebPath(Settings.BlogImagesFullSize) + Eval("Image") %>" width="624" height="214" alt="<%# SiteHelper.ParseTextWithCustomTag(Eval("Header").ToString()) %>" />
                    <p><em><%# Eval("PreviewText") %></em><br />
                    <a href="<%# SiteHelper.GetWebPath("~/Blog.aspx/") + Eval("Url") %>">Читать далее</a></p>
                </li>          
            </ItemTemplate>
        </asp:ListView>
        <div class="paginator-holder side">
            <div style="text-align:left; font-size: 16px; font-weight: bold;margin-bottom: 7px;">Страницы:</div>
            <div class="paginator">
            <asp:DataPager ID="dpgPager" PagedControlID="lvwItems" QueryStringField="page" PageSize="5" runat="server">
            <Fields>
                <asp:NextPreviousPagerField 
                        ButtonType="Button"
                        ButtonCssClass="arrows prew"
                        RenderDisabledButtonsAsLabels="true"
                        ShowFirstPageButton="false"
                        ShowPreviousPageButton="true" PreviousPageText="<"
                        ShowNextPageButton="false"
                        ShowLastPageButton="false" /><%--ShowFirstPageButton="true" FirstPageText="<<"--%>

                    <asp:NumericPagerField
                        ButtonType="Button"
                        ButtonCount="30"
                        CurrentPageLabelCssClass="current"
                        RenderNonBreakingSpacesBetweenControls="true" />

                    <asp:NextPreviousPagerField
                        ButtonType="Button"
                        ButtonCssClass="arrows next"
                        RenderDisabledButtonsAsLabels="true"
                        ShowFirstPageButton="false"
                        ShowPreviousPageButton="false"
                        ShowLastPageButton="false"
                        ShowNextPageButton="true" NextPageText=">" /><%--ShowLastPageButton="true" LastPageText=">>"--%>
            </Fields>
            </asp:DataPager>
        </div>
      </div>
    </asp:Panel>
    <asp:Panel ID="pnlPost" Visible="false" runat="server" CssClass="simple-text">
        <h1><asp:Literal ID="postHeader" runat="server" /></h1>
        <p><img ID="postImage" width="624" height="214" alt="" runat="server" /></p>
        
        <div class="blog_ul">
        <asp:Literal ID="postText" runat="server" />
        </div>   
        <div class="pager">
            <h4  style="font-size:18px;">Читайте далее:</h4>
            <a id="lnkBlogsPrev" style="font-size:14px;" class="prev" runat="server">Предыдущая запись</a>
            <br />
            <a id="lnkBlogsNext" style="font-size:14px;" runat="server">Следующая запись</a>
            <%--<a id="lnkProjectsList" class="all" runat="server">Список проектов</a>--%>
        </div>
        <br />
        
        
        <at:GetProjectCost runat="server" id="projectCost" />
       
  


    </asp:Panel>
    
 


</asp:Content>


<%-- 
<div class="oject-list-holder" id="blogPhotosHolder" visible="false" runat="server">
        <ul class="object-list">
            <li>
                <h3 class="active"><span class="arrow"></span>Дополнительные изображения:</h3>
                <ul class="ourwork-list project-photos object-photos-holder" style="display: block">
                    <asp:Repeater ID="rptImages" runat="server">
                        <ItemTemplate>
                            <li>
                                <div class="ourwork-img">
                                    <a href="<%# SiteHelper.GetWebPath(Settings.BlogImagesFullSize) + Eval("Name") %>">
                                        <img src="<%# SiteHelper.GetWebPath(Settings.BlogImagesThumbsMedium) + Eval("Name") %>" alt="" width="155" height="140" />
                                    </a>
                                    <div class="img-overlay"></div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </li>
        </ul>

    </div>
--%>