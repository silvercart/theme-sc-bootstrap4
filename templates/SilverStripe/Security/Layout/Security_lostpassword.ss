<div class="row">
    <section id="content-main" class="col-12">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            <% if $CurrentPage.IsLostPasswordView && $CurrentPage.PageByIdentifierCode('SilvercartMyAccountHolder').ChangePasswordContent %>
                {$CurrentPage.PageByIdentifierCode('SilvercartMyAccountHolder').ChangePasswordContent}
            <% else %>
                {$Content}
            <% end_if %>
            <% if $CurrentPage.IsPasswordSentView %>
                {$CurrentPage.PageByIdentifierCode('SilvercartMyAccountHolder').ChangePasswordInfo}
            <% end_if %>
        <% if $Form %>
            {$Form}
        <% end_if %>
        </article>
    </section>
</div>