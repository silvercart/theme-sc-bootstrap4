<ul>
    <li>
        <div class="nav-item">
            <a class="nav-link" href="{$Link}" title="{$Title}">{$MenuTitle}</a>
        </div>
    <% if $Children %>
        <% loop $Children %>
            {$SiteMapChildren}
        <% end_loop %>
    <% end_if %>
    </li>
</ul>



           
       