<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>

    <div class="silvercart-checkout-payment-additionalInfo clearfix">
<% with $PaymentMethod %>
        <h2>{$Name}</h2>
    <% if $showPaymentLogos && $PaymentLogos.exists %>
        <div class="logos m-2">
            <span class="logo">
                <% loop $PaymentLogos %>
                    {$Image.Pad(250,70)}
                <% end_loop %>
            </span>
        </div>
    <% end_if %>
    <% if $paymentDescription %>
        <div class="silvercart-checkout-payment-additionalInfo-description"><i>{$paymentDescription.RAW}</i></div>
    <% end_if %>
<% end_with %>
<% loop $Actions %>
    <button class="btn btn-primary float-right" type="submit" id="{$ID}" title="{$Title}" value="{$Value}" name="{$Name}">{$Title} <span class="fa fa-caret-right"></span></button>
<% end_loop %>
    </div>
    <hr>
<% if $IncludeFormTag %>
</form>
<% end_if %>