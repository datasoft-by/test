<%@ Page Title="Дизайн проекты интерьеров салонов красоты. Интерьеры салона красоты" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="designproektsalonov.aspx.cs" Inherits="Services_designproektsalonov" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <meta name="description" content="Разработка дизайн проектов интерьера салона красоты в Петербурге, Спб и Ленинградской области" />
    <meta name="keywords" content="дизайн проект салона красоты, дизайн интерьера салонов красоты" />
</asp:Content>
 <%--
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">
   
    <at:Portfolio ID="Portfolio1" runat="server" />
    <at:ResponseControl ID="response" runat="server" />
    <at:OurWorks ID="OurWorks" runat="server" />
    <at:News id="news" runat="server" />
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
        <at:ContactInfo ID="contactInfo" runat="server" 
        
</asp:Content>
--%>
<asp:Content ID="Content4" ContentPlaceHolderID="TitleContent" Runat="Server">
     Мы создаем дизайн проекта салонов красоты качественно и в срок
</asp:Content>
<asp:Content ID="Content14" ContentPlaceHolderID="specialOfferContent" Runat="Server">
<at:SpecialOffer Header="Планировка вашего салона - бесплатно!" ID="specialOffer" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" runat="server">

    <h1>Дизайн-проект салонов красоты: дорогой интерьер – недорого</h1>
    
    <p>Дизайн-проект салона красоты – это пакет документов, по которым выполняются ремонтно-отделочные работы, 
    а также происходит наполнение интерьера вашего салона мебелью, аксессуарами, элементами декора.</p>
    <p>Мы разработаем дизайн-проект салона в соответствии с вашими идеями и предложим свои. Наши дизайнеры 
    помогут вам создать красивый уют для ваших клиентов и сотрудников по приемлемым ценам.</p>
    <p>Первый шаг работы с нами – создание <strong><u>бесплатного</u></strong> планировочного решения вашего 
    салона. Оставьте заявку, и наш специалист свяжется с вами. </p>

    <div class="action-banner">
        
        <img alt="Дизайн проект салонов красоты" src="../content/images/services/design_proekt_salona_krasoti.jpg">
    </div>
     <at:Reason10 ID="reason10" runat="server" />
    <p>Мы разработали более <font style="background:Red; color: White;">35</font> дизайн-проектов салонов красоты.</p>

    <h3>Поэтому мы точно знаем, чего вы хотите от интерьера вашего заведения:</h3>

        <ul class="features-list">
            <li>
                <img src="../images/20.jpg" width="107" height="100" alt="Уют и приятная атмосфера" />
                <h4>Уют и приятная атмосфера</h4>
                <p>Ваши клиенты должны получать удовольствие от самого нахождения в вашем салоне. Тогда им обязательно захочется вернуться к вам вновь и привести своих друзей. Мы создаем «интерьер удовольствия» – именно так можно назвать результат нашего дизайн-проекта.</p>
            </li>
            <li>
                <img alt="Функциональность" src="../images/17.jpg" width="107" height="100" />
                <h4>Функциональность</h4>
                <p>В вашем салоне должно быть удобно как клиентам, так и сотрудникам. Поэтому наряду с массажными и маникюрными кабинетами мы не забудем спланировать служебные и подсобные помещения. Мы также знаем, насколько важно удобство перемещения в салоне – мы сделаем его просторным, и каждый ваш сотрудник будет наслаждаться свободой движения.</p>
            </li>
            <li>
                <img alt="Приемлемая стоимость" src="../images/18.jpg" width="107" height="100" />
                <h4>Приемлемая стоимость</h4>
                <p>Разумеется, несложно создать интерьер по принципу «Любой каприз за ваши деньги». Но что если вы ограничены в бюджете, но при этом хотите, чтобы ваш интерьер выглядел дорого? Мы поможем вам этого достичь, включив в дизайн-проект простые и недорогие отделочные материалы, мебель и аксессуары. А также придадим вашему салону истинный шик за счет пары недорогих, но эксклюзивных элементов декора.</p>
            </li>
            <li>
                <img alt="Концептуальность" src="../images/19.jpg" width="107" height="100" />
                <h4>Концептуальность</h4>
                <p>Решили назвать салон красоты «Лондон»? Как насчет душевой кабины в виде традиционной английской телефонной будки? Мы предложим оригинальные творческие решения под любые ваши идеи.</p>
            </li>
        </ul>




    <h3>Что вы получаете, заказав дизайн-проект салона красоты?</h3>
    <ul class="quality-list">
        <li>
            <h4>Бесплатное планировочное решение.</h4>
            <p>Мы бесплатно проконсультируем вас по вашему проекту и составим планировочное решение.</p>
        </li>
        <li>
            <h4>Согласование проекта.</h4>
            <p>Мы внимательно выслушаем ваши предпочтения и идеи по созданию интерьера, после чего предложим несколько вариантов их реализации. Какую бы концепцию вы ни выбрали, ваш салон будет иметь гармоничный и уютный интерьер, полностью соответствующий всем СНиПам и ГОСТам.</p>
        </li>
        <li>
            <h4>Визуализация решения.</h4>
            <p>Мы предоставим вам 3D-изображения вашего салона красоты, чтобы вы четко представляли, как он будет выглядеть по завершении всех работ.</p>
        </li>
        <li>
            <h4>Составление рабочей документации.</h4>
            <p>В комплекте технической документации будут все данные, чертежи и схемы, позволяющие строительной бригаде воплотить утвержденный дизайн в жизнь.</p>
        </li>
        <li>
            <h4>Помощь в подборе лицевых отделочных материалов, мебели, аксессуаров и т.д.</h4>
            <p>Разрабатывая дизайн-проект, мы точно знаем, где купить все задуманные нами детали интерьера. Мы посоветуем вам надежных поставщиков с высоким качеством товара и невысокими ценами. А сами выступим в роли дизайнеров-декораторов.</p>
        </li>
        <li>
            <h4>Авторский надзор.</h4>
            <p>По вашему желанию мы будем сами контролировать воплощение нашего проекта в жизнь, чтобы вы получили именно тот результат, который вы утвердили.</p>
        </li>
    </ul>



    <h3>Примеры наших работ:</h3>
<ul class="ourwork-list">
                    
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/kazan_salon_krasoty_fashion_112_kv_metrov">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/5d5b6c58-db85-484e-a62e-8cba9ea82b65.jpg" alt="Казань, салон красоты Fashion - 112 кв. метров">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/kazan_salon_krasoty_fashion_112_kv_metrov"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/kazan_salon_krasoty_fashion_112_kv_metrov">Казань, салон красоты Fashion - 112 кв. метров</a></h4>
                        
                    </div>
                </li>
            
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_teplo_126_kv_metrov">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/e1ab6404-6208-474a-94f8-42af77483c61.jpg" alt="Салон красоты Teplo">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_teplo_126_kv_metrov"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_teplo_126_kv_metrov">Салон красоты Teplo</a></h4>
                        
                    </div>
                </li>
            
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_fishka_91_kv_metr_razrabotka_dizajnproekta_salona_krasoty">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/479a6b2c-92fb-4a36-beed-593b7c85449a.jpg" alt="Салон красоты &quot;Фишка&quot; - 91 кв. метр">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_fishka_91_kv_metr_razrabotka_dizajnproekta_salona_krasoty"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_fishka_91_kv_metr_razrabotka_dizajnproekta_salona_krasoty">Салон красоты "Фишка" - 91 кв. метр</a></h4>
                        
                    </div>
                </li>
            
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_matreshka_70_kvmetrov">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/626a3e3c-d9f7-49b0-8e44-0856d6d2cd95.jpg" alt="Салон красоты &quot;Матрешка&quot; - 70 кв.метров">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_matreshka_70_kvmetrov"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_matreshka_70_kvmetrov">Салон красоты "Матрешка" - 70 кв.метров</a></h4>
                        
                    </div>
                </li>

                </ul>

<at:ResponsePage ID="responsePage" runat="server" />
    <noindex>

    
        <h3>С чего начать работу с нами?</h3>

        <p>Начните с  бесплатной планировки вашего будущего салона. Для этого оставьте заявку, и наш менеджер свяжется с вами 
        в ближайшее время.<br /> Вы расскажете нам о своих предпочтениях. А мы <font style="color:#F00">бесплатно</font> 
        составим для вас планировочное решение.</p>

       <at:GetProjectCost runat="server" id="projectCost" />/>
    </noindex>
</asp:Content>