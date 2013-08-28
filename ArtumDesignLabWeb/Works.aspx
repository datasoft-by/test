<%@ Page Title="Примеры дизайн проектов квартир, примеры дизайна интерьера - Портфолио дизайн-студии" Language="C#" 
    AutoEventWireup="true" CodeFile="Works.aspx.cs" Inherits="ArtumDesignLab.UI.Works" %>
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <at:DynamicHead ID="dynHead" runat="server" />
</asp:Content>

<asp:Content ID="SidebarContent" ContentPlaceHolderID="sidebarContent" runat="server">
    <at:FurniturePortfolio ID="FurniturePortfolio" runat="server" />    
    <at:FurnitureInfo ID="FurnitureInfo" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="basicContent" runat="server">
    <asp:Panel ID="pnlProjectsList" runat="server">
        <h1><asp:Literal ID="ltrTitle" runat="server" /></h1>
        <p><asp:Literal ID="ltrText" runat="server" /></p>
        <asp:ListView ID="lvwProjects" runat="server" 
            onpagepropertieschanging="lvwProjects_PagePropertiesChanging">
            <LayoutTemplate>
                <ul class="portfolio-list">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
	            <li>
		            <div class="portfolio-img">
			            <a href="<%# SiteHelper.GetWebPath("~/Works.aspx") + "?id=" +  Eval("WorkID") + "&cat=" + Eval("WorkCategoryID") %>">
                            <img src="<%# SiteHelper.GetWebPath(Settings.WorksImagesThumbsMedium + Eval("Image"))%>" alt="<%# Eval("Header")%>" width="155" height="140">
                         </a></div>
		            <div class="portfolio-txt">
			            <h3><a href="<%# SiteHelper.GetWebPath("~/Works.aspx") + "?id=" +  Eval("WorkID") + "&cat=" + Eval("WorkCategoryID") %>"><%# Eval("Header") %></a></h3>
			            <p><%# SiteHelper.GetSentences(Eval("Text").ToString(), 2) %></p>
		            </div>
	            </li>          
            </ItemTemplate>
        </asp:ListView>
        <div class="paginator-holder side">
            <span>Страницы:</span>
            <div class="paginator">
            <asp:DataPager ID="dpgPager" PagedControlID="lvwProjects" QueryStringField="page" PageSize="20" runat="server">
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

    <asp:Panel ID="pnlProject" runat="server">
	    <h1><asp:Literal ID="litHeader" runat="server" /></h1>
	    <p><asp:Literal ID="litText" runat="server" /></p>
        <div class="oject-list-holder" id="worksPhotosHolder" visible="false" runat="server">
            <ul class="object-list">
	            <li>
		            <h3 class="active"><span class="arrow"></span>Фотографии:</h3>

			            <ul class="ourwork-list project-photos object-photos-holder" style="display: block">
                            <asp:Repeater ID="rptImages" runat="server">
                                <ItemTemplate>
						            <li>
                                        <div class="ourwork-img">
                                            <a href="<%# SiteHelper.GetWebPath(Settings.WorksImagesFullSize) + Eval("Name") %>">
						                        <img width="305" height="165" alt="" src="<%# SiteHelper.GetWebPath(Settings.WorksImagesThumbsMedium) + Eval("Name") %>" />
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
    </asp:Panel>
</asp:Content>
