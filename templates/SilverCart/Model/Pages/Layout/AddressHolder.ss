<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>

    <% if $ErrorMessage %>
        <div class="alert alert-danger" role="alert">{$ErrorMessage}</div>
    <% end_if %>
    <% if SuccessMessage %>
        <div class="alert alert-success" role="alert">{$SuccessMessage}</div>
    <% end_if %>

    <% if $CurrentRegisteredCustomer %>
        <div class="section-header clearfix">
            <h1><%t SilverCart\Model\Pages\AddressHolder.CURRENT_DEFAULT_ADDRESSES 'Your default invoice and shipping addresses' %></h1>
        </div>
        {$Content}
        <% with $CurrentRegisteredCustomer %>
            <% if $hasOnlyOneStandardAddress %>
                <% with $InvoiceAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
            <% else %>
        <div class="row address-list">
            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                <% with $InvoiceAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
            </div>
            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                <% with $ShippingAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
            </div>
        </div>
            <% end_if %>
        <div class="silvercart-address-equalize">
            <% include SilverCart/Model/Pages/AddressDetail %>
        </div>
        <% end_with %>
        <hr />
        <a class="btn btn-primary" href="{$Link(addNewAddress)}" data-target="#silvercart-add-address-form" id="silvercart-add-address-link"><%t SilverCart\Model\Pages\AddressHolder.ADD 'Add new address' %></a>
        <div class="hidden-form collapse" id="silvercart-add-address-form">
            {$AddAddressForm}
        </div>
    <% else %>
        <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
    <% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        <% if $CurrentRegisteredCustomer %>
            {$SubNavigation}
        <% end_if %>
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>