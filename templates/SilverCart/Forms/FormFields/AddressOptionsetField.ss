<div class="silvercart-checkout-address row">
<% if $items %>
    <% loop $items %>
    <div class="col-sm-12 col-md-10 col-lg-8">
        <label for="{$htmlId}" class="silvercart-address card">
        <% if $isInvoiceAddress || $isShippingAddress %>
            <div class="card-header border-0 pb-0">
            <% if $isInvoiceAddress %>
                <span class="fa fa-credit-card"></span> <%t SilverCart\Model\Pages\AddressHolder.DEFAULT_INVOICEADDRESS 'invoice address' %>
            <% end_if %>
            <% if $isShippingAddress %>
                <span class="fa fa-truck"></span> <%t SilverCart\Model\Pages\AddressHolder.DEFAULT_SHIPPINGADDRESS 'shipping address' %>
            <% end_if %>
            </div>
        <% end_if %>
            <div class="card-body">
                <div class="float-left silvercart-address-radiofield">
                    <input class="margin-top2x" type="radio" name="{$name}" value="{$value}" id="{$htmlId}" <% if $checked %>checked="checked"<% end_if %> />
                </div>
                <p class="card-text ml-4">
                <% if $IsPackstation != 0 %>
                    <em>{$address.fieldLabel('PackstationLabel')}</em><br />
                <% else_if $TaxIdNumber || $Company %>
                    <span class="silvercart-address-company-section">
                        <% if $isCompanyAddress %><em><%t SilverCart\Model\Customer\Customer.BUSINESSCUSTOMER 'Business customer' %></em><br /><% end_if %>
                        <% if $TaxIdNumber %>{$address.fieldLabel('TaxIdNumber')}: {$TaxIdNumber}<br /><% end_if %>
                        <% if $Company %><i>{$Company}</i><br /><% end_if %>
                    </span>
                <% end_if %>
                <% if $FirstName || $Surname %>
                    <strong>{$SalutationText} {$AcademicTitle} {$FirstName} {$Surname}</strong><br/>
                <% end_if %>
                <% if $Addition %>
                    {$Addition}<br/>
                <% end_if %>
                <% if $IsPackstation != 0 %>
                    {$PostNumber}<br/>
                    {$Packstation}<br/>
                <% else %>
                    {$Street} {$StreetNumber}<br/>
                <% end_if %>
                    {$Postcode} {$City}<br/>
                    {$Country.Title}<br/>
                <% if $Phone %>
                    {$address.fieldLabel('PhoneShort')}: {$Phone}
                <% end_if %>
                </p>
            </div>
            <% if $address.canEdit || $address.canDelete %>
            <div class="clearfix">
                <div class="btn-group btn-group-justified float-right">
                <% if $address.canEdit %>
                    <a class="btn btn-sm btn-link" data-toggle="tooltip" data-placement="top" title="<%t SilverCart\Model\Pages\AddressHolder.EDIT 'edit' %>" id="silvercart-edit-shipping-address-id" href="{$CurrentPage.Link}editAddress/{$ID}"><span class="fa fa-pencil"></span> <%t SilverCart\Model\Pages\AddressHolder.EDIT 'edit' %></a>
                <% end_if %>
                <% if not $isLastAddress && $address.canDelete %>
                    <a class="btn btn-sm btn-link" data-toggle="tooltip" data-placement="top" title="<%t SilverCart\Model\Pages\AddressHolder.DELETE 'delete' %>" id="silvercart-delete-shipping-address-id" href="{$CurrentPage.Link}deleteAddress/{$ID}"><span class="fa fa-trash"></span> <%t SilverCart\Model\Pages\AddressHolder.DELETE 'delete' %></a>
                <% end_if %>
                </div>
            </div>
            <% end_if %>
        </label>
    </div>
    <% end_loop %>
<% else %>
    <div class="alert alert-danger">{$fieldLabel('NoAddressAvailable')}</div>
<% end_if %>
</div>
