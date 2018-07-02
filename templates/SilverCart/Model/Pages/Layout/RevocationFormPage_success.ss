<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
            <h1><%t SilverCart\Model\Pages\RevocationFormPage.Success 'Successfully sent revocation' %></h1>
        </div>
        <div class="alert alert-success"><%t SilverCart\Model\Pages\RevocationFormPage.SuccessText 'Thank you! We received your revocation.' %></div>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>