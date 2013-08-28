<%@ Page Title="Дизайн ресторанов и кафе. Разработка дизайн проектов интерьера ресторанов, кафе" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="designproektrestoranov.aspx.cs" Inherits="Services_designproektrestoranov" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<%--
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">

    <at:Portfolio ID="Portfolio1" runat="server" />
    <at:ResponseControl ID="response" runat="server" />
    <at:OurWorks ID="OurWorks" runat="server" />
    <at:News id="news" runat="server" />
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
        <at:ContactInfo ID="contactInfo" runat="server" />
        
</asp:Content>
--%>
<asp:Content ID="Content4" ContentPlaceHolderID="TitleContent" Runat="Server">
     Мы создаем дизайн проекты ресторанов, кафе и баров качественно и в срок
</asp:Content>
<asp:Content ID="Content14" ContentPlaceHolderID="specialOfferContent" Runat="Server">
<at:SpecialOffer Header="Планировка вашего ресторана - бесплатно!" ID="specialOffer" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" runat="server">

    <h1>Дизайн проект ресторана - ваши посетители станут вашими постоянными клиентами</h1>

    <p><strong>Дизайн проект ресторанов и кафе</strong> - это создание уникального и 
    запоминающегося образа вашего заведения, упакованное в виде понятных чертежей и эскизов. </p>
    <p>По этим чертежам и эскизам будут выполняться ремонт и отделка вашего ресторана, а 
    также его наполнение мебелью, аксессуарами, элементами декора. Именно удачный дизайн 
    проект является одной из главных составляющих успеха нового заведения. </p>
    <p>Закажите дизайн интерьера ресторана сейчас. Оставьте заявку на консультацию, и наш 
    специалист составит для вас планировочное решение <strong>бесплатно.</strong> </p>


    <div class="action-banner">
        <img alt="Дизайн проект общественного помещения" src="../content/images/services/design_proekt_public_1.jpg" />
    </div>
    <at:Reason10 ID="reason10" runat="server" />

     
    <h3>Создание дизайн-проекта ресторана помогает вам решить следующие задачи:</h3>

        <ul class="features-list">
            <li>
                <img src="../images/28.jpg" width="107" height="100" alt="Воплощение в жизнь концепции вашего заведения" /> 
                <h4>Воплощение в жизнь концепции вашего заведения</h4>
                <p>Решили открыть ресторан восточной кухни или небольшую кофейню? Мы продумаем все особенности интерьера до мельчайших деталей и предложим вам несколько вариантов реализации. </p>
            </li>
            <li>
                <img alt="Создание уютной атмосферы для посетителей" src="../images/29.jpg" width="107" height="100" />
                <h4>Создание уютной атмосферы для посетителей </h4>
                <p>Мебель, игра света, оформление стен – все эти элементы создают неповторимую атмосферу вашего заведения, которую по достоинству оценят ваши посетители и которая заставит их приходить к вам снова и снова.</p>
            </li>
            <li>
                <img alt="Разработка перепланировки помещения" src="../images/30.jpg" width="107" height="100" />
                <h4>Разработка перепланировки помещения</h4>
                <p>Мы позаботимся о том, чтобы в вашем ресторане было достаточное количество служебных и подсобных помещений, чтобы зал при необходимости комфортно делился на курящую и некурящую зоны, а посетителям было удобно и  просторно. Для этого мы сделаем перепланировку вашего заведения, которая будет полностью отвечать всем строительным и санитарным нормам.</p>
            </li>
            <li>
                <img alt="Разделение потоков" src="../images/31.jpg" width="107" height="100" />
                <h4>Разделение потоков</h4>
                <p>Мы продумаем интерьер таким образом, что для всего будет своя выделенная территория. Грязные тарелки никак не будут мешать свежеприготовленным блюдам, а пути посетителей, вновь пришедших гостей и официантов не пересекутся.</p>
            </li>
            <li>
                <img alt="Соблюдение требований всех инстанций" src="../images/32.jpg" width="107" height="100" />
                <h4>Соблюдение требований всех инстанций</h4>
                <p>Зал вашего ресторана будет полностью отвечать всем правилам противопожарной безопасности, существующим СНиПам, требованиям СЭС и прочим законодательным нормам. Поэтому у вас не возникнет проблем ни с одной надзорной инстанцией. Кроме того, разработкой интерьера вашей кухни будет заниматься не только дизайнер, но и технолог, поэтому вы получите удобное, функциональное и безопасное помещение.</p>
            </li>
        </ul>


    <h3>Что вы получаете, заказав дизайн-проект ресторана, кафе или бистро?</h3>
    <ul class="quality-list">
        <li>
            <h4>Бесплатное планировочное решение.</h4>
            <p>Мы бесплатно проконсультируем вас по вашему проекту и составим планировочное решение. </p>
        </li>
        <li>
            <h4>Согласование проекта.</h4>
            <p>Мы внимательно выслушаем ваши предпочтения и идеи по созданию интерьера, после чего предложим варианты их реализации. Мы продумаем все – от внешнего облика столов и барной стойки до декоративных элементов и тонкостей освещения зала.</li></p>
        <li>
            <h4>Визуализация решения.</h4>
            <p>Мы предоставим вам 3D-изображения вашего заведения, чтобы вы четко представляли, как оно будет выглядеть по завершении всех работ.</p>
        </li>
        <li>
            <h4>Составление рабочей документации.</h4>
            <p>В комплекте технической документации будут все данные, чертежи и схемы, позволяющие строительной бригаде воплотить утвержденный дизайн-проект в жизнь. Строители получат всё – от расстановки столиков до последнего электровывода.</p>
        </li>
        <li>
            <h4>Помощь в подборе лицевых отделочных материалов, мебели, аксессуаров и т.д.</h4>
            <p>Разрабатывая дизайн-проект, мы точно знаем, где купить все задуманные нами детали интерьера. Мы посоветуем вам надежных поставщиков с высоким качеством товара и приемлемыми ценами, а сами выступим в роли дизайнеров-декораторов.</p>
        </li>
        <li>
            <h4>Авторский надзор.</h4>
            <p>По вашему желанию мы будем сами контролировать воплощение проекта в жизнь, чтобы вы получили именно тот результат, который утвердили.</p>
        </li>
    </ul>

    <h3>Посмотрите примеры выполненных нами дизайн-проектов:</h3>
    <ul class="ourwork-list">
                    
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/pivnoj_bar">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/b6d9b884-fc31-4525-82dd-1f45a0cc45b6.jpg" alt="Пивной бар">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/pivnoj_bar"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/pivnoj_bar">Пивной бар</a></h4>
                        
                    </div>
                </li>
            
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/sushibar">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/3181886e-5c4f-4ec2-9898-656077165ea5.jpg" alt="Суши-бар">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/sushibar"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/sushibar">Суши-бар</a></h4>
                        
                    </div>
                </li>
            
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/nochnoj_klub">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/e9d0d1ce-4b25-419f-9e72-5dd5e1f54557.jpg" alt="Ночной клуб">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/nochnoj_klub"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/nochnoj_klub">Ночной клуб</a></h4>
                        
                    </div>
                </li>
            
                <li>
                    <div class="ourwork-img_no_popup">
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/kafe_2">
                            <img width="305" height="165" src="http://www.artumstudio.ru/content/images/portfolio/thumbsmedium/00a4b53d-89ef-4c72-92c8-c97a564113d7.jpg" alt="Кафе 2">
                        </a>
                       
                        <a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/kafe_2"> <div class="img-overlay"></div></a>
                        
                    </div>
                    <div class="ourwork-txt">
                        <h4><a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov/kafe_2">Кафе 2</a></h4>
                        
                    </div>
                </li>
            

            
                </ul>


    <at:ResponsePage ID="responsePage" runat="server" />
    <noindex>


        <h3>С чего начать работу с нами?</h3>

        <p>Начните с  бесплатной планировки вашего будущего ресторана. Для этого оставьте заявку, и наш 
        менеджер свяжется с вами в ближайшее время.<br /> Вы расскажете нам о своих предпочтениях. А мы
        <font style="color:#F00">бесплатно</font>  составим для вас планировочное решение.</p>

        <at:GetProjectCost runat="server" id="projectCost" />
    </noindex>
</asp:Content>