<div class="cookie-consent-field {$Class}">
    <div class="float-right">
        <div class="custom-control custom-switch">
            {$addExtraClass('custom-control-input').Field}
            <label class="custom-control-label" for="{$ID}"></label>
        </div>
    </div>
    <div class="mr-5">
        <a class="btn-cookie-details ml-2" data-target="#cookie-details-{$CookieGroup.ID}" href="javascript:;"><span class="fas fa-chevron-down"></span></a> <label for="{$ID}" class="font-weight-bold text-uppercase d-inline-block m-0">{$Title}</label>
    </div>
</div>
<% if $Message %>
    <div class="cookie-consent-field__message cookie-consent-field__message--{$MessageType}}">
        {$Message}
    </div>
<% end_if %>