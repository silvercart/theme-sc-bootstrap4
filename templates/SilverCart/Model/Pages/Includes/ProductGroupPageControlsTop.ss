<% if $HasMoreProductsThan(0) %>
<section class="silvercart-product-group-page-selectors clearfix productFilter mb-3">
    <% if $CurrentPage.productsOnPagesString %>
    <span class="btn btn-sm products-on-page float-left">{$CurrentPage.productsOnPagesString}</span>
    <% end_if %>
    <% include SilverCart/Model/Pages/ProductGroupPageControls %>
    {$ProductGroupPageSelectorsForm}
</section>
    <% include SilverCart/Model/Pages/ProductPagination %>
<% end_if %>