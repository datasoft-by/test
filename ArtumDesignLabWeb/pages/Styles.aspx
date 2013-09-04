<%@ Page Title="Стили интерьера | студия дизайна «Artum»" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" 
CodeFile="Styles.aspx.cs" Inherits="pages_Styles" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">
    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" /> 
    <at:Portfolio ID="Portfolio1" runat="server" />
    <at:ContactInfo ID="contactInfo" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">
    <h1>
        Стили интерьера</h1>
    <p>
        <a href="#">Современный дизайн</a> жилых помещений нередко предполагает смешение стилей. Такая тенденция
        обусловлена стремлением удовлетворить запросы всех членов семьи, проживающих зачастую
        в недостаточно просторных комнатах. А также вполне понятным желанием разнообразить
        атмосферу.
    </p>
    <p>
        Многие выбирают <a href="#">классику</a>. Причем, не только люди преклонного возраста, но и прагматичная
        молодежь, бизнесмены. Однако классицизм многолик, в нем можно выделить несколько
        направлений. Например, английская классика – это предпочтение перед массивными предметами
        и общее ощущение торжественности. А греко-римский классический стиль – это точные
        пропорции и тяга к естественности. В свою очередь, «ампир» – разновидность классического
        направления, известная благодаря изящной лепнине, литым деталям и резьбе.
    </p>
    <p>
        Ровесник классики – стиль «рококо». Зеркала, обилие живых цветов, бронза и картины
        в резных рамах, позолота и изящный светлый цвет стен – таков этот стиль, всегда
        говорящий о празднике души. От него существенно отличается <a href="#">«модерн»</a>. Никаких легкомысленных
        завитушек! Только плавные линии, блеклые оттенки, изогнутые фигуры даже там, где
        сознание привычно рисует точную геометрию.
    </p>
    <p>
        Любители пропорций и противники декоративности выбирают <a href="#">«минимализм»</a>. Особенно актуальны
        функциональные предметы и поиски точных форм в помещениях с малыми площадями. Та
        же функциональность, что присуща <a href="#">«модерну»</a>, отличает и <a href="#">«хай-тек»</a>. Однако в первом
        случае практичное содержание дополнено экстравагантной формой. Например, кресло
        может, по замыслу дизайнера, копировать форму космического цветка, а микроволновка
        – цвет мрамора.
    </p>
    <p>
        Широко используется в современных интерьерах <a href="#">этнический стиль</a>. Это могут быть как
        африканские мотивы, для которых характерна имитация леопардовых шкур, натуральное
        темное дерево и охра, так и атмосфера швейцарского шато с его аккуратными предметами
        обихода и уютной небрежностью.
    </p>
    <p>
        Влюбленные в соленые брызги выбирают <a href="#">морской стиль</a>. Бело-синий цвет тельняшки и
        неба, оттенки морской волны и обилие предметов, позволяющих вспомнить отдых (ракушки,
        аквариумы, изображения пейзажей и морских животных), делают каждый день обладателя
        такого помещения чуть более радужным.
    </p>
    <p>
        Таким образом, существуют разнообразные стили дизайна (многие из них даже не упомянуты
        в рамках данной статьи). Потому всякий человек может оформить свое жилище как по
        личному вкусу, так и в рамках одного из них.
    </p>
    <p>
    <ul>
        <li><a href="http://www.artumstudio.ru/blog/sovremennyj_stil_dizajna/">Современный стиль дизайна</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_klassicheskom_stile/">Дизайн в классическом стиле</a></li>
        <li><a href="http://www.artumstudio.ru/blog/stil_modern_v_dizajne/">Стиль модерн в дизайне</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_yaponskom_stile/">Дизайн в японском стиле</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_stile_provans/">Дизайн в стиле прованс</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_stile_xajtek/">Дизайн в стиле хай-тек</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_stile_kantri/">Дизайн в стиле кантри</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_vostochnom_stile/">Дизайн в восточном стиле</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_stile_minimalizm/">Дизайн в стиле минимализм</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_morskom_stile/">Дизайн в морском стиле</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_stile_barokko/">Дизайн в стиле барокко</a></li>
        <li><a href="http://www.artumstudio.ru/blog/etnicheskij_stil_v_interere/">Этнический стиль в интерьере</a></li>
        <li><a href="http://www.artumstudio.ru/blog/dizajn_v_stile_artdeko/">Дизайн в стиле арт-деко</a></li>
    </ul>
    </p>
</asp:Content>



