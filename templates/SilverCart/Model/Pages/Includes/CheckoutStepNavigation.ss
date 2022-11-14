<% if $Checkout && $Checkout.CheckoutSteps %>
    <% with $Checkout %>
        <% if $CurrentPageIsCartPage %>
    <div class="text-center sr-only"><h1><span class="fa fa-shopping-cart"></span> 1. <%t SilverCart\Model\Pages\Page.CART 'Cart' %></h1></div>
    <div class="progress"><div class="progress-bar bg-success" role="progressbar" style="width: {$getStepProgressPercentage(true)}%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="{$VisibleCheckoutStepWithCartCount}"></div></div>
        <% else_if $CurrentStep.IsVisible %>
            <% with $CurrentStep %>
    <div class="text-left text-sm-center sr-only"><h1><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. {$StepTitle}</h1></div>
    <div class="progress"><div class="progress-bar bg-success" role="progressbar" style="width: {$Up.StepProgressPercentage}%" aria-valuenow="{$VisibleStepNumber}" aria-valuemin="0" aria-valuemax="{$Up.VisibleCheckoutStepWithCartCount}"></div></div>
            <% end_with %>
        <% end_if %>
    <div class="d-flex gap-2 mt-1 mb-4">
        <% if $ShowCartInCheckoutNavigation %>
            <div class="w-100 flex-shrink-1 text-center nav-item <% if $CurrentPageIsCartPage %>current-step<% end_if %>">
            <% if $CurrentPageIsCartPage %>
                <span class="nav-link active"><strong><span class="fa fa-shopping-cart"></span> 1. <span class="step-title d-none d-sm-inline"><%t SilverCart\Model\Pages\Page.CART 'Cart' %></span></strong></span>
            <% else %>
                <a class="nav-link" href="{$Top.PageByIdentifierCode('SilvercartCartPage').Link}"><span class="fa fa-ok"></span> <span class="fa fa-shopping-cart"></span> 1. <span class="step-title d-none d-sm-inline">{$CurrentUser.Cart.singular_name}</span></a>
            <% end_if %>
            </div>
        <% end_if %>
        <% loop $VisibleCheckoutSteps %>
            <div class="w-100 flex-shrink-1 text-center <% if $IsAccessible %>nav-item<% end_if %> ">
            <% if $IsCurrentStep && not $Up.CurrentPageIsCartPage %>
                <span class="nav-link active step-{$StepNumber}"><strong><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></strong></span>
            <% else_if $IsCompleted %>
                <a class="nav-link" href="{$Top.PageByIdentifierCode('SilvercartCheckoutStep').Link(step)}/{$StepNumber}"><span class="fa fa-ok"></span> <span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></a>
            <% else_if $IsPreviousStepCompleted %>
                <a class="nav-link" href="{$Top.PageByIdentifierCode('SilvercartCheckoutStep').Link(step)}/{$StepNumber}"><span class="fa fa-ok"></span> <span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></a>
            <% else %>
                <span class="nav-link disabled"><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></span>
            <% end_if %>
            </div>
        <% end_loop %>
    </div>
    <% end_with %>
<% end_if %>