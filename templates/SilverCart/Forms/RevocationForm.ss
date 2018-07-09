<% if $IncludeFormTag %>
    <% if $Customer %>
<form name="SupportRevocationForm" id="SupportRevocationForm" method="post">
    <input type="hidden" name="ExistingOrder" value="" id="SupportExistingOrder">
</form>
<script>
$(document).ready(function() {
    $('select[name="ExistingOrder"]').on('change', function() {
        $('#SupportExistingOrder').val($(this).val());
        $('#SupportRevocationForm').submit();
    });
});
</script>
    <% end_if %>
<form {$addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
<% if $Customer %>
    <h3 class="mt-3"><%t SilverCart\Forms\RevocationForm.Order 'Order' %></h3>
    {$Fields.dataFieldByName(ExistingOrder).FieldHolder}
<% end_if %>
    <h3 class="mt-5"><%t SilverCart\Forms\RevocationForm.Data 'Data' %></h3>
    <hr/>
    <p><%t SilverCart\Dev\Tools.To 'To' %>:</p>
<% with $CurrentPage.SiteConfig %>
    <address class="ml-2">
        <strong>{$ShopName}</strong><br/>
        {$ShopStreet} {$ShopStreetNumber}<br/>
        {$ShopPostcode} {$ShopCity}<br/>
        {$ShopCountry.Title}<br/>
    </address>
<% end_with %>
    <p><%t SilverCart\Forms\RevocationForm.RevocationDate 'Date of revocation' %>: <strong>{$CurrentDate}</strong></p>
    <hr/>
    {$Fields.dataFieldByName(RevocationOrderData).FieldHolder}
    {$Fields.dataFieldByName(OrderDate).FieldHolder}
    {$Fields.dataFieldByName(OrderNumber).FieldHolder}
    {$Fields.dataFieldByName(Email).FieldHolder}
    <h3 class="mt-5"><%t SilverCart\Forms\RevocationForm.NameOfConsumer 'Name of the customer' %></h3>
    {$Fields.dataFieldByName(Salutation).FieldHolder}
    {$Fields.dataFieldByName(FirstName).FieldHolder}
    {$Fields.dataFieldByName(Surname).FieldHolder}
    <h3 class="mt-5"><%t SilverCart\Forms\RevocationForm.AddressOfConsumer 'Address of the customer' %></h3>
    {$Fields.dataFieldByName(Street).FieldHolder}
    {$Fields.dataFieldByName(StreetNumber).FieldHolder}
    {$Fields.dataFieldByName(Addition).FieldHolder}
    {$Fields.dataFieldByName(Postcode).FieldHolder}
    {$Fields.dataFieldByName(City).FieldHolder}
    {$Fields.dataFieldByName(Country).FieldHolder}
    {$CustomFormSpecialFields}
    <div class="clearfix">
    <% loop $Actions %>
        <button class="btn btn-primary float-right" type="submit" id="{$ID}" title="{$Title}" value="{$Title}"><span class="fa fa-arrow-right"></span> {$Title}</button> 
    <% end_loop %> 
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>