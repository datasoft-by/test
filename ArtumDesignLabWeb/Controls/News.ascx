<%@ Control Language="C#" AutoEventWireup="true" CodeFile="News.ascx.cs" Inherits="ArtumDesignLab.UI.Controls_News" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="ourwork-block">
	<div class="justify">
		<h3 class="side">Новости</h3>
		<div class="button-holder side">
            <a class="button" href="<%= SiteHelper.GetWebPath("~/News.aspx") %>">все новости</a>
		</div>
	</div>
	<ul class="ourwork-list">
        <asp:Repeater ID="rptItems" runat="server">
        <ItemTemplate>
		<li>
			<div class="ourwork-img_no_popup">
                <a href="<%# SiteHelper.GetWebPath("~/News.aspx") + "?id=" + Eval("NewID") %>">
                    <img id="Img1" src='<%# SiteHelper.GetWebPath(Settings.NewsImagesThumbs) + Eval("Image") %>' alt='<%# Eval("Header") %>' width="305" height="165" visible='<%# (Eval("Image") != null) %>' runat="server">
                </a>
			</div>
			<div class="news-txt">
                <%--<p><%# SiteHelper.GetPreviewText(Eval("Text").ToString(), 90) %></p>
                    <%# SiteHelper.GetSentences(Eval("Text").ToString(), 1) %>--%>
				<h4 class="date"><%# DateTimeHelper.GetDateInReadableFormat((DateTime)Eval("Date")) %></h4>
				<p>
                    <a href="<%# SiteHelper.GetWebPath("~/News.aspx") + "?id=" + Eval("NewID") %>"><%# Eval("Header") %></a>
                </p>
			</div>
		</li>
        </ItemTemplate>
        </asp:Repeater>
	</ul>
</div>