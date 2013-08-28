<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BlogTitle.ascx.cs" Inherits="ArtumDesignLab.UI.Controls_BlogTitle" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<
<div class="blog-block">
	<div class="anons-holder blog-anons">
		<h2>Блог студии</h2>
		<div class="list-link">/ <a href="<%= SiteHelper.GetWebPath("~/Blog.aspx") %>">читать все посты</a></div>
		<ul class="anons-list">
            <asp:Repeater ID="rptItems" runat="server">
                <ItemTemplate>
			        <li>
                        <a href="<%# SiteHelper.GetWebPath("~/Blog.aspx") + "?id=" + Eval("ID") %>">
                            <img width="192" height="108" alt="<%# Eval("Header") %>" src="<%# SiteHelper.GetWebPath(Settings.BlogImagesThumbsMedium) + Eval("Image") %>">
                        </a>
				        <p class="date"><%# Eval("Date") %></p>
				        <h3><a href="<%# SiteHelper.GetWebPath("~/Blog.aspx") + "?id=" + Eval("ID") %>"><%# Eval("Header")%></a></h3>
				        <p><%# Eval("PreviewText") %></p>
			        </li>
                </ItemTemplate>
            </asp:Repeater>
		</ul>
	</div>
</div>