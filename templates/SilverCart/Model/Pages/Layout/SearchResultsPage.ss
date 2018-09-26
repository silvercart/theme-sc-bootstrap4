<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\SearchResultsPage.TITLE 'Search Results' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\SearchResultsPage.TITLE 'Search Results' %></h1></header>
        <% if $EncodedSearchQuery %>
            <p><%t SilverCart\Model\Pages\SearchResultsPage.RESULTTEXT 'Search results for query <strong>&rdquo;{query}&rdquo;</strong>' query=$EncodedSearchQuery.RAW %> ({$TotalSearchResults} <%t SilverCart\Model\Pages\Page.SEARCH_RESULTS 'results' %>):</p>
        <% end_if %>
        <% if $getProducts %>
            <nav class="silvercart-product-group-page-control-top">
                <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
            </nav>
            <section class="silvercart-product-group-page sc-products clearfix">
                {$RenderProductGroupPageGroupView}
            </section>
        <% else %>
            <div class="alert alert-info">
                <%t SilverCart\Model\Pages\Page.THE_QUERY 'The query' %><strong>&rdquo;{$EncodedSearchQuery.RAW}&rdquo;</strong><%t SilverCart\Model\Pages\Page.DIDNOT_RETURN_RESULTS 'did not return any results in our shop.' %>
            </div>
        <% end_if %>
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>