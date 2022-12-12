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
    <% if $ExternalLinksWithIcon %>
            <section class="card bg-light border-0 p-3">
                <h4><%t SilverCart\Admin\Model\Config.SOCIALMEDIA 'Social Media' %></h4>
                <div id="socialicons" itemscope itemtype="http://schema.org/Organization">
                    <link itemprop="url" href="{$BaseHref}" />
                    <% loop $ExternalLinksWithIcon %>
                        <a itemprop="sameAs" class="icon btn mb-1" href="{$Link.LinkURL}" title="{$Title}" {$Link.TargetAttr}>{$Icon('fa-2x')}</a>
                    <% end_loop %>
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
                <img class="img-fluid mr-2 bg-light" src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.ScaleWidth(150).Link}<% else %>{$BaseHref}_resources/vendor/silvercart/silvercart/client/img/logo.png<% end_if %>" alt="{$SiteConfig.Title}">
                {$SiteConfig.Title} | {$SiteConfig.Tagline} | <a href="http://www.silvercart.org" target="_blank" title="SilverCart. eCommerce software. Open-source. You'll love it.">by SilverCart eCommerce</a></p>
        </div>
    </div>
</footer>
<% end_cached %>
<% if $SiteConfig.CookiePolicyConfigIsActive %>
    <% include CookieConsent %>
<% end_if %>
<% include AdminNavigation %>
<% if $CurrentPage.isProductDetailView %>
    {$Product.Microdata}
<% end_if %>