<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message" class="px-7 py-6">
        <!-- Logo Section -->
        <div class="text-center py-2 mb-5">
            <img src="${url.resourcesPath}/img/dharma-wheel.svg" alt="Dharma Wheel" class="w-16 h-16 mx-auto mb-2 drop-shadow-sm">
            <span class="block font-serif text-2xl font-bold text-cd-brand tracking-wide">Chanh Dao</span>
        </div>

        <p class="instruction text-cd-secondary mb-4">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>

        <!-- Notice -->
        <div class="notice-box-cd mb-4">
            <div class="flex items-start gap-3">
                <span class="text-cd-brand mt-0.5">
                    <i class="fa-solid fa-circle-info"></i>
                </span>
                <div class="text-sm text-cd-secondary">
                    <p class="font-medium mb-1 text-cd-primary">Can't find the email?</p>
                    <ul class="list-disc list-inside space-y-1 text-cd-muted">
                        <li>Please check your <strong class="text-cd-primary">spam/junk folder</strong></li>
                        <li>Email delivery may take up to <strong class="text-cd-primary">10 minutes</strong></li>
                    </ul>
                </div>
            </div>
        </div>

        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}" class="text-cd-accent font-medium hover:text-cd-brand hover:underline transition-all duration-200">${msg("backToApplication")}</a></p>
            <#elseif actionUri?has_content>
                <p><a href="${actionUri}" class="text-cd-accent font-medium hover:text-cd-brand hover:underline transition-all duration-200">${msg("proceedWithAction")}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}" class="text-cd-accent font-medium hover:text-cd-brand hover:underline transition-all duration-200">${msg("backToApplication")}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
