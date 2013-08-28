<%@ Page Title="Мы и наши преимущества | Студия дизайна «Artum»" Language="C#" MasterPageFile="~/Template.master"
    AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="ArtumDesignLab.UI.About" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
    <meta name="description" content="Наша команда - дизайн-студия." />
    <meta name="keywords" content="О нас, студия дизайна интерьера" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="basicContent" runat="server">
    <asp:Repeater ID="rPersonal" runat="server">
        <HeaderTemplate>
            <h1>
                Наша команда</h1>
            <ul class="about-list">
        </HeaderTemplate>
        <FooterTemplate>
            </ul>
            <h3 style="margin-bottom: 7px;">
                О компании:</h3>
            <p>
                Студия дизайна Artum была основана в 2010 году. С момента основания было выполнено
                более 300 проектов общей площадью более 35000 квадратных метров. В данный момент
                численность студии составляет 21 человек. В настойщий момент мы отвественно заявляем,
                что являемся лучшей студией в Санкт-Петербурге по уровню сервиса, ценовой политике,
                отношения к выполняемому делу и уровню ответственности за свой труд. Руководство
                компании всегда открыто к предложениям и общению, наши телефоны всегда отвечают
                и офис открыт для встреч. Обращайтесь и вы останетесь довольны!
            </p>
            <at:CallOrder ID="callOrder" runat="server" />
        </FooterTemplate>
        <ItemTemplate>
            <li>
                <div class="about-txt">
                    <%# GetTitle(SiteHelper.GetWebPath("~/About.aspx/") + Eval("Url"), Eval("PersonalCategoryID"), Eval("Name"))%>
                    <i>
                        <%# Eval("PersonalCategoryName") %></i>
                </div>
                <div class="about-img">
                    <img width="235" alt="<%# Eval("Name") %>" src="<%# SiteHelper.GetWebPath(Settings.PersonalImages + Eval("ThumbImage"))%>" />
                </div>
                <%# Eval("Phone") != null && Eval("Phone").ToString() != "" ? 
                    String.Format("<div><b>Телефон:</b> {0}</div>", Eval("Phone")) : ""%>
                <%# Eval("Email") != null && Eval("Email").ToString() != "" ? 
                    String.Format("<div><b>Email:</b> <script type=\"text/javascript\">document.write(unescape('{0}'));</script></div>", 
                        EscapeAll(String.Format("<a href='mailto:{0}'>{0}</a>", Eval("Email")))) : ""%>
                <%# GetPortfolioButton(SiteHelper.GetWebPath("~/About.aspx/") + Eval("Url"), Eval("PersonalCategoryID"))%>
            </li>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Panel ID="pnlDesigner" runat="server" Visible="false">
        <div class="h1_style">
            <asp:Literal ID="ltrDesignerName" runat="server" /></div>
        <div style="float: left; margin-bottom:30px;">
            <div class="about-img" style="width:300px; float:left;">
                <asp:Literal ID="lDesignerImage" runat="server" />
            </div>
            <div style="float: left; width: 315px; font-size:12px; line-height:1.5em; font-weight:bold;">
                <asp:Literal ID="lExperience" runat="server" />
                <br />
                <br />
                <asp:Literal ID="lStyles" runat="server" />
            </div>
        </div>
        <asp:ListView ID="lvwProjects" runat="server" OnPagePropertiesChanging="lvwProjects_PagePropertiesChanging"
            OnDataBound="lvwItems_DataBound">
            <LayoutTemplate>
                <div class="h1_style">
                    Портфолио (только реальные работы!)</div>
                <ul class="ourwork-list">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <div class="ourwork-img">
                        <a href="<%# SiteHelper.GetWebPath(Settings.PortfolioImagesFullSize + Eval("ProjectThumb").ToString().Replace("png", "jpg")) %>"
                            rel="lightbox[<%# Eval("ProjectID") %>]">
                            <img width="305" height="165" alt="<%# HttpUtility.HtmlEncode( Eval("ProjectName").ToString()) %>"
                                src="<%# SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsMedium + Eval("ProjectThumb").ToString().Replace("png", "jpg"))%>" />
                        </a>
                        <div style="display: none;">
                            <%# GetProjectPhotoLinks((Int32)Eval("ProjectID")) %>
                        </div>
                        <div class="img-overlay">
                        </div>
                    </div>
                    <div class="ourwork-txt">
                        <h4>
                            <a href="<%# SiteHelper.GetWebPath("~/Portfolio.aspx/") + Eval("ProjectCategory.Url") + "/" + Eval("Url") %>">
                                <%# Eval("ProjectName") %></a></h4>
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
        <div class="paginator-holder side">
            <span>Страницы:</span>
            <div class="paginator">
                <asp:DataPager ID="dpgPager" PagedControlID="lvwProjects" QueryStringField="page"
                    PageSize="20" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="arrows prew" RenderDisabledButtonsAsLabels="true"
                            ShowFirstPageButton="false" ShowPreviousPageButton="true" PreviousPageText="<"
                            ShowNextPageButton="false" ShowLastPageButton="false" />
                        <%--ShowFirstPageButton="true" FirstPageText="<<"--%>
                        <asp:NumericPagerField ButtonType="Button" ButtonCount="6" CurrentPageLabelCssClass="current"
                            RenderNonBreakingSpacesBetweenControls="true" />
                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="arrows next" RenderDisabledButtonsAsLabels="true"
                            ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowLastPageButton="false"
                            ShowNextPageButton="true" NextPageText=">" />
                        <%--ShowLastPageButton="true" LastPageText=">>"--%>
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
        <at:CallDesignerConsultation runat="server" ID="CallDesignerConsultation" />
    </asp:Panel>
</asp:Content>
