<% if $Elements %>
<div class="row clearfix">
    <% loop $Elements %>
        <% include SilverCart\View\GroupView\ProductGroupTile %>
    <% end_loop %>
</div>
<% end_if %>