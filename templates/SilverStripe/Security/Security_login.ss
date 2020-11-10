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
        {$RequireExternalResourcesForBody}
        <% include SilverCart/Model/Pages/FooterCustomHtml %>
    </body>
</html>