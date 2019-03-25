<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\RevocationFormPage.Success 'Successfully sent revocation' %></h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1><%t SilverCart\Model\Pages\RevocationFormPage.Success 'Successfully sent revocation' %></h1></header>
            <div class="alert alert-success"><%t SilverCart\Model\Pages\RevocationFormPage.SuccessText 'Thank you! We received your revocation.' %></div>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>