<div class="row">
    <div id="content-main" class="span12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
        {$ContentStep6}
        <div class="alert alert-success clearfix">
            <strong><span class="fa fa-check"></span> <%t SilverCart\Model\Pages\Page.ORDER_COMPLETED 'Your order is completed' %></strong><br/>
            <br/>
            <%t SilverCart\Model\Pages\Page.ORDER_THANKS 'Many thanks for Your oder.' %> <%t SilverCart\Model\Pages\Page.ORDERS_EMAIL_INFORMATION_TEXT 'Please check Your email inbox for the order confirmation.' %><br/>
            <% if currentMember.currentRegisteredCustomer %>
                <br/>
                <%t SilverCart\Model\Pages\Page.VIEW_ORDERS_TEXT 'You can check the status of Your order any time in the' %> <a href="{$PageByIdentifierCodeLink('SilvercartOrderHolder')}"><%t SilverCart\Model\Pages\OrderHolder.SINGULARNAME 'Order overview' %></a>.<br/>
                <a class="btn btn-success btn-block-sm float-right" href="{$PageByIdentifierCodeLink('SilvercartOrderHolder')}"><%t SilverCart\Model\Pages\OrderHolder.SINGULARNAME 'Order overview' %></a>
            <% end_if %>
        </div>

        {$PaymentConfirmationText}

        <% if $CustomersOrder %>
            <h1><%t SilverCart\Model\Pages\OrderHolder.OrderDetails 'Order Details' %></h1>
            <% include SilverCart/Model/Pages/OrderDetails %>
        <% end_if %>

        <div class="silvercartWidgetHolder">
            {$InsertWidgetArea(Content)}
        </div>
    </div>
</div>
{$SiteConfig.GoogleConversionTrackingCode.RAW}