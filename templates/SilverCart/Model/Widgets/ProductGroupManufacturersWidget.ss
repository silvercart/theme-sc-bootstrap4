<% if $ShowWidget && $Manufacturers %>
    <% if $FrontTitle %>
<header><h3 <% if $isFilteredByManufacturer %>class="is-filtered"<% end_if %>>{$FrontTitle}</h3></header>
    <% end_if %>
<ul class="list-unstyled">
    <% loop $Manufacturers %>
        <% if $Title %>
    <li><a href="{$Link}" title="{$Title}"><% if $logo %>{$logo.Pad(150,100)}<% else %>{$Title}<% end_if %></a></li>
        <% end_if %>
    <% end_loop %>
</ul>
    <% if $isFilteredByManufacturer %>
<a class="btn btn-sm btn-warning" href="{$PageLink}" title="<%t SilverCart\Model\Widgets\ProductGroupManufacturersWidget.RESETFILTER 'Show all' %>"><%t SilverCart\Model\Widgets\ProductGroupManufacturersWidget.RESETFILTER 'Show all' %></a>
    <% end_if %>
<% end_if %>