<div class="form-vertical grouped">
    <h4><%t SilverCart\Model\Pages\MyAccountHolder.ALREADY_HAVE_AN_ACCOUNT 'Do you already have an account?' %></h4>
    <div class="ml-3 mr-3 mb-3">
        {$LoginForm}
    </div>

    <h4><%t SilverCart\Model\Pages\MyAccountHolder.WANTTOREGISTER 'Do you want to register?' %></h4>
    <div class="ml-3 mr-3 mb-3">
        <a class="btn btn-sm btn-primary" href="{$PageByIdentifierCodeLink('SilvercartRegistrationPage')}"><%t SilverCart\Model\Pages\MyAccountHolder.GOTO_REGISTRATION 'Go to the registration form' %></a>
        <p class="mt-3"><%t SilverCart\Model\Pages\MyAccountHolder.REGISTER_ADVANTAGES_TEXT 'By registering you can reuse your data like invoice or delivery addresses on your next purchase.' %></p>
    </div>
</div>
<br><br>