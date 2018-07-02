<% if $Checkout && $Checkout.CheckoutSteps %>
    <% with $Checkout %>
        <% if $CurrentStep.IsVisible %>
            <% with $CurrentStep %>
<div class="text-center"><h1><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. {$StepTitle}</h1></div>
<progress class="progress progress-success" value="{$VisibleStepNumber}" max="{$Up.VisibleCheckoutStepWithCartCount}"></progress>
            <% end_with %>
        <% else_if $CurrentPageIsCartPage %>
<div class="text-center"><h1><span class="fa fa-shopping-cart"></span> 1. <%t SilverCart\Model\Pages\Page.CART 'Cart' %></h1></div>
<progress class="progress progress-success" value="1" max="{$VisibleCheckoutStepWithCartCount}"></progress>
        <% end_if %>
<table class="table checkout-steps text-center">
    <tr>
    <% if $ShowCartInCheckoutNavigation %>
        <td <% if $CurrentPageIsCartPage %>class="current-step"<% end_if %>>
            <div class="well">
                <% if $CurrentPageIsCartPage %>
                <span class="highlight active"><strong><span class="fa fa-shopping-cart"></span> 1. <span class="step-title"><%t SilverCart\Model\Pages\Page.CART 'Cart' %></span></strong></span>
                <% else %>
                <a class="highlight" href="{$Top.PageByIdentifierCode('SilvercartCartPage').Link}"><span class="fa fa-ok"></span> <span class="fa fa-shopping-cart"></span> 1. <span class="step-title">{$CurrentUser.Cart.singular_name}</span></a>
                <% end_if %>
            </div>
        </td>
    <% end_if %>
    <% loop $VisibleCheckoutSteps %>
        <td <% if $IsCurrentStep %>class="current-step"<% end_if %>>
            <div class="well">
                <% if $IsCurrentStep %>
                <span class="highlight active step-{$StepNumber}"><strong><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title">{$StepTitle}</span></strong></span>
                <% else_if $IsCompleted %>
                <a class="highlight" href="{$Top.Link(step)}/{$StepNumber}"><span class="fa fa-ok"></span> <span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title">{$StepTitle}</span></a>
                <% else_if $IsPreviousStepCompleted %>
                <a class="highlight" href="{$Top.Link(step)}/{$StepNumber}"><span class="fa fa-ok"></span> <span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title">{$StepTitle}</span></a>
                <% else %>
                <span><span class="fa fa-checkoutstep{$StepNumber}"></span> {$VisibleStepNumber}. <span class="step-title">{$StepTitle}</span></span>
                <% end_if %>
            </div>
        </td>
    <% end_loop %>
    </tr>
</table>
    <% end_with %>
<% end_if %>