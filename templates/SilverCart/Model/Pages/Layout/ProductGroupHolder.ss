<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
<% cached $CacheKey %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
            {$RevocationForm}
        <% if $ViewableChildren %>
            <div class="silvercart-product-group-page-control-top clearfix">
                <% include SilverCart/Model/Pages/ProductGroupHolderControls %>
            </div>
            {$RenderProductGroupHolderGroupView}
        <% end_if %>
        </article>
<% end_cached %>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>