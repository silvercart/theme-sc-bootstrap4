<div id="pre-header" class="clearfix row py-2">
    <nav class="col-md-4">  
<% if $CurrentRegisteredCustomer %>
        <h3 class="sr-only"><%t SilverCart\Model\Pages\Page.WELCOME 'Welcome' %></h3>
        <span class="list-inline-item">{$CurrentRegisteredCustomer.Name}</span>
    <% if $CurrentRegisteredCustomer.isAdmin %>
        <a class="list-inline-item" href="{$baseHref}admin"  title="<%t SilverCart\Model\Pages\Page.ADMIN_AREA 'Admin Access' %>"><span class="fa fa-lock"></span> <%t SilverCart\Model\Pages\Page.ADMIN_AREA 'Admin Access' %></a>
    <% end_if %>
        <a class="list-inline-item" href="{$PageByIdentifierCode('SilvercartMyAccountHolder').Link}" title="<%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %>"><span class="fa fa-user"></span> <%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %></a>
        <a class="list-inline-item" href="{$logoutURL}" title="<%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %>"> <span class="fa fa-sign-out"></span> <%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %></a>
<% else %>
        <h3 class="sr-only"><%t SilverCart\Model\Pages\Page.REGISTER 'Register' %></h3>
        <a class="list-inline-item" href="{$PageByIdentifierCode('SilvercartRegistrationPage').Link}" title="<%t SilverCart\Model\Pages\Page.REGISTER 'Register' %>"><span class="fa fa-universal-access"></span> <%t SilverCart\Model\Pages\Page.REGISTER 'Register' %></a>
        <a class="list-inline-item" href="{$PageByIdentifierCode('SilvercartMyAccountHolder').Link}" title="<%t SilverCart\Model\Pages\Page.LOGIN 'Login' %>"><span class="fa fa-sign-in"></span> <%t SilverCart\Model\Pages\Page.LOGIN 'Login' %></a>
<% end_if %>
    </nav>
<% with $PageByIdentifierCode('SilvercartMetaNavigationHolderService') %>
    <% if $Children %>
    <nav class="col-md-8 d-none d-md-block text-right">
        <h3 class="sr-only">{$Title.XML}</h3>
        <ul class="list-inline">
        <% loop $Children %>
            <li class="list-inline-item"><a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>" class="{$LinkingMode}">{$MenuTitle.XML}</a></li>
        <% end_loop %>
        </ul>
    </nav>
    <% end_if %>
<% end_with %>
</div>