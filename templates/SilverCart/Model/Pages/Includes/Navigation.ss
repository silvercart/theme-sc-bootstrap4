<% cached $MainNavigationCacheKey %>
<% with $SiteConfig %>
    <% if $BrandNavigation %>
        <div class="container-fluid d-flex my-3 justify-content-between">
            <% loop $BrandNavigation.Filter('IsActive', 1).Sort('Sort', 'ASC') %>
                <a href="{$Link.LinkURL}"><img src="$Image.ScaleHeight(40).Link" /></a>
            <% end_loop %>
        </div>
    <% end_if %>
<% end_with %>
<nav id="navbar" class="navbar navbar-expand-md static-top">
    <div class="container-fluid">
        <div class="icon-bar row w-100 mx-0 d-md-none" role="group">
            <div class="col-auto px-0 justify-content-sm-start d-sm-none">
                <a class="navbar-brands d-block" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                <% if $SiteConfig.ShopNavigationLogo %>
                    <img class="logo-icon img-fluid" alt="{$SiteConfig.Title}" src="{$SiteConfig.ShopNavigationLogo.ScaleHeight(40).URL}" />
                <% else %>
                    <img class="logo-icon img-fluid" alt="{$SiteConfig.Title}" src="{$SiteConfig.ShopLogo.ScaleHeight(40).URL}" />
                <% end_if %>
                </a>
            </div>
            <div class="col px-0 justify-content-sm-end">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainnav" aria-controls="mainnav" aria-expanded="false" aria-label="Navigation"><span class="navbar-toggler-icon">&#9776;</span></button>
            </div>
            <div class="col p-1 justify-content-sm-end mobile-quicksearch">{$QuickSearchForm("QuickSearchFormMobile")}</div>
        </div>
        <div id="mainnav" class="collapse navbar-collapse position-relative">
            <ul class="navbar-nav nav-fill w-100">
            <% with $PageByIdentifierCode('SilvercartFrontPage') %>
                <li class="nav-item d-none d-lg-block">
                    <a class="nav-link navlink-home <% if $isCurrent %>active<% end_if %>" href="{$Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                    <% if $SiteConfig.ShopNavigationLogo %>
                        <img class="img-fluid" src="{$SiteConfig.ShopNavigationLogo.ScaleHeight(48).URL}" alt="{$SiteConfig.Title}" />
                    <% else %>
                        <span class="fa fa-2x fa-home"></span>
                    <% end_if %>
                    </a>
                </li>
            <% end_with %>
            <% with $MainNavigationRootPage %>
                <% loop $Children %>
                    <% if $Children %>
                <li id="navlist{$ID}" class="nav-item dropdown" data-item-id="{$ID}">
                    <a href="{$Link}" title="{$MenuTitle.XML}" class="nav-link dropdown-toggle <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>" data-toggle="dropdown">{$MenuTitle.XML}</a>
                    <ul class="dropdown-menu loading" data-dropdown-in="lightSpeedIn" data-dropdown-out="lightSpeedOut" id="navbarToggleExternalContent{$ID}">
                        <li class="col nav-item text-gray py-4"><span class="spinner-border spinner-border-lg"></span></li>
                    </ul>
                </li>
                    <% else %>
                <li id="navlist{$ID}" class="nav-item" data-item-id="{$ID}">
                    <a href="{$Link}" title="{$MenuTitle.XML}" class="nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a>
                </li>
                    <% end_if %>
                <% end_loop %>
            <% end_with %>
            </ul>
        </div>
    </div>
</nav>
<% end_cached %>