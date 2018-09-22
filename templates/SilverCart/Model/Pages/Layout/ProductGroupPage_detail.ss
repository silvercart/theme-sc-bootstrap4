<div class="row">
    <div id="content-main" class="col-12 <% if $InsertWidgetArea('Sidebar') %>col-md-9<% else %>col-md-12<% end_if %> sc-product-details">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div id="sc-product-backlink" class="clearfix mb-3">
            <% if $BackLink %>
            <a class="btn btn-sm float-left" href="{$BackLink}#product{$getProduct.ID}">
                <span class="fa fa-chevron-left"></span>
                <%t SilverCart\Model\Pages\Page.BACK_TO 'Back to &quot;{title}&quot;' title=$BackPage.MenuTitle %>
            </a>
            <% end_if %>
            <a class="btn btn-sm float-left" href="javascript:window.print()" title="<%t SilverCart\Model\Pages\ProductPage.PRINT 'Print' %>">
                <span class="fa fa-print"></span>
            </a>
            <a class="btn btn-sm float-left" href="{$getProduct.ProductQuestionLink}" title="<%t SilverCart\Model\Product\Product.PRODUCT_QUESTION_LABEL 'Questions for the product' %>">
                <span class="fa fa-envelope"></span>
            </a>
        </div>
    <% with $Product %>
        <article class="card card-product">
            {$InsertWidgetArea(Content)}
            {$BeforeProductHtmlInjections}
            <header class="card-header sc-product-title row no-gutters">
                <h1 class="card-title col-md-10">{$Title.HTML}</h1>
                <div class="col-md-2 text-right">
                    <span class="card-subtitle"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$ProductNumberShop}</span>
                </div>
            </header>
        <% if $hasPortraitOrientationImage %>
            <% include SilverCart/Model/Pages/Product_Portrait %>
        <% else %>
            <% include SilverCart/Model/Pages/Product_Landscape %>
        <% end_if %>
        </article>
        <% if $PluggedInAfterImageContent %>
            <% loop $PluggedInAfterImageContent %>
                {$Content}
            <% end_loop %>
        <% end_if %>
        <% include SilverCart\Model\Pages\ProductPageTabs %>
        {$AfterProductHtmlInjections}
    <% end_with %>
    <% if $Product.WidgetArea.WidgetControllers %>
        <div class="mt-3">
        <% loop $Product.WidgetArea.WidgetControllers %>
            {$WidgetHolder}
        <% end_loop %>
        </div>
    <% end_if %>
    </div>
<% if $InsertWidgetArea('Sidebar') %>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea('Sidebar')}
    </aside>
<% end_if %>
</div>
