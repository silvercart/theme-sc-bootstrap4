<% if $Elements %>
    <% loop $Elements %>
        <% if $hasPortraitOrientationImage %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_PortraitOrientation %>
        <% else %>
            <% include SilverCart/View/GroupView/ProductGroupPageList_LandscapeOrientation %>
        <% end_if %>
    <% end_loop %>
<% end_if %>
