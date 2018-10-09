<% if $IncludeFormTag %>
<form {$addExtraClass("form-row price-range").AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="input-group input-group-sm col-5 col-xxl-4">
        {$Fields.dataFieldByName(MinPrice).addExtraClass('text-right').Field}
        <div class="input-group-append"><div class="input-group-text">{$CurrencySymbol}</div></div>
    </div>
    <div class="col-auto">
        <span class="fa fa-minus mt-2"></span>
    </div>
    <div class="input-group input-group-sm col-5 col-xxl-4">
        {$Fields.dataFieldByName(MaxPrice).addExtraClass('text-right').Field}
        <div class="input-group-append"><div class="input-group-text">{$CurrencySymbol}</div></div>
    </div>
    <div class="col-3 col-lg-2 col-xxl-auto order-5 order-xxl-4">
    <% loop $Actions %>
        <button class="btn btn-outline-primary btn-sm float-right mt-2 mt-xxl-0" type="submit" id="{$ID}" title="{$Title}">{$Title}</button> 
    <% end_loop %>
    </div>
    <div class="col-9 col-xxl-12 order-4 order-xxl-5">
        <a class="btn btn-sm btn-light mt-2" href="{$CurrentPage.Link}ClearProductAttributePriceFilter" title="<%t SilverCart\ProductAttributes\Model\Widgets\PriceFilterWidget.DISABLE_FILTER 'Reset price filter' %>"><span class="fa fa-times"></span> <%t SilverCart\ProductAttributes\Model\Widgets\PriceFilterWidget.DISABLE_FILTER 'Reset price filter' %></a>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>