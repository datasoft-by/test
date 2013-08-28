<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactInfo.ascx.cs" Inherits="Controls_ContactInfo" %>
    <div class="phone_right">
        <%--<strong id="call_phone_2">--%><strong><%= Session["ContactPhone"] %></strong>
        <div class="call_now"><a href="mailto:info@artumstudio.ru">info@artumstudio.ru</a></div>
    </div>
    
