<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message" class="auth-form auth-message-flow">
        <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>

        <div class="notice-box">
            <span class="notice-icon" aria-hidden="true">i</span>
            <div>
                <p class="notice-title">${msg("reltronerEmailNoticeMissingTitle")}</p>
                <ul class="notice-list">
                    <li>${msg("reltronerEmailNoticeSpam")}</li>
                    <li>${msg("reltronerEmailNoticeDelay")}</li>
                </ul>
            </div>
        </div>

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
