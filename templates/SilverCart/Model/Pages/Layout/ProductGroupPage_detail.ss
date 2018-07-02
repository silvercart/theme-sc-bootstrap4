<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-xs-12 sc-product-details">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div id="sc-product-backlink" class="clearfix">
            <% if $BackLink %>
            <a class="btn btn-sm pull-xs-left" href="{$BackLink}#product{$getProduct.ID}">
                <i class="fa fa-chevron-left"></i>
                <%t SilverCart\Model\Pages\Page.BACK_TO 'Back to &quot;{title}&quot;' title=$BackPage.MenuTitle %>
            </a>
            <% end_if %>
            <a class="btn btn-sm pull-xs-left" href="javascript:window.print()" title="<%t SilverCart\Model\Pages\ProductPage.PRINT 'Print' %>">
                <i class="fa fa-print"></i>
            </a>
            <a class="btn btn-sm pull-xs-left" href="{$getProduct.ProductQuestionLink}" title="<%t SilverCart\Model\Product\Product.PRODUCT_QUESTION_LABEL 'Questions for the product' %>">
                <i class="fa fa-envelope"></i>
            </a>
        </div>
    <% with $Product %>
        <article class="card card-product">
            {$InsertWidgetArea(Content)}
            {$BeforeProductHtmlInjections}
            <div class="card-header sc-product-title">
                <header class="col-lg-10"><h1 class="card-title">{$Title.HTML}</h1></header>
                <div class="col-lg-2 text-right">
                    <span class="card-subtitle"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$ProductNumberShop}</span>
                </div>
            </div>
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
        <div class="margin-top">
        <% loop $Product.WidgetArea.WidgetControllers %>
            {$WidgetHolder}
        <% end_loop %>
        </div>
    <% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-xs-12">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
