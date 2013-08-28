<%@ Page Title="Контакты | студия дизайна «Artum»" Language="C#" 
    AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="ArtumDesignLab.UI.Contacts" %>

<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
    <meta name="description" content="Контакты дизайн студии «Artum» Санкт - Петебург, разработка дизайн проектов, ремонт помещений, декорирование пространств, создание фирменного стиля компании." />
    <meta name="keywords" content="Контакты, Санкт-Петербург" />
</asp:Content>
<%--
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarContent" Runat="Server">

<at:StudioInfo ID="StudioInfo1" runat="server" />

</asp:Content>
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="basicContent" runat="Server">
<div class="simple-text">
    <h1>Контакты - студия «Artum»</h1>
    <h2>Телефоны:</h2>
    
        
        <div style="font-size: 16px;">Телефон в Санкт-Петербурге: <strong><%= Session["CityToEmail"].ToString().Equals("Санкт-Петербург") ? Session["ContactPhone"] : ConfigurationManager.AppSettings.Get("PhoneDefaultSanktPetersburg")%></strong></div>
        <br />
        <div style="font-size: 16px;">Телефон в Москве: <strong><%= ConfigurationManager.AppSettings.Get("PhoneDefaultMoscow")%></strong></div>
        <br />
        <div style="font-size: 16px;">Бесплатный телефон для регионов: <strong><%= ConfigurationManager.AppSettings.Get("PhoneRussia8800")%></strong></div>
        <br />
   

    <h3>Адрес наших офисов:</h3>
    <h3><span  style="color:#C93E00;">1)</span> 197342, Санкт-Петербург, Белоостровская ул., 17, корпус 2, офис 204, офис 209, БЦ «Avantage»</h3>
  
    <h3><span  style="color:#C93E00;">2)</span>123242, Москва, Новинский бульвар, 31, офис 113</h3>
    <b>Режим работы:</b>
    <p>Понедельник - Пятница : с 10.00 до 20.00<br />
    Суббота, Воскресенье - по предварительной договоренности</p>

    <script type="text/javascript">
        document.write(unescape('%3C%70%3E%3C%62%3E%65%2D%6D%61%69%6C%3A%3C%2F%62%3E%20%3C%61%20%68%72%65%66%3D%22%6D%61%69%6C%74%6F%3A%69%6E%66%6F%40%61%72%74%75%6D%73%74%75%64%69%6F%2E%72%75%22%3E%69%6E%66%6F%40%61%72%74%75%6D%73%74%75%64%69%6F%2E%72%75%3C%2F%61%3E%3C%2F%70%3E%0A%3C%70%3E%3C%62%3E%49%43%51%3A%20%3C%2F%62%3E%36%33%32%37%36%38%35%31%39%3C%2F%70%3E%0A%3C%70%3E%3C%62%3E%53%6B%79%70%65%3A%20%3C%2F%62%3E%61%72%74%75%6D%73%74%75%64%69%6F%3C%2F%70%3E'));
    </script>

    <p>
    <h3 style="margin-bottom:5px;margin-top:15px;">Как добраться - Санкт-Петербург</h3>
    <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=PiCBYPp-75rJKwrsXD7xtulzOUVw9sQo&width=585&height=370"></script>
    <h3 style="margin-bottom:5px;margin-top:25px;">Как добраться - Москва</h3>
    <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=4e87uvM6yxviX-YGQ6I8Iio0K_6y50lw&width=585&height=370"></script>
    </p>
    <br />
<noindex>
 <h2>Уважаемые поставщики!  Ниже текст - для вас!</h2>

    <p><b>Убедительная просьба <u>НЕ ЗВОНИТЬ</u> нам! </b></p>

    <p>Присылайте на почту <script type="text/javascript">

                               document.write(unescape('%3C%61%20%68%72%65%66%3D%22%6D%61%69%6C%74%6F%3A%70%61%72%74%6E%65%72%40%61%72%74%75%6D%73%74%75%64%69%6F%2E%72%75%22%3E%70%61%72%74%6E%65%72%40%61%72%74%75%6D%73%74%75%64%69%6F%2E%72%75%3C%2F%61%3E'));

</script> Ваше коммерческое предложение и в нем обязательно:</p>
    <p>
    1. Сделайте описание того, что вы предлагаете и почему нам должно быть интересно именно ваше предложение.
    <br>
    2. Чем вы отличаетесь от своих конкурентов? Опишите уникальные свойства вашего продукта, покажите свой продукт - картинки, применение в интерьере и прочее. 
    <br>
    3. Укажите сколько это может стоить или приложите  прайс-листы и мы посчитаем все сами.
    <br>
    4. Укажите сроки и условия поставки (складская программа/на заказ).
    <br>
    5. Оставьте координаты того, с кем можно обсудить все вопросы.
    </p>
    <p>
    На сегодняшний день мы рассматриваем предложения по следующим категориям товаров: 
    </p><ul style="font-size:12px; line-height:1.5em;">
        <li style="list-style-type:disc; list-style-position:inside;">Мебель.  Необычная и нестандартная,  бескаркасная.  Мягкая и корпусная, на заказ и готовая.</li>
        <li style="list-style-type:disc; list-style-position:inside;">Сантехника необычная (например,  цветная, металлическая, кривая).</li>
        <li style="list-style-type:disc; list-style-position:inside;">Светильники (особенно интересуют  магазины на севере Санкт-Петербурга, в которых представлен широкий ассортимент светильников в зале).</li>
        <li style="list-style-type:disc; list-style-position:inside;">Декоративная штукатурка (необходимое условие &ndash; у вас должна быть очень большая библиотека образцов)</li>
    </ul>
    <p></p>
    <p>
    Мы обязательно рассмотрим ваше предложение и, если оно окажется подходящим для интерьеров наших клиентов, то мы с вами свяжемся сами.
    </p>
    </noindex>
   <at:CallOrder ID="callOrder" runat="server" />
</div>
</asp:Content>

