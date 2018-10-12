<div class="row row-offcanvas row-offcanvas-right">
<% cached $CacheKey %>
    <section id="content-main" class="col-12 col-md-9 col-lg-10 col-md-lg-80 col-xxl-89 order-md-2">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article aria-label="{$Title.XML}">
            <header><h1 id="maintitle">{$Title}</h1></header>
    <% if $isFirstPage && not $isFiltered %>
        <% if $ViewableChildren %>
        <nav class="silvercart-product-group-page-control-top navbar pb-3 clearfix">
            <% include SilverCart/Model/Pages/ProductGroupHolderControls %>
        </nav>
        <section class="silvercart-product-group-page sc-products mb-3 clearfix">
            <h2 class="sr-only">{$Title}</h2>
            {$RenderProductGroupHolderGroupView}
        </section>
        <% end_if %>
        <% if $ShowPreorderableProducts %>
            <% with $getPreorderableProductsForTemplate(10) %>
        <section class="widget mb-3 clearfix">
            <h2 class="d-inline-block">{$Title}</h2>
            <a href="{$PreorderableProductsLink}" class="d-inline-block ml-2"><span class="fa fa-arrow-right"></span> {$PreorderableProductsLinkTitle}</a>
            <% include SilverCart\View\GroupView\WidgetProductBoxSlider %>
        </section>
            <% end_with %>
        <% end_if %>
        <% if $ShowNewProducts %>
            <% with $getNewProductsForTemplate(10) %>
        <section class="widget mb-3 clearfix">
            <h2 class="d-inline-block">{$Title}</h2>
            <a href="{$NewProductsLink}" class="d-inline-block ml-2"><span class="fa fa-arrow-right"></span> {$NewProductsLinkTitle}</a>
            <% include SilverCart\View\GroupView\WidgetProductBoxSlider %>
        </section>
            <% end_with %>
        <% end_if %>
        {$BeforeInsertWidgetAreaContent}
        {$InsertWidgetArea('Content')}
    <% end_if %>
    <% if $HasMoreProductsThan(0) %>
        <div class="silvercart-product-group-page-control-top clearfix" id="scpgpct">
            <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
        </div>
    <% end_if %>
        <section class="silvercart-product-group-page sc-products clearfix">
            <h2 class="sr-only">{$Title}</h2>
            {$RenderProductGroupPageGroupView}
        </section>
    <% if $HasMoreProductsThan(0) %>
        <% include SilverCart/Model/Pages/ProductGroupPageControlsBottom %>
    <% end_if %>
    <% if $isFirstPage %>
        {$PageContent}
    <% end_if %>
        </article>
    </section>
<% end_cached %>
    <aside id="sidebar" class="col-12 col-md-3 col-lg-2 col-md-lg-20 col-xxl-11 sidebar-offcanvas order-md-1 border-right">
        <% include SilverCart\Model\Pages\ProductGroupSidebar %>
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>