<% if $IncludeFormTag %>
<form {$addExtraClass("form-row price-range").AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="input-group input-group-sm col-12">
        <div class="input-group-prepend"><div class="input-group-text">{$CurrencySymbol}</div></div>
        {$Fields.dataFieldByName(MinPrice).addExtraClass('text-center px-0').Field}
        <div class="input-group-append input-group-prepend"><div class="input-group-text"><span class="fa fa-minus"></span></div></div>
        {$Fields.dataFieldByName(MaxPrice).addExtraClass('text-center px-0').Field}
        <div class="input-group-append">
        <% loop $Actions %>
            <button class="btn btn-outline-primary btn-sm input-group-append float-right ml-0" type="submit" id="{$ID}" title="{$Title}">{$Title}</button> 
        <% end_loop %>
        </div>
    </div>
    <div class="col-9 col-xxl-12 order-4 order-xxl-5">
        <a class="btn btn-sm btn-light mt-2" href="{$CurrentPage.Link('ClearProductAttributePriceFilter')}" title="<%t SilverCart\ProductAttributes\Model\Widgets\PriceFilterWidget.DISABLE_FILTER 'Reset price filter' %>"><span class="fa fa-times"></span> <%t SilverCart\ProductAttributes\Model\Widgets\PriceFilterWidget.DISABLE_FILTER 'Reset price filter' %></a>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>