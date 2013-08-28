<%@ Page Title="Примеры дизайн проектов квартир, примеры дизайна интерьера - Портфолио дизайн-студии" MasterPageFile="~/Template.master"
    Language="C#" AutoEventWireup="true" CodeFile="Portfolio.aspx.cs" Inherits="ArtumDesignLab.UI.Portfolio" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:content ID="Content1" contentplaceholderid="headContent" runat="server">
    <at:DynamicHead ID="dynHead" runat="server" />
    <asp:Literal ID="lFbMetaTag" runat="server" />
    <%--<%= !string.IsNullOrEmpty(Request[dpgPager.QueryStringField]) ? string.Format("<link rel=\"canonical\" href=\"{0}{1}\" />", SiteHelper.GetSiteAddress(), Request.RawUrl.Remove(Request.RawUrl.LastIndexOf("/"))) : string.Empty%>--%>
</asp:content>
<%--
<asp:Content ID="SidebarContent" ContentPlaceHolderID="sidebarContent" runat="server">
  
    <at:Interiors ID="interiors" runat="server" />
    
    <at:ContactInfo ID="contactInfo" runat="server" />
  
</asp:Content>  --%>
<asp:content id="Content2" contentplaceholderid="basicContent" runat="server">
    <asp:Panel ID="pnlProjectsList" runat="server">
        <div class="h1_style">Наше портфолио (только реальные работы!)</div>
        <h1><asp:Literal ID="ltrTitle" runat="server" /></h1>
        <p style="margin-bottom:5px;"><asp:Literal ID="ltrText" runat="server" /></p>
        <br />
        <asp:ListView ID="lvwProjects" runat="server" onpagepropertieschanging="lvwProjects_PagePropertiesChanging" ondatabound="lvwItems_DataBound">
            <LayoutTemplate>
                <ul class="ourwork-list">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <div class="ourwork-img">
                        <a href="<%# SiteHelper.GetWebPath(Settings.PortfolioImagesFullSize + Eval("ProjectThumb").ToString().Replace("png", "jpg"))%>" rel="lightbox[<%# Eval("ProjectID") %>]">
                            <img width="305" height="165"  alt="<%# HttpUtility.HtmlEncode( Eval("ProjectName").ToString()) %>" src="<%# SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsMedium + Eval("ProjectThumb").ToString().Replace("png", "jpg"))%>" />
                            <%--<img width="616" height="300" alt="<%# HttpUtility.HtmlEncode( Eval("ProjectName").ToString()) %>" src="<%# SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsMedium + "5.jpg")%>" />--%>
                        </a>
                        <div style="display:none;">
                            <%# GetProjectPhotoLinks((Int32)Eval("ProjectID")) %>
                        </div>
                        <div class="img-overlay"></div>
                        <%--<a href="<%# SiteHelper.GetWebPath("~/Portfolio.aspx/") + Eval("ProjectCategory.Url") + "/" + Eval("Url") %>"> </a>--%>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="<%# SiteHelper.GetWebPath("~/Portfolio.aspx/") + Eval("ProjectCategory.Url") + "/" + Eval("Url") %>"><%# Eval("ProjectName") %></a></h4>
                        <%--<p><%# SiteHelper.GetSentences(Eval("ProjectText").ToString(), 2) %></p> --%>
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
        <div class="h1_style">Наше портфолио (только реальные работы!)</div>
        <h1><asp:Literal ID="litHeader" runat="server" /></h1>
        <p style="margin-bottom:3px;"><asp:Literal ID="litText" runat="server" /></p>
        <div class="oject-list-holder">
            <ul class="object-list">
                <asp:Literal ID="litProjectPhotos"  runat="server" />
            </ul>
            <div class="fb-like" style="margin-bottom:20px;" data-href="" data-width="450" data-show-faces="false" data-send="false">
            </div>
            <asp:PlaceHolder ID="phDesigner" runat="server" Visible="false">
                <div class="h1_style">
                    <asp:Literal ID="ltrDesignerName" runat="server" />
                </div>
                <div style="float: left; margin-bottom: 30px;">
                    <div class="about-img" style="width: 235px; float: left; margin-right: 20px;">
                        <asp:Literal ID="lDesignerImage" runat="server" />
                    </div>
                    <div style="float: left; width: 360px; font-size: 12px; line-height: 1.5em; font-weight: bold;">
                        <div style="margin-bottom: 25px;">
                            <asp:Literal ID="lExperience" runat="server" /></div>
                        <div style="margin-bottom: 25px;">
                            <asp:Literal ID="lStyles" runat="server" /></div>
                        <div style="font-size: 14px;">
                            Понравилась работа? <a class="callorder2_btn" href="#call-designer-question" style="text-decoration: underline;">
                                Задайте вопрос дизайнеру!</a></div>
                    </div>
                </div>
                <div style="display: none;">
                    <div id="call-designer-question">
                        <at:CallDesignerQuestion ID="CallDesignerQuestion" runat="server" />
                    </div>
                </div>
            </asp:PlaceHolder>
            <div class="pager">
                <span  style="text-decoration:underline;color:Black; font-size:18px;">Предыдущий проект:</span>
                <a  style="color:#C93E00; font-size:18px;" id="lnkProjectsPrev" class="prev" runat="server">Предыдущий проект</a>
                <br /><br />
                <span  style="text-decoration:underline;color:Black; font-size:18px;">Следующий проект:</span>
                <a style="color:#C93E00; font-size:18px;" id="lnkProjectsNext" runat="server">Следующий проект</a><br /><br />
                <a style="color:#C93E00; font-size:18px;"  id="lnkProjectsList" class="all" runat="server">Список проектов</a>
            </div>
        </div>
    </asp:Panel>
    <br /><br />
     
    <at:ResponsePage ID="responsePage" runat="server" />
    <at:GetProjectCost runat="server" id="projectCost" />
   
</asp:content>
