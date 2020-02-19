<% if $Product.Single.exists %>
<div class="shopping-cart-position <% if not $first %>border-top pt-3 mt-3<% end_if %>" data-position-id="{$ID}">
    <div class="shopping-cart-position-content clearfix">
        <div class="float-left mr-3">
            <img class="img-fluid" src="{$Product.Single.ImageURL}" alt="" style="max-height: 60px;" /><br/>
        </div>
        {$Product.SinglePropertiesNice} {$Product.Single.LongNameHTML}<br/>
        <div class="btn-toolbar justify-content-between mt-2" role="toolbar">
            <button class="btn btn-sm btn-link btn-position-remove" type="button" data-position-id="{$ID}" data-target="{$CurrentPage.Link('removeFromCart')}" data-success-callback="silvercart.modal.sidebarShoppingCart().updateInfo(data);"><span class="fa fa-trash"></span> <%t BattleBear\SingleCardManager.remove 'remove' %></button>
            <div class="input-group input-group-sm input-group-position-quantity" style="width: 100px;">
                <div class="input-group-prepend">
                    <button class="btn btn-light btn-position-decrease" type="button" data-position-id="{$ID}"><span class="fa fa-minus"></span></button>
                </div>
                <input class="form-control bg-light border-light text-center input-position-quantity no-arrows" type="number" aria-label="{$fieldLabel('Quantity')}" value="{$TypeSafeQuantity}" name="Quantity[{$ID}]" data-name="Quantity" data-position-id="{$ID}" data-target="{$CurrentPage.Link('updateQuantity')}" data-success-callback="silvercart.modal.sidebarShoppingCart().updateInfo(data);" min="0" max="<% if $Product.StockQuantity > 4 %>4<% else %>{$Product.StockQuantity}<% end_if %>">
                <div class="input-group-append">
                    <button class="btn btn-light btn-position-increase" type="button" data-position-id="{$ID}"><span class="fa fa-plus"></span></button>
                </div>
            </div>
        </div>
    </div>
</div>
<% else %>
<div class="shopping-cart-position border-top pt-3 mt-3" data-position-id="{$ID}">
    <div class="shopping-cart-position-content clearfix">
        <div class="float-left mr-3">
            <img class="img-fluid" src="{$Product.ListImage.Pad(62,62).URL}" alt="{$Product.Title}" />
        </div>
        {$Product.Title}<br/>
        <div class="btn-toolbar justify-content-between mt-2" role="toolbar">
            <button class="btn btn-sm btn-link btn-position-remove" type="button" data-position-id="{$ID}"><span class="fa fa-trash"></span> <%t BattleBear\SingleCardManager.remove 'remove' %></button>
            <div class="input-group input-group-sm" style="width: 100px;">
                <div class="input-group-prepend">
                    <button class="btn btn-light position-decrease" type="button" data-position-id="{$ID}"><span class="fa fa-minus"></span></button>
                </div>
                <input class="form-control bg-light border-light text-center input-position-quantity no-arrows" aria-label="{$fieldLabel('Quantity')}" value="{$TypeSafeQuantity}" name="Quantity[{$ID}]" data-name="Quantity" data-position-id="{$ID}">
                <div class="input-group-append">
                    <button class="btn btn-light position-increase" type="button" data-position-id="{$ID}"><span class="fa fa-plus"></span></button>
                </div>
            </div>
        </div>
    </div>
</div>
<% end_if %>