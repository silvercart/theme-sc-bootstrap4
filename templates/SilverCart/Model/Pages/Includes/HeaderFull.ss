<header class="container-fluid">
    <% include SilverCart/Model/Pages/HeaderPreHeader %>
    <div id="main-header" class="clearfix">
        <div class="row">
            <div class="siteLogo col-12 col-md-4 d-none d-md-block">
                <a class="logo-link" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                    <img src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.Link}<% else %>{$BaseHref}resources/vendor/silvercart/silvercart/client/img/logo.png<% end_if %>" class="img-fluid w-50" alt="{$SiteConfig.Title}">
                    <span class="d-none d-md-block small">{$SiteConfig.Title} - {$SiteConfig.Tagline}</span>
                </a>
            </div>
            <div class="smtb col-12 col-md-8 clearfix justify-content-sm-end p-0">
            <% with $SiteConfig %>
                <% if $ShopOpeningHours || $ShopPhone || $ShopAdditionalInfo || $ShopAdditionalInfo2 %>
                <div id="collapseHeaderWidgets" class="collapse in d-md-block">
                    <div class="headerWidgets row">
                        <% if $ShopOpeningHours || $ShopPhone %>
                        <div class="col-sm-auto">
                            <% if $ShopPhone %>
                            <span class="fa fa-phone"></span> {$ShopPhone.RAW}<br/>
                            <% end_if %>
                            <% if $ShopPhone %>
                            <span class="fa fa-clock-o"></span> {$ShopOpeningHours.RAW}
                            <% end_if %>
                        </div>
                        <% end_if %>
                        <% if $ShopAdditionalInfo %>
                        <div class="col-sm-2">
                            {$ShopAdditionalInfo.RAW}
                        </div>
                        <% end_if %>
                        <% if $ShopAdditionalInfo2 %>
                        <div class="col-sm">
                            {$ShopAdditionalInfo2.RAW}
                        </div>
                        <% end_if %>
                    </div>
                </div>
                <% end_if %>
            <% end_with %>
                <div class="row no-gutters justify-content-sm-end" role="group" aria-label="First group">
                    <nav class="clearfix btn-toolbar pb-2">
                        <% if $SiteConfig.ShopOpeningHours || $SiteConfig.ShopPhone %>
                        <a href="#" class="btn d-md-none" data-toggle="collapse" data-target="#collapseHeaderWidgets" aria-expanded="true" aria-controls="collapseHeaderWidgets" title="Kontaktinfo"><span class="fa fa-2x fa-info" aria-hidden="true"></span>
                            <span class="d-none d-sm-inline-block">Kontaktinfo</span></a>
                        <% end_if %>
                        <% if $ShoppingCart.isFilled %>
                        <a id="silvercart-checkout-link" class="btn" href="{$PageByIdentifierCode('SilvercartCheckoutStep').Link}" title="<%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %>"><span class="fa fa-2x fa-credit-card hidden-md-up"></span> <span class="d-none d-sm-inline-block"><%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %></span> <span class="fa fa-caret-right"></span></a>
                        <% end_if %>
                        <% if not $EditableShoppingCart %>
                        <a id="cart-dropdown" class="btn dropdown-toggle cart-preview" data-toggle="dropdown" title="<% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %>">
                            <span class="fa fa-2x fa-shopping-cart"></span> <% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <span class="d-none d-sm-inline-block"><%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %></span>
                            <span class="caret"></span>
                        </a>
                        <section class="dropdown-menu cart-content" aria-labelledby="cart-dropdown">
                            <% include SilverCart/Model/Pages/ShoppingCartDropdown %>
                        </section>
                        <% end_if %>
                        <% if $AllTranslations.Count > 1 %>
                        <div>
                            <% loop $AllTranslations %>
                                <% if $First %>
                            <a id="translation-select" class="btn btn-sm dropdown-toggle" data-target="translation-select-dropdown" data-toggle="dropdown" hreflang="{$RFC1766}" title="<%t SilverCart\Model\Pages\Page.SHOWINPAGE 'set language to {language}' language=$Name %>">
                                <img alt="{$Name}" src="{$ThemeDir}/client/img/icons/flags/{$Code}.png" width="25" /> <span class="caret"></span>
                            </a>
                            <div id="translation-select-dropdown" class="dropdown-menu" aria-labelledby="translation-select">
                                <% else %>
                                <a class="dropdown-item {$RFC1766}" href="{$Link}" hreflang="{$RFC1766}" title="<%t SilverCart\Model\Pages\Page.SHOWINPAGE 'set language to {language}' language=$Name %>">
                                    <img alt="{$Name}" src="{$ThemeDir}/client/img/icons/flags/{$Code}.png" width="25" /> {$Name}</a>
                                <% end_if %>
                                <% if $Last %>
                            </div>
                                <% end_if %>
                            <% end_loop %>
                        </div>
                        <% end_if %>
                    </nav>
                    <div class="col-12 col-sm-4 text-right d-none d-md-block">
                        {$QuickSearchForm}
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>