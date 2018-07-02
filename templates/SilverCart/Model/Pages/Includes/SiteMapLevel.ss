<div class="card">
    <ul>
        <li>
        <% if $Children %>
            <div class="card-header h5">
                <a class="list-group-item" href="{$Link}" title="{$Title}">{$MenuTitle}</a>
            </div>
            <% loop $Children %>
                {$SiteMapChildren}
            <% end_loop %>
        <% else %>
            <a class="btn btn-sm" href="{$Link}" title="{$Title}">{$MenuTitle}</a>
        <% end_if %>
        </li>
    </ul>
</div>



           
       