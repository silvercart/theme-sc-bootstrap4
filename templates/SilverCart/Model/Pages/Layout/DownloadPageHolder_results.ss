<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
            {$DownloadSearchForm}
            <div class="alert alert-info mt-2"><%t SilverCart\Model\Pages\DownloadPageHolder.ResultsText 'Your search for <strong>&quot;{term}&quot;</strong> resulted in <strong>{count} results</strong>.' term=$SearchQuery count=$SearchResultsCount %></div>
            <% include SilverCart/Model/Pages/DownloadPage_Table %>
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>