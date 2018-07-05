<% include SilverCart/Model/Pages/CheckoutStepNavigation %>
<div class="row">
    <section id="content-main" class="col-12">
        <article>
            {$EditAddressForm}
        </article>
        <% if $WidgetSetContent.exists %>
        <section class="sc-widget-holder">
            {$InsertWidgetArea(Content)}
        </section>
        <% end_if %>
    </section>
</div>