<header class="container-fluid">
    <div id="main-header" class="clearfix">
        <div class="row">
            <div class="siteLogo col-12 col-sm-5 col-md-auto d-none d-sm-block">
                <a class="logo-link d-inline-block" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                    <img src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.ScaleHeight(70).Link}<% else %>{$BaseHref}resources/vendor/silvercart/silvercart/client/img/logo.png<% end_if %>" class="img-fluid" alt="{$SiteConfig.Title}">
                    <span class="sr-only">{$SiteConfig.Title} - {$SiteConfig.Tagline}</span>
                </a>
            </div>
            <div class="smtb col-12 col-sm clearfix justify-content-sm-end p-0 my-auto">
                <div class="row no-gutters justify-content-sm-end" role="group" aria-label="First group">
                    <div class="col-12 col-sm text-right d-none d-md-block my-auto">
                        {$QuickSearchForm}
                    </div>
                    <nav class="col-12 col-sm-auto clearfix btn-toolbar pb-2 pl-2">
                        {$HeaderNavBeforeTranslationSelectContent}
                    <% if $AllTranslations.Count > 1 %>
                        <div class="dropdown">
                        <% loop $AllTranslations %>
                            <% if $First %>
                            <a id="translation-select" class="btn btn-sm dropdown-toggle border-right" data-target="translation-select-dropdown" data-toggle="dropdown" hreflang="{$RFC1766}" title="<%t SilverCart\Model\Pages\Page.SHOWINPAGE 'set language to {language}' language=$Name %>">
                                <span class="d-block mr-2 mt-1">{$Code.UpperCase}</span><span class="fa fa-2x fa-globe"></span> <span class="caret"></span>
                                <%--<img alt="{$Name}" src="{$ThemeDir}/client/img/icons/flags/{$Code}.png" width="25" /> <span class="caret"></span>--%>
                            </a>
                            <div id="translation-select-dropdown" class="dropdown-menu" aria-labelledby="translation-select">
                            <% else %>
                                <a class="dropdown-item {$RFC1766}" href="{$Link}" hreflang="{$RFC1766}" title="<%t SilverCart\Model\Pages\Page.SHOWINPAGE 'set language to {language}' language=$Name %>">
                                    <img alt="{$Name}" src="{$ThemeDir}/client/img/icons/flags/{$Code}.png" width="25" /> {$Name}</a>
                                <% if $Last %>
                            </div>
                                <% end_if %>
                            <% end_if %>
                        <% end_loop %>
                        </div>
                    <% end_if %>
                        {$HeaderNavBeforeAccountSelectContent}
                    <% if $CurrentRegisteredCustomer %>
                        <div class="dropdown">
                            <a id="account-dropdown" class="btn dropdown-toggle text-left" data-toggle="dropdown" title="<%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %>">
                                <span class="d-block text-truncate"><%t SilverCart\Model\Pages\Page.HELLO 'Welcome' %>, {$CurrentRegisteredCustomer.FirstName}</span>
                                <strong><span class="fa fa-user"></span> <%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %></strong>
                                <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="account-dropdown">
                                <a class="dropdown-item" href="{$PageByIdentifierCode('SilvercartMyAccountHolder').Link}" title="<%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %>"><%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %></a>
                        <% loop $PageByIdentifierCode('SilvercartMyAccountHolder').Children %>
                                <a class="dropdown-item" href="{$Link}" title="{$Title}">{$MenuTitle}</a>
                        <% end_loop %>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{$logoutURL}" title="<%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %>"> <span class="fa fa-sign-out"></span> <%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %></a>
                            </div>
                        </div>
                    <% else %>
                        <div class="dropdown">
                            <a id="account-dropdown" class="btn dropdown-toggle text-left" data-toggle="dropdown" title="<%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %>">
                                <span class="d-block text-truncate"><%t SilverCart\Model\Pages\Page.HELLO 'Welcome' %>, <%t SilverCart\Model\Pages\Page.LOGIN 'Login' %></span>
                                <strong><span class="fa fa-user"></span> <%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %></strong>
                                <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="account-dropdown">
                        <% with $PageByIdentifierCode('SilvercartMyAccountHolder') %>
                                <a class="dropdown-item" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.LOGIN 'Login' %>"> <span class="btn btn-primary btn-block"><%t SilverCart\Model\Pages\Page.LOGIN 'Login' %></span></a>
                                <a class="dropdown-item" href="{$Up.PageByIdentifierCode('SilvercartRegistrationPage').Link}" title="<%t SilverCart\Model\Pages\Page.REGISTER 'Login' %>"> <small><%t SilverCart\Model\Pages\Page.REGISTER_NEW 'New customer?' %> <span class="text-primary"><%t SilverCart\Model\Pages\Page.REGISTER_HERE 'Register here.' %></span></small></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %>"><%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %></a>
                            <% loop $Children %>
                                <a class="dropdown-item" href="{$Link}" title="{$Title}">{$MenuTitle}</a>
                            <% end_loop %>
                        <% end_with %>
                            </div>
                        </div>
                    <% end_if %>
                        {$HeaderNavBeforeCartSelectContent}
                    <% if not $EditableShoppingCart %>
                        <div class="dropdown-cart">
                            <a id="cart-dropdown" class="btn dropdown-toggle text-left cart-preview" data-toggle="dropdown" title="<% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %>">
                                <% if $ShoppingCart.isFilled %><span class="position-relative"><span class="badge badge-success badge-cart position-absolute">{$CurrentMember.ShoppingCart.getQuantity}</span></span><% end_if %>
                                <span class="fa fa-3x fa-shopping-cart float-left mr-1 position-relative bottom-2"></span> <%t SilverCart\Model\Pages\Page.CART 'Cart' %><br/><strong><% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %></strong>
                                <span class="caret"></span>
                            </a>
                            <section class="dropdown-menu cart-content" aria-labelledby="cart-dropdown">
                                <% include SilverCart/Model/Pages/ShoppingCartDropdown %>
                            </section>
                        </div>
                    <% end_if %>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>