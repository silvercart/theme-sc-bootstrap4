<% if $Elements %>
    <% loop $Elements %>
<div class="silvercart-product-group-page-list-item {$EvenOdd}">
    <div class="card card-product {$EvenOdd} {$FirstLast}" id="product{$ID}">
        <% if $hasPortraitOrientationImage %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_PortraitOrientation %>
        <% else %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_LandscapeOrientation %>
        <% end_if %>
    </div>
</div>
    <% end_loop %>
<% end_if %>
