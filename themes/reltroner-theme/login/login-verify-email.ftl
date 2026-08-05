<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <div class="auth-form auth-message-flow">
            <p class="instruction">
                <#if verifyEmail??>
                    ${msg("emailVerifyInstruction1",verifyEmail)}
                <#else>
                    ${msg("emailVerifyInstruction4",user.email)}
                </#if>
            </p>

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

            <#if isAppInitiatedAction??>
                <form id="kc-verify-email-form" action="${url.loginAction}" method="post">
                    <div id="kc-form-buttons" class="split-actions">
                        <#if verifyEmail??>
                            <input class="btn-primary-custom" type="submit" value="${msg("emailVerifyResend")}" />
                        <#else>
                            <input class="btn-primary-custom" type="submit" value="${msg("emailVerifySend")}" />
                        </#if>
                        <button class="btn-secondary-custom" type="submit" name="cancel-aia" value="true" formnovalidate>${msg("doCancel")}</button>
                    </div>
                </form>
            </#if>
        </div>
    <#elseif section = "info">
        <#if !isAppInitiatedAction??>
            <p class="instruction">
                ${msg("emailVerifyInstruction2")}
                <br/>
                <a href="${url.loginAction}" class="auth-link">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
            </p>
        </#if>
    </#if>
</@layout.registrationLayout>
