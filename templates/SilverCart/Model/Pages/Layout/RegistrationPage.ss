<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
        {$Content}
        <% if $CurrentRegisteredCustomer %>
            <p><%t SilverCart\Model\Pages\Page.ALREADY_REGISTERED 'Hello {name}, You have already registered.' name=$CurrentMember.FirstName %></p>
        <% else %>
            {$RegisterRegularCustomerForm}
        <% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
