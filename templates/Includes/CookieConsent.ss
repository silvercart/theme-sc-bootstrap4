<% if $PromptCookieConsent %>
    <style>
        body {
            overflow: hidden;
        }
    </style>
    <div class="cookie-consent-background" style="z-index:1030;">
        <div class="cookie-consent" id="cookie-consent">
            <div id="cookie-consent-main">
                <h3>{$SiteConfig.CookieConsentTitle}</h3>
                <div class="cookie-consent-body">{$SiteConfig.CookieConsentContent}</div>
                <div class="d-flex justify-content-between cookie-consent__buttons">
                    <a class="btn btn-link btn-manage button hollow cookie-consent__button cookie-consent__button--manage" href="{$CookiePolicyPage.Link}" data-target="{$baseHref}sc-action/cookieManager">
                        <span class="fas fa-cog"></span> <%t Broarm\\CookieConsent\\CookieConsent.ManageCookies 'Manage cookie settings' %>
                    </a>
                    <a class="btn btn-primary btn-accept button cookie-consent__button cookie-consent__button--accept" href="{$AcceptAllCookiesLink}" rel="nofollow">
                        <span class="fas fa-check"></span> <%t Broarm\\CookieConsent\\CookieConsent.AcceptAllCookies 'Accept all cookies' %>
                    </a>
                </div>
            </div>
        </div>
    </div>
<% end_if %>