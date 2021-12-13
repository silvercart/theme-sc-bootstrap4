<% with $CustomersOrder %>
<div class="row">
    <div class="col-12 col-lg-6 col-xxl-5">
        <table class="table table-sm">
            <tbody>
                <tr>
                    <td class="text-left text-nowrap"><%t SilverCart\Model\Pages\Page.ORDER_DATE 'Order date' %></td>
                    <td class="text-right">{$Created.Nice}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('PaymentMethodTitle')}</td>
                    <td class="text-right">{$PaymentMethod.Name}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('OrderStatus')}</td>
                    <td class="text-right">{$OrderStatus.Title}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('PaymentStatus')}</td>
                    <td class="text-right">{$PaymentStatus.Title}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('ShippingFee')}</td>
                    <td class="text-right">{$HandlingCostShipment.Nice}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('OrderAmount')}</td>
                    <td class="text-right">{$AmountTotal.Nice}</td>
                </tr>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('OrderNumber')}</td>
                    <td class="text-right font-weight-bold font-italic">{$OrderNumber}</td>
                </tr>
        <% if $OrderDetailInformationAfterOrderNumber %>
            <% loop $OrderDetailInformationAfterOrderNumber %>
                <tr>
                    <td class="text-left text-nowrap">{$Title}</td>
                    <td class="text-{$Alignment} <% if $Highlight %>font-weight-bold<% end_if %>">{$Value}</td>
                </tr>
            <% end_loop %>
        <% end_if %>
                {$OrderDetailInformationHTMLAfterOrderNumber}
                <% if Note %>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('YourNote')}</td>
                    <td class="text-justify font-italic">{$getFormattedNote}</td>
                </tr>
                <% end_if %>
                <% if $ExpectedDelivery %>
                 <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('ExpectedDelivery')}</td>
                    <td class="text-right font-weight-bold font-italic">{$ExpectedDeliveryNice}</td>
                </tr>
                <% end_if %>
                <% if $TrackingCode %>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('TrackingCode')}</td>
                    <td class="text-right font-weight-bold font-italic">{$TrackingCode}</td>
                </tr>
                <% end_if %>
                <% if $TrackingLink %>
                <tr>
                    <td class="text-left text-nowrap">{$fieldLabel('Tracking')}</td>
                    <td class="text-right"><a class="btn btn-sm btn-info text-wrap-normal" href="{$TrackingLink}" target="blank" title="{$fieldLabel('TrackingLinkLabel')}">{$fieldLabel('TrackingLinkLabel')} <span class="fa fa-external-link"></span></a></td>
                </tr>
                <% end_if %>
                <tr>
                    <td class="text-left text-nowrap"><%t SilverCart\Model\Pages\RevocationFormPage.TITLE 'Revocation' %></td>
                    <td class="text-right"><a class="btn btn-sm btn-warning" href="{$CurrentPage.PageByIdentifierCodeLink('SilvercartRevocationFormPage')}?o={$ID}"><%t SilverCart\Forms\RevocationForm.GoTo 'Go to revocation form' %> <span class="fa fa-caret-right"></span></a></td>
                </tr>
            <% with $CurrentPage %>
                <% if $AllowReorder %>
                <tr>
                    <td colspan="2" class="text-right">
                        <a class="btn btn-sm btn-outline-primary" href="{$ReoderLink}">{$fieldLabel('ButtonReorder')} <span class="fa fa-caret-right"></span></a><br/>
                        <small class="alert alert-dark mt-1 mb-0 p-1 d-inline-block text-left"><span class="fa fa-info-circle"></span> {$fieldLabel('ButtonReorderDesc')}</small>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-right">
                        <a class="btn btn-sm btn-outline-primary" href="{$ReoderFullLink}">{$fieldLabel('ButtonReorderFull')} <span class="fa fa-caret-right"></span></a><br/>
                        <small class="alert alert-dark mt-1 mb-0 p-1 d-inline-block text-left"><span class="fa fa-info-circle"></span> {$fieldLabel('ButtonReorderFullDesc')}</small>
                    </td>
                </tr>
                <% end_if %>
            <% end_with %>
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
    <% if $OrderDetailActions %>
<div class="d-flex justify-content-between">
    {$OrderDetailActions}
</div>
    <% end_if %>
<% end_with %>
