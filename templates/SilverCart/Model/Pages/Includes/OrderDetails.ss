<% with $CustomersOrder %>
    <table class="table table-condensed">
        <tbody>
            <tr>
                <td class="text-left nowrap"><%t SilverCart\Model\Pages\Page.ORDER_DATE 'Order date' %></td>
                <td class="text-left full">{$Created.Nice}</td>
            </tr>
            <tr>
                <td class="text-left nowrap">{$fieldLabel('PaymentMethodTitle')}</td>
                <td class="text-left full">{$PaymentMethod.Name}</td>
            </tr>
            <tr>
                <td class="text-left nowrap">{$fieldLabel('OrderStatus')}</td>
                <td class="text-left full">{$OrderStatus.Title}</td>
            </tr>
            <tr>
                <td class="text-left nowrap">{$fieldLabel('ShippingFee')}</td>
                <td class="text-left full">{$HandlingCostShipment.Nice}</td>
            </tr>
            <tr>
                <td class="text-left nowrap">{$fieldLabel('OrderAmount')}</td>
                <td class="text-left full">{$AmountTotal.Nice}</td>
            </tr>
            <tr>
                <td class="text-left nowrap">{$fieldLabel('OrderNumber')}</td>
                <td class="text-left full">{$OrderNumber}</td>
            </tr>
            <% if Note %>
            <tr>
                <td class="text-left nowrap">{$fieldLabel('YourNote')}</td>
                <td class="text-left full">{$getFormattedNote}</td>
            </tr>
            <% end_if %>
            <% if $ExpectedDelivery %>
             <tr>
                <td class="text-left nowrap"><strong>{$fieldLabel('ExpectedDelivery')}</strong></td>
                <td class="text-left full">{$ExpectedDeliveryNice}</td>
            </tr>
            <% end_if %>
            <% if $TrackingCode %>
            <tr>
                <td class="text-left nowrap"><strong>{$fieldLabel('Tracking')}</strong></td>
                <td class="text-left full"><a href="{$TrackingLink}" target="blank" title="{$fieldLabel('TrackingLinkLabel')}">{$fieldLabel('TrackingLinkLabel')}</a></td>
            </tr>
            <% end_if %>
            <tr>
                <td class="text-left nowrap"><%t SilverCart\Model\Pages\RevocationFormPage.TITLE 'Revocation' %></td>
                <td class="text-left full"><a class="silvercart-button btn" href="{$CurrentPage.PageByIdentifierCodeLink('SilvercartRevocationFormPage')}?o={$ID}"><%t SilverCart\Forms\RevocationForm.GoTo 'Go to revocation form' %> <i class="fa fa-caret-right"></i></a></td>
            </tr>
            {$OrderDetailInformation}
        </tbody>
    </table>
    <div class="row silvercart-address-equalize">
        <div class="span6 col-md-6">
            <div class="well margin-top">
        <% with $InvoiceAddress %>
            <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
        <% end_with %>
            </div>
        </div>
        <div class="span6 col-md-6">
            <div class="well margin-top">
        <% with $ShippingAddress %>
            <% include SilverCart/Model/Pages/AddressDetailReadOnly %>
        <% end_with %>
            </div>
        </div>
    </div>
    <div class="margin-top">
        {$OrderDetailTable}
    </div>
<% end_with %>
