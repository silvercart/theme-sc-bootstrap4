<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
    <% if $CurrentRegisteredCustomer %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        <% if $CurrentMembersOrders %>
            <table id="silvercart-order-holder-table-id" class="table responsive-table">
                <thead>
                    <tr>
                        <th scope="col" class="text-left"><%t SilverCart\Model\Pages\Page.ORDER_DATE 'order date' %> /<br />{$CurrentMembersOrders.first.fieldLabel('OrderNumber')}</th>
                        <th scope="col" class="text-left"><%t SilverCart\Model\Pages\Page.ORDERED_PRODUCTS 'ordered products' %></th>
                        <th scope="col" class="text-left"><%t SilverCart\Model\Order\OrderStatus.SINGULARNAME 'Order Status' %></th>
                        <th scope="col" class="text-left"><%t SilverCart\Model\Payment\PaymentStatus.SINGULARNAME 'Payment Status' %></th>
                        <th scope="col" class="text-left">{$CurrentMembersOrders.first.fieldLabel('AmountTotal')}</th>
                        <th scope="col">&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                <% loop $CurrentMembersOrders %>
                    <% include SilverCart/Model/Pages/OrderHolderOrderListEntry %>
                <% end_loop %>
                </tbody>
            </table>
        <% else %>
            <div class="alert alert-danger">
                <p><%t SilverCart\Model\Pages\Page.NO_ORDERS 'You do not have any orders yet' %></p>
            </div>
        <% end_if %>
        </article>
    <% else %>
        <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
    <% end_if %>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
    <% if $CurrentRegisteredCustomer %>
        {$SubNavigation}
    <% end_if %>
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>