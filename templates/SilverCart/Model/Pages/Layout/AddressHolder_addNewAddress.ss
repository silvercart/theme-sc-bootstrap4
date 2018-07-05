<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <% if $CurrentRegisteredCustomer %>
        <article>
            {$AddAddressForm}
        </article>
        <% else %>
            <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
        <% end_if %>
    </section>
    <aside class="col-12 col-md-3">
    <% if $CurrentRegisteredCustomer %>
        {$SubNavigation}
    <% end_if %>
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>