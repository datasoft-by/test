<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
    CodeFile="Login.aspx.cs" Inherits="ArtumDesignLab.Admin.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <asp:Login ID="logLogin" runat="server" DisplayRememberMe="False" 
        FailureText="Попробуйте ещё раз" LoginButtonText="Войти" 
        OnAuthenticate="logLogin_Authenticate" Orientation="Horizontal" 
        PasswordLabelText="Пароль:" PasswordRequiredErrorMessage="Введите пароль" 
        TitleText="Ты кто?" UserNameLabelText="Логин:" 
        UserNameRequiredErrorMessage="Введите логин" Width="519px">
        <TitleTextStyle Font-Size="Large" ForeColor="Maroon" Height="50px" />
    </asp:Login>
</asp:Content>
