<!DOCTYPE html>
<html lang="{$ContentLocale}">
    <head>
        <% include SilverCart/Model/Pages/Head %>
    </head>
    <body lang="{$ContentLocale}" class="{$ClassNameCSS} bg-gray-dark">
        <% include SilverCart/Model/Pages/HeaderCustomHtml %>
        <div id="main-container" class="clearfix">
            <main id="main" class="main container-fluid clearfix">{$Layout}</main>
        </div>
        {$ModuleHtmlInjections}
        <% if $isLive %>
            <% with $SiteConfig %>
                {$GoogleAnalyticsTrackingCode.RAW}
                {$MatomoTrackingCode.RAW}
            <% end_with %>
        <% end_if %>
        <% include SilverCart/Model/Pages/FooterCustomHtml %>
    </body>
</html>