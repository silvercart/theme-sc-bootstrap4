<% cached $MainNavigationCacheKey %>
<nav class="navbar yamm navbar-static-top navbar-full">
    <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse" data-target="#mainnav" aria-controls="mainnav" aria-expanded="false" aria-label="Navigation">&#9776;</button>
    <div class="container">
        <div id="mainnav" class="collapse navbar-toggleable-sm">
            <ul class="nav navbar-nav nav-justified">
            <% loop $PageByIdentifierCode('SilvercartFrontPage') %>
                <li class="nav-item hidden-lg-down">
                    <a class="nav-link navlink-home <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>" href="{$Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                    <% if $SiteConfig.ShopNavigationLogo %>
                        <span class="fa fa-2x fa-home"></span> <img class="logo-icon" alt="{$SiteConfig.Title}" src="{$SiteConfig.ShopNavigationLogo.Pad(115,42,f0f0f0).URL}" />
                    <% else %>
                        <span class="fa fa-2x fa-home"></span> <img class="logo-icon" alt="{$SiteConfig.Title}" src="{$SiteConfig.ShopLogo.Pad(115,42,f0f0f0).URL}" />
                    <% end_if %>
                    </a>
                </li>
            <% end_loop %>
            <% with $MainNavigationRootPage %>
                <% loop $Children %>
                    <% if $hasProductsOrChildren %>
                <li id="navlist{$ID}" class="nav-item <% if $Children  %>dropdown yamm-fw<% end_if %>">
                        <% if $Children %>
                    <a href="{$OriginalLink}" title="{$MenuTitle.XML}" class="nav-link dropdown-toggle <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>" data-toggle="dropdown" data-animation="1">{$MenuTitle.XML}</a>
                    <ul class="dropdown-menu" data-dropdown-in="lightSpeedIn" data-dropdown-out="lightSpeedOut">
                        <li>
                            <a href="{$OriginalLink}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>" class="heading nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a><% if $ActiveProducts.Count > 0 %><span class="tag tag-pill tag-default">{$ActiveProducts.Count}</span><% end_if %>
                            <div class="yamm-content">
                                <% if $ClassName == 'SilverStripe\CMS\Model\RedirectorPage' %>
                                    <% with $LinkTo %>
                                        <% include SilverCart/Model/Pages/NavigationSubmenu %>
                                    <% end_with %>
                                <% else %>
                                    <% include SilverCart/Model/Pages/NavigationSubmenu %>
                                <% end_if %>
                            </div>
                        </li>
                    </ul>
                        <% else %>
                    <a href="{$Link}" title="{$MenuTitle.XML}" class="nav-link rootlink <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a>
                        <% end_if %>
                </li>
                    <% end_if %>
                <% end_loop %>
            <% end_with %>
            </ul>
        </div>
    </div>
</nav>
<% end_cached %>