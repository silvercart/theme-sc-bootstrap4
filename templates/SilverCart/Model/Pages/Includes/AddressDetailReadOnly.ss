<div class="silvercart-address card w-100">
<% if $isInvoiceAddress || $isShippingAddress %>
    <div class="card-header border-0 pb-0">
    <% if $isInvoiceAndShippingAddress %>
        <strong><span class="fa fa-credit-card"></span> <%t SilverCart\Model\Pages\AddressHolder.INVOICEANDSHIPPINGADDRESS 'invoice and shipping address' %></strong>
    <% else_if $isInvoiceAddress %>
        <strong><span class="fa fa-credit-card"></span> <%t SilverCart\Model\Pages\AddressHolder.INVOICEADDRESS 'invoice address' %></strong>
    <% else_if $isShippingAddress %>
        <strong><span class="fa fa-truck"></span> <%t SilverCart\Model\Pages\AddressHolder.SHIPPINGADDRESS 'shipping address' %></strong>
    <% end_if %>
    </div>
<% end_if %>
    <div class="card-body">
        <p class="card-text">
            {$BeforeAddressContent}
        <% if $IsPackstation %>
            <em>{$fieldLabel('PackstationLabel')}</em><br/>
        <% else_if $TaxIdNumber || $Company %>
            <span class="silvercart-address-company-section">
                <% if $isCompanyAddress %><em><%t SilverCart\Model\Customer\Customer.BUSINESSCUSTOMER 'Business customer' %></em><br /><% end_if %>
                <% if $TaxIdNumber %>{$fieldLabel('TaxIdNumber')}: {$TaxIdNumber}<br /><% end_if %>
                <% if $Company %><i>{$Company}</i><br /><% end_if %>
            </span>
        <% end_if %>
    <% if $hasAddressData %>
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
            {$BeforeCountryContent}
            {$Country.Title}<br/>
        <% if $Phone %>
            {$fieldLabel('PhoneShort')}: {$Phone}
        <% end_if %>
            {$AfterAddressContent}
    <% else %>
            <div class="alert alert-danger"><%t SilverCart\Model\Pages\AddressHolder.NOT_DEFINED 'Not defined yet' %></div>
    <% end_if %>
        </p>
    </div>
</div>