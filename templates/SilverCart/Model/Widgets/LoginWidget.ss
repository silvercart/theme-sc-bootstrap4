<% if $CurrentMember.currentRegisteredCustomer %>
    <% cached $WidgetCacheKey %>
<header><h3><%t SilverCart\Model\Widgets\LoginWidget.TITLE_LOGGED_IN 'My account' %></h3></header>
        <% if $MyAccountPage.Children %>
<nav class="widget-login logged-in">
    <ul class="nav flex-column nav-fill">
        <% loop $MyAccountPage.Children %>
        <li class="nav-item {$LinkingMode}">
            <a href="{$Link}" title="{$Title.HTML}" class="nav-link <% if $IsActivePage %>active<% end_if %> <% if $IsSectionPage %>section<% end_if %>">{$MenuTitle.XML}</a>
        </li>
        <% end_loop %>
    </ul>
</nav>
        <% end_if %>
    <% end_cached %>
<% else %>
<header><h3><%t SilverCart\Model\Widgets\LoginWidget.TITLE_NOT_LOGGED_IN 'Login' %></h3></header>
<div class="widget-login logged-out clearfix">
    {$LoginWidgetForm}
    <h4 class="mt-4"><%t SilverCart\Model\Pages\MyAccountHolder.WANTTOREGISTER 'Do you want to register?' %></h4>
    <p><%t SilverCart\Model\Pages\MyAccountHolder.REGISTER_ADVANTAGES_TEXT 'By registering you can reuse your data like invoice or delivery addresses on your next purchase.' %></p>
    <a class="btn btn-sm btn-light float-right" href="{$PageByIdentifierCodeLink('SilvercartRegistrationPage')}"><%t SilverCart\Model\Pages\MyAccountHolder.GOTO_REGISTRATION 'Go to the registration form' %> <span class="fa fa-arrow-right"></span></a>
</div>
<% end_if %>