<% if $HasMoreProductsThan(0) %>
<div class="silvercart-product-group-page-selectors clearfix productFilter">
    <% if $CurrentPage.productsOnPagesString %>
    <span class="btn btn-sm products-on-page pull-sm-left">{$CurrentPage.productsOnPagesString}</span>
    <% end_if %>
    <% include SilverCart/Model/Pages/ProductGroupPageControls %>
    {$ProductGroupPageSelectorsForm}
</div>
    <% include SilverCart/Model/Pages/ProductPagination %>
<% end_if %>