<header id="main-header" class="container-fluid clearfix border-bottom">
    <div class="row  justify-content-center">
        <div class="siteLogo col-12 col-sm-5 col-md-auto">
            <a class="logo-link d-inline-block" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                <img src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.ScaleHeight(70).Link}<% else %>{$BaseHref}resources/vendor/silvercart/silvercart/client/img/logo.png<% end_if %>" class="img-fluid" alt="{$SiteConfig.Title}">
                <span class="sr-only">{$SiteConfig.Title} - {$SiteConfig.Tagline}</span>
            </a>
        </div>
        <div class="smtb col-12 col-sm clearfix justify-content-sm-end p-0 my-auto d-none d-md-block">
            <div class="row no-gutters justify-content-sm-end" role="group" aria-label="First group">
                <nav class="col-12 col-sm-auto clearfix btn-toolbar pb-2 pl-2">
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
                <% if $EditableShoppingCart && $ShoppingCart.isFilled %>
                    <a class="btn btn-text border-left" href="{$PageByIdentifierCode('SilvercartCheckoutStep').Link}" title="<%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %>">
                        <span class="fa fa-2x fa-credit-card position-relative top-4"></span> <strong><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-caret-right"></span></strong>
                    </a>
                <% end_if %>
                </nav>
            </div>
        </div>
    </div>
</header>