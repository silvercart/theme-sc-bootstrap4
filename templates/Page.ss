<!DOCTYPE html>
<html lang="{$ContentLocale}">
    <head>
        <% include SilverCart/Model/Pages/Head %>
    </head>
    <body lang="{$ContentLocale}" class="{$ClassNameCSS}">
        <% include SilverCart/Model/Pages/HeaderCustomHtml %>
        <div id="main-container" class="clearfix">
            <% include SilverCart/Model/Pages/HeaderFull %>
            <% include SilverCart/Model/Pages/Navigation %>
            <main id="main" class="main container-fluid clearfix">{$Layout}</main>
            <% include SilverCart/Model/Pages/Footer %>
        </div>
        {$ModuleHtmlInjections}
        <% if $isLive %>
            <% with $SiteConfig %>
                {$GoogleAnalyticsTrackingCode.RAW}
                {$PiwikTrackingCode.RAW}
            <% end_with %>
        <% end_if %>
        <% include SilverCart/Model/Pages/FooterCustomHtml %>
        <% include SilverCart/Model/Pages/NavigationScroll %>
    </body>
</html>