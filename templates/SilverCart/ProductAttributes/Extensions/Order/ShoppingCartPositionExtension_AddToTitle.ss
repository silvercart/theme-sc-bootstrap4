<% if $VariantAttributes.exists || $UserInputAttributes.exists %>
<ul class="silvercart-product-attribute-list">
    <% if $VariantAttributes.exists %>
        <% loop $VariantAttributes %>
    <li><span><em>{$ProductAttribute.Title}:</em></span> {$Title}</li>
        <% end_loop %>
    <% end_if %>
    <% if $UserInputAttributes.exists %>
        <% loop $UserInputAttributes %>
    <li><span><em>{$AttributeTitle}:</em></span> {$Title}</li>
        <% end_loop %>
    <% end_if %>
</ul>
<% end_if %>