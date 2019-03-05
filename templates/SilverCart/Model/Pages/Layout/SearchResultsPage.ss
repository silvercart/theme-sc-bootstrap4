<div class="row">
    <section id="content-main" class="col-12 col-md-9 col-lg-10 col-md-lg-80 col-xxl-89 order-md-2">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\SearchResultsPage.TITLE 'Search Results' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\SearchResultsPage.TITLE 'Search Results' %></h1></header>
        <% if $EncodedSearchQuery && $SearchCategory %>
            <p><%t SilverCart\Model\Pages\SearchResultsPage.ResultsTextQueryAndCategory 'Search results for query <strong>&rdquo;{query}&rdquo;</strong> within the category <strong>&rdquo;{category}&rdquo;</strong> ({results} results)' query=$EncodedSearchQuery.RAW category=$SearchCategory.Title results=$TotalSearchResults %>:</p>
        <% else_if $EncodedSearchQuery %>
            <p><%t SilverCart\Model\Pages\SearchResultsPage.ResultsTextQuery 'Search results for query <strong>&rdquo;{query}&rdquo;</strong> ({results} results)' query=$EncodedSearchQuery.RAW results=$TotalSearchResults %>:</p>
        <% else_if $SearchCategory %>
            <p><%t SilverCart\Model\Pages\SearchResultsPage.ResultsTextCategory 'Search results for the category <strong>&rdquo;{category}&rdquo;</strong> ({results} results)' category=$SearchCategory.Title results=$TotalSearchResults %>:</p>
        <% end_if %>
        <% if $getProducts %>
            <nav class="silvercart-product-group-page-control-top">
                <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
            </nav>
            <section class="silvercart-product-group-page sc-products clearfix">
                {$RenderProductGroupPageGroupView}
            </section>
            <nav class="silvercart-product-group-page-control-bottom">
                <% include SilverCart/Model/Pages/ProductGroupPageControlsBottom %>
            </nav>
        <% else %>
            <div class="alert alert-info">
                <%t SilverCart\Model\Pages\Page.THE_QUERY 'The query' %> <strong>&rdquo;{$EncodedSearchQuery.RAW}&rdquo;</strong> <%t SilverCart\Model\Pages\Page.DIDNOT_RETURN_RESULTS 'did not return any results in our shop.' %>
            </div>
        <% end_if %>
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside id="sidebar" class="col-12 col-md-3 col-lg-2 col-md-lg-20 col-xxl-11 sidebar-offcanvas order-md-1 border-right">
        <% include SilverCart\Model\Pages\SearchResultsSidebar %>
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>