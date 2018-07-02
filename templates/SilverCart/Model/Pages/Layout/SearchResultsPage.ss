<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <h1><%t SilverCart\Model\Pages\SearchResultsPage.TITLE 'Search Results' %></h1>
        <% if $EncodedSearchQuery %>
            <p><%t SilverCart\Model\Pages\SearchResultsPage.RESULTTEXT 'Search results for query <b>&rdquo;{query}&rdquo;</b>' query=$EncodedSearchQuery %> ({$TotalSearchResults} <%t SilverCart\Model\Pages\Page.SEARCH_RESULTS 'results' %>):</p>
        <% end_if %>

        {$InsertWidgetArea(Content)}

        <% if $getProducts %>
            <div class="silvercart-product-group-page-control-top">
                <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
            </div>
            <div class="silvercart-product-group-page sc-products clearfix">
                {$RenderProductGroupPageGroupView}
            </div>
        <% else %>
            <p>
                <%t SilverCart\Model\Pages\Page.THE_QUERY 'The query' %>
                <b>&rdquo;{$EncodedSearchQuery}&rdquo;</b>
                <%t SilverCart\Model\Pages\Page.DIDNOT_RETURN_RESULTS 'did not return any results in our shop.' %>
            </p>
        <% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>