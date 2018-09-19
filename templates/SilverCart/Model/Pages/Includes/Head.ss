<% base_tag %>
{$SiteConfig.GoogleWebmasterCode.Raw}
<title><% if $ClassName == "SilverCart\Model\Pages\FrontPage" %>{$SiteConfig.Title} - {$SiteConfig.Tagline}<% else %><% if $MetaTitle %>{$MetaTitle}<% else %>{$Title}<% end_if %> <%t SilverCart\Model\Pages\Page.MetaTitleAt 'at {shopTitle}' shopTitle=$SiteConfig.Title %><% end_if %></title>
{$MetaTags(false)}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="robots" content="index, follow">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%--{$RequireColorSchemeCSS('theme-', 'default')}--%>
<% require themedCSS("client/css/theme-default") %>
<% require themedCSS("client/css/animate.min") %>
<% require themedCSS("client/css/font-awesome.min") %>
<% require themedCSS("client/css/jquery.fancybox") %>
<% require themedCSS("client/css/slidorion") %>
<% require themedJavascript("client/js/jquery-3.2.1.min") %>
{$RequireI18nJavaScript}
{$RequireExtendedJavaScript}
{$RequireCookieBannerJavaScript}
<% require themedJavascript("client/js/bootstrap.bundle.min") %>
<% require themedJavascript("client/js/jquery-ui.min") %>
<% require themedJavascript("client/js/jquery.fancybox.min") %>
<% require themedJavascript("client/js/lazyload") %>
<% require themedJavascript("client/js/sly.min") %>
<% require themedJavascript("client/js/silvercart.theme") %>
<% require themedJavascript("client/js/silvercart.attributes") %>
<% require themedJavascript("client/js/silvercart.sly") %>
<% require themedJavascript("client/js/jquery.slidorion.min") %>
<% require themedJavascript("client/javascript/jquery.pixeltricks.tools") %>
<% require themedJavascript("client/javascript/jquery.cookie") %>
<% require themedJavascript("client/javascript/silvercart.js") %>
<% if $SiteConfig.MobileTouchIcon %>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<link rel="apple-touch-icon" sizes="76x76" href="{$SiteConfig.MobileTouchIcon.Pad(76,76).Link}" />
<link rel="apple-touch-icon" sizes="120x120" href="{$SiteConfig.MobileTouchIcon.Pad(120,120).Link}" />
<link rel="apple-touch-icon" sizes="152x152" href="{$SiteConfig.MobileTouchIcon.Pad(152,152).Link}" />
<link rel="apple-touch-icon" sizes="180x180" href="{$SiteConfig.MobileTouchIcon.Pad(180,180).Link}" />
<link rel="icon" sizes="192x192" href="{$SiteConfig.MobileTouchIcon.Pad(192,192).Link}">
<link rel="apple-touch-startup-image" href="{$SiteConfig.MobileTouchIcon.Link}">
<% end_if %>
<% if $SiteConfig.Favicon %>
<link rel="shortcut icon" href="{$SiteConfig.Favicon.Link}">
<% end_if %>
<% include SilverCart/Model/Pages/HeadCustomHtml %>