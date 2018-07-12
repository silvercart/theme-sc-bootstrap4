<% cached $MainNavigationCacheKey %>
<nav id="navbar" class="navbar navbar-expand-md static-top">
    <div class="container-fluid">
        <div class="icon-bar row w-100 mx-0 d-md-none" role="group">
            <div class="col-4 px-0 justify-content-sm-start">
                <a class="navbar-brand d-block" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                <% if $SiteConfig.ShopNavigationLogo %>
                    <img class="logo-icon img-fluid" alt="{$SiteConfig.Title}" src="{$SiteConfig.ShopNavigationLogo.Pad(100,35,f0f0f0).URL}" />
                <% else %>
                    <img class="logo-icon img-fluid" alt="{$SiteConfig.Title}" src="{$SiteConfig.ShopLogo.Pad(100,35,f0f0f0).URL}" />
                <% end_if %>
                </a>
            </div>
            <div class="col-3 px-0 justify-content-sm-end">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainnav" aria-controls="mainnav" aria-expanded="false" aria-label="Navigation"><span class="navbar-toggler-icon">&#9776;</span></button>
            </div>
            <div class="mobile-quicksearch col-5 p-1 justify-content-sm-end"></div>
        </div>
        <div id="mainnav" class="collapse navbar-collapse position-relative">
            <ul class="navbar-nav nav-fill w-100">
            <% loop $PageByIdentifierCode('SilvercartFrontPage') %>
                <li class="nav-item d-none d-lg-block">
                    <a class="nav-link navlink-home <% if $isCurrent %>active<% end_if %>" href="{$Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                    <% if $SiteConfig.ShopNavigationLogo %>
                        <img class="img-fluid" src="{$SiteConfig.ShopNavigationLogo.ScaleHeight(48).URL}" alt="{$SiteConfig.Title}" />
                    <% else %>
                        <span class="fa fa-2x fa-home"></span>
                    <% end_if %>
                    </a>
                </li>
            <% end_loop %>
            <% with $MainNavigationRootPage %>
                <% loop $Children %>
                    <% if $hasProductsOrChildren %>
                        <% if $Children %>
                <li id="navlist{$ID}" class="nav-item dropdown">
                    <a href="{$Link}" title="{$MenuTitle.XML}" aria-controls="navbarToggleExternalContent{$ID}" aria-expanded="false" aria-label="Toggle navigation" class="nav-link dropdown-toggle <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>" data-toggle="dropdown" data-animation="1">{$MenuTitle.XML}</a>
                    <% include SilverCart/Model/Pages/NavigationSubmenu %>
                </li>
                        <% else %>
                <li id="navlist{$ID}" class="nav-item">
                    <a href="{$Link}" title="{$MenuTitle.XML}" class="nav-link rootlink <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a>
                </li>
                        <% end_if %>
                    <% end_if %>
                <% end_loop %>
            <% end_with %>
            </ul>
        </div>
    </div>
</nav>
<% end_cached %>