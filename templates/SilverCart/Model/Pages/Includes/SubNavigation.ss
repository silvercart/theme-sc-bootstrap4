<% if $SubElements %>
<nav class="categories widget">
    <ul class="nav flex-column">
        <% loop $SubElements %>
        <li class="{$FirstLast} nav-item">
            <a href="{$Link}" class="nav-link highlight <% if $LinkingMode == current %>active<% end_if %>" title="{$Title.XML}">{$MenuTitle.XML}</a>
            <% if $Children %>
            <ul class="submenu nav flex-column">
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
