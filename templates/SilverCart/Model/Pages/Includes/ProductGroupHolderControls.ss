<% if $ViewableChildren %>
    <% if $ViewableChildren.MoreThanOnePage || $hasMoreGroupHolderViewsThan(1) %>
<div class="productFilters clearfix mb-3">
        <% if $hasMoreGroupHolderViewsThan(1) %>
            <% if $ViewableChildren.MoreThanOnePage %>
    <div class="float-left">
        <% include SilverCart/Model/Pages/ProductGroupPagination %>
    </div>
            <% end_if %>
    <div class="form-horizontal float-right text-center">
        <div class="btn-group btn-group-sm">
            <% loop $GroupHolderViews %>
                <% if $isActiveHolder %>
            <span class="btn btn-primary active" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></span>
                <% else %>
            <a class="btn btn-secondary" href="{$CurrentPage.Link}switchGroupHolderView/{$Code}" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></a>
                <% end_if %>
            <% end_loop %>
        </div>
    </div>
        <% else_if $ViewableChildren.MoreThanOnePage %>
            <% include SilverCart/Model/Pages/ProductGroupPagination %>
        <% end_if %>
</div>
    <% end_if %>
<% end_if %>