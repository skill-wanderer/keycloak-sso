<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${msg("reltronerErrorTitle")}
        </#if>
    <#elseif section = "form">
    <div id="kc-error-message" class="auth-form auth-message-flow">
        <p class="instruction">
            <#if message?has_content>
                ${kcSanitize(message.summary)?no_esc}
            <#else>
                ${msg("reltronerErrorFallback")}
            </#if>
        </p>

        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}" class="auth-link">${msg("backToApplication")}</a></p>
            <#elseif actionUri?has_content>
                <p><a href="${actionUri}" class="auth-link">${msg("proceedWithAction")}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}" class="auth-link">${msg("backToApplication")}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
