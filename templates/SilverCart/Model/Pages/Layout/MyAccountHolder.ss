<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
    <% if $CurrentRegisteredCustomer %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        <% if $Children %>
            <% loop $Children %>
                <% if $hasSummary %>
            <section class="card mb-3">
                <div class="card-body clearfix">
                    <h3 class="card-title"><span class="fa fa-caret-right"></span> {$SummaryTitle}</h3>
                    <div class="card-text">{$Summary}</div>
                    <div class="card-footer"><a class="btn btn-sm btn-primary float-right" href="{$Link}" title="<%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %>"><%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %> <span class="fa fa-arrow-right"></span></a></div>
                </div>
            </section>
                <% end_if %>
            <% end_loop %>
        <% end_if %>
        </article>
    <% else %>
        <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
    <% end_if %>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
    <% if $CurrentRegisteredCustomer %>
        {$SubNavigation}
    <% end_if %>
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>




