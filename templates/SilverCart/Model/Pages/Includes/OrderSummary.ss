<% if $CurrentPage.CurrentMembersOrders %>
    <table id="silvercart-order-holder-table-id" class="table responsive-table">
        <thead>
            <tr>
                <th><%t SilverCart\Model\Pages\Page.ORDER_DATE 'order date' %></th>
                <th>{$CurrentPage.CurrentMembersOrders.first.fieldLabel('OrderNumber')}</th>
                <th><%t SilverCart\Model\Pages\Page.ORDERED_PRODUCTS 'ordered products' %></th>
                <th><%t SilverCart\Model\Order\OrderStatus.SINGULARNAME 'Order status' %></th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        <tbody>
            <% loop $CurrentPage.CurrentMembersOrders(3) %>
                <tr>
                    <td class="creationdate" data-title="<%t SilverCart\Model\Pages\Page.ORDER_DATE 'order date' %>"><a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}">{$Created.Nice}</a></td>
                    <td class="ordernumber" data-title="{$fieldLabel('OrderNumber')}"><a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}"><span class="mobile-show-sm inline">#</span>{$OrderNumber}</a></td>
                    <td class="positions" data-title="<%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %>"><a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}"><% loop $OrderPositions %>{$Title.RAW} <% if not $Last %> | <% end_if %><% end_loop %></a></td>
                    <td class="orderstatus" data-title="{$fieldLabel('OrderStatus')}"><a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}">{$OrderStatus.Title}</a></td>
                    <td class="detailbutton"><a class="btn btn-sm btn-primary" href="{$CurrentPage.OrderDetailLink}{$ID}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>"><span class="fa fa-angle-double-right"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a></td>
                </tr>
            <% end_loop %>
        </tbody>
    </table>
<% else %>
<div class="alert alert-info">
    <p><%t SilverCart\Model\Pages\Page.NO_ORDERS 'You do not have any orders yet' %></p>
</div>
<% end_if %>