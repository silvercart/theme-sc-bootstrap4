<% include SilverCart/Model/Pages/CheckoutStepNavigation %>
<div class="row">
    <section id="content-main" class="col-12">
    <% if $canCheckout %>
        <article>
            {$Content}
            {$Checkout.CurrentStep}
        </article>
        <% if $WidgetSetContent.exists %>
        <section class="sc-widget-holder">
            {$InsertWidgetArea(Content)}
        </section>
        <% end_if %>
    <% else %>
        <div class="alert alert-danger">{$CheckoutErrorMessage}</div>
    <% end_if %>
    </section>
</div>