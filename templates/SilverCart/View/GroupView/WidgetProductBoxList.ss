<% if $Elements %>
    <% if not $Top.useSlider %>
<div class="sc-products sc-products-vertical clearfix">
    <% end_if %>
        <% loop $Elements %>
<div class="silvercart-product-group-page-list-item {$EvenOdd}">
    <div class="card card-product {$EvenOdd} {$FirstLast}">
        <% if $hasPortraitOrientationImage %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_PortraitOrientation %>
        <% else %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_LandscapeOrientation %>
        <% end_if %>
    </div>
</div>
    <% end_loop %>
    <% if not $Top.useSlider %>
</div>
    <% end_if %>   
<% end_if %>