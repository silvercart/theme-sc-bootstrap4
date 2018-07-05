<% with $CurrentMember %>
    <div class="row">
        <div class="col-6 col-sm-6 d-flex">
        <% with $InvoiceAddress %>
            <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
        <% end_with %>
        </div>
        <div class="col-6 col-sm-6 d-flex">
        <% with $ShippingAddress %>
            <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
        <% end_with %>
        </div>
    </div>
<% end_with %>