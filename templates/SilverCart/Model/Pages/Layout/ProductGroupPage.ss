<div class="row row-offcanvas row-offcanvas-right">
<% cached $CacheKey %>
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article aria-label="{$Title.XML}">
            <header><h1 id="maintitle">{$Title}</h1></header>
    <% if $ViewableChildren %>
        <nav class="silvercart-product-group-page-control-top navbar pb-3 clearfix">
            <% include SilverCart/Model/Pages/ProductGroupHolderControls %>
        </nav>
        <section class="silvercart-product-group-page sc-products mb-3 clearfix">
            <h2 class="sr-only">{$Title}</h2>
            {$RenderProductGroupHolderGroupView}
        </section>
    <% end_if %>
        {$InsertWidgetArea(Content)}
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
    <aside id="sidebar" class="col-12 col-md-3 sidebar-offcanvas">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>