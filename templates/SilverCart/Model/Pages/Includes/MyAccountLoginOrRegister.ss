<div class="form-vertical grouped">
    <h4><%t SilverCart\Model\Pages\MyAccountHolder.ALREADY_HAVE_AN_ACCOUNT 'Do you already have an account?' %></h4>
    <div class="margin-side">
        {$LoginForm}
    </div>

    <h4><%t SilverCart\Model\Pages\MyAccountHolder.WANTTOREGISTER 'Do you want to register?' %></h4>
    <div class="row">
        <div class="span4 col-xs-12 col-xl-4">
            <a class="btn btn-sm btn-primary" href="{$PageByIdentifierCodeLink('SilvercartRegistrationPage')}"><%t SilverCart\Model\Pages\MyAccountHolder.GOTO_REGISTRATION 'Go to the registration form' %></a>
        </div>
        <div class="span8 col-xs-12 col-xl-8 last">
            <%t SilverCart\Model\Pages\MyAccountHolder.REGISTER_ADVANTAGES_TEXT 'By registering you can reuse your data like invoice or delivery addresses on your next purchase.' %>
        </div>
    </div>
</div>
<br><br>