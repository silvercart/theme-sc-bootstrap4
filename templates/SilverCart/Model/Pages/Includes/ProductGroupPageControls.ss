<% if $HasMoreProductsThan(0) %>
    <% if $ActiveProducts && $hasMoreGroupViewsThan(1) %>
<div class="inline pull-xs-right">
    <div class="btn-group">
        <% loop $GroupViews %>
            <% if $isActive %>
        <span class="btn btn-sm btn-primary active"  title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></span>
            <% else %>
        <a class="btn btn-sm btn-secondary" href="{$CurrentPage.Link}switchGroupView/{$Code}" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></a>
            <% end_if %>
        <% end_loop %>
    </div>
</div>
    <% else_if $Children && $hasMoreGroupHolderViewsThan(1) %>
<div class="inline pull-xs-right">
    <div class="btn-group">
            <% loop $GroupHolderViews %>
                <% if $isActiveHolder %>
        <span class="btn btn-sm btn-primary active"  title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></span>
                <% else %>
        <a class="btn btn-sm btn-secondary" href="{$CurrentPage.Link}switchGroupView/{$Code}" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></a>
    </div>
</div>
            <% end_if %>
        <% end_loop %>
    <% end_if %>
<% end_if %>