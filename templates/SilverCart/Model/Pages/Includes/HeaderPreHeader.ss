<div id="pre-header" class="clearfix">
    <div class="container">
        <div class="clearfix row">
            <div class="col-md-5 col-sm-12 col-xs-12">
                <nav class="nav">
            <% if $CurrentRegisteredCustomer %>
                    <span class="hidden-sm-down">{$CurrentRegisteredCustomer.Name}</span>
                <% if $CurrentRegisteredCustomer.isAdmin %>
                    <a class="highlight nav-link" href="{$baseHref}admin"  title="<%t SilverCart\Model\Pages\Page.ADMIN_AREA 'Admin Access' %>"><span class="fa fa-lock"></span> <%t SilverCart\Model\Pages\Page.ADMIN_AREA 'Admin Access' %></a>
                <% end_if %>
                    <a class="highlight nav-link" href="{$PageByIdentifierCode('SilvercartMyAccountHolder').Link}" title="<%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %>"><span class="fa fa-user"></span> <%t SilverCart\Model\Pages\Page.MYACCOUNT 'my account' %></a>
                    <a class="highlight nav-link" href="{$baseHref}Security/logout/" title="<%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %>"> <span class="fa fa-sign-out"></span> <%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %></a>
            <% else %>
                    <a class="highlight nav-link" href="{$PageByIdentifierCode('SilvercartRegistrationPage').Link}" title="<%t SilverCart\Model\Pages\Page.REGISTER 'Register' %>"><span class="fa fa-universal-access"></span> <%t SilverCart\Model\Pages\Page.REGISTER 'Register' %></a>
                    <a class="highlight nav-link" href="{$PageByIdentifierCode('SilvercartMyAccountHolder').Link}" title="<%t SilverCart\Model\Pages\Page.LOGIN 'Login' %>"><span class="fa fa-sign-in"></span> <%t SilverCart\Model\Pages\Page.LOGIN 'Login' %></a>
            <% end_if %>
                </nav>
            </div>
            <% with $PageByIdentifierCode('SilvercartMetaNavigationHolderService') %>
                <% if $Children %>
            <nav class="col-lg-7 col-md-7 hidden-sm-down">
                <ul class="pull-sm-right float-sm-right list-inline">
                        <% loop $Children %>
                    <li class="list-inline-item"><a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>" class="{$LinkingMode}">{$MenuTitle.XML}</a></li>
                        <% end_loop %>
                </ul>
            </nav>
                <% end_if %>
            <% end_with %>
        </div>
    </div>
</div>