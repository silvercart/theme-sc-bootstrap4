<% cached 'Footer',$CurrentPage.MemberGroupCacheKey %>
<footer class="bg-primary">
<% if $FooterColumns %>
    <div class="footerOuter">
        <div class="container">
            <div class="row row-eq-height">
    <% loop $FooterColumns %>
                <div class="span3 col-md-3 col-xs-6">
                    <div class="section-header clearfix">
                        <p><a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>">{$MenuTitle.XML}</a></p>
                    </div>
        <% if $Children %>
                    <div class="footer-links">
                        <ul class="list-unstyled">
            <% loop $Children %>
                            <li><a class="highlight" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><i class="fa fa-caret-right"></i> {$MenuTitle.XML}</a></li>
            <% end_loop %>
                        </ul>
                    </div>
        <% end_if %>
                </div>
    <% end_loop %>
<% with $SiteConfig %>
    <% if $FacebookLink || $TwitterLink || $XingLink || $GoogleplusLink || $InstagramLink || $BloglovinLink || $PinterestLink || $YouTubeLink || $TumblrLink || $RSSLink || $EmailLink %>
                <div class="span3 col-md-3 col-xs-6">
                    <div class="section-header clearfix">
                        <p><%t SilverCart\Admin\Model\Config.SOCIALMEDIA 'Social Media' %></p>
                    </div>
                    <div id="socialicons" itemscope itemtype="http://schema.org/Organization">
                        <link itemprop="url" href="{$BaseHref}" />
        <% if $FacebookLink   %><a itemprop="sameAs" class="icon" href="{$FacebookLink}" title="Follow with Facebook" target="_blank"><i class="fa fa-facebook"></i></a><% end_if %>
        <% if $TwitterLink    %><a itemprop="sameAs" class="icon" href="{$TwitterLink}" title="Follow with Twitter" target="_blank"><i class="fa fa-twitter"></i></a><% end_if %>
        <% if $XingLink       %><a itemprop="sameAs" class="icon" href="{$XingLink}" title="Follow with Xing" target="_blank"><i class="fa fa-xing"></i></a><% end_if %>
        <% if $GoogleplusLink %><a itemprop="sameAs" class="icon" href="{$GoogleplusLink}" title="Follow with Google Plus" target="_blank"><i class="fa fa-google-plus"></i></a> <% end_if %>
        <% if $InstagramLink  %><a itemprop="sameAs" class="icon" href="{$InstagramLink}" title="Follow with Instagram" target="_blank"><i class="fa fa-instagram"></i></a><% end_if %>
        <% if $BloglovinLink  %><a itemprop="sameAs" class="icon" href="{$BloglovinLink}" title="Follow with Bloglovin" target="_blank"><i class="fa fa-heart"></i></a><% end_if %>
        <% if $PinterestLink  %><a itemprop="sameAs" class="icon" href="{$PinterestLink}" title="Follow with Pinterest" target="_blank"><i class="fa fa-pinterest"></i></a><% end_if %>
        <% if $YouTubeLink    %><a itemprop="sameAs" class="icon" href="{$YouTubeLink}" title="Follow with YouTube" target="_blank"><i class="fa fa-youtube"></i></a><% end_if %>
        <% if $TumblrLink     %><a itemprop="sameAs" class="icon" href="{$TumblrLink}" title="Follow with Tumblr" target="_blank"><i class="fa fa-tumblr"></i></a><% end_if %>
        <% if $RSSLink        %><a itemprop="sameAs" class="icon" href="{$RSSLink}" title="Follow with RSS" target="_blank"><i class="fa fa-rss"></i></a><% end_if %>
        <% if $EmailLink      %><a itemprop="sameAs" class="icon" href="mailto:{$EmailLink}" title="Email Me" target="_blank"><i class="fa fa-envelope"></i></a><% end_if %>
                    </div>
                </div>
    <% end_if %>
<% end_with %>
            </div>
        </div>
    </div>
<% end_if %>
    <div class="container footer">
        <div class="row">
            <div class="span12 col-md-12">
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
        </div>
    </div>
</footer>
<% end_cached %>
<% if $CurrentPage.isProductDetailView %>
    {$Product.Microdata}
<% end_if %>