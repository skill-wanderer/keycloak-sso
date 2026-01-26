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
        <div class="text-center py-1.5 mb-4">
            <img src="${url.resourcesPath}/img/cropped-skill-wanderer-logo-768x256.webp" alt="Skill Wanderer Logo" class="h-auto block mx-auto drop-shadow-sm max-w-full">
        </div>
        
        <p class="instruction text-gray-700 mb-4">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        
        <!-- Email delivery notice -->
        <div class="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-4">
            <div class="flex items-start gap-3">
                <span class="text-amber-600 mt-0.5">
                    <i class="fa-solid fa-circle-info"></i>
                </span>
                <div class="text-sm text-amber-800">
                    <p class="font-medium mb-1">Can't find the email?</p>
                    <ul class="list-disc list-inside space-y-1 text-amber-700">
                        <li>Please check your <strong>spam/junk folder</strong></li>
                        <li>Email delivery may take up to <strong>10 minutes</strong></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}" class="text-brand-500 font-medium hover:text-brand-600 hover:underline transition-all duration-300">${msg("backToApplication")}</a></p>
            <#elseif actionUri?has_content>
                <p><a href="${actionUri}" class="text-brand-500 font-medium hover:text-brand-600 hover:underline transition-all duration-300">${msg("proceedWithAction")}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}" class="text-brand-500 font-medium hover:text-brand-600 hover:underline transition-all duration-300">${msg("backToApplication")}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
