<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="{$ContentLocale}"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="{$ContentLocale}"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="{$ContentLocale}"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="{$ContentLocale}"> <!--<![endif]-->
    <head>
        <% include SilverCart/Model/Pages/Head %>
    </head>
    <body lang="{$ContentLocale}" class="{$ClassNameCSS}">
        <% include SilverCart/Model/Pages/HeaderCustomHtml %>
        <div id="main-container" class="clearfix">
            <% include SilverCart/Model/Pages/HeaderFunnel %>
            <div class="main" id="main"><div class="content container">
                {$Layout}
            </div></div>
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
    </body>
</html>
