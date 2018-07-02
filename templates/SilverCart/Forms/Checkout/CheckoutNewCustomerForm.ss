<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <p><%t SilverCart\Forms\Checkout\CheckoutNewCustomerForm.RegisterText 'Do you want to register so you can reuse your data on your next purchase?' %></p>
    {$Fields.dataFieldByName(AnonymousOptions).FieldHolder}
    {$CustomFormSpecialFields}
<% loop $Actions %>
    <button class="btn btn-sm btn-primary float-right pull-right" type="submit" id="{$ID}" title="{$Title}" value="{$Value}" name="{$Name}">{$Title} <span class="fa fa-caret-right"></span></button>
<% end_loop %>
<% if $IncludeFormTag %>
</form>
<% end_if %>