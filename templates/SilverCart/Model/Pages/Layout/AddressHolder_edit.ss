<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <div id="silvercart-breadcrumbs-id" class="silvercart-breadcrumbs clearfix">
            <p>{$Breadcrumbs}</p>
        </div>

        <% if $CurrentRegisteredCustomer %>
        <div class="section-header clearfix">
            <h1><%t SilverCart\Model\Customer\Address.EDITADDRESS 'Edit address' %></h1>
        </div>
            {$EditAddressForm}
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