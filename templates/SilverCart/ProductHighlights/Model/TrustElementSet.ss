<% if $Items %>
<div class="header__welcome-mobile desktop d-none d-md-block h-auto py-1 bg-{$badgeColor} {$ExtraClasses}">
    <% if $Items.count == 3 %>
    <div class="container d-md-flex pt-0 justify-content-between">
    <% else %>
    <div class="container d-md-flex pt-0 justify-content-around">
    <% end_if %>
    <% loop $Items %>
        <div class="trust-element flex-grow-1 flex-shrink-1 flex-basis-0 {$ExtraClasses}">
            {$forTemplate}
        </div>
    <% end_loop %>
    </div>
</div>
<% end_if %>