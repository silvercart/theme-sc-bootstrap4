<div class="row">
    <section id="content-main" class="col-12">
        <h2 class="sr-only">{$Title}</h2>
        <article>
            <div class="alert alert-info">
                <h1 class="alert-heading">{$Title} <small class="font-italic">[{$fieldLabel('ErrorCode')} {$ErrorCode}]</small></h1>
                <p><strong>{$Content}</strong></p>
            </div>
        <% if $ErrorCode == 403 && not $CurrentUser.isRegisteredCustomer %>
            <div class="card">
                <div class="card-header">
                    <h3 class="m-0">{$fieldLabel('Login')}</h3>
                </div>
                <div class="card-body">
                    {$LoginForm}
                </div>
            </div>
        <% end_if %>
        </article>
    </section>
</div>