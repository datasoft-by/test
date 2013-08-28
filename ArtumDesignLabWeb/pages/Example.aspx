<%@ Page Title="Пример дизайн-проекта. Состав дизайн-проекта | студия дизайна «Artum»"
    Language="C#" AutoEventWireup="true" CodeFile="Example.aspx.cs" Inherits="pages_Example" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<asp:content id="Content1" contentplaceholderid="headContent" runat="Server">
    <meta name="description" content="Студия интерьера «Artum» разрабатывает дизайн проекты квартир в Санкт-Петербурге." />
    <meta name="keywords" content="Дизайн проект квартиры, Заказать дизайн проект, Дизайн проект однокомнатной квартиры, Разработка дизайн проекта, Дизайн проекты интерьер квартир" />
</asp:content>
<asp:content id="Content2" contentplaceholderid="sidebarContent" runat="Server">
    <at:portfolio ID="portfolio" runat="server" />
    <at:designprojectinfo ID="designProjectInfo" runat="server" />
    <at:ResponseControl ID="ResponseControl1" runat="server" />
    <at:News id="news" runat="server" />
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
            <at:ContactInfo ID="contactInfo" runat="server" />
</asp:content>
<asp:content id="Content3" contentplaceholderid="basicContent" runat="Server">
    <h1>Пример дизайн-проекта. Состав дизайн-проекта.</h1>


        <p>Ниже приведен пример полного рабочего дизайн-проекта квартиры, разработанный нашей студией.</p>
    <div class="oject-list-holder">
        <ul class="object-list" style="margin-bottom: 10px;">
            <li>
                <h3 class="active"><span class="arrow"></span>Пример дизайн-проекта</h3>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/1.jpg">
                    <img src="http://www.artumstudio.ru/images/projects/1.jpg" alt="Титульный лист"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Титульный лист</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/2.jpg">
                    <img src="http://www.artumstudio.ru/images/projects/2.jpg" alt="Обмерный план"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Обмерный план</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/3.jpg">
                    <img src="http://www.artumstudio.ru/images/projects/3.jpg" alt="План расстановки мебели и оборудования"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План расстановки мебели и оборудования</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/4.jpg">
                <img src="http://www.artumstudio.ru/images/projects/4.jpg" alt="Схема планировки с указанием основных размеров"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Схема планировки с указанием основных размеров</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/5.jpg">
                <img src="http://www.artumstudio.ru/images/projects/5.jpg" alt="3D-Визуализация"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/6.jpg">
                <img src="http://www.artumstudio.ru/images/projects/6.jpg" alt="3D-Визуализация"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/7.jpg">
               <img src="http://www.artumstudio.ru/images/projects/7.jpg" alt="3D-Визуализация"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/8.jpg">
                <img src="http://www.artumstudio.ru/images/projects/8.jpg" alt="3D-Визуализация"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/9.jpg">
                <img src="http://www.artumstudio.ru/images/projects/9.jpg" alt="3D-Визуализация"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/10.jpg">
                <img src="http://www.artumstudio.ru/images/projects/10.jpg" alt="3D-Визуализация"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/11.jpg">
                <img src="http://www.artumstudio.ru/images/projects/11.jpg" alt="3D-Визуализация"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">3D-Визуализация</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/12.jpg">
                <img src="http://www.artumstudio.ru/images/projects/12.jpg" alt="План демонтажа перегородок"/></a>
                <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План демонтажа перегородок</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/13.jpg">
               <img src="http://www.artumstudio.ru/images/projects/13.jpg" alt="План возводимых перегородок"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План возводимых перегородок</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/14.jpg">
                <img src="http://www.artumstudio.ru/images/projects/14.jpg" alt="План размещения сантехнического оборудования"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План размещения сантехнического оборудования</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/15.jpg">
                <img src="http://www.artumstudio.ru/images/projects/15.jpg" alt="План полов"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План полов</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/16.jpg">
                <img src="http://www.artumstudio.ru/images/projects/16.jpg" alt="Титульный лист"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План теплых полов</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/17.jpg">
                <img src="http://www.artumstudio.ru/images/projects/17.jpg" alt="План потолков"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План потолков</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/18.jpg">
                <img src="http://www.artumstudio.ru/images/projects/18.jpg" alt="Разрезы по потолкам"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Разрезы по потолкам</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/19.jpg">
               <img src="http://www.artumstudio.ru/images/projects/19.jpg" alt="План размещения осветительных приборов, привязка выпусков освещения"/>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План размещения осветительных приборов, привязка выпусков освещения</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/20.jpg">
                <img src="http://www.artumstudio.ru/images/projects/20.jpg" alt="План привязки выключателей с указанием включения групп светильников"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План привязки выключателей с указанием включения групп светильников</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/21.jpg">
              <img src="http://www.artumstudio.ru/images/projects/21.jpg" alt="План электрики"/></a>
                 <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">План электрики</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/22.jpg">
                <img src="http://www.artumstudio.ru/images/projects/22.jpg" alt="Схема обозначения разверток"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Схема обозначения разверток</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/23.jpg">
                <img src="http://www.artumstudio.ru/images/projects/23.jpg" alt="Развертки по стенам Входной зоны"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Входной зоны</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/24.jpg">
                <img src="http://www.artumstudio.ru/images/projects/24.jpg" alt="Развертки по стенам Гостиной"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Гостиной</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/25.jpg">
               <img src="http://www.artumstudio.ru/images/projects/25.jpg" alt="Развертки по стенам Кухни-столовой"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Кухни-столовой</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/26.jpg">
               <img src="http://www.artumstudio.ru/images/projects/26.jpg" alt="Развертки по стенам Спальни"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Спальни</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/27.jpg">
               <img src="http://www.artumstudio.ru/images/projects/27.jpg" alt="Развертки по стенам Детской"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Детской</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/28.jpg">
                <img src="http://www.artumstudio.ru/images/projects/28.jpg" alt="Схема декоративных ниш Н4, Н5, Н6"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Схема декоративных ниш Н4, Н5, Н6</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/29.jpg">
               <img src="http://www.artumstudio.ru/images/projects/29.jpg" alt="Схема декоративных ниш Н4, Н5, Н6"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Схема декоративных ниш Н4, Н5, Н6</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/30.jpg">
                <img src="http://www.artumstudio.ru/images/projects/30.jpg" alt="Развертки по стенам Душевой №4"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Душевой №4</div>
                <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/31.jpg">
               <img src="http://www.artumstudio.ru/images/projects/31.jpg" alt="Развертки по стенам Ванной комнаты №5"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Развертки по стенам Ванной комнаты №5</div>
               <br/>
                 <a href="http://www.artumstudio.ru/images/projects/big/32.jpg">
              <img src="http://www.artumstudio.ru/images/projects/32.jpg" alt="Ведомость отделки,спецификация заполнения дверных проемов"/></a>
                <div class="img-overlay"></div>
                <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Ведомость отделки,спецификация заполнения дверных проемов</div>
                <br/>
                <a href="http://www.artumstudio.ru/images/projects/big/33.jpg">
                <img src="http://www.artumstudio.ru/images/projects/33.jpg" alt="Схема отделки"/></a>
                 <div class="img-overlay"></div>
               <div style="text-align:center;color:Black; font-size:16px;font-weight:bold;">Схема отделки</div>
            </li>
        </ul>
    </div>

    <div class="oject-list-holder">
        <ul class="object-list" style="margin-bottom: 10px;">
            <li>
                <h3 class="active"><span class="arrow"></span>Состав дизайн-проекта</h3>
                <div style="display: block" class="object-photos-holder">
                    <p>
                        1.	Обмерный чертеж объекта с привязкой существующих инженерных коммуникаций<br />
                        2.	Ведомость чертежей<br />
                        2.	План расстановки мебели и оборудования<br />
                        3.	План демонтажа перегородок и инженерных коммуникаций
                (при необходимости)<br />
                        4.	План возводимых перегородок с маркировкой оконных и дверных проёмов (при необходимости)<br />
                        5.	План потолка с указанием типа используемого материала, отдельных узлов и сечений<br />
                        6.	План размещения осветительных приборов, привязка выпусков освещения.<br />
                        7.	План привязки выключателей с указанием включения групп светильников<br />
                        8.	План электрики (электрических и слаботочных сетей) и электровыводов с привязками<br />
                        9.	План полов с указанием типа напольных покрытий и площадей<br />
                        10.	План размещения электрического подогрева пола с привязкой регулятора
                (при необходимости)<br />
                        11.	План размещения сантехнического оборудования с привязкой выпусков и водорозеток<br />
                        12.	Развёртка стен с раскладкой кафельной плитки с указанием размеров (количество чертежей зависит от уровня сложности)<br />
                        13.	Чертежи заказных изделий (при необходимости)<br />
                        14.	3D-визуализации помещений<br />
                        15.	Спецификация дверных проёмов и полотен<br />
                        16.	Ведомость отделки помещений
                    </p>

                </div>
            </li>
        </ul>
    </div>



</asp:content>
