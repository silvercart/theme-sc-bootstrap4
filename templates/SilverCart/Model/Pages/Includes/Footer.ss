{$BeforeFooterContent}
<% cached 'Footer',$CurrentPage.MemberGroupCacheKey %>
<footer class="footer mt-5 pt-4">
    <h3 class="sr-only">Footer</h3>
    <div class="container-fluid">
        <div class="card-deck justify-content-between">
<% if $FooterColumns %>
    <% loop $FooterColumns %>
            <section class="card bg-light border-0 p-3">
                <h4><a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>">{$MenuTitle.XML}</a></h4>
        <% if $Children %>
                <nav class="footer-links" aria-label="{$MenuTitle.XML}">
                    <ul class="list-unstyled">
            <% loop $Children %>
                        <li><a class="highlight" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><span class="fa fa-caret-right"></span> {$MenuTitle.XML}</a></li>
            <% end_loop %>
                    </ul>
                </nav>
        <% end_if %>
            </section>
    <% end_loop %>
<% end_if %>
<% with $SiteConfig %>
    <% if $FacebookLink || $TwitterLink || $XingLink || $GoogleplusLink || $InstagramLink || $BloglovinLink || $PinterestLink || $YouTubeLink || $TumblrLink || $RSSLink || $EmailLink %>
            <section class="card bg-light border-0 p-3">
                <h4><%t SilverCart\Admin\Model\Config.SOCIALMEDIA 'Social Media' %></h4>
                <div id="socialicons" itemscope itemtype="http://schema.org/Organization">
                    <link itemprop="url" href="{$BaseHref}" />
        <% if $FacebookLink   %><a itemprop="sameAs" class="icon btn mb-1" href="{$FacebookLink}" title="Follow with Facebook" target="_blank"><span class="fa fa-2x fa-facebook"></span></a><% end_if %>
        <% if $TwitterLink    %><a itemprop="sameAs" class="icon btn mb-1" href="{$TwitterLink}" title="Follow with Twitter" target="_blank"><span class="fa fa-2x fa-twitter"></span></a><% end_if %>
        <% if $XingLink       %><a itemprop="sameAs" class="icon btn mb-1" href="{$XingLink}" title="Follow with Xing" target="_blank"><span class="fa fa-2x fa-xing"></span></a><% end_if %>
        <% if $GoogleplusLink %><a itemprop="sameAs" class="icon btn mb-1" href="{$GoogleplusLink}" title="Follow with Google Plus" target="_blank"><span class="fa fa-2x fa-google-plus"></span></a> <% end_if %>
        <% if $InstagramLink  %><a itemprop="sameAs" class="icon btn mb-1" href="{$InstagramLink}" title="Follow with Instagram" target="_blank"><span class="fa fa-2x fa-instagram"></span></a><% end_if %>
        <% if $BloglovinLink  %><a itemprop="sameAs" class="icon btn mb-1" href="{$BloglovinLink}" title="Follow with Bloglovin" target="_blank"><span class="fa fa-2x fa-heart"></span></a><% end_if %>
        <% if $PinterestLink  %><a itemprop="sameAs" class="icon btn mb-1" href="{$PinterestLink}" title="Follow with Pinterest" target="_blank"><span class="fa fa-2x fa-pinterest"></span></a><% end_if %>
        <% if $YouTubeLink    %><a itemprop="sameAs" class="icon btn mb-1" href="{$YouTubeLink}" title="Follow with YouTube" target="_blank"><span class="fa fa-2x fa-youtube"></span></a><% end_if %>
        <% if $TumblrLink     %><a itemprop="sameAs" class="icon btn mb-1" href="{$TumblrLink}" title="Follow with Tumblr" target="_blank"><span class="fa fa-2x fa-tumblr"></span></a><% end_if %>
        <% if $RSSLink        %><a itemprop="sameAs" class="icon btn mb-1" href="{$RSSLink}" title="Follow with RSS" target="_blank"><span class="fa fa-2x fa-rss"></span></a><% end_if %>
        <% if $EmailLink      %><a itemprop="sameAs" class="icon btn mb-1" href="mailto:{$EmailLink}" title="Email Me" target="_blank"><span class="fa fa-2x fa-envelope"></span></a><% end_if %>
                </div>
            </section>
    <% end_if %>
<% end_with %>
        </div>
    </div>
<% with $SiteConfig %>
    <% if $ShopOpeningHours || $ShopPhone || $ShopAdditionalInfo || $ShopAdditionalInfo2 %>
    <hr/>
    <section class="container-fluid mt-0 py-3">
        <h5 class="sr-only"><%t SilverCart\Admin\Model\Config.ShopAdditionalInfo 'Additional Information' %></h5>
        <div class="row justify-content-sm-center">
        <% if $ShopOpeningHours || $ShopPhone %>
        <div class="col-6 col-sm-4 col-md-4 col-lg-2 col-xl-3 col-xxl-2">
            <% if $ShopPhone %>
            <span class="fa fa-phone"></span> {$ShopPhone.RAW}<br/>
            <% end_if %>
            <% if $ShopPhone %>
            <span class="fa fa-clock-o"></span> {$ShopOpeningHours.RAW}
            <% end_if %>
        </div>
        <% end_if %>
        <% if $ShopAdditionalInfo %>
        <div class="col-6 col-sm-4 col-md-4 col-lg-2 col-xl-3 col-xxl-2">
            {$ShopAdditionalInfo.RAW}
        </div>
        <% end_if %>
        <% if $ShopAdditionalInfo2 %>
        <div class="col-sm-8 col-md-6 col-xxl-4 mt-3 mt-sm-3 mt-lg-0">
            {$ShopAdditionalInfo2.RAW}
        </div>
        <% end_if %>
        </div>
    </section>
    <% end_if %>
<% end_with %>
    <div class="bg-primary mt-3 py-3">
        <div class="container-fluid">
    <% if $PaymentMethods %>
            <ul class="payment-methods list-inline float-right">
        <% loop $PaymentMethods %>
            <% if $showPaymentLogos && $PaymentLogos %>
                <% loop $PaymentLogos %>
                    <% if $Image.Size %>
                <li class="list-inline-item"><a href="{$CurrentPage.PageByIdentifierCodeLink('SilvercartPaymentMethodsPage')}#{$Top.String2urlSegment($Up.Name)}" title="{$Up.Title.HTML}"><img src="{$Image.ScaleHeight(35).URL}" alt="{$Up.Title.HTML}" /></a></li>
                    <% end_if %>
                <% end_loop %>
            <% end_if %>
        <% end_loop %>
            </ul>
    <% end_if %>
    <% with $PageByIdentifierCode('SilvercartShippingFeesPage') %>
            <ul class="shipping-methods list-inline float-right mr-4">
        <% loop $Carriers %>
            <% if $Logo %>
                <li class="list-inline-item"><a href="{$Up.Link}#{$Top.String2urlSegment($Title)}" title="{$Title.HTML}"><img src="{$Logo.ScaleHeight(35).URL}" alt="{$Title.HTML}" /></a></li>
                <% if $AllowedSilvercartShippingMethods %>
                    <% loop $AllowedSilvercartShippingMethods %>
                        <% if $Logo %>
                <li class="list-inline-item"><a href="{$Up.Up.Link}#{$Top.String2urlSegment($TitleWithCarrier)}" title="{$TitleWithCarrier.HTML}"><img src="{$Logo.ScaleHeight(35).URL}" alt="{$TitleWithCarrier.HTML}" /></a></li>
                        <% end_if %>
                    <% end_loop %>
                <% end_if %>
            <% end_if %>
        <% end_loop %>
            </ul>
    <% end_with %>
            <p class="clearfix mb-0 align-middle">
                <img class="img-fluid mr-2 bg-light" src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.ScaleWidth(150).Link}<% else %>{$BaseHref}resources/vendor/silvercart/silvercart/client/img/logo.png<% end_if %>" alt="{$SiteConfig.Title}">
                {$SiteConfig.Title} | {$SiteConfig.Tagline} | <a href="http://www.silvercart.org" target="_blank" title="SilverCart. eCommerce software. Open-source. You'll love it.">by SilverCart eCommerce</a></p>
        </div>
    </div>
</footer>
<% end_cached %>
<% if $SiteConfig.CookiePolicyConfigIsActive %>
    <% include CookieConsent %>
<% end_if %>
<% with $CurrentRegisteredCustomer %>
    <% if $isAdmin || $isCardPurchaser || $isSalesPartner %>
<div id="nav-admin" class="p-fixed m-0 h-100" style="width: 300px; top: 0px; left: -300px; z-index: 1100;">
    <div class="p-relative z-2 border-right border-gray bg-gray-light w-100 h-100" style="box-shadow: inset 0px 0px 4px 0px rgba(0, 0, 0, .5);">
        <% if $isSalesPartner %>
            <% loop $SingleCatalogs %>
        <h6 class="d-flex justify-content-between align-items-center px-3 pt-3 mb-2 text-muted text-uppercase"><span>{$Title}</span><a class="d-flex align-items-center text-muted" href="{$ManageLink('index')}"><span class="fas fa-tv"></span></a></h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('openorders')}"><span class="fas fa-file-invoice-dollar text-center" style="width: 18px;"></span> {$fieldLabel('PageOpenOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('inprogressorders')}"><span class="fas fa-file-invoice text-center" style="width: 18px;"></span> {$fieldLabel('PageInProgressOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('shippedorders')}"><span class="fas fa-shipping-fast text-center" style="width: 18px;"></span> {$fieldLabel('PageShippedOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('pickuporders')}"><span class="fas fa-box-open text-center" style="width: 18px;"></span> {$fieldLabel('PagePickupOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('doneorders')}"><span class="fas fa-clipboard-check text-center" style="width: 18px;"></span> {$fieldLabel('PageDoneOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('canceledorders')}"><span class="fas fa-times text-center" style="width: 18px;"></span> {$fieldLabel('PageCanceledOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('settings')}"><span class="fas fa-cog text-center" style="width: 18px;"></span> {$fieldLabel('PageSettings')}</a></li>
        </ul>
            <% end_loop %>
        <% end_if %>
        <% if $isCardPurchaser %>
        <h6 class="d-flex justify-content-between align-items-center px-3 pt-3 mb-2 text-muted text-uppercase"><span>Kartenverwaltung</span><a class="d-flex align-items-center text-muted" href="{$Top.SellCardsPage.Link('orders')}"><span class="fas fa-clipboard"></span></a></h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="{$Top.PurchaseCardsPage.Link}"><span class="fas fa-id-badge"></span> {$Top.PurchaseCardsPage.Title}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$Top.PurchaseCardsPage.Link('orders')}"><span class="fas fa-file-invoice-dollar"></span> Ankauf: <%t BattleBear\SingleCardManager\Model\Order\Order.OpenOrders 'Open Orders' %></a></li>
            <li class="nav-item"><a class="nav-link" href="{$Top.SellCardsPage.Link('orders')}"><span class="fas fa-clipboard"></span> Verkauf: <%t BattleBear\SingleCardManager\Model\Order\Order.OpenOrders 'Open Orders' %></a></li>
            <li class="nav-item"><a class="nav-link" href="{$Top.StockPage.Link}"><span class="fas fa-dolly"></span> {$Top.StockPage.fieldLabel('CurrentStock')}</a></li>
        </ul>
        <% end_if %>
        <% if $isAdmin %>
        <h6 class="d-flex justify-content-between align-items-center px-3 pt-3 mb-2 text-muted text-uppercase"><span>Admin</span><a class="d-flex align-items-center text-muted" href="{$baseHref}admin"><span class="fas fa-lock"></span></a></h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link " href="{$baseHref}admin"><span class="fas fa-lock"></span> <%t SilverCart\Model\Pages\Page.ADMIN_AREA 'Admin Access' %></a></li>
            <li class="nav-item"><a class="nav-link" href="{$Link}?flushi18n=1"><span class="fas fa-sync"></span> <%t SilverCart\Model\Pages\Page.FlushI18n 'Flush I18N' %></a></li>
            <li class="nav-item"><a class="nav-link " href="{$Link}?flushrequirements=1"><span class="fas fa-sync"></span> <%t SilverCart\Model\Pages\Page.FlushRequirements 'Flush CSS / JS cache' %></a></li>
        </ul>
        <% end_if %>
    </div>
    <div class="btn-toggle-nav p-absolute z-1 border border-gray-light border-left-0 rounded-right shadow bg-white cursor-pointer op-50 transition-all" style="height: 100px; left: 100%; top: calc(50% - 50px);"><span class="fas fa-2x fa-chevron-right mx-2 align-middle" style="line-height: 100px;"></span></div>
</div>
    <% end_if %>
<% end_with %>
<% if $CurrentPage.isProductDetailView %>
    {$Product.Microdata}
<% end_if %>