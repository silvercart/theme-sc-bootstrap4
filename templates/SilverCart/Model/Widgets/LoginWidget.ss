<% if $CurrentMember.currentRegisteredCustomer %>
    <% cached $WidgetCacheKey %>
    <h3><%t SilverCart\Model\Widgets\LoginWidget.TITLE_LOGGED_IN 'My account' %></h3>
        <% if $MyAccountPage.Children %>
    <nav class="categories silvercart-product-group-navigation-widget">
        <div class="nav list-group">
            <% loop $MyAccountPage.Children %>
            <a href="{$Link}" title="{$Title.HTML}" class="list-group-item <% if $IsActivePage %>active<% end_if %> <% if $IsSectionPage %>section<% end_if %> level-1">{$MenuTitle.XML}</a>
            <% end_loop %>
        </div>
    </nav>
        <% end_if %>
    <% end_cached %>
<% else %>
    <div class="section-header clearfix">
        <h3><%t SilverCart\Model\Widgets\LoginWidget.TITLE_NOT_LOGGED_IN 'Login' %></h3>
    </div>

    <div class="silvercart-widget-content_frame silvercart-widget-login">
        {$LoginWidgetForm}

        <h4><%t SilverCart\Model\Pages\MyAccountHolder.WANTTOREGISTER 'Do you want to register?' %></h4>
        <p><%t SilverCart\Model\Pages\MyAccountHolder.REGISTER_ADVANTAGES_TEXT 'By registering you can reuse your data like invoice or delivery addresses on your next purchase.' %></p>
        <a class="btn btn-sm float-right" href="{$PageByIdentifierCodeLink('SilvercartRegistrationPage')}"><%t SilverCart\Model\Pages\MyAccountHolder.GOTO_REGISTRATION 'Go to the registration form' %> &raquo;</a>
    </div>
<% end_if %>