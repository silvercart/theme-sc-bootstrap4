<% if $Checkout && $Checkout.CheckoutSteps %>
    <% with $Checkout %>
        <% if $CurrentPageIsCartPage %>
<div class="text-center"><h1><span class="fa fa-shopping-cart"></span> 1. <%t SilverCart\Model\Pages\Page.CART 'Cart' %></h1></div>
<div class="progress"><div class="progress-bar bg-success" role="progressbar" style="width: {$getStepProgressPercentage(true)}%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="{$VisibleCheckoutStepWithCartCount}"></div></div>
        <% else_if $CurrentStep.IsVisible %>
            <% with $CurrentStep %>
<div class="text-left text-sm-center"><h1><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. {$StepTitle}</h1></div>
<div class="progress"><div class="progress-bar bg-success" role="progressbar" style="width: {$Up.StepProgressPercentage}%" aria-valuenow="{$VisibleStepNumber}" aria-valuemin="0" aria-valuemax="{$Up.VisibleCheckoutStepWithCartCount}"></div></div>
            <% end_with %>
        <% end_if %>
<table class="table table-sm table-auto flex checkout-steps text-center">
    <tr>
    <% if $ShowCartInCheckoutNavigation %>
        <td class="nav-item <% if $CurrentPageIsCartPage %>current-step<% end_if %>">
        <% if $CurrentPageIsCartPage %>
            <span class="nav-link active"><strong><span class="fa fa-shopping-cart"></span> 1. <span class="step-title d-none d-sm-inline"><%t SilverCart\Model\Pages\Page.CART 'Cart' %></span></strong></span>
        <% else %>
            <a class="nav-link" href="{$Top.PageByIdentifierCode('SilvercartCartPage').Link}"><span class="fa fa-ok"></span> <span class="fa fa-shopping-cart"></span> 1. <span class="step-title d-none d-sm-inline">{$CurrentUser.Cart.singular_name}</span></a>
        <% end_if %>
        </td>
    <% end_if %>
    <% loop $VisibleCheckoutSteps %>
        <td <% if $IsAccessible %>class="nav-item"<% end_if %>>
        <% if $IsCurrentStep && not $Up.CurrentPageIsCartPage %>
            <span class="nav-link active step-{$StepNumber}"><strong><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></strong></span>
        <% else_if $IsCompleted %>
            <a class="nav-link" href="{$Top.PageByIdentifierCode('SilvercartCheckoutStep').Link(step)}/{$StepNumber}"><span class="fa fa-ok"></span> <span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></a>
        <% else_if $IsPreviousStepCompleted %>
            <a class="nav-link" href="{$Top.PageByIdentifierCode('SilvercartCheckoutStep').Link(step)}/{$StepNumber}"><span class="fa fa-ok"></span> <span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></a>
        <% else %>
            <span class="nav-link disabled"><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title d-none d-sm-inline">{$StepTitle}</span></span>
        <% end_if %>
        </td>
    <% end_loop %>
    </tr>
</table>
    <% end_with %>
<% end_if %>