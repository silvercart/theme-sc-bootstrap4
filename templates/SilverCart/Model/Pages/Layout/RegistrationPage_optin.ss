<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\RegistrationPage.OptInTitle 'Confirm your email address' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\RegistrationPage.OptInTitle 'Confirm your email address' %></h1></header>
        <% if $CurrentRegisteredCustomer %>
            <div class="alert alert-success"><%t SilverCart\Model\Pages\RegistrationPage.OptInMessage 'Your email address is confirmed.' %></div>
            <div class="clearfix">
                <a class="btn btn-primary float-left" href="{$baseHref}"><span class="fa fa-angle-double-left"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInGoToShop 'Go to shop' %></a>
                <a class="btn btn-primary float-right" href="{$PageByIdentifierCode('SilvercartMyAccountHolder').Link}"><%t SilverCart\Model\Pages\RegistrationPage.OptInGoToMyAccount 'Go to my account' %> <span class="fa fa-angle-double-right"></span></a>
            </div>
        <% else %>
            <div class="alert alert-info"><%t SilverCart\Model\Pages\RegistrationPage.OptInMessageLogin 'Please log in to confirm your email address.' %></div>
            <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
        <% end_if %>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>