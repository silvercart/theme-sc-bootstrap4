<% if $ProductAttributes && $ProductAttributeValues %>
<table class="table table-striped table-bordered">
    <tr>
        <th class="w-25">{$fieldLabel('ProductAttribute')}</th>
        <th class="w-75">{$fieldLabel('ProductAttributeValue')}</th>
    </tr>
    <% loop $AttributesWithValues %>
    <tr class="{$EvenOdd}">
        <td class="text-top pr-3">{$Attribute.Title}</td>
        <td class="text-top pr-3"><% loop $Values %><% if not $First %>, <% end_if %>{$Title}<% end_loop %></td>
    </tr>
    <% end_loop %>
</table>
<% end_if %>