<% if $HasMoreProductsThan(0) %>
<div class="silvercart-product-group-page-selectors clearfix shadow-sm p-1 mb-3">
    <% if $CurrentPage.productsOnPagesString %>
    <span class="btn products-on-page float-left">{$CurrentPage.productsOnPagesString}</span>
    <% end_if %>
    <% include SilverCart/Model/Pages/ProductGroupPageControls %>
    {$ProductGroupPageSelectorsForm}
</div>
    <% include SilverCart/Model/Pages/ProductPagination %>
<% end_if %>