<%@ Page Title="Ремонт под ключ. Ремонт квартир, загородных домов, офисов, ресторанов, кафе" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="remont.aspx.cs" Inherits="Services_remont" %>
 <%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
   <meta name="description" content="Ремонтно-отделочные работы в Санкт-Петербурге. Ремонт квартир, загородных домов, коттеджей." />
   <meta name="keywords" content="Ремонт под ключ" />
</asp:Content>
<%--
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">

     <at:Portfolio ID="Portfolio2" runat="server" />
    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" />
    <at:ResponseControl ID="Portfolio1" runat="server" />
    <at:News id="news" runat="server" />
     <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
         <at:ContactInfo ID="contactInfo" runat="server" />
         
</asp:Content>
--%>
<asp:Content ID="Content4" ContentPlaceHolderID="TitleContent" Runat="Server">
    Дизайнерский ремонт
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" runat="server">
     <h1>Возьмем на себя весь ремонт: от разработки дизайна интерьера до вывоза строительного мусора</h1>
    
    <p>
        Ремонт под ключ, заказанный у нас – это комплексный ремонт и отделка вашего помещения с выполнением всех строительных работ. 
        При этом мы выполняем всю работу «от и до», опираясь на ваши пожелания, а также наши знания и умения, и представляем вам готовый результат.    
    </p>
    <p>
        Мы разрабатываем дизайн-проект и делаем ремонт под ключ в квартирах, домах, офисах и общественных заведениях. 
        Вы говорите о ваших предпочтениях, утверждаете наши дизайн-решения и получаете результат. Всю остальную работу мы берем на себя.
    </p>
    <p>
        Первый шаг работы с нами – <span style="font-weight:bold;text-decoration:underline;">бесплатное</span> планировочное решение вашего помещения. Оставьте заявку, и наш специалист свяжется с вами.    
    </p>
    <div class="acent">
        <div class="acent-bottom" style="text-align: center; padding-top: 10px">
                <a href="#call-window" class="callorder3_btn button-red">Заказать бесплатную планировку</a>
        </div>
    </div>

<h2 style="font-size: 24px;">Если вы задумались о ремонте, то мы знаем, что вас беспокоит:</h2>
<div class="disced-list">
<ul style="font-size:12px;">
    <li>Вы хотите сделать все в одном месте: от дизайна до готового ремонта</li>
    <li>Вы опасаетесь, что ремонт затянется на долгие месяцы, поэтому никак не решаетесь его начать</li>
    <li>Вы боитесь, что работа будет сделана некачественно, и ее в результате придется переделывать или жить с недоделками</li>
    <li>Вам страшно, что выделенных на ремонт денег не хватит, потому что в процессе будут возникать непредвиденные расходы</li>
    <li>Вы боитесь, что вам не удастся выделить время на ремонт – ведь строительную бригаду надо ежедневно контролировать</li>
</ul>
</div>

<h2 style="font-size: 24px;">Мы избавим вас от страхов с нашей услугой «ремонт под ключ».</h2>
<p>
    Мы берем на себя <span style="font-weight:bold;">все ремонтные работы</span>, включая разработку дизайна интерьера, перепланировки помещения и их согласование. 
    Это значит, что вы только формулируете ваши потребности и одобряете предложенные нами варианты, а всю остальную работу выполняем мы.
</p>

<h2 style="font-size: 24px;">Что вы получаете, заказав у нас ремонт под ключ:</h2>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/33.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Бесплатное планировочное решение</span>
            <br />
            Мы бесплатно проконсультируем вас по вашему проекту и составим планировочное решение.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/34.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Визуализация решения</span>
            <br />
            Мы предоставим вам дизайн-макет и 3D-изображения вашего будущего помещения, чтобы
            вы четко представляли, как оно будет выглядеть по завершении всех работ.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/35.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Рабочая документация для строителей</span>
            <br />
            Вам не придется объяснять строителям, что имелось в виду на чертежах – это полностью
            наша задача, изложенная техническим языком в соответствующих документах.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/36.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Подбор лицевых отделочных материалов и комплектующих</span>
            <br />
            Мы точно знаем, где лучше и надежнее – ведь мы не первый год на этом рынке. Поэтому
            вам не придется беспокоиться, что краска может быть некачественной, а обои быстро
            отклеятся. Все отделочные материалы и комплектующие будут только от проверенных
            поставщиков.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/37.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Авторский надзор</span>
            <br />
            Наши специалисты тщательно контролируют соответствие выполняемых работ утвержденной
            концепции. Поэтому риски, что строители сделают «что-то не то», полностью исключены.
        </div>
    </div>
    <div class="acent">
        <div class="acent-bottom" style="text-align: center; padding-top: 10px">
                <a href="#call-window" class="callorder3_btn button-red">Заказать бесплатную планировку</a>
        </div>
    </div>

<h2 style="font-size: 24px;">Обратитесь к нам, если вам нужен:</h2>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/38.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Ремонт квартиры</span>
            <br />
            Мы выполняем ремонты любой сложности – как в новостройках, так и во «вторичном жилье».<br />
Нужна перепланировка? Добавим еще одну спальню, совместим гостиную с рабочим кабинетом, создадим помещение под кладовку или гардеробную.<br /> 
При этом мы готовы порекомендовать вам специалистов, которые согласуют за вас перепланировку в нужных  инстанциях.

        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/39.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Отделка загородного дома</span>
            <br />
            Мы поможем вам сделать дом «для себя», то есть под ваши вкусы и потребности. Проконсультируем, какие лицевые отделочные материалы лучше всего подобрать в зависимости от типа дома и его особенностей.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/40.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Ремонт офиса</span>
            <br />
            Увеличился штат сотрудников, и нужна дополнительная площадь? Или специфика бизнеса требует изменения помещения?<br /> 
            Предложим дизайн-проект и сделаем ремонт под ваши нужды с учетом всех правил противопожарной безопасности,  СНиПов и прочих законодательных норм.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/41.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Ремонт общественных заведений (магазины, рестораны, салоны красоты и т.д.)</span>
            <br />
            С помощью ремонта мы создаем <span style="font-weight: bold">атмосферу</span>. Ту, которую по достоинству оценят ваши клиенты и которая заставит их вернуться к вам опять. Мы учтем все – от общей концепции заведения до всех ваших идей и пожеланий. Сделаем необходимую перепланировку или реконструкцию и согласуем ее в надзорных органах.
        </div>
    </div>

<h2 style="font-size: 24px;">5 причин для вас работать с нами:</h2>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/42.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Причина №1: Дизайн и ремонт силами одной компании</span>
            <br />
            Наши специалисты разработают для вас дизайн-макет и выполнят все необходимые работы, прописанные в технической документации.<br />
            В этом случае время работ значительно сокращается, т.к. обсуждение технических моментов реализации проекта между сотрудниками сводится к минимуму.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/43.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Причина №2: Делаем, как для себя</span>
            <br />
            Каждый порученный нам объект мы воспринимаем как <span style="font-weight: bold">свой</span>, поэтому делаем ремонт, <span style="font-weight: bold">как для себя</span>. 
            Мы работаем тщательно и скрупулезно, заботясь о каждом квадратном сантиметре вашей площади. Мы искренне хотим, чтобы все получилось красиво и качественно – ведь это наша репутация и наша гордость, если вы остались довольны. Именно поэтому большинство наших клиентов рекомендуют нас своим друзьям.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/44.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Причина №3: Вы будете иметь дело с лучшими специалистами</span>
            <br />
            В нашей команде – только профессионалы, каждый из которых имеет опыт работы не менее 5 лет. 
            Все наши дизайнеры имеют высшее художественное образование, а ремонтной бригадой руководят высококвалифицированные инженеры-строители.
        </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/45.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Причина №4: Ваш ремонт будет сделан строго в оговоренные сроки</span>
            <br />
            Мы не затягиваем сроки ремонтных работ. Все сроки, так же как и полная смета на ремонт, будут указаны в договоре, поэтому вы можете заранее планировать новоселье.
       </div>
    </div>
    <div style="float: left; width=100%;">
        <div class="block-left">
            <img width="128" height="128" src="http://www.artumstudio.ru/content/images/services/remont/46.png"
                alt="">
        </div>
        <div class="block-right">
            <span style="font-weight: bold">Причина №5: Мы даем 100% гарантию качества</span>
            <br />
            Большинство фирм, если и дают гарантии на ремонт, то на срок от 1 года до 3 лет. Мы настолько уверены в качестве наших работ, что даем гарантию на ремонт на 5 лет. Если в течение этого срока вы найдете какие-либо недостатки в проведенных нами работах, то мы устраним их бесплатно.
        </div>
    </div>
    <div class="acent">
        <div class="acent-bottom" style="text-align: center; padding-top: 10px">
                <a href="#call-window" class="callorder3_btn button-red">Заказать бесплатную планировку</a>
        </div>
    </div>

<h2 style="font-size: 24px;">Почитайте некоторые отзывы о нашей работе</h2>
    <ul class="ourwork-list project-photos">
        <li>
            <div class="ourwork-img">
                
                <a href="../images/response/andrienko.jpg">
               <img width="78" height="111" class="opinion" alt="Картинка" src="../images/response/andrienko_small.jpg">
                </a>

                <div class="img-overlay">
                </div>
            </div>
            <div class="ourwork-txt">
                <h4>Вадим Андриенко</h4>
                <p><a href="http://www.artumstudio.ru/portfolio/interery_kvartir/zhk_knyaz_aleksandr_nevskij_111_kv_metrov_razrabotka_dizajnproekta_interera_kvartiry">ссылка на проект</a></p>
            </div>
        </li>
        <li>
            <div class="ourwork-img">
                <a href="../images/response/tsareva.jpg">
               <img width="78" height="111" class="opinion" alt="Картинка" src="../images/response/tsareva_small.jpg">
                <div class="img-overlay">
                </div>
            </div>
            <div class="ourwork-txt">
                <h4>Елена Царева</h4>
                <p><a href="http://www.artumstudio.ru/portfolio/interery_kvartir/poselok_gorelovo_krasnoselskoe_shosse_105_kvmetrov_razrabotka_dizajnproekta_interera_kvartiry">ссылка на проект</a></p>
            </div>
        </li>
         <li>
            <div class="ourwork-img">
                
                <a href="../images/response/kurganova.jpg">
               <img width="78" height="111" class="opinion" alt="Картинка" src="../images/response/kurganova_small.jpg">
                </a>

                <div class="img-overlay">
                </div>
            </div>
            <div class="ourwork-txt">
                <h4>Елена Курганова</h4>
                <p><a href="http://www.artumstudio.ru/portfolio/interery_kvartir/ulica_kompozitorov_106_kvmetrov_razrabotka_dizajnproekta_interera_kvartiry">ссылка на проект</a></p>
            </div>
        </li>
                 <li>
            <div class="ourwork-img">
                
                <a href="../images/response/mandrika.jpg">
               <img width="78" height="111" class="opinion" alt="Картинка" src="../images/response/mandrika_small.jpg">
                </a>

                <div class="img-overlay">
                </div>
            </div>
            <div class="ourwork-txt">
                <h4>Лариса Мандрика</h4>
                <p><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty/salon_krasoty_fishka_91_kv_metr_razrabotka_dizajnproekta_salona_krasoty">ссылка на проект</a></p>
            </div>
        </li>
    </ul>


<h2 style="font-size: 24px;">С чего начать сотрудничество с нами?</h2>
<p>
    Начните с бесплатной планировки вашего помещения.<br />
    Для этого оставьте заявку, и наш менеджер свяжется с вами в ближайшее время.<br /> 
    Вы расскажете нам о своих предпочтениях и о том, чего ждете от ремонта. А мы <span style="font-weight: bold; color:#F00;">бесплатно</span> создадим для вас планировочное решение.
</p>

    <div class="acent">
        <div class="acent-bottom" style="text-align: center; padding-top: 10px">
                <a href="#call-window" class="callorder3_btn button-red">Заказать бесплатную планировку</a>
        </div>
    </div>

<noindex>
<at:CallOrder ID="callOrder" runat="server" />
</noindex>
               
</asp:Content>
