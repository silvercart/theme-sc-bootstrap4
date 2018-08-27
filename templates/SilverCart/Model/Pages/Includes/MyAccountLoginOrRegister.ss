<% if $InfoMessages %>
<div class="alert alert-info">
    <span class="fa fa-info-circle"></span> <% loop $InfoMessages %>{$Text}<br/><% end_loop %>
</div>
<% end_if %>
<div class="form-vertical grouped">
    <h4><%t SilverCart\Model\Pages\MyAccountHolder.ALREADY_HAVE_AN_ACCOUNT 'Do you already have an account?' %></h4>
    <div class="ml-3 mr-3 mb-3">
        {$LoginForm}
    </div>

    <h4><%t SilverCart\Model\Pages\MyAccountHolder.WANTTOREGISTER 'Do you want to register?' %></h4>
    <div class="ml-3 mr-3 mb-3">
        <div class="row">
            <div class="col-12 col-lg-8">
                <p class="mt-3"><%t SilverCart\Model\Pages\MyAccountHolder.REGISTER_ADVANTAGES_TEXT 'By registering you can reuse your data like invoice or delivery addresses on your next purchase.' %></p>
                <a class="btn btn-primary float-right" href="{$PageByIdentifierCodeLink('SilvercartRegistrationPage')}"><span class="fa fa-arrow-right"></span> <%t SilverCart\Model\Pages\MyAccountHolder.GOTO_REGISTRATION 'Go to the registration form' %></a>
            </div>
        </div>
    </div>
</div>
<br><br>