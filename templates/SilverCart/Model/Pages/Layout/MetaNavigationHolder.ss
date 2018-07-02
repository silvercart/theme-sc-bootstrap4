<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12 silvercartMetaNavigationHolder">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
        {$Content}
        <% if $Form %>
        <div class="form">
            {$Form}
        </div>
        <% end_if %>
        <div class="silvercartWidgetHolder">
            {$InsertWidgetArea(Content)}
        </div>
<% if $Children %>
    <% loop $Children %>
        <div class="col-lg-4">
            <div class="card">
                <h2 class="card-title">
                    <a href="#section{$ID}" data-target="#section{$ID}" data-toggle="collapse" class="accordion-toggle btn btn-default btn-sm" title="{$Title}" aria-expanded="<% if first %>true<% else %>false<% end_if %>" aria-controls="section{$ID}"><i class="fa fa-caret-right"></i> {$Title}</a>
                </h2>
                <div class="card-block">
                    {$MetaDescription}
                </div>
                <div class="card-footer">
                    <a class="btn btn-secondary pull-xs-right float-right" href="{$Link}" title="{$Title}"><%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %> <span class="fa fa-caret-right"></span></a>
                </div>
            </div>
          </div>
    <% end_loop %>
<% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div> 