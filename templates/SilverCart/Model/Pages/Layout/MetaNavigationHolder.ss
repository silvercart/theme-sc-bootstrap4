<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
<% if $Children %>
        <div class="card-deck">
    <% loop $Children %>
            <div class="card card-product mb-3">
                <h2 class="card-header">
                    <a href="#section{$ID}" data-target="#section{$ID}" data-toggle="collapse" class="accordion-toggle btn btn-link btn-sm btn-wrap text-left" title="{$Title}" aria-expanded="<% if first %>true<% else %>false<% end_if %>" aria-controls="section{$ID}"><span class="fa fa-caret-right"></span> {$Title}</a>
                </h2>
                <div class="card-body">
                    {$MetaDescription}
                </div>
                <div class="card-footer">
                    <a class="btn btn-sm btn-secondary btn-wrap float-right" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>">{$Title} <span class="fa fa-caret-right"></span></a>
                </div>
            </div>
    <% end_loop %>
        </div>
<% end_if %>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div> 