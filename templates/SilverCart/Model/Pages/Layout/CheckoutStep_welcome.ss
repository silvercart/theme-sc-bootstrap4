<% include SilverCart/Model/Pages/CheckoutStepNavigation %>
<div class="row">
    <section id="content-main" class="col-12">
    <% if $canCheckout %>
        <article>
            <div class="alert alert-success"><span class="fa fa-check"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInMessage 'Your email address is confirmed.' %></div>
            {$Content}
            {$Checkout.CurrentStep}
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    <% else %>
        <div class="alert alert-danger">{$CheckoutErrorMessage}</div>
    <% end_if %>
    </section>
</div>