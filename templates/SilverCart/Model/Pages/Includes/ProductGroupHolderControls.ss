<% if $ViewableChildren %>
    <% if $ViewableChildren.MoreThanOnePage || $hasMoreGroupHolderViewsThan(1) %>
<div class="productFilters clearfix">
        <% if $hasMoreGroupHolderViewsThan(1) %>
            <% if $ViewableChildren.MoreThanOnePage %>
    <div class="pull-sm-left">
        <% include SilverCart/Model/Pages/ProductGroupPagination %>
    </div>
            <% end_if %>
    <div class="form-horizontal pull-sm-right text-center">
        <div class="btn-group">
            <% loop $GroupHolderViews %>
                <% if $isActiveHolder %>
            <span class="btn btn-sm btn-primary active" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></span>
                <% else %>
            <a class="btn btn-sm btn-secondary" href="{$CurrentPage.Link}switchGroupHolderView/{$Code}" title="{$Label}"><span class="fa fa-groupview-{$Code}"></span></a>
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