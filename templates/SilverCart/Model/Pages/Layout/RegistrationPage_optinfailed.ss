<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\RegistrationPage.OptInFailedTitle 'Opt-in failed' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\RegistrationPage.OptInFailedTitle 'Opt-in failed' %></h1></header>
            <div class="alert alert-danger"><%t SilverCart\Model\Pages\RegistrationPage.OptInFailedMessage 'This registration opt in link is invalid.' %></div>
            <div class="clearfix">
                <a class="btn btn-primary float-left" href="{$baseHref}"><span class="fa fa-angle-double-left"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInGoToShop 'Go to shop' %></a>
                <a class="btn btn-primary float-right" href="{$Link('optinresend')}"><span class="fa fa-envelope"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInResend 'Resend verification email' %></a>
            </div>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>