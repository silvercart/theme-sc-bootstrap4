<% cached 'Footer',$CurrentPage.MemberGroupCacheKey %>
<footer class="footer mt-5 pt-4">
    <h3 class="sr-only">Footer Navigation</h3>
    <section class="container-fluid">
        <div class="card-deck justify-content-between">
<% if $FooterColumns %>
    <% loop $FooterColumns %>
            <section class="card bg-light border-0 p-3">
                <h3><a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>">{$MenuTitle.XML}</a></h3>
        <% if $Children %>
                <nav class="footer-links">
                    <ul class="list-unstyled">
            <% loop $Children %>
                        <li><a class="highlight" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><span class="fa fa-caret-right"></span> {$MenuTitle.XML}</a></li>
            <% end_loop %>
                    </ul>
                </nav>
        <% end_if %>
            </section>
    <% end_loop %>
<% end_if %>
<% with $SiteConfig %>
    <% if $FacebookLink || $TwitterLink || $XingLink || $GoogleplusLink || $InstagramLink || $BloglovinLink || $PinterestLink || $YouTubeLink || $TumblrLink || $RSSLink || $EmailLink %>
            <section class="card bg-light border-0 p-3">
                <h3><%t SilverCart\Admin\Model\Config.SOCIALMEDIA 'Social Media' %></h3>
                <div id="socialicons" itemscope itemtype="http://schema.org/Organization">
                    <link itemprop="url" href="{$BaseHref}" />
        <% if $FacebookLink   %><a itemprop="sameAs" class="icon btn mb-1" href="{$FacebookLink}" title="Follow with Facebook" target="_blank"><span class="fa fa-2x fa-facebook"></span></a><% end_if %>
        <% if $TwitterLink    %><a itemprop="sameAs" class="icon btn mb-1" href="{$TwitterLink}" title="Follow with Twitter" target="_blank"><span class="fa fa-2x fa-twitter"></span></a><% end_if %>
        <% if $XingLink       %><a itemprop="sameAs" class="icon btn mb-1" href="{$XingLink}" title="Follow with Xing" target="_blank"><span class="fa fa-2x fa-xing"></span></a><% end_if %>
        <% if $GoogleplusLink %><a itemprop="sameAs" class="icon btn mb-1" href="{$GoogleplusLink}" title="Follow with Google Plus" target="_blank"><span class="fa fa-2x fa-google-plus"></span></a> <% end_if %>
        <% if $InstagramLink  %><a itemprop="sameAs" class="icon btn mb-1" href="{$InstagramLink}" title="Follow with Instagram" target="_blank"><span class="fa fa-2x fa-instagram"></span></a><% end_if %>
        <% if $BloglovinLink  %><a itemprop="sameAs" class="icon btn mb-1" href="{$BloglovinLink}" title="Follow with Bloglovin" target="_blank"><span class="fa fa-2x fa-heart"></span></a><% end_if %>
        <% if $PinterestLink  %><a itemprop="sameAs" class="icon btn mb-1" href="{$PinterestLink}" title="Follow with Pinterest" target="_blank"><span class="fa fa-2x fa-pinterest"></span></a><% end_if %>
        <% if $YouTubeLink    %><a itemprop="sameAs" class="icon btn mb-1" href="{$YouTubeLink}" title="Follow with YouTube" target="_blank"><span class="fa fa-2x fa-youtube"></span></a><% end_if %>
        <% if $TumblrLink     %><a itemprop="sameAs" class="icon btn mb-1" href="{$TumblrLink}" title="Follow with Tumblr" target="_blank"><span class="fa fa-2x fa-tumblr"></span></a><% end_if %>
        <% if $RSSLink        %><a itemprop="sameAs" class="icon btn mb-1" href="{$RSSLink}" title="Follow with RSS" target="_blank"><span class="fa fa-2x fa-rss"></span></a><% end_if %>
        <% if $EmailLink      %><a itemprop="sameAs" class="icon btn mb-1" href="mailto:{$EmailLink}" title="Email Me" target="_blank"><span class="fa fa-2x fa-envelope"></span></a><% end_if %>
                </div>
            </section>
    <% end_if %>
<% end_with %>
        </div>
    </section>
    <section class="bg-primary mt-3 py-3">
        <div class="container-fluid">
    <% if $PaymentMethods %>
            <ul class="payment-methods list-inline pull-md-right">
        <% loop $PaymentMethods %>
            <% if $showPaymentLogos && $PaymentLogos %>
                <% loop $PaymentLogos %>
                    <% if $Image.Size %>
                <li class="list-inline-item"><a href="{$CurrentPage.PageByIdentifierCodeLink('SilvercartPaymentMethodsPage')}#{$Top.String2urlSegment($Up.Name)}" title="{$Up.Title.HTML}"><img src="{$Image.SetHeight(35).URL}" alt="{$Up.Title.HTML}" /></a></li>
                    <% end_if %>
                <% end_loop %>
            <% end_if %>
        <% end_loop %>
            </ul>
    <% end_if %>
            <p>{$SiteConfig.Title} | {$SiteConfig.Tagline} | <a href="http://www.silvercart.org" target="_blank" title="SilverCart. eCommerce software. Open-source. You'll love it.">by SilverCart eCommerce</a></p>
        </div>
    </section>
</footer>
<% end_cached %>
<% if $CurrentPage.isProductDetailView %>
    {$Product.Microdata}
<% end_if %>