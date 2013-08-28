<%@ Page Title="Новости | студия дизайна «Artum»" Language="C#" 
         AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="ArtumDesignLab.UI.News" %>
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <meta name="description" content="Новости дизайн студии «Artum», мы занимаемся разработкой дизайн проектов, декорированием помещений, разработкой фирменного стиля компаний" />
    <meta name="keywords" content="Новости дизайн студии «Artum»" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarContent" Runat="Server">
<at:StudioInfo ID="StudioInfo1" runat="server" />
    <at:ResponseControl ID="response" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="basicContent" Runat="Server">
    <asp:Panel ID="pnlNews" runat="server" CssClass="simple-text">
        <h1>Новости дизайн студии «Artum»</h1>
<%--	<div class="current-news" id="currentItem" runat="server" visible="false">
		<h3><asp:Literal ID="ltrHeader" runat="server" /></h3>
        <p><asp:Literal ID="ltrDate" runat="server" /></p>
		<asp:Literal ID="ltrText" runat="server" />
	</div>--%>
    <asp:ListView ID="lvwItems" OnPagePropertiesChanging="lvwItems_PagePropertiesChanging" OnDataBound="lvwItems_DataBound" runat="server">
        <LayoutTemplate>
            <ul class="news-list1">
                <li runat="server" id="itemPlaceholder" />
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
                <li style="margin-bottom: 10px;">
                    <table>
                        <tr>
                            <td class="nowrap"><p class="date"><%# DateTimeHelper.GetDateInReadableFormat((DateTime)Eval("Date")) %></p></td>
                            <td><h3><a href="<%# SiteHelper.GetWebPath("~/News.aspx/") + Eval("Url") %>"><%# SiteHelper.ParseTextWithCustomTag(Eval("Header").ToString()) %></a></h3></td>
                        </tr>
                    </table>                                
                    <img src="<%# SiteHelper.GetWebPath(Settings.NewsImagesFull) + Eval("Image") %>" width="624" height="214" alt="<%# SiteHelper.ParseTextWithCustomTag(Eval("Header").ToString()) %>" />
                    <p>&nbsp;</p>                
                </li>          
<%--		    <li runat="server">
                <div class="item_pic">
	                <a href="<%# SiteHelper.GetWebPath("~/News.aspx/") + Eval("Url") %>">
                    <img width="624" border="0" alt=" <%# Eval("Header")%>" title=" <%# Eval("Header")%>" src="<%# SiteHelper.GetWebPath(Settings.NewsImagesFull) + Eval("Image")%>">
	                </a>
	            </div>
			    <p class="date"><%# DateTimeHelper.GetDateInReadableFormat((DateTime)Eval("Date")) %></p>
			    <h3>
                    <a href="<%# SiteHelper.GetWebPath("~/News.aspx/") + Eval("Url") %>">
                        <%# Eval("Header")%>
                    </a>
                </h3>
		    </li>                 
--%>        </ItemTemplate>
    </asp:ListView>
    <div class="paginator-holder side">
            <div style="text-align:left; font-size: 16px; font-weight: bold;margin-bottom: 7px;">Страницы:</div>
            <div class="paginator">
        <asp:DataPager ID="dpgPager" PagedControlID="lvwItems" QueryStringField="page" runat="server" PageSize="15">
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
                        ButtonCount="6"
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
            <a id="lnkNewsPrev" style="font-size:14px;" class="prev" runat="server">Предыдущая новость</a>
            <br />
            <a id="lnkNewsNext" style="font-size:14px;" runat="server">Следующая новость</a>
        </div>
        <br />
        <at:GetProjectCost runat="server" id="projectCost" />
    </asp:Panel>
</asp:Content>

