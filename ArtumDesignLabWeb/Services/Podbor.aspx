<%@ Page Title="Подбор отделочных материалов, мебели и освещения | студия дизайна «Artum»"  Language="C#" 
         AutoEventWireup="true" CodeFile="Podbor.aspx.cs" Inherits="Services_Podbor" %>
 <%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<%--
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">

    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" /> 
    <at:Portfolio ID="Portfolio1" runat="server" />    
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
        <at:ContactInfo ID="contactInfo" runat="server" />
        
 </asp:Content>
 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">
<h1>
Подбор отделочных материалов, мебели, сантехники и освещения
</h1>
    <p>
        Многие заказчики, рассматривая 3d-изображения своего 
        будущего интерьера, вполне обоснованно спрашивают:
    </p>
    <h2 style="color: #FFCC86; font-size: 20px;">
        Действительно ли, реализованный проект будет выглядеть так же, как на картинках?
    </h2>
    <p>
        Конечно, визуализации нужны в основном для понимания концепции <a href="http://www.artumstudio.ru/designproject">дизайн проекта</a> и для 
        облегчения  подбора  необходимых  материалов , подходящей мебели и проч. 
        Некоторые позиции могут измениться в процессе работ. 
        Однако в целом заказчик получает именно тот интерьер / экстерьер, который он утвердил 
        на стадии проектирования.
    </p>
    <p>
        Сложность заключается в том, что не всегда сразу же удается найти, к примеру, 
        желаемый оттенок плитки или рисунок обоев. А порой выбранный вариант смущает 
        заказчика завышенной стоимостью.
    </p>
    <p>
        У нашей компании есть отличные возможности избегать подобные неурядицы. 
        В нашей копилке собрано огромное количество 
        <a href="http://www.artumstudio.ru/partners">поставщиков</a> по самым разнообразным направлениям. 
        Именно поэтому мы с легкостью наполняем объект всем необходимым независимо от уровня 
        и сложности дизайн проекта.
    </p>
    <p>
        Наши возможности не ограничены представленными в салонах выставками. 
        Мы также можем найти любые позиции из многообразия каталогов. 
        Если же потребуется совершенно эксклюзивная мебель по конкретным размерам – не проблема: 
        Наша студия возьмет на себя разработку и прорисовку заказных изделий.
    </p>
<at:CallOrder ID="callOrder" runat="server" />
</asp:Content>

