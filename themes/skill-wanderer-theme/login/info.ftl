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
        
        <p class="instruction text-[rgba(255,255,255,0.7)] mb-4">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        
        <!-- Email delivery notice -->
        <div class="notice-box mb-4">
            <div class="flex items-start gap-3">
                <span class="text-[#FFD93D] mt-0.5">
                    <i class="fa-solid fa-circle-info"></i>
                </span>
                <div class="text-sm text-[rgba(255,255,255,0.7)]">
                    <p class="font-medium mb-1 text-[#e0e0e0]">Can't find the email?</p>
                    <ul class="list-disc list-inside space-y-1 text-[rgba(255,255,255,0.6)]">
                        <li>Please check your <strong class="text-[#e0e0e0]">spam/junk folder</strong></li>
                        <li>Email delivery may take up to <strong class="text-[#e0e0e0]">10 minutes</strong></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("backToApplication")}</a></p>
            <#elseif actionUri?has_content>
                <p><a href="${actionUri}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("proceedWithAction")}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("backToApplication")}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
