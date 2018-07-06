<% cached $WidgetCacheKey %>
    <% if $Attributes %>
        <% loop $Attributes %>
            <% if not $First %>
</section>
<section class="widget clearfix silvercart-widget {$Top.ExtraCssClasses}" id="widget-{$Top.ID}-{$Pos}">
            <% end_if %>
    <header><h3 class="<% if $HasSelectedValues %>has-selected-values<% else %>has-no-selected-values<% end_if %>">{$Title}</h3></header>
    <div class="widget-product-attribute-filter">
        <ul class="list-unstyled mb-0">
            <% if $AssignedValues %>
                <% loop $AssignedValues %>
            <li><label for="silvercart-product-attribute-value-{$ID}"><input type="checkbox" name="silvercart-product-attribute-value-{$ID}" id="silvercart-product-attribute-value-{$ID}" class="silvercart-product-attribute-value silvercart-product-attribute-{$ProductAttribute.ID}" value="{$ID}" <% if $IsFilterValue %>checked="checked"<% end_if %> /> {$Title}</label></li>
                <% end_loop %>
            <% end_if %>
        </ul>
            <% if $HasSelectedValues %>
        <a href="#" data-id="{$ID}" class="remove-filter btn btn-sm btn-light"><span class="fa fa-times"></span> <%t SilverCart\ProductAttributes\Model\Widgets\ProductAttributeFilterWidget.DISABLE_FILTER_FOR 'Reset all filters for &quot;{title}&quot;' title=$Title %></a>
            <% end_if %>
    </div>
        <% end_loop %>
<form name="silvercart-product-attribute-filter-form" method="post" action="{$FormAction}" class="invisible">
    <input type="hidden" name="silvercart-product-attribute-selected-values" value="{$CurrentPage.FilterValueList}" />
    <input type="hidden" name="silvercart-product-attribute-widget" value="{$ID}" />
    <input type="hidden" name="ajax" value="1" />
</form>
<script>
    silvercart.attributes.filter.setMainSelector('{$getJsMainSelector}');
<% if $CurrentPage.FilterValueArrayList %>
    <% loop $CurrentPage.FilterValueArrayList %>
    silvercart.attributes.filter.Push($ID);
    <% end_loop %>
<% end_if %>
</script>
    <% end_if %>
<% end_cached %>
