<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
    <% if $CurrentRegisteredCustomer %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
        {$Content}
        {$EditProfileForm}
    <% else %>
        <% include SilverCart/Model/Pages/MyAccountLoginOrRegister %>
    <% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        <% if $CurrentRegisteredCustomer %>
            {$SubNavigation}
        <% end_if %>
        $InsertWidgetArea(Sidebar)
    </aside>
</div>
