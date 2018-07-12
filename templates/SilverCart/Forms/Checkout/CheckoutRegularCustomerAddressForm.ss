<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
            <h4><%t SilverCart\Model\Pages\Page.BILLING_ADDRESS 'Invoice address' %></h4>
            {$BeforeInvoiceAddressContent}
            {$Fields.dataFieldByName(InvoiceAddress).FieldHolder}
            {$AfterInvoiceAddressContent}
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
            <h4><%t SilverCart\Model\Pages\Page.SHIPPING_ADDRESS 'Shipping Address' %></h4>
            <div id="ShippingAddressFields" class="clearfix">
                {$Fields.dataFieldByName(ShippingAddress).FieldHolder}
            </div>
            {$Fields.dataFieldByName(InvoiceAddressAsShippingAddress).FieldHolder}
        </div>
    </div>
    <hr/>
    {$CustomFormSpecialFields}
    <div class="clearfix">
        <a id="silvercart-add-address-link" data-toggle="collapse" data-target="#silvercart-add-address-form" aria-expanded="false" aria-controls="silvercart-add-address-form" href="{$CurrentPage.Link}addNewAddress" class="btn btn-secondary btn-sm silvercart-trigger-add-address-link js-link"><span class="fa fa-plus"></span> <%t SilverCart\Model\Pages\AddressHolder.ADD 'Add new address' %></a>
    <% loop $Actions %>
        <button class="btn btn-primary float-right" type="submit" id="{$ID}" title="{$Title}" value="{$Value}" name="{$Name}">{$Title} <span class="fa fa-caret-right"></span></button>
    <% end_loop %>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>