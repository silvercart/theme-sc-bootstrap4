<header>
    <% include SilverCart/Model/Pages/HeaderPreHeader %>
    <div id="main-header" class="clearfix">
        <div class="container">
            <div class="clearfix row">
                <div class="siteLogo col-xxl-5 col-xl-3 col-lg-3 col-xs-12">
                    <a class="logo-link" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                        <span>{$SiteConfig.Title} - {$SiteConfig.Tagline}</span>
                    </a>
                </div>
                <div class="smtb col-xxl-7 col-xl-9 col-lg-9 col-xs-12">
                    <% with $SiteConfig %>
                        <% if $ShopOpeningHours || $ShopPhone || $ShopAdditionalInfo || $ShopAdditionalInfo2 %>
                    <div id="collapseHeaderWidgets" class="collapse in">
                        <div class="headerWidgets row clearfix">
                            <% if $ShopOpeningHours || $ShopPhone %>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                <% if $ShopPhone %>
                                <span class="fa fa-phone"></span> {$ShopPhone.RAW}<br/>
                                <% end_if %>
                                <% if $ShopPhone %>
                                <span class="fa fa-clock-o"></span> {$ShopOpeningHours.RAW}
                                <% end_if %>
                            </div>
                            <% end_if %>
                            <% if $ShopAdditionalInfo %>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                {$ShopAdditionalInfo.RAW}
                            </div>
                            <% end_if %>
                            <% if $ShopAdditionalInfo2 %>
                            <div class="col-xs-12 col-sm-4 col-md-6 col-lg-6 col-xl-6 col-xxl-6 margin-top-xs no-margin-top-sm">
                                {$ShopAdditionalInfo2.RAW}
                            </div>
                            <% end_if %>
                        </div>
                    </div>
                        <% end_if %>
                    <% end_with %>
                    <div id="actionItems" class="clearfix padded text-right">
                        <% if $SiteConfig.ShopOpeningHours || $SiteConfig.ShopPhone %>
                        <div class="btn-group pull-lg-left hidden-lg-up">
                            <a href="#" class="btn" data-toggle="collapse" data-target="#collapseHeaderWidgets" aria-expanded="true" aria-controls="collapseHeaderWidgets" title="Kontaktinfo"><i class="fa fa-info" aria-hidden="true"></i>
                            <span class="hidden-sm-down">Kontaktinfo</span></a>
                        </div>
                        <% end_if %>
                        <% if $ShoppingCart.isFilled %>
                        <div class="btn-group pull-lg-left">
                            <a id="silvercart-checkout-link" class="btn" href="{$PageByIdentifierCode('SilvercartCheckoutStep').Link}" title="<%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %>"><span class="hidden-sm-down"><%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %></span> <i class="fa fa-credit-card hidden-md-up"></i> <i class="fa fa-caret-right"></i></a>
                        </div>
                        <% end_if %>
                        <% if not $EditableShoppingCart %>
                        <div class="btn-group cart-preview pull-lg-left">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" title="<% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %>">
                                <i class="fa fa-shopping-cart"></i> <% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <span class="hidden-sm-down"><%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %></span>
                                <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu cart-content pull-sm-left">
                                <div class="dropdown-item">
                                    <% include SilverCart/Model/Pages/ShoppingCartDropdown %>
                                </div>
                            </div>
                        </div>
                        <% end_if %>
                        <% if $AllTranslations.Count > 1 %>
                        <nav class="btn-group pull-lg-left">
                            <ul class="nav navbar-nav">
                            <% loop $AllTranslations %>
                                <% if $First %>
                                <li>
                                    <a class="btn btn-sm dropdown-toggle first" data-toggle="dropdown" href="javascript:;" hreflang="{$RFC1766}" title="<%t SilverCart\Model\Pages\Page.SHOWINPAGE 'set language to {language}' language=$Name %>">
                                        <img alt="{$Name}" src="{$ThemeDir}/client/img/icons/flags/{$Code}.png" width="25" /> <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu language">
                                <% else %>
                                        <li>
                                            <a class="dropdown-item {$RFC1766}" href="{$Link}" hreflang="{$RFC1766}" title="<%t SilverCart\Model\Pages\Page.SHOWINPAGE 'set language to {language}' language=$Name %>">
                                                <img alt="{$Name}" src="{$ThemeDir}/client/img/icons/flags/{$Code}.png" width="25" /> {$Name}</a>
                                        </li>
                                <% end_if %>
                                <% if $Last %>
                                    </ul>
                                </li>
                                <% end_if %>
                            <% end_loop %>
                            </ul>
                        </nav>
                    <% end_if %>
                        <div class="col-12 col-sm-4 text-right d-none d-md-block sqsf">
                            {$QuickSearchForm}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
