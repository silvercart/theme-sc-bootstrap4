<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\RegistrationPage.OptInPendingTitle 'Opt-in pending' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\RegistrationPage.OptInPendingTitle 'Opt-in pending' %></h1></header>
            <div class="alert alert-info"><%t SilverCart\Model\Pages\RegistrationPage.OptInPendingMessage 'Email verification is pending. Please check your mailbox and visit the verification link.' %></div>
            <div class="clearfix">
                <a class="btn btn-primary float-left" href="{$baseHref}"><span class="fa fa-angle-double-left"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInGoToShop 'Go to shop' %></a>
                <a class="btn btn-primary float-right" href="{$Link('optinresend')}"><span class="fa fa-envelope"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInResend 'Resend verification email' %></a>
            </div>
            <div class="clearfix mt-40">
                <a class="btn btn-sm btn-outline-danger float-right" href="{$logoutURL}" title="<%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %>"><%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %> <span class="fa fa-sign-out"></span></a>
            </div>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>