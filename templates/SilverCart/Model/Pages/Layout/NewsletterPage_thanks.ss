<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\NewsletterPage.THANKS_TITLE 'Newsletter Status' %></h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1><%t SilverCart\Model\Pages\NewsletterPage.THANKS_TITLE 'Newsletter Status' %></h1></header>
    <% with $NewsletterForm %>
        <% if $Message %>
            <div id="{$FormName}_message" class="alert alert-{$MessageType} message {$MessageType}">{$Message}</div>
        <% end_if %>
    <% end_with %>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>