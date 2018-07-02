<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <h4><%t SilverCart\Model\Shipment\ShippingMethod.SINGULARNAME 'Shipping method' %></h4>
    {$Fields.dataFieldByName(ShippingMethod).FieldHolder}
    <hr>
    <div class="clearfix">
<% loop $Actions %>
        <button class="btn btn-sm btn-primary float-right pull-right" type="submit" id="{$ID}" title="{$Title}" value="{$Value}" name="{$Name}">{$Title} <span class="fa fa-caret-right"></span></button>
<% end_loop %>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>