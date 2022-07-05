<% cached $WidgetCacheKey %>
    <% if $Attributes %>
        <% loop $Attributes %>
            <% if not $First %>
</section>
<section class="widget clearfix silvercart-widget {$Top.ExtraCssClasses}" id="widget-{$Top.ID}-{$Pos}">
            <% end_if %>
    <header><h4 class="<% if $HasSelectedValues %>has-selected-values<% else %>has-no-selected-values<% end_if %>">{$Title}</h4></header>
    <div class="widget-product-attribute-filter">
            <% if not $DisableFilterReset && $HasSelectedValues %>
        <a href="#" data-id="{$ID}" class="remove-filter btn btn-sm btn-light mb-2"><span class="fa fa-chevron-left"></span> <%t SilverCart\ProductAttributes\Model\Widgets\ProductAttributeFilterWidget.Clear 'Clear' %></a>
            <% end_if %>
        <ul class="list-unstyled mb-0">
            <% if $AssignedValues %>
                <% loop $AssignedValues %>
            <li><label for="silvercart-product-attribute-value-{$ID}"><input type="checkbox" name="silvercart-product-attribute-value-{$ID}" id="silvercart-product-attribute-value-{$ID}" class="silvercart-product-attribute-value silvercart-product-attribute-{$ProductAttribute.ID}" value="{$ID}" <% if $IsFilterValue %>checked="checked"<% end_if %> /> {$Title}</label></li>
                <% end_loop %>
            <% end_if %>
        </ul>
    </div>
        <% end_loop %>
<form name="silvercart-product-attribute-filter-form" method="post" action="{$FormAction}" class="invisible"
      data-main-selector="{$getJsMainSelector}"
      data-filter-list="<% if $CurrentPage.FilterValueArrayList %><% loop $CurrentPage.FilterValueArrayList %>{$ID}<% if not $Last %>,<% end_if %><% end_loop %><% end_if %>">
    <input type="hidden" name="silvercart-product-attribute-selected-values" value="{$CurrentPage.FilterValueList}" />
    <input type="hidden" name="silvercart-product-attribute-widget" value="{$ID}" />
    <input type="hidden" name="ajax" value="1" />
</form>
    <% end_if %>
<% end_cached %>
