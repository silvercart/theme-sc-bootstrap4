<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
    <fieldset>
        <% if $Legend %><legend>{$Legend}</legend><% end_if %>
        <% loop $Fields %>
        <div class="mb-3">
            {$FieldHolder}
            <% if $CookieGroup.exists %>
            <div id="cookie-details-{$CookieGroup.ID}" style="display:none;">
                {$CookieGroup.renderWith('Broarm\\CookieConsent\\Shortcode\\CookieGroupTable_table')}
            </div>
            <% end_if %>
        </div>
        <% end_loop %>
    </fieldset>
<% if $Actions %>
    <div class="btn-toolbar justify-content-end">
    <% if $CurrentPage.isAjaxRequest %>
        <button class="btn btn-outline-primary btn-back mr-auto"><span class="fas fa-arrow-left"></span> <%t SilverCart\Model\Pages\Page.BACK 'Back' %></button>
    <% end_if %>
    <% loop $Actions %>
        <% if $InputType == 'submit' %>
            {$setUseButtonTag(1).addExtraClass('btn btn-outline-primary').Field}
        <% else_if $InputType == 'reset' %>
            {$setUseButtonTag(1).addExtraClass('btn btn-outline-danger').Field}
        <% else %>
            {$setUseButtonTag(1).addExtraClass('btn btn-outline-primary').Field}
        <% end_if %>
    <% end_loop %>
        <a class="btn btn-primary btn-accept ml-2 button cookie-consent__button cookie-consent__button--accept" href="{$CurrentPage.AcceptAllCookiesLink}" rel="nofollow">
            <span class="fas fa-check"></span> <%t Broarm\\CookieConsent\\CookieConsent.AcceptAllCookies 'Accept all cookies' %>
        </a>
    </div>
<% end_if %>
<% if $IncludeFormTag %>
</form>
<% end_if %>
