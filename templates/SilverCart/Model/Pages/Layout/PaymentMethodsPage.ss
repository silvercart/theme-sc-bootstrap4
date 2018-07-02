<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
        {$Content}
        <% if $Form %>
        <div class="form">
            {$Form}
        </div>
        <% end_if %>
<% if $PaymentMethods %>
    <% loop $PaymentMethods %>
        <% if $isActive %>
        <div class="clearfix">
            <h2 id="{$Top.String2urlSegment($Name)}">{$Name}</h2>
            <% if $showPaymentLogos && $PaymentLogos.exists %>
                <div class="float-right">
                    <% loop $PaymentLogos %>
                        {$Image.Pad(250,70)}
                    <% end_loop %>
                </div>
            <% end_if %>
            <% if $LongPaymentDescription %>
                <p class="float-xs-left">{$LongPaymentDescription}</p>
            <% end_if %>
        </div>
        <% end_if %>
        <hr>
    <% end_loop %>
<% end_if %>
        <div class="silvercartWidgetHolder">
            {$InsertWidgetArea(Content)}
        </div>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
