<% if $Elements %>
    <% if not $Top.useSlider %>
<div class="sc-products sc-products-vertical clearfix no-slider">
    <% end_if %>
    <% loop $Elements %>
        <% if $hasPortraitOrientationImage %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_PortraitOrientation %>
        <% else %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_LandscapeOrientation %>
        <% end_if %>
    <% end_loop %>
    <% if not $Top.useSlider %>
</div>
    <% end_if %>   
<% end_if %>