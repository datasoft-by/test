<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Blog.ascx.cs" Inherits="ArtumDesignLab.UI.Controls_Blog" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="anons-holder blog-anons">
	<h4>Блог студии</h4>
	<ul class="anons-list">
        <asp:Repeater ID="rptItems" runat="server">
            <ItemTemplate>
		        <li>
                    <a href="<%# SiteHelper.GetWebPath("~/Blog.aspx") + "?id=" + Eval("ID") %>">
                        <img src="<%# SiteHelper.GetWebPath(Settings.BlogImagesThumbsSmall) + Eval("Image") %>" alt="<%# Eval("Header") %>" width="88" height="72">
                    </a>
			        <p class="date"><%# Eval("Date") %></p>
			        <h3><a href="<%# SiteHelper.GetWebPath("~/Blog.aspx") + "?id=" + Eval("ID") %>"><%# Eval("Header")%></a></h3>
			        <p><%# SiteHelper.GetPreviewText(Eval("PreviewText").ToString(), 90) %></p>
		        </li>        
            </ItemTemplate>
        </asp:Repeater>
	</ul>
	<div class="list-link">
		/ <a href="<%= SiteHelper.GetWebPath("~/Blog.aspx") %>">все посты</a>
	</div>
</div>