<div class="row">
    <section id="content-main" class="col-12">
        {$BeforeContent}
        <article>
            {$ContentStep6}
            <div class="alert alert-success clearfix">
                <strong><span class="fa fa-check"></span> {$TitleStep6}</strong><br/>
                <br/>
            <% if $ContentStep6 %>
                {$ContentStep6}
            <% else %>
                <%t SilverCart\Model\Pages\Page.ORDER_THANKS 'Many thanks for Your oder.' %> <%t SilverCart\Model\Pages\Page.ORDERS_EMAIL_INFORMATION_TEXT 'Please check Your email inbox for the order confirmation.' %><br/>
                <br/>
            <% end_if %>
            <% if currentMember.currentRegisteredCustomer %>
                <%t SilverCart\Model\Pages\Page.VIEW_ORDERS_TEXT 'You can check the status of Your order any time in the' %> <a href="{$PageByIdentifierCodeLink('SilvercartOrderHolder')}"><%t SilverCart\Model\Pages\OrderHolder.SINGULARNAME 'Order overview' %></a>.<br/>
                <a class="btn btn-success btn-block-sm float-right" href="{$PageByIdentifierCodeLink('SilvercartOrderHolder')}"><%t SilverCart\Model\Pages\OrderHolder.SINGULARNAME 'Order overview' %></a>
            <% end_if %>
            </div>
            {$PaymentConfirmationText}
            <% if $CustomersOrder.HasPositionsWithOrderConfirmationPageText %>
                <% loop $CustomersOrder.PositionsWithOrderConfirmationPageText %>
                    {$Product.OrderEmailText}
                <% end_loop %>
            <% end_if %>
            {$AfterContent}
        </article>
    <% if $CustomersOrder %>
        <h1><%t SilverCart\Model\Pages\OrderHolder.OrderDetails 'Order Details' %></h1>
        <% include SilverCart/Model/Pages/OrderDetails %>
    <% end_if %>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
</div>