<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only"><%t SilverCart\Model\Pages\RegistrationPage.OptInWelcomeTitle 'Cofirm your email address' %></h2>
        <article>
            <header><h1><%t SilverCart\Model\Pages\RegistrationPage.OptInWelcomeTitle 'Cofirm your email address' %></h1></header>
        <% if $CurrentRegisteredCustomer %>
            <div class="alert alert-info">
                <strong><span class="fa fa-check"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInWelcomeMessage 'Congratulations! Your registration in our shop was successful!' %></strong><br/>
                <br/>
                <%t SilverCart\Model\Pages\RegistrationPage.OptInWelcomeMessage2 'To activate your account, please confirm your email address by visiting the verification link you received by email.' %><br/>
                <%t SilverCart\Model\Pages\RegistrationPage.OptInWelcomeMessage3 'The email verification link was sent to <strong>{email}</strong>. Please check your inbox.' email=$CurrentUser.Email %>
            </div>
            <div class="clearfix">
                <a class="btn btn-primary float-left" href="{$baseHref}"><span class="fa fa-angle-double-left"></span> <%t SilverCart\Model\Pages\RegistrationPage.OptInGoToShop 'Go to shop' %></a>
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
