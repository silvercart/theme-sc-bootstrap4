<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        </article>
        <% if $WidgetSetContent.exists %>
        <section class="sc-widget-holder">
            {$InsertWidgetArea(Content)}
        </section>
        <% end_if %>
<% if $Children %>
        <div class="card-deck">
    <% loop $Children %>
            <div class="card card-product mb-3">
                <h2 class="card-header">
                    <a href="#section{$ID}" data-target="#section{$ID}" data-toggle="collapse" class="accordion-toggle btn btn-default btn-sm" title="{$Title}" aria-expanded="<% if first %>true<% else %>false<% end_if %>" aria-controls="section{$ID}"><i class="fa fa-caret-right"></i> {$Title}</a>
                </h2>
                <div class="card-body">
                    {$MetaDescription}
                </div>
                <div class="card-footer">
                    <a class="btn btn-sm btn-secondary wrap float-right" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>">{$Title} <span class="fa fa-caret-right"></span></a>
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