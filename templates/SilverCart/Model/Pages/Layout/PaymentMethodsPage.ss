<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
<% if $PaymentMethods %>
    <% loop $PaymentMethods %>
        <% if $isActive %>
            <section class="clearfix">
                <h2 id="{$Top.String2urlSegment($Name)}">{$Name}</h2>
                <% if $showPaymentLogos && $PaymentLogos.exists %>
                    <div class="float-right">
                        <% loop $PaymentLogos %>
                            {$Image.Pad(250,70)}
                        <% end_loop %>
                    </div>
                <% end_if %>
                <% if $LongPaymentDescription %>
                    <p class="float-left">{$LongPaymentDescription}</p>
                <% end_if %>
            </section>
        <% end_if %>
            <hr>
    <% end_loop %>
<% end_if %>
        </article>
        <% if $WidgetSetContent.exists %>
        <section class="sc-widget-holder">
            {$InsertWidgetArea(Content)}
        </section>
        <% end_if %>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
