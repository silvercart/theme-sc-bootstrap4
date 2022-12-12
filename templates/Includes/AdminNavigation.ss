<% with $CurrentRegisteredCustomer %>
    <% if $isAdmin || $isCardPurchaser || $isSalesPartner %>
<div id="nav-admin" class="p-fixed m-0 h-100" style="width: 300px; top: 0px; left: -300px; z-index: 1100;">
    <div class="p-relative z-2 border-right border-gray bg-gray-light w-100 h-100" style="box-shadow: inset 0px 0px 4px 0px rgba(0, 0, 0, .5);">
        <% if $isSalesPartner %>
            <% loop $SingleCatalogs %>
        <h6 class="d-flex justify-content-between align-items-center px-3 pt-3 mb-2 text-muted text-uppercase"><span>{$Title}</span><a class="d-flex align-items-center text-muted" href="{$ManageLink('index')}"><span class="fas fa-tv"></span></a></h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('openorders')}"><span class="fas fa-file-invoice-dollar text-center" style="width: 18px;"></span> {$fieldLabel('PageOpenOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('inprogressorders')}"><span class="fas fa-file-invoice text-center" style="width: 18px;"></span> {$fieldLabel('PageInProgressOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('shippedorders')}"><span class="fas fa-shipping-fast text-center" style="width: 18px;"></span> {$fieldLabel('PageShippedOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('pickuporders')}"><span class="fas fa-box-open text-center" style="width: 18px;"></span> {$fieldLabel('PagePickupOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('doneorders')}"><span class="fas fa-clipboard-check text-center" style="width: 18px;"></span> {$fieldLabel('PageDoneOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('canceledorders')}"><span class="fas fa-times text-center" style="width: 18px;"></span> {$fieldLabel('PageCanceledOrders')}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$ManageLink('settings')}"><span class="fas fa-cog text-center" style="width: 18px;"></span> {$fieldLabel('PageSettings')}</a></li>
        </ul>
            <% end_loop %>
        <% end_if %>
        <% if $isCardPurchaser %>
        <h6 class="d-flex justify-content-between align-items-center px-3 pt-3 mb-2 text-muted text-uppercase"><span>Kartenverwaltung</span><a class="d-flex align-items-center text-muted" href="{$Top.SellCardsPage.Link('orders')}"><span class="fas fa-clipboard"></span></a></h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="{$Top.PurchaseCardsPage.Link}"><span class="fas fa-id-badge"></span> {$Top.PurchaseCardsPage.Title}</a></li>
            <li class="nav-item"><a class="nav-link" href="{$Top.PurchaseCardsPage.Link('orders')}"><span class="fas fa-file-invoice-dollar"></span> Ankauf: <%t BattleBear\SingleCardManager\Model\Order\Order.OpenOrders 'Open Orders' %></a></li>
            <li class="nav-item"><a class="nav-link" href="{$Top.SellCardsPage.Link('orders')}"><span class="fas fa-clipboard"></span> Verkauf: <%t BattleBear\SingleCardManager\Model\Order\Order.OpenOrders 'Open Orders' %></a></li>
            <li class="nav-item"><a class="nav-link" href="{$Top.StockPage.Link}"><span class="fas fa-dolly"></span> {$Top.StockPage.fieldLabel('CurrentStock')}</a></li>
        </ul>
        <% end_if %>
        <% if $isAdmin %>
        <h6 class="d-flex justify-content-between align-items-center px-3 pt-3 mb-2 text-muted text-uppercase"><span>Admin</span><a class="d-flex align-items-center text-muted" href="{$baseHref}admin"><span class="fas fa-lock"></span></a></h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link " href="{$baseHref}admin" target="_blank"><span class="fas fa-lock"></span> <%t SilverCart\Model\Pages\Page.ADMIN_AREA 'Admin Access' %></a></li>
            <% if $CurrentPage.AdminLink %>
            <li class="nav-item"><a class="nav-link " href="{$CurrentPage.AdminLink}" target="_blank"><span class="fas fa-pen"></span> <%t SilverCart.EditPage 'Edit page' %></a></li>
                <% if $CurrentPage.isProductDetailView %>
            <li class="nav-item"><a class="nav-link " href="{$CurrentPage.DetailViewProduct.AdminLink}" target="_blank"><span class="fas fa-pen"></span> <%t SilverCart.EditProduct 'Edit product' %></a></li>
                <% end_if %>
            <% end_if %>
            <li class="nav-item"><a class="nav-link" href="{$Link}?flushi18n=1"><span class="fas fa-sync"></span> <%t SilverCart\Model\Pages\Page.FlushI18n 'Flush I18N' %></a></li>
            <li class="nav-item"><a class="nav-link " href="{$Link}?flushrequirements=1"><span class="fas fa-sync"></span> <%t SilverCart\Model\Pages\Page.FlushRequirements 'Flush CSS / JS cache' %></a></li>
        </ul>
        <% end_if %>
    </div>
    <div class="btn-toggle-nav p-absolute z-1 border border-gray-light border-left-0 rounded-right shadow bg-white cursor-pointer op-50 transition-all" style="height: 100px; left: 100%; top: calc(50% - 50px);"><span class="fas fa-2x fa-chevron-right mx-2 align-middle" style="line-height: 100px;"></span></div>
</div>
    <% end_if %>
<% end_with %>