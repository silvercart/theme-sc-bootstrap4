<h4><%t SilverCart\Model\Pages\ProductGroupPage.ShowOffersFor 'Show offers for' %></h4>
<ul class="list-unstyled mb-3 pb-3 border-bottom">
<% if $Parent.IsProductGroupPage %>
    <% include SilverCart\Model\Pages\ProductGroupSidebar_Parent %>
<% end_if %>
    <li class="ml-12"><strong>{$MenuTitle}</strong>
<% if $Children %>
        <ul class="list-unstyled ml-3">
    <% loop $Children %>
            <li><a href="{$Link}" title="{$Title}">{$MenuTitle}</a></li>
    <% end_loop %>
        </ul>
<% end_if %>
    </li>
</ul>
<% if $ShowPreorderableProducts || $ShowNewProducts || $ExtendedDynamicProductGroupNavigationItems %>
<ul class="list-unstyled mb-3 pb-3 border-bottom">
    <% if $ShowPreorderableProducts %>
    <li class="ml-12"><a href="{$Link('preorders')}" title="<%t SilverCart.Buy2 'Buy {title1} {title2}' title1=$Title title2=$fieldLabel('PreorderableProducts') %>">{$fieldLabel('PreorderableProducts')}</a></li>
    <% end_if %>
    <% if $ShowNewProducts %>
    <li class="ml-12"><a href="{$Link('newproducts')}" title="<%t SilverCart.Buy2 'Buy {title1} {title2}' title1=$Title title2=$fieldLabel('NewProducts') %>">{$fieldLabel('NewProducts')}</a></li>
    <% end_if %>
    <% if $ExtendedDynamicProductGroupNavigationItems %>
        <% loop $ExtendedDynamicProductGroupNavigationItems %>
    <li class="ml-12"><a href="{$Link}" title="{$Title}">{$MenuTitle}</a></li>
        <% end_loop %>
    <% end_if %>
</ul>
<% end_if %>