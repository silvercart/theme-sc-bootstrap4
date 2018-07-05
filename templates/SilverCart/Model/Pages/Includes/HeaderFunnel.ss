<header id="main-header" class="container-fluid clearfix">
    <% include SilverCart/Model/Pages/HeaderPreHeader %>
    <div class="row">
        <div class="siteLogo col-12 col-md-4">
            <a class="logo-link" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                <img src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.Link}<% else %>{$BaseHref}resources/vendor/silvercart/silvercart/client/img/logo.png<% end_if %>" class="img-fluid w-50" alt="{$SiteConfig.Title}">
                <span class="d-none d-md-block small">{$SiteConfig.Title} - {$SiteConfig.Tagline}</span>
            </a>
        </div>
    </div>
</header>