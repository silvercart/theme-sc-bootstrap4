<% if $SubElements %>
<nav class="widget">
    <% if $SubElementsTitle %>
        <% if $SubElementsTitleLink %>
    <a class="h4 d-block <% if $LinkingMode == current %>active<% end_if %>" href="{$SubElementsTitleLink}">{$SubElementsTitle}</a>
        <% else %>
    <h4>{$SubElementsTitle}</h4>
        <% end_if %>
    <% end_if %>
    <ul class="nav flex-column">
        <% loop $SubElements %>
        <li class="{$FirstLast}">
            <div class="nav-item">
                <a href="{$Link}" class="nav-link highlight <% if $LinkingMode == current %>active<% end_if %>" title="{$Title.XML}">{$MenuTitle.XML}</a>
            </div>
            <% if $Children %>
            <ul class="nav flex-column level-1">
                <% loop $Children %>
                <li class="{$FirstLast} nav-item">
                    <a href="{$Link}" class="nav-link highlight <% if $LinkingMode == current %>active<% end_if %>" title="{$Title.XML}">{$MenuTitle.XML}</a>
                </li>
                <% end_loop %>
            </ul>
            <% end_if %>
        </li>
        <% end_loop %>
    </ul>
</nav>
<% end_if %>
