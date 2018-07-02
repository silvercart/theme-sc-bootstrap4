<% loop $Children %>
    <% if $hasProductsOrChildren %>
    <div class="col-lg-{$Parent.MegaMenuColumnClass.part} col-xs-6 {$Parent.MegaMenuColumnClass.colBreak} {$Parent.MegaMenuColumnClass.childCount}">
        <% if $Children %>
        <ul class="nav list-group subsubmenu">
            <li class="heading">
                <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}</a><% if $ActiveProducts.Count > 0 %><span class="tag tag-pill tag-default">{$ActiveProducts.Count}</span><% end_if %>
            </li>
            <% loop $Children %>
                <% if $hasProductsAndChildren %>
            <li <% if $Children %>class="dropdown"<% end_if %>>
                <a <% if $Children %>data-target="#subvlist{$ID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"<% end_if %> href="{$Link}" id="subnavlist{$ID}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="list-group-item <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %><% if $Children %> dropdown-toogle<% end_if %>">
                    <% if $groupPicture %>
                    <i class="ico">
                        <% with $groupPicture %>
                        <img src="{$CroppedImage(30,30).Url}" alt="{$MenuTitle.XML}" class="img-responsive" />
                        <% end_with %>
                    </i>
                    <% else %>
                    <span class="fa fa-chevron-right"></span>
                    <% end_if %>
                    <% if $ActiveProducts.Count > 0 %><span class="tag tag-pill tag-default"> {$ActiveProducts.Coun}</span><% end_if %>
                </a>
            </li>
                <% end_if %>
            <% end_loop %>
        </ul>
        <% else %>
        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>" class="heading nav-link <% if $isCurrent %>active<% else_if $isSection %>section<% end_if %>">{$MenuTitle.XML}<% end_if %></a><% if $ActiveProducts.Count > 0 %><span class="tag tag-pill tag-default">{$ActiveProducts.Count}</span>
        <% end_if %>
    </div>
    <% end_if %>
<% end_loop %>

