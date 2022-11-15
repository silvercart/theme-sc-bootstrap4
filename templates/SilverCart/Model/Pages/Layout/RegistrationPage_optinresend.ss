<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\RegistrationPage.OptInResendTitle 'Resend verification link' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\RegistrationPage.OptInResendTitle 'Resend verification link' %></h1></header>
        <% if $CurrentRegisteredCustomer %>
            <div class="alert alert-info"><%t SilverCart\Model\Pages\RegistrationPage.OptInResendMessage 'The email verification link was resent to {email}.' email=$CurrentUser.Email %></div>
            <div class="clearfix">
                <a class="btn btn-outline-primary float-left" href="{$logoutURL}"><span class="fa fa-sign-out"></span> <%t SilverCart\Model\Pages\Page.LOGOUT 'Logout' %></a>
                <a class="btn btn-primary float-right" href="{$Link('optinresend')}"><span class="fa fa-envelope"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInResend 'Resend verification email' %></a>
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