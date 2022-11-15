<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
    <% if $CurrentRegisteredCustomer %>
        <article>
            <header><h1><%t SilverCart\Model\Pages\AddressHolder.CURRENT_DEFAULT_ADDRESSES 'Your default invoice and shipping addresses' %></h1></header>
            {$Content}
        <% with $CurrentRegisteredCustomer %>
            <% if $hasOnlyOneStandardAddress %>
                <% with $InvoiceAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
            <% else %>
            <section class="row address-list">
                <div class="col-12 col-sm-6 col-xl-4">
                <% with $InvoiceAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
                </div>
                <div class="col-12 col-sm-6 col-xl-4">
                <% with $ShippingAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
                </div>
            </section>
            <% end_if %>
            <section class="mt-3">
                <% include SilverCart/Model/Pages/AddressDetail %>
            </section>
        <% end_with %>
        </article>
        <hr />
        <section>
            <a class="btn btn-primary" href="{$Link(addNewAddress)}" data-target="#silvercart-add-address-form" id="silvercart-add-address-link"><%t SilverCart\Model\Pages\AddressHolder.ADD 'Add new address' %></a>
            <div class="hidden-form collapse" id="silvercart-add-address-form">
                {$AddAddressForm}
            </div>
        </section>
    <% else %>
        <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
    <% end_if %>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
        <% if $CurrentRegisteredCustomer %>
            {$SubNavigation}
        <% end_if %>
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>