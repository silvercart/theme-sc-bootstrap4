<ul class="dropdown-menu" data-dropdown-in="lightSpeedIn" data-dropdown-out="lightSpeedOut" id="navbarToggleExternalContent{$ID}">
    <li class="col nav-item">
        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="heading nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a>
        <% if $ActiveProducts.exists %><span class="badge badge-pill badge-primary">{$ActiveProducts.Count}</span><% end_if %>
    </li>
    <ul class="dropdown-content row nav">
<% loop $Children %>
    <% if $hasProductsOrChildren %>
        <li class="col-6 col-xs-2 col-md-3 {$Parent.MegaMenuColumnClass.colBreak} {$Parent.MegaMenuColumnClass.childCount} mt-3 nav-item">
        <% if $Children %>
            <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a>
            <% if $ActiveProducts.exists %><span class="badge badge-pill badge-primary">{$ActiveProducts.Count}</span><% end_if %>
            <% loop $Children %>
                <% if $hasProductsAndChildren %>
                    <% if $First %>
                        <%-- todo 3 level menu not needed yet for standard --%>
            <div class="collapse nav" id="navbarToggleExternalContent{$Up.ID}">
                <ul class="navbar-nav ">
                    <% end_if %>
                    <% if $Children %>
                    <li class="nav-item  dropdown">
                        <a data-target="#subvlist{$ID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="{$Link}" id="subnavlist{$ID}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="dropdown-toogle <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">
                        <% if $groupPicture %>
                            <span class="ico"><img src="{$groupPicture.Pad(30,30).Url}" alt="{$MenuTitle.XML}" class="img-responsive" /></span>
                        <% else %>
                            <span class="fa fa-chevron-right"></span>
                        <% end_if %>
                        </a>
                        <% if $ActiveProducts.exists %><span class="badge badge-pill badge-primary">{$ActiveProducts.Count}</span><% end_if %>
                    </li>
                    <% else %>
                    <li>
                        <a href="{$Link}" id="subnavlist{$ID}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="<% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">
                        <% if $groupPicture %>
                            <span class="ico"><img src="{$groupPicture.Pad(30,30).Url}" alt="{$MenuTitle.XML}" class="img-responsive" /></span>
                        <% else %>
                            <span class="fa fa-chevron-right"></span>
                        <% end_if %>
                        </a>
                        <% if $ActiveProducts.exists %><span class="badge badge-pill badge-primary">{$ActiveProducts.Count}</span><% end_if %>
                    </li>
                    <% end_if %>
                    <% if $Last %>
                </ul>
            </div>
                    <% end_if %>
                <% end_if %>
            <% end_loop %>
        <% else %>
            <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a>
            <% if $ActiveProducts.exists %><span class="badge badge-pill badge-primary">{$ActiveProducts.Count}</span><% end_if %>
        <% end_if %>
        </li>
    <% end_if %>
<% end_loop %>
    </ul>
</ul>