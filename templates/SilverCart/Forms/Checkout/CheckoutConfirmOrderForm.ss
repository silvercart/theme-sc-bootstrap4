<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="row">
        <div class="span4 col-lg-4 col-sm-4">
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%--                                      ADDRESS SECTION                                       --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
    <% with $Controller.Checkout.CurrentStep %>
        <% if $InvoiceAddressIsShippingAddress %>
            <div class="checkout-change-area margin-bottom">
            {$BeforeInvoiceAddressContent}
            <% with $InvoiceAddress %>
                <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
            <% end_with %>
            {$AfterInvoiceAddressContent}
                <a class="btn btn-xs checkout-change-button" href="{$Controller.AddressStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
            </div>
        <% else %>
            <div class="checkout-change-area margin-bottom">
                {$BeforeInvoiceAddressContent}
                <% with $InvoiceAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
                {$AfterInvoiceAddressContent}
                <a class="btn btn-xs checkout-change-button" href="{$Controller.AddressStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
            </div>
            <div class="checkout-change-area margin-bottom">
                {$BeforeShippingAddressContent}
                <% with $ShippingAddress %>
                    <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
                <% end_with %>
                {$AfterShippingAddressContent}
                <a class="btn btn-xs checkout-change-button" href="{$Controller.AddressStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
            </div>
        <% end_if %>
    <% end_with %>
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%--                                SHIPMENT & PAYMENT SECTION                                  --%>
<%-- ------------------------------------------------------------------------------------------ --%>
<%-- ------------------------------------------------------------------------------------------ --%>
    <% with $Controller.Checkout.CurrentStep %>
            <div class="checkout-change-area margin-bottom">
                <div class="card">
                    <div class="card-header"><%t SilverCart\Model\Pages\CheckoutStep.CHOSEN_SHIPPING 'Chosen shipping method' %>:</div>
                    <div class="card-block">
                    {$BeforeShippingMethodContent}
                    <% with $ShippingMethod %>
                        {$Carrier.Title} - {$Title} <% if $ShippingFee.PostPricing %>*<% end_if %>
                        <% if $ShippingFee.CalculatedPrice %> ({$ShippingFee.CalculatedPrice.Nice})<% end_if %>
                    <% end_with %>
                    <% if $ShoppingCart.getDeliveryTime($ShippingMethod.ID) %>
                        <% if $ShippingMethod.isPickup %>
                        <br/><small class="delivery-time-hint">{$ShippingMethod.fieldLabel(ReadyForPickup)}:<br/>{$ShoppingCart.getDeliveryTime($ShippingMethod.ID)}</small>
                        <% else %>
                        <br/><small class="delivery-time-hint">{$ShippingMethod.fieldLabel(ExpectedDelivery)}:<br/>{$ShoppingCart.getDeliveryTime($ShippingMethod.ID)}</small>
                        <% end_if %>
                    <% end_if %>
                    {$AfterShippingMethodContent}
                    </div>
                </div>
                <% if not $Controller.SkipShippingStep %>
                <a class="btn btn-xs checkout-change-button" href="{$Controller.ShipmentStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
                <% end_if %>
            </div>
            <div class="checkout-change-area margin-bottom">
                <div class="card">
                    <div class="card-header"><%t SilverCart\Model\Pages\CheckoutStep.CHOSEN_PAYMENT 'Chosen payment method' %></div>
                    <div class="card-block">
                    {$BeforePaymentMethodContent}
                    <% with $PaymentMethod %>
                        {$Name}
                        <% if $HandlingCost.amount.Amount > 0 %> ({$HandlingCost.amount.Nice})<% end_if %>
                    <% end_with %>
                    {$AfterPaymentMethodContent}
                    </div>
                </div>
                <% if not $Controller.SkipPaymentStep %>
                <a class="btn btn-xs checkout-change-button" href="{$Controller.PaymentStepLink}"><span class="fa fa-edit"></span> <%t SilverCart\Model\Pages\CheckoutStep.Change 'Change' %></a>
                <% end_if %>
            </div>
    <% end_with %>
    <%-- ------------------------------------------------------------------------------------------ --%>
    <%-- ------------------------------------------------------------------------------------------ --%>
    <%--                                    FORM FIELDS SECTION                                     --%>
    <%-- ------------------------------------------------------------------------------------------ --%>
    <%-- ------------------------------------------------------------------------------------------ --%>
            <div class="checkout-change-area margin-bottom" id="silvercart-checkout-note">
                <div class="card-header"><label><%t SilverCart\Model\Pages\Page.REMARKS 'Remarks' %></label></div>
                {$Fields.dataFieldByName(Note).FieldHolder}
            </div>
        </div>
        <div class="span8 col-lg-8 col-sm-8">
            <div id="silvercart-checkout-privacy-check" class="well small-well margin-bottom">
                {$Fields.dataFieldByName(HasAcceptedTermsAndConditions).FieldHolder}
                {$Fields.dataFieldByName(HasAcceptedRevocationInstruction).FieldHolder}
                <% if $ShowNewsletterCheckbox %>
                    {$Fields.dataFieldByName(SubscribedToNewsletter).FieldHolder}
                <% end_if %>
            </div>

            {$Controller.Checkout.CurrentStep.ShoppingCartFull}

            <hr/>
            <% if $CurrentPage.SiteConfig.ShowTaxAndDutyHint %>
            <p class="tax-and-duty-hint"><%t SilverCart\Model\Pages\CheckoutStep.TaxAndDutyHint 'Caution: There are additional taxes and fees for delivery to non EU countries.' %></p>
            <hr/>
            <% end_if %>
            <div class="margin-side clearfix">
            <% loop $Actions %>
                <button class="btn btn-primary btn-lg btn-block-xs float-right pull-right action" type="submit" title="{$Title}" name="{$Name}" id="{$ID}">{$Title} <span class="fa fa-caret-right"></span></button>
            <% end_loop %>
            </div>
        </div>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>