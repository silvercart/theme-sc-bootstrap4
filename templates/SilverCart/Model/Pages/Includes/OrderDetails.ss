<% with $CustomersOrder %>
<div class="row">
    <div class="col-12 col-lg-6 col-xxl-5">
        <table class="table table-sm">
            <tbody>
                <tr>
                    <td class="text-left text-nowrap"><%t SilverCart\Model\Pages\Page.ORDER_DATE 'Order date' %></td>
                    <td class="text-left">{$Created.Nice}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('PaymentMethodTitle')}</td>
                    <td class="text-left">{$PaymentMethod.Name}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('OrderStatus')}</td>
                    <td class="text-left">{$OrderStatus.Title}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('ShippingFee')}</td>
                    <td class="text-left">{$HandlingCostShipment.Nice}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('OrderAmount')}</td>
                    <td class="text-left">{$AmountTotal.Nice}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('OrderNumber')}</td>
                    <td class="text-left">{$OrderNumber}</td>
                </tr>
                <% if Note %>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('YourNote')}</td>
                    <td class="text-left">{$getFormattedNote}</td>
                </tr>
                <% end_if %>
                <% if $ExpectedDelivery %>
                 <tr>
                    <td class="text-left text-nowrap"><strong>{$fieldLabel('ExpectedDelivery')}</strong></td>
                    <td class="text-left">{$ExpectedDeliveryNice}</td>
                </tr>
                <% end_if %>
                <% if $TrackingCode %>
                <tr>
                    <td class="text-left text-nowrap"><strong>{$fieldLabel('Tracking')}</strong></td>
                    <td class="text-left"><a href="{$TrackingLink}" target="blank" title="{$fieldLabel('TrackingLinkLabel')}">{$fieldLabel('TrackingLinkLabel')}</a></td>
                </tr>
                <% end_if %>
                <tr>
                    <td class="text-left text-nowrap"><%t SilverCart\Model\Pages\RevocationFormPage.TITLE 'Revocation' %></td>
                    <td class="text-left"><a class="btn btn-sm btn-warning" href="{$CurrentPage.PageByIdentifierCodeLink('SilvercartRevocationFormPage')}?o={$ID}"><%t SilverCart\Forms\RevocationForm.GoTo 'Go to revocation form' %> <i class="fa fa-caret-right"></i></a></td>
                </tr>
                {$OrderDetailInformation}
            </tbody>
        </table>
    </div>
    <div class="col-12 col-lg-6 col-xxl-7">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 col-xl-12 col-xxl-6 mt-lg-0"><% with $InvoiceAddress %><% include SilverCart/Model/Pages/AddressDetailReadOnly %><% end_with %></div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 col-xl-12 col-xxl-6 mt-3 mt-sm-0 mt-lg-3 mt-xxl-0"><% with $ShippingAddress %><% include SilverCart/Model/Pages/AddressDetailReadOnly %><% end_with %></div>
        </div>
    </div>
</div>
<div class="mt-3">
    {$OrderDetailTable}
</div>
<% end_with %>
