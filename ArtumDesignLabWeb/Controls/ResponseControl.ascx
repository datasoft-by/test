<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResponseControl.ascx.cs" Inherits="Controls_ResponseControl" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<noindex>
<div class="review-block">
	<div class="justify">
		<h3 class="side" style="font-size:22px;">Отзывы клиентов:</h3>
		<div class="button-holder side">
            <a class="button" rel="nofollow" href="<%= SiteHelper.GetWebPath("~/Responses.aspx") %>">все отзывы</a>
		</div>
	</div>
<ul class="review-list">
					<li>
						<div class="snippet-img">
							<img  alt="Вадим Андриенко" src="/images/Temp/user01.jpg">
						</div>
						<div class="review-txt">
							<h4>
								<a rel="nofollow" href="http://www.artumstudio.ru/responses">Вадим Андриенко</a>
							</h4>
							<p>Сотрудничество со студией очень понравилось. Все работы выполнялись в срок и с надлежащим качеством. Особенно хотелось бы 
                            отметить работу дизайнера, её отзывчивость, понимание вопросов и оперативность в работе. Также, никаких нареканий к администрации студии, всё четко и оперативно. Спасибо!</p>
						</div>
					</li>
					<li>
						<div class="snippet-img">
							<img  alt="Павел Клигач" src="/images/Temp/user02.jpg">
						</div>
						<div class="review-txt">
							<h4>
								<a rel="nofollow" href="http://www.artumstudio.ru/responses">Павел Клигач
									
								</a>
							</h4>
							<p>Выражаю благодарность компании «Artum» за разработку дизайн проекта моей квартиры в г. 
                    Пушкин. Из большого количества представленных на рынке фирм занимающихся разработками дизайн 
                    проекта, 
                    компания «Artum» была выбрана мной, прежде всего исходя из стоимости работ. Стоимость, которых
                     как оказалась ниже предлагаемых конкурентами. В дальнейшем очень порадовал срок выполнения 
                     работ - всего 1 месяц, качество дизайн проекта было разработано на высшем уровне, все мои 
                     пожелания были учтены и предложены мне профессиональным видением дизайнера. Отдельное спасибо 
                      Костоусовой Марии.</p>
						</div>
					</li>

				</ul>
    <%--
	<ul class="review-list">
        <asp:Repeater ID="rptItems" runat="server">
        <ItemTemplate>
		<li>
            <div class="snippet-img">
                <img id="Img1" src='<%# SiteHelper.GetWebPath(Settings.ResponcesImagesThumbs) + Eval("Image") %>' alt='<%# Eval("Name") %>' width="100" height="82" visible='<%# (Eval("Image") != null) %>' runat="server" />
			</div>
            <div class="review-txt">
				<h4>
					<a rel="nofollow" href="<%# SiteHelper.GetWebPath("~/Responses.aspx") + "#" + Eval("ResponseId") %>"><%# Eval("Name") %>,
						<span><%# Eval("Post") %></span>
					</a>
				</h4>
				<p><%# Eval("Text") %></p>
			</div>
            <p class="icons">
                <a class="icon icon-vkontakte" href="<%# Eval("Vkontakte") %>" target="_blank"></a>
                <a class="icon icon-facebook" href="<%# Eval("Facebook") %>" target="_blank"></a>
                <a class="icon icon-twitter" href="<%# Eval("Twitter") %>" target="_blank"></a> 
            </p>
		</li>
        </ItemTemplate>
        </asp:Repeater>
	</ul>
     --%>    
</div>
</noindex>