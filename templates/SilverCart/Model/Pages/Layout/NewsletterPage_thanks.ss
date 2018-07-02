<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
           <h1><%t SilverCart\Model\Pages\NewsletterPage.THANKS_TITLE 'Newsletter Status' %></h1>
        </div>
    <% with $NewsletterForm %>
        <% if $Message %>
            <p id="{$FormName}_message" class="alert alert-{$MessageType} message {$MessageType}">{$Message}</p>
        <% end_if %>
    <% end_with %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
