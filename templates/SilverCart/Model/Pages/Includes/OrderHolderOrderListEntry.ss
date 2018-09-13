<tr>
    <td class="creationdate-and-ordernumber" data-title="{$fieldLabel('OrderNumber')}">
        <a class="highlight creationdate" href="{$CurrentPage.OrderDetailLink}{$ID}">{$Created.Nice}</a><br />
        <a class="highlight ordernumber" href="{$CurrentPage.OrderDetailLink}{$ID}">{$OrderNumber}</a><br />
    <% if $OrderDetailInformationAfterOrderNumber %>
        <% loop $OrderDetailInformationAfterOrderNumber %>
        <a class="highlight ordernumber" href="{$CurrentPage.OrderDetailLink}{$Up.ID}">{$Value}</a><br />
        <% end_loop %>
    <% end_if %>
    </td>
    <td class="positions" data-title="<%t SilverCart\Model\Pages\Page.ORDERED_PRODUCTS 'ordered products' %>">
        <ul class="unstyled list-unstyled">
        <% loop $LimitedOrderPositions(2) %>
            <li><a class="highlight" href="{$CurrentPage.OrderDetailLink}{$Order.ID}">{$Title.RAW}</a></li>
        <% end_loop %>
        <% if $hasMoreOrderPositionsThan(2) %>
            <li><a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}">...</a></li>
        <% end_if %>
        </ul>
    </td>
    <td class="orderstatus" data-title="{$fieldLabel('OrderStatus')}">
        <a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}">{$OrderStatus.Title}</a>
    </td>
    <td class="orderstatus" data-title="{$fieldLabel('PaymentStatus')}">
        <a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}">{$PaymentStatus.Title}</a>
    </td>
    <td class="total-price" data-title="{$fieldLabel('AmountTotal')}">
        <a class="highlight" href="{$CurrentPage.OrderDetailLink}{$ID}">{$AmountTotal.Nice}</a>
    </td>
    <td class="detailbutton">
        <a class="btn btn-sm btn-primary" href="{$CurrentPage.OrderDetailLink}{$ID}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>"  data-toggle="tooltip" data-placement="top" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>"><span class="fa fa-angle-double-right"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
    </td>
</tr>
