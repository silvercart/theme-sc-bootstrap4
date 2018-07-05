<% if $HasMoreProductsThan(0) %>
    <% if $ActiveProducts && $hasMoreGroupViewsThan(1) %>
<div class="float-right">
    <div class="btn-group btn-group-sm" role="group" aria-label="">
        <% loop $GroupViews %>
            <% if $isActive %>
        <span class="btn btn-primary active" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></span>
            <% else %>
        <a class="btn btn-secondary" href="{$CurrentPage.Link}switchGroupView/{$Code}" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></a>
            <% end_if %>
        <% end_loop %>
    </div>
</div>
    <% else_if $Children && $hasMoreGroupHolderViewsThan(1) %>
<div class="float-right">
    <div class="btn-group btn-group-sm" role="group" aria-label="">
            <% loop $GroupHolderViews %>
                <% if $isActiveHolder %>
        <span class="btn btn-primary active"  title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></span>
                <% else %>
        <a class="btn btn-secondary" href="{$CurrentPage.Link}switchGroupView/{$Code}" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></a>
    </div>
</div>
            <% end_if %>
        <% end_loop %>
    <% end_if %>
<% end_if %>