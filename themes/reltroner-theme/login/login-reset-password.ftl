<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="auth-form" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="username" class="form-label">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
                <input type="text" id="username" name="username" class="form-input-custom" autofocus value="${(auth.attemptedUsername!'')}" autocomplete="username"
                       aria-invalid="<#if messagesPerField.existsError('username')>true<#else>false</#if>"
                       <#if messagesPerField.existsError('username')>aria-describedby="input-error-username"</#if>/>
                <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="field-error" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="notice-box">
                <span class="notice-icon" aria-hidden="true">i</span>
                <div>
                    <p class="notice-title">${msg("reltronerEmailNoticeTitle")}</p>
                    <ul class="notice-list">
                        <li>${msg("reltronerEmailNoticeSpam")}</li>
                        <li>${msg("reltronerEmailNoticeDelay")}</li>
                    </ul>
                </div>
            </div>

            <div id="kc-form-buttons">
                <input class="btn-primary-custom" type="submit" value="${msg("doSubmit")}"/>
            </div>
            <div id="kc-form-options" class="secondary-action">
                <a href="${url.loginUrl}" class="auth-link">${msg("backToLogin")}</a>
            </div>
        </form>
    <#elseif section = "info" >
        <#if realm.duplicateEmailsAllowed>
            ${msg("emailInstructionUsername")}
        <#else>
            ${msg("emailInstruction")}
        </#if>
    </#if>
</@layout.registrationLayout>
