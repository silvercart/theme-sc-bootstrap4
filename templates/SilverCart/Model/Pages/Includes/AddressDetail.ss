 <% if $Addresses %>
<h2>{$CurrentPage.Title}</h2><br/>
<div class="row address-list">
    <% loop $Addresses %>
    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 d-flex">
        <div class="card w-100 mb-3">
        <% if $isInvoiceAddress || $isShippingAddress %>
            <div class="card-header border-0 pb-0">
            <% if $isInvoiceAddress %>
                <span class="fa fa-credit-card"></span> <%t SilverCart\Model\Pages\AddressHolder.DEFAULT_INVOICE 'This is your invoice address' %>
            <% end_if %>
            <% if $isShippingAddress %>
                <span class="fa fa-truck"></span> <%t SilverCart\Model\Pages\AddressHolder.DEFAULT_SHIPPING 'This is your shipping address' %>
            <% end_if %>
            </div>
        <% end_if %>
            <div class="card-body">
                <p class="card-text">
                <% if $IsPackstation %>
                    <em>{$fieldLabel('PackstationLabel')}</em><br/>
                <% else_if $TaxIdNumber || $Company %>
                    <span class="silvercart-address-company-section">
                        <% if $isCompanyAddress %><em><%t SilverCart\Model\Customer\Customer.BUSINESSCUSTOMER 'Business customer' %></em><br /><% end_if %>
                        <% if $TaxIdNumber %>{$fieldLabel('TaxIdNumber')}: {$TaxIdNumber}<br /><% end_if %>
                        <% if $Company %><i>{$Company}</i><br /><% end_if %>
                    </span>
                <% end_if %>
                <% if $FirstName || $Surname %>
                    <strong>{$SalutationText} {$AcademicTitle} {$FirstName} {$Surname}</strong><br/>
                <% end_if %>
                <% if $Addition %>
                    {$Addition}<br/>
                <% end_if %>
                <% if $IsPackstation %>
                    {$PostNumber}<br/>
                    {$Packstation}<br/>
                <% else %>
                    {$Street} {$StreetNumber}<br/>
                <% end_if %>
                    {$Postcode} {$City}<br/>
                    {$Country.Title}<br/>
                <% if $Phone %>
                    {$fieldLabel('PhoneShort')}: {$Phone}
                <% end_if %>
                </p>
            </div>
            <div class="text-right">
            <% if $canSetAsDefaultInvoiceAddress %>
                <a class="btn btn-sm btn-link" data-toggle="tooltip" data-placement="top" title="<%t SilverCart\Model\Pages\AddressHolder.SET_AS 'Set as' %> <%t SilverCart\Model\Pages\AddressHolder.INVOICEADDRESS 'invoice address' %>" href="{$CurrentPage.Link}setInvoiceAddress/{$ID}"><span class="fa fa-credit-card"></span> Standard</a>
            <% end_if %>
            <% if $canSetAsDefaultShippingAddress %>
                <a class="btn btn-sm btn-link" data-toggle="tooltip" data-placement="top" title="<%t SilverCart\Model\Pages\AddressHolder.SET_AS 'Set as' %> <%t SilverCart\Model\Pages\AddressHolder.SHIPPINGADDRESS 'shipping address' %>" href="{$CurrentPage.Link}setShippingAddress/{$ID}"><span class="fa fa-truck"></span> Standard</a>
            <% end_if %>
            <% if $canEdit %>
                <a class="btn btn-sm btn-link" data-toggle="tooltip" data-placement="top" title="<%t SilverCart\Model\Pages\AddressHolder.EDIT 'edit' %>" id="silvercart-edit-shipping-address-id" href="{$CurrentPage.PageByIdentifierCodeLink('SilvercartAddressHolder')}edit/{$ID}"><span class="fa fa-pencil"></span> <%t SilverCart\Model\Pages\AddressHolder.EDIT 'edit' %></a>
            <% end_if %>
            <% if not $isLastAddress && $canDelete %>
                <a class="btn btn-sm btn-link" data-toggle="tooltip" data-placement="top" title="<%t SilverCart\Model\Pages\AddressHolder.DELETE 'Delete' %>" id="silvercart-delete-shipping-address-id" href="{$CurrentPage.Link}deleteAddress/{$ID}"><span class="fa fa-trash"></span> <%t SilverCart\Model\Pages\AddressHolder.DELETE 'Delete' %></a>
            <% end_if %>
            </div>
        </div>
    </div>
    <% end_loop %>
</div>
<% end_if %>
