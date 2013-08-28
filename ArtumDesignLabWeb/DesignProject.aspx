<%@ Page Title="Дизайн проект интерьера. Разработка дизайн проекта  в студии «Artum»" Language="C#"
    AutoEventWireup="true" CodeFile="DesignProject.aspx.cs" Inherits="DesignProject" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="TitleContent" Runat="Server">
    Мы создаём дизайн проекты качественно и в срок и с гарантией
</asp:Content>
 <%--
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" runat="Server">
   
    <at:Portfolio ID="Portfolio1" runat="server" />
    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" />
    <at:ResponseControl ID="response" runat="server" />
    <at:OurWorks ID="OurWorks" runat="server" />
    <at:News id="news" runat="server" />
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
        <at:ContactInfo ID="contactInfo" runat="server" />
       
</asp:Content>
 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" runat="server">
    <h1>Дизайн проект интерьера - профессионально воплощаем в жизнь ваши мечты об интерьере</h1>
    <p>
    <strong>Дизайн-проект интерьера</strong> - это комплект документов, по которым 
    будут выполняться  все ремонтно-отделочные работы в вашем помещении. В дизайн-проекте 
    рассчитываются объемы материалов для отделки, подбирается мебель, оборудование, 
    элементы декора. Мы создаем дизайн-проекты квартир, <a href="http://www.artumstudio.ru/services/house">дизайн проекты загородных домов</a>, офисов и 
    общественных заведений.
    </p>
    <p>
        С нашей помощью вы, во-первых, сократите расходы, время и силы на ремонт, а, 
    во-вторых, создадите красивый, уютный и функциональный интерьер. Оставьте заявку 
    на консультацию, и наш специалист составит для вас планировочное решение <font style="color: #F00">бесплатно</font>.
    </p>


    <div class="action-banner">
        <img alt="Дизайн проект" src="../content/images/services/design_project.jpg">
    </div>

    <h3>Если вы запланировали ремонт, то сравните, как он будет протекать с дизайн-проектом и без него:</h3>
    <table border="0" cellspacing="0" cellpadding="0" class="compare-table">
        <thead>
            <tr>
                <th class="negative">Без дизайн-проекта:</th>
                <th>С дизайн-проектом:</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="negative">Вы потратите на ремонт больше денег, чем запланировали, вследствие переделок и дозаказа материалов. А по завершении ремонта не будете знать, как распорядиться их излишками.</td>
                <td class="positive">Благодаря предварительному расчету материалов вы не выйдете за рамки бюджета.</td>
            </tr>
            <tr class="var">
                <td class="negative">Вы допустите массу ошибок в ремонте из-за отсутствия опыта.</td>
                <td class="positive">Опытные специалисты предостерегут вас от ошибок и посоветуют оптимальные варианты интерьерных решений.</td>
            </tr>
            <tr>
                <td class="negative">Вам придется самим продумывать перепланировку помещения, не зная разрешенных законодательством вариантов.</td>
                <td class="positive">Дизайнеры предложат вам самую удачную и функциональную перепланировку в полном соответствии со строительными нормами.</td>
            </tr>
            <tr class="var">
                <td class="negative">У вас не получится предусмотреть в интерьере «все и сразу»: функциональность, красоту, удобство, эксклюзивность, цветовые решения и т.д.</td>
                <td class="positive">При разработке дизайн-проекта специалисты учтут абсолютно все нюансы – от расположения розеток до сочетания цветов в мебели и текстиле.</td>
            </tr>

            <tr>
                <td class="negative">Ремонт затянется на неопределенное время
                    <br />
                    из-за отсутствия четкого планирования и непредсказуемого поведения строителей.</td>
                <td class="positive">Ремонт пройдет в четко установленные сроки под чутким контролем авторов дизайн-проекта.</td>
            </tr>
            <tr class="var">
                <td class="negative">Стройка станет вашим "вторым домом"
                    <br />
                    из-за постоянных вопросов строительной бригады и необходимости контроля.</td>
                <td class="positive">Вам даже не придется принимать участие в ремонте, т.к. наши дизайнеры осуществляют авторский надзор за всеми работами.</td>
            </tr>
        </tbody>
    </table>


        <h3>Что вы получаете, заказав у нас разработку дизайн-проекта:</h3>
        <ul class="features-list">
            <li>
                <img src="../images/21.jpg" width="107" height="100" alt="Интерьер вашей мечты, даже если вы не можете четко сформулировать свои пожелания" />
                <h4>Интерьер вашей мечты, даже если вы не можете четко сформулировать свои пожелания.</h4>
                <p>Мечтаете об интерьере «в английском стиле»? Обожаете французское кино? А, может быть, хотите отразить в интерьере 
                свое восхищение любимой футбольной командой? Мы учтем все ваши пожелания и предложим   дизайн, который будет точно 
                соответствовать вашему внутреннему «я».</p>
            </li>
            <li>
                <img alt="Удобную и функциональную перепланировку вашего объекта." src="../images/26.jpg" width="107" height="100" />
                <h4>Удобную и функциональную перепланировку вашего объекта.</h4>
                <p>Если вы хотите создать дополнительные помещения 
                или объединить несколько помещений в одно, мы предложим наиболее удобный и функциональный вариант, отвечающий всем 
                строительным нормам.</p>
            </li>
            <li>
                <img alt="Последние тенденции в мире дизайна и ремонта – в вашем помещении" src="../images/22.jpg" width="107" height="100" />
                <h4>Последние тенденции в мире дизайна и ремонта – в вашем помещении.</h4>
                <p>Мы не будем предлагать вам решения 
                вчерашнего дня, ведь мы хотим, чтобы ваш интерьер выглядел стильно и современно. Поэтому в разработку дизайн-проекта 
                мы включаем только свежие тренды и отделочные материалы  нового поколения, гармонично сочетая их с проверенными 
                временем вариантами.</p>
            </li>
            <li>
                <img alt="Практичность, удобство и эргономичность" src="../images/23.jpg" width="107" height="100" />
                <h4>Практичность, удобство и эргономичность.</h4>
                <p>Можете быть уверены: мы предусмотрим достаточное количество 
                шкафов в квартире, удобные рабочие места в офисе и достаточно подсобных помещений в ресторане. Ведь ваш интерьер 
                должен быть не только красивым, но и функциональным.</p>
            </li>
            <li>
                <img alt="Компромисс вместо конфликтов" src="../images/24.jpg" width="107" height="100" />
                <h4>Компромисс вместо конфликтов.</h4>
                <p>Если у вас возникли разногласия по поводу предстоящего ремонта с вашими 
                близкими или коллегами, то мы вас помирим! Наши специалисты помогут найти верное решение среди десятка разных мнений.</p>
            </li>
            <li>
                <img alt="Планирование вашего времени и бюджета" src="../images/25.jpg" width="107" height="100" />
                <h4>Планирование вашего времени и бюджета.</h4>
                <p>Наличие дизайн-проекта позволяет до начала ремонта спланировать 
                ваше время и бюджет. Кроме того, поскольку все материалы заранее внесены в смету, вы будете избавлены от непредвиденных
                расходов во время ремонта.</p>
            </li>
        </ul>



    <h3>Этапы создания вашего дизайн-проекта:</h3>
    <ul class="quality-list">
        <li>
            <h4>Бесплатное планировочное решение</h4>
            <p>Мы бесплатно проконсультируем вас по вашему проекту и составим планировочное решение.</p>
        </li>
        <li>
            <h4>Подписание договора</h4>
            <p>Если вы решили заказать у нас дизайн-проект, то мы подписываем договор, где будут четко 
            изложены условия и сроки работы.</p>
        </li>

        <li>
            <h4>Разработка стилистики и концепции дизайна</h4>
            <p>На данном этапе мы выясняем ваши вкусовые предпочтения и стилевые пристрастия, пожелания 
            по планировке и функциональному назначению помещений, комплектации мебелью и оборудованием. 
            Получив ваши ответы и зафиксировав их в техническом задании, дизайнер приступает к работе 
            над дизайн-проектом.</p>
        </li>
        <li>
            <h4>Создание планировочных и стилевых решений и их визуализация</h4>
            <p>Дизайнер создает планы помещений с размещенными на них мебелью и оборудованием. После 
            вашего одобрения дизайнер приступает к стилистической проработке дизайна. В итоге вы получаете 
            комплект 3D-эскизов (изображений), которые позволяют детально увидеть и оценить интерьеры 
            проектируемых помещений.</p>
        </li>
        <li>
            <h4>Составление рабочей документации для строителей</h4>
            <p>Рабочая документация содержит все необходимые технические данные, позволяющие строительной 
            бригаде воплотить утвержденный дизайн-проект в жизнь. Вам не придется тратить время на 
            постановку задач строителям и ответы на их вопросы.</p>
        </li>
        <li>
            <h4>Проведение ремонтных работ</h4>
            <p>Далее на объекте производятся ремонтно-строительные, отделочные, инженерные и сопутствующие 
            работы. В ходе этих работ мы поможем вам в следующем:<br />
            - подберем и проконсультируем по закупке лицевых отделочных материалов<br />
            - поможем в выборе мебели и технического оснащения<br />
            - подберем предметы интерьера, освещения, аксессуаров и т.п.<br />
            - будем, по вашему желанию, осуществлять Авторский надзор в соответствии с проектными решениями.<br />
            </p>
        </li>
    </ul>




      <at:OurWorksPage ID="ourWorksPage" runat="server" />
   <at:Reason10 ID="reason" runat="server" />






        
        
        
         <at:ResponsePage ID="responsePage" runat="server" />
    <noindex>

    
        <h3>С чего начать работу с нами?</h3>
        <p>Начните с  бесплатной планировки вашего будущего помещения. Для этого оставьте заявку, и наш менеджер 
        свяжется с вами в ближайшее время. <br /> Вы расскажете нам о своих предпочтениях. А мы 
        <font style="color:#F00">бесплатно</font> создадим для вас планировочное решение.</p>

     <at:GetProjectCost runat="server" id="projectCost" />

    </noindex>
</asp:Content>
<%-- 
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">
<h3>Дизайн проект интерьера</h3>

                       <at:Pain ID="pain" runat="server" />
                       <!-- Пример дизайн проекта -->
                       <noindex>
                               <div class="oject-list-holder">
            <ul class="object-list" style="margin-bottom: 10px;">
                <li>
                <h3><span class="arrow"></span>Состав дизайн-проекта</h3>
                <div style="display: none;" class="object-photos-holder">
                <p>
                1.    Обмерный чертеж объекта с привязкой существующих инженерных коммуникаций<br />
                2.    Ведомость чертежей<br />
                2.    План расстановки мебели и оборудования<br />
                3.    План демонтажа перегородок и инженерных коммуникаций
                (при необходимости)<br />
                4.    План возводимых перегородок с маркировкой оконных и дверных проёмов (при необходимости)<br />
                5.    План потолка с указанием типа используемого материала, отдельных узлов и сечений<br />
                6.    План размещения осветительных приборов, привязка выпусков освещения.<br />
                7.    План привязки выключателей с указанием включения групп светильников<br />
                8.    План электрики (электрических и слаботочных сетей) и электровыводов с привязками<br />
                9.    План полов с указанием типа напольных покрытий и площадей<br />
                10.    План размещения электрического подогрева пола с привязкой регулятора
                (при необходимости)<br />
                11.    План размещения сантехнического оборудования с привязкой выпусков и водорозеток<br />
                12.    Развёртка стен с раскладкой кафельной плитки с указанием размеров (количество чертежей зависит от уровня сложности)<br />
                13.    Чертежи заказных изделий (при необходимости)<br />
                14.    3D-визуализации помещений<br />
                15.    Спецификация дверных проёмов и полотен<br />
                16.    Ведомость отделки помещений
                </p>
                
                </div>
                </li>
            </ul>
        </div> 
        
        <p>Ниже приведен пример полного рабочего дизайн-проекта квартиры, разработанный нашей студией.</p>
        <div class="oject-list-holder">
            <ul class="object-list" style="margin-bottom: 10px;">
                <li>
                <h3><span class="arrow"></span>Пример дизайн-проекта</h3>
                <div style="display: none;" class="object-photos-holder">
                <ul class="object-photos">
                <li>
                
                    <a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/e9df7874-305e-4603-8514-2f9afa864e79.png" %>"> 
                    <img width="155" height="140" alt="Титульный лист" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/e9df7874-305e-4603-8514-2f9afa864e79.png" %>"> Титульный лист</a></li>
                    <li>
                    <a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/e97c26eb-2373-4d6f-8974-b799a6dbc56e.png" %>"> 
                    <img width="155" height="140" alt="Обмерный план" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/e97c26eb-2373-4d6f-8974-b799a6dbc56e.png" %>"> Обмерный план</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/4d82e95f-8d80-47b8-9698-ea144b3b082d.png" %>"> 
                    <img width="155" height="140" alt="Ведомость чертежей" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/4d82e95f-8d80-47b8-9698-ea144b3b082d.png" %>"> Ведомость чертежей</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/0b6218d9-697b-45b7-9f58-8da742d7a3d1.png" %>"> <img width="155" height="140" alt="План расстановки мебели и оборудования" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/0b6218d9-697b-45b7-9f58-8da742d7a3d1.png" %>"> План расстановки мебели и оборудования</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/bf933a98-ddd4-48a0-9533-5dfe560eb268.png" %>"> <img width="155" height="140" alt="Планировка квартиры с указанием основных размеров" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/bf933a98-ddd4-48a0-9533-5dfe560eb268.png" %>"> Планировка квартиры с указанием основных размеров</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/0cc3b103-4df6-4c66-8894-60a59b134711.png" %>"> <img width="155" height="140" alt="Визуализации помещений" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/0cc3b103-4df6-4c66-8894-60a59b134711.png" %>"> Визуализации помещений</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/63292b65-66cc-48c8-ac23-020271b74c10.png" %>"> <img width="155" height="140" alt="Визуализации помещений" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/63292b65-66cc-48c8-ac23-020271b74c10.png" %>"> Визуализации помещений</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/eed586bd-dfc1-48aa-8a74-4c756e70296d.png" %>"> <img width="155" height="140" alt="Визуализации помещений" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/eed586bd-dfc1-48aa-8a74-4c756e70296d.png" %>"> Визуализации помещений</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/75635b26-bf19-4a3c-9f79-9db4a95907da.png" %>"> <img width="155" height="140" alt="Визуализации помещений" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/75635b26-bf19-4a3c-9f79-9db4a95907da.png" %>"> Визуализации помещений</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/4fd32835-2e94-4784-b4da-da2022e7f29f.png" %>"> <img width="155" height="140" alt="План демонтажа перегородок" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/4fd32835-2e94-4784-b4da-da2022e7f29f.png" %>"> План демонтажа перегородок</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/f21710d0-7597-40a1-b1ce-109334de1ea0.png" %>"> <img width="155" height="140" alt="План возводимых перегородок с маркировкой дверных проёмов" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/f21710d0-7597-40a1-b1ce-109334de1ea0.png" %>"> План возводимых перегородок с маркировкой дверных проёмов</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/63f73817-b3e0-4444-ac77-d45e248f8bfd.png" %>"> <img width="155" height="140" alt="План полов" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/63f73817-b3e0-4444-ac77-d45e248f8bfd.png" %>"> План полов</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/46c7101b-d402-475d-914c-2d0aa5ad6e27.png" %>"> <img width="155" height="140" alt="План теплых полов" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/46c7101b-d402-475d-914c-2d0aa5ad6e27.png" %>"> План теплых полов</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/8c386ed6-b816-428d-9f37-63ec29d57f53.png" %>"> <img width="155" height="140" alt="План потолков" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/8c386ed6-b816-428d-9f37-63ec29d57f53.png" %>"> План потолков</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/dd0d6748-2cf7-4663-86db-456b12b01e2a.png" %>"> <img width="155" height="140" alt="Разрезы по потолку" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/dd0d6748-2cf7-4663-86db-456b12b01e2a.png" %>"> Разрезы по потолку</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/9def1bad-6925-4e3d-b520-62bb96277d99.png" %>"> <img width="155" height="140" alt="План размещения осветительных приборов" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/9def1bad-6925-4e3d-b520-62bb96277d99.png" %>"> План размещения осветительных приборов</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/191085f8-635a-4c5d-9e5e-74962687db6f.png" %>"> <img width="155" height="140" alt="План привязки выключателей" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/191085f8-635a-4c5d-9e5e-74962687db6f.png" %>"> План привязки выключателей</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/c4850cd7-f160-4670-8955-972f3b4b8993.png" %>"> <img width="155" height="140" alt="План электрики" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/c4850cd7-f160-4670-8955-972f3b4b8993.png" %>"> План электрики</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/37f906bd-cbf1-43f3-9d28-90eb2722db59.png" %>"> <img width="155" height="140" alt="Схема устройства второго яруса детских" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/37f906bd-cbf1-43f3-9d28-90eb2722db59.png" %>"> Схема устройства второго яруса детских</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/cae76911-9da6-43b6-b348-56421f07edfd.png" %>"> <img width="155" height="140" alt="Развертки по стенам, ванная комната" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/cae76911-9da6-43b6-b348-56421f07edfd.png" %>"> Развертки по стенам, ванная комната</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/1cf57972-af90-4fd4-a020-eae867e3b476.png" %>"> <img width="155" height="140" alt="Развертки по стенам, ванная комната" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/1cf57972-af90-4fd4-a020-eae867e3b476.png" %>"> Развертки по стенам, ванная комната</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/c22c0410-96a6-422c-8b5f-08097e7232ba.png" %>"> <img width="155" height="140" alt="Схема декоративных ниш" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/c22c0410-96a6-422c-8b5f-08097e7232ba.png" %>"> Схема декоративных ниш</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/c231a799-ef4c-4967-be9a-7d63d4c71fc6.png" %>"> <img width="155" height="140" alt="Схема декоративных ниш" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/c231a799-ef4c-4967-be9a-7d63d4c71fc6.png" %>"> Схема декоративных ниш</a></li><li><a href="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/fullsize/1ed8a4ff-21f4-4846-bc8a-7d0d7f20c3ec.png" %>"> <img width="155" height="140" alt="Ведомость отделки" src="<%= SiteHelper.GetWebPath("~/") + "content/images/portfolio/thumbsmedium/1ed8a4ff-21f4-4846-bc8a-7d0d7f20c3ec.png" %>"> Ведомость отделки</a></li></ul></div>
                </li>
            </ul>
        </div>  
                       </noindex>
                       <div class="simple-text">
        <p>
    <noindex>    
    «Элитный дизайн интерьера» – фраза, которая согревает душу одним владельцам жилья, режет слух 
    другим, и очень малую часть из них оставляет равнодушными. Одни уже живут в подобных интерьерах. 
    Другим еще только предстоит их создать, но пока они этого сделать не могут по тем или иным причинам. 
    А третьи не видят в них абсолютно никакого смысла, но и они рано или поздно придут к осознанию того, 
    что эксклюзивный интерьер  это не прихоть и не блажь, а жизненная необходимость для тех, кто хочет 
    состояться и в личном плане, и в карьере.
    </p>
        <h2 style="color: #FFCC86; font-size: 24px;">Наше портфолио</h2>
        <ul>
            <li><a href="http://www.artumstudio.ru/portfolio/interery_kvartir" rel="nofollow">Дизайн квартир</a></li>
            <li><a href="http://www.artumstudio.ru/portfolio/interery_zagorodnyx_domov" rel="nofollow">Дизайн загородных домов</a></li>            
            <li><a href="http://www.artumstudio.ru/portfolio/interery_obshhestvennyx_pomeshhenij" rel="nofollow">Дизайн общественных помещений</a></li>
        </ul>
        <p>

    Дизайн бюро интерьеров  «Artum», предлагает лучшие дизайны интерьеров жителям Санкт-Петербурга и 
    Ленинградской области. Примеры  дизайн проектов,  разработанных  нашей  студией, Вы  можете просмотреть 
    по ссылке: <a href="http://www.artumstudio.ru/portfolio/interery_kvartir" rel="nofollow">портфолио</a>.
    </noindex>
    </p>
        <h2 style="color: #FFCC86; font-size: 20px;">Дизайн проект интерьера</h2>
        <p>

            <b>Дизайн-проект интерьеров</b> – это не набор красивых иллюстраций, это возможность увидеть совершенный, 
            законченный образ Вашего дома или офиса заранее. Вы никогда не приобретете случайные, 
            не вписывающиеся в Ваш интерьер вещи, потому что в Вашем доме каждый предмет уже будет 
            на своем месте. Да, пока на бумаге, но, вооружившись дизайн-проектом, 
            Вы значительно ускорите сроки воплощения своей мечты в жизнь: Вы не задумывались, 
            что дизайн-проект – это идеальное руководство для строителей? 
            С точной сметой и точными сроками выполнения каждого этапа работ? Это четкое представление 
            о том, когда и сколько розеток необходимо будет купить, потому что Вы будете наверняка знать, 
            где именно они будут установлены. У Вас не будет проблем с согласованием тех или иных изменений 
            в своей квартире в разгар ремонтных работ – все это будет сделано заранее. Вы сможете держать 
            под контролем весь процесс работ и сберечь свое время – Вам не придется отказываться от 
            запланированного путешествия в Италию только из-за того, что Вы опасаетесь простоя или небрежности
             со стороны строителей. И это только практическая ценность дизайн-проекта. А каких изумительных
              художественных и психологических эффектов можно добиться путем многочисленных дизайнерских
               "происков" и ухищрений!         
        </p>
        <p>
Но, ни один по-настоящему уникальный интерьер не может быть создан без основательного 
<strong>дизайн проекта интерьера</strong>, разработать который под силу только профессиональному дизайнеру интерьера. 
</p>
        <p>
<strong>Дизайн проект</strong> предполагает создание достаточно большого количества документации, в том числе и планов. При разработке <strong>дизайн проекта интерьера</strong> обязательно составляются: во-первых, план всех помещений, находящихся в квартире или доме; во-вторых, при необходимости планируются, как демонтаж, так и перепланировка; в-третьих, план потолка, где указываются необходимые высоты и будущие места расположений осветительных приборов, к нему прилагается и план освещения, где указывается нахождение выключателей. Кроме того, занимаясь созданием <strong>дизайн проекта интерьера</strong> не обойтись без создания плана пола, разверстки стен и плана сантехнического оборудования.

</p>       
  <br /><div style="text-align: center;">
                    <a class="callorder3_btn"  style="font-size:26px; text-decoration:underline;" href="#call-window">Оставить заявку</a>
                     </div>  <br />
    <h2 style="color: #FFCC86; font-size: 20px;">Разработка дизайн проектов жилых и общественных помещений</h2>
    <img height="214" width="624" src="http://www.artumstudio.ru/content/images/blog/fullsize/a1a815a9-7035-4a46-abf6-3edc0aedca79.png" alt="Дизайн проект">
    <p>
    Что жилые, что общественные помещения одинаково требуют серьезного и вдумчивого подхода к созданию их интерьеров. При создании любого<strong> дизайн проекта</strong> необходимо достаточно тесно и основательно сотрудничать с заказчиками, будь то дизайн интерьера магазина, дизайн загородного дома, дизайн интерьера ресторана или же дизайн офиса.
    </p>
    <p>
    При работе над <strong>дизайн проектом интерьера</strong>, помимо утвержденного в обязательном порядке варианта перепланировки, разрабатываются собственно концепция будущего интерьера и его стиль. Кроме того, <strong>дизайн проект</strong> предполагает создание всей документации, которая может понадобиться при внедрении этого <strong>дизайн проекта</strong> в жизнь, как поставщикам, так и строителям и отделочникам. Только наличие всех необходимых документов позволит им точно следовать имеющемуся <strong>дизайн проекту</strong>. Ко всему прочему, заказчик может выбрать составление<strong> дизайн проекта</strong>, как только эскизного (в случае, если он готов сам осуществлять дальнейший комплекс работ), так и полного. 

    </p>

    </div>

     


        <at:CallOrder ID="callOrder" runat="server" />
      

        
</asp:Content>

--%>