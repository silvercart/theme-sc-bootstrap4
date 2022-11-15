<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="row">
        <div class="col-12 col-md-4">
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%--                                      ADDRESS SECTION                                       --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
    <% with $Controller.Checkout.CurrentStep %>
        <% if $InvoiceAddressIsShippingAddress %>
            <div class="checkout-change-area mb-2 position-relative border">
            {$Top.BeforeInvoiceAddressContent}
            <% with $InvoiceAddress %>
                <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
            <% end_with %>
            {$Top.AfterInvoiceAddressContent}
                <a class="btn btn-sm btn-link position-absolute top-2 right checkout-change-button" href="{$Controller.AddressStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
            </div>
        <% else %>
            <div class="checkout-change-area mb-2 position-relative border">
                {$Top.BeforeInvoiceAddressContent}
                <% with $InvoiceAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
                {$Top.AfterInvoiceAddressContent}
                <a class="btn btn-sm btn-link position-absolute top-2 right checkout-change-button" href="{$Controller.AddressStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
            </div>
            <div class="checkout-change-area mb-2 position-relative border">
                {$Top.BeforeShippingAddressContent}
                <% with $ShippingAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
                {$Top.AfterShippingAddressContent}
                <a class="btn btn-sm btn-link position-absolute top-2 right checkout-change-button" href="{$Controller.AddressStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
            </div>
        <% end_if %>
    <% end_with %>
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%--                                SHIPMENT & PAYMENT SECTION                                  --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
    <% with $Controller.Checkout.CurrentStep %>
            <div class="checkout-change-area mb-2 position-relative border">
                <div class="card">
                    <div class="card-header border-0 pb-0"><%t SilverCart\Model\Pages\CheckoutStep.CHOSEN_SHIPPING 'Chosen shipping method' %>:</div>
                    <div class="card-body">
                    {$BeforeShippingMethodContent}
                    <% with $ShippingMethod %>
                        {$Carrier.Title} - {$Title} <% if $ShippingFee.PostPricing %>*<% end_if %>
                        <% if $ShippingFee.CalculatedPrice %> ({$ShippingFee.CalculatedPrice.Nice})<% end_if %>
                    <% end_with %>
                    <% if $ShoppingCart.getDeliveryTime($ShippingMethod.ID) %>
                        <% if $ShippingMethod.isPickup %>
                        <br/><small class="delivery-time-hint">{$ShippingMethod.fieldLabel('ReadyForPickup')}:<br/>{$ShoppingCart.getDeliveryTime($ShippingMethod.ID)}</small>
                        <% else %>
                        <br/><small class="delivery-time-hint">{$ShippingMethod.fieldLabel('ExpectedDelivery')}:<br/>{$ShoppingCart.getDeliveryTime($ShippingMethod.ID)}</small>
                        <% end_if %>
                    <% end_if %>
                    {$AfterShippingMethodContent}
                    </div>
                </div>
                <% if not $Controller.SkipShippingStep %>
                <a class="btn btn-sm btn-link position-absolute top-2 right checkout-change-button" href="{$Controller.ShipmentStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
                <% end_if %>
            </div>
            <div class="checkout-change-area mb-2 position-relative border">
                <div class="card">
                    <div class="card-header border-0 pb-0"><%t SilverCart\Model\Pages\CheckoutStep.CHOSEN_PAYMENT 'Chosen payment method' %></div>
                    <div class="card-body">
                    {$BeforePaymentMethodContent}
                    <% with $PaymentMethod %>
                        {$Name}
                        <% if $HandlingCost.amount.Amount > 0 %> ({$HandlingCost.amount.Nice})<% end_if %>
                    <% end_with %>
                    {$AfterPaymentMethodContent}
                    </div>
                </div>
                <% if not $Controller.SkipPaymentStep %>
                <a class="btn btn-sm btn-link position-absolute top-2 right checkout-change-button" href="{$Controller.PaymentStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
                <% end_if %>
            </div>
    <% end_with %>
    <%-- ------------------------------------------------------------------------------------------ --%>
    <%-- ------------------------------------------------------------------------------------------ --%>
    <%--                                    FORM FIELDS SECTION                                     --%>
    <%-- ------------------------------------------------------------------------------------------ --%>
    <%-- ------------------------------------------------------------------------------------------ --%>
        <% if $CurrentPage.EnableNote %>
            <div class="checkout-change-area mb-2" id="silvercart-checkout-note">
                <div class="card">
                    <div class="card-header pb-0"><label for="{$Fields.dataFieldByName('Note').ID}"><%t SilverCart\Model\Pages\Page.REMARKS 'Remarks' %></label></div>
                    {$Fields.dataFieldByName('Note').addExtraClass('border-0').Field}
                </div>
            </div>
        <% end_if %>
        </div>
        <div class="col-12 col-md-8">
            {$Controller.Checkout.CurrentStep.ShoppingCartFull}
            <% if $CurrentPage.SiteConfig.ShowTaxAndDutyHint %>
            <p class="tax-and-duty-hint"><%t SilverCart\Model\Pages\CheckoutStep.TaxAndDutyHint 'Caution: There are additional taxes and fees for delivery to non EU countries.' %></p>
            <hr/>
            <% end_if %>
            <div class="row">
                <div class="offset-2 col-10 offset-sm-5 col-sm-7 offset-lg-7 col-lg-5 text-justify">
                <% if $ShowNewsletterCheckbox %>
                    <div class="alert alert-light mb-2 py-1 px-2">
                        {$Fields.dataFieldByName('SubscribedToNewsletter').addExtraClass('mb-0').FieldHolder}
                    </div>
                <% end_if %>
                <% loop $Actions %>
                    <button class="btn btn-primary btn-lg btn-block action" type="submit" title="{$Title}" name="{$Name}" id="{$ID}">{$Title} <span class="fa fa-caret-right"></span></button>
                <% end_loop %>
                <% if $CurrentPage.EnableTermsAndConditionsCheckbox %>
                    <div class="form-group form-check mb-t mb-0">
                        <input class="form-check-input" type="checkbox" id="checkbox-atac" name="AcceptTermsAndConditions" required="required" />
                        <label class="form-check-label" for="checkbox-atac">{$AcceptTermsAndConditionsText}</label>
                    </div>
                <% else %>
                    <div class="mt-3 mb-0">{$AcceptTermsAndConditionsText}</div>
                <% end_if %>
                </div>
            </div>
        </div>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>