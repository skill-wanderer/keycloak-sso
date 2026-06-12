<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("reltronerLoginTitle")}
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="auth-form">
                <div class="form-group">
                    <label for="username" class="form-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="form-input-custom" name="username" value="${(login.username!'')}" type="text" disabled autocomplete="username" />
                    <#else>
                        <input tabindex="1" id="username" class="form-input-custom" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true<#else>false</#if>"
                               <#if messagesPerField.existsError('username','password')>aria-describedby="input-error-username-password"</#if>
                        />

                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error-username-password" class="field-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">${msg("password")}</label>
                    <input tabindex="2" id="password" class="form-input-custom" name="password" type="password" autocomplete="current-password"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true<#else>false</#if>"
                           <#if messagesPerField.existsError('username','password')>aria-describedby="input-error-username-password"</#if>
                    />
                </div>

                <div class="form-options-row">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <label class="checkbox-label" for="rememberMe">
                                <#if login.rememberMe??>
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked class="checkbox-input"> ${msg("rememberMe")}
                                <#else>
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="checkbox-input"> ${msg("rememberMe")}
                                </#if>
                            </label>
                        </#if>
                    </div>
                    <div>
                        <#if realm.resetPasswordAllowed>
                            <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="auth-link">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>
                </div>

                <div id="kc-form-buttons">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="btn-primary-custom" name="login" id="kc-login" type="submit" value="${msg("reltronerContinue")}"/>
                </div>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="social-provider-panel">
                <div class="auth-divider" role="presentation"></div>
                <h2 class="social-provider-heading">${msg("identity-provider-login-label")}</h2>

                <ul class="social-provider-list">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" class="social-btn-custom" href="${p.loginUrl}">
                                <span>${p.displayName!}</span>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" class="auth-link strong-link">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
