<% with $CurrentMember %>
    <div class="row silvercart-address-equalize">
        <div class="col-6 col-sm-6">
        <% with $InvoiceAddress %>
            <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
        <% end_with %>
            <hr class="hidden-sm-up"/>
        </div>
        <div class="col-6 col-sm-6">
        <% with $ShippingAddress %>
            <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
        <% end_with %>
        </div>
    </div>
<% end_with %>