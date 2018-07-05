<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        <% if $CurrentRegisteredCustomer %>
            <div class="alert alert-info"><%t SilverCart\Model\Pages\Page.ALREADY_REGISTERED 'Hello {name}, You have already registered.' name=$CurrentMember.FirstName %></div>
        <% else %>
            {$RegisterRegularCustomerForm}
        <% end_if %>
        </article>
        <% if $WidgetSetContent.exists %>
        <section class="sc-widget-holder">
            {$InsertWidgetArea(Content)}
        </section>
        <% end_if %>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
