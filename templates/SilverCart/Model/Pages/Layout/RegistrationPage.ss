<div class="row">
    <% if $WidgetSetSidebar.exists %>
    <section id="content-main" class="col-12 col-md-9">
    <% else %>
    <section id="content-main" class="col-12 col-xxl-9">
    <% end_if %>
        <h2 class="sr-only">{$Title}</h2>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        <% if $CurrentRegisteredCustomer %>
            <div class="alert alert-info"><%t SilverCart\Model\Pages\Page.ALREADY_REGISTERED 'Hello {name}, You have already registered.' name=$CurrentMember.FirstName %></div>
        <% else %>
            {$RegisterRegularCustomerForm}
        <% end_if %>
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    <% if $WidgetSetSidebar.exists %>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea(Sidebar)}
    </aside>
    <% else %>
    </section>
    <% end_if %>
</div>
