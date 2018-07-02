<div class="row">
    <div id="content-main" class="span9 col-xs-12 col-sm-12 col-md-12 col-lg-8">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
    <% if $CurrentRegisteredCustomer %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>       
        {$Content}
        <% if $Children %>
        <div id="cart-acc" class="cart-accordain" role="tablist" aria-multiselectable="true">
            <% loop $Children %>
                <% if $hasSummary %>
            <div class="card">
                <div class="card-block clearfix">
                    <h3 class="card-title"><i class="fa fa-caret-right"></i> {$SummaryTitle}</h3>
                    <div class="card-text">{$Summary}</div>
                    <a class="btn btn-sm btn-primary pull-right" href="{$Link}" title="<%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %>"><%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %> <span class="fa fa-arrow-right"></span></a>
                </div>
            </div>
                <% end_if %>
            <% end_loop %>
        </div>
        <% end_if %>
    <% else %>
        <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
    <% end_if %>
    </div>
    <aside class="span3 col-xs-12 col-sm-12 col-md-12 col-lg-4">
    <% if $CurrentRegisteredCustomer %>
        {$SubNavigation}
    <% end_if %>
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>




