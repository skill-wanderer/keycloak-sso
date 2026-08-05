<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("reltronerRegisterTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="auth-form" action="${url.registrationAction}" method="post">
            <div class="form-group">
                <label for="firstName" class="form-label">${msg("firstName")} <span class="required-marker" aria-hidden="true">*</span></label>
                <input type="text" id="firstName" class="form-input-custom" name="firstName" value="${(register.formData.firstName!'')}" autocomplete="given-name"
                       aria-invalid="<#if messagesPerField.existsError('firstName')>true<#else>false</#if>"
                       <#if messagesPerField.existsError('firstName')>aria-describedby="input-error-firstName"</#if> />
                <#if messagesPerField.existsError('firstName')>
                    <span id="input-error-firstName" class="field-error" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="form-group">
                <label for="lastName" class="form-label">${msg("lastName")} <span class="required-marker" aria-hidden="true">*</span></label>
                <input type="text" id="lastName" class="form-input-custom" name="lastName" value="${(register.formData.lastName!'')}" autocomplete="family-name"
                       aria-invalid="<#if messagesPerField.existsError('lastName')>true<#else>false</#if>"
                       <#if messagesPerField.existsError('lastName')>aria-describedby="input-error-lastName"</#if> />
                <#if messagesPerField.existsError('lastName')>
                    <span id="input-error-lastName" class="field-error" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">${msg("email")} <span class="required-marker" aria-hidden="true">*</span></label>
                <input type="email" id="email" class="form-input-custom" name="email" value="${(register.formData.email!'')}" autocomplete="email"
                       aria-invalid="<#if messagesPerField.existsError('email')>true<#else>false</#if>"
                       <#if messagesPerField.existsError('email')>aria-describedby="input-error-email"</#if> />
                <#if messagesPerField.existsError('email')>
                    <span id="input-error-email" class="field-error" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                    </span>
                </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group">
                    <label for="username" class="form-label">${msg("username")} <span class="required-marker" aria-hidden="true">*</span></label>
                    <input type="text" id="username" class="form-input-custom" name="username" value="${(register.formData.username!'')}" autocomplete="username"
                           aria-invalid="<#if messagesPerField.existsError('username')>true<#else>false</#if>"
                           <#if messagesPerField.existsError('username')>aria-describedby="input-error-username"</#if> />
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="form-group">
                    <label for="password" class="form-label">${msg("password")} <span class="required-marker" aria-hidden="true">*</span></label>
                    <input type="password" id="password" class="form-input-custom" name="password" autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true<#else>false</#if>"
                           <#if messagesPerField.existsError('password')>aria-describedby="input-error-password"</#if> />
                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="password-confirm" class="form-label">${msg("passwordConfirm")} <span class="required-marker" aria-hidden="true">*</span></label>
                    <input type="password" id="password-confirm" class="form-input-custom" name="password-confirm" autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true<#else>false</#if>"
                           <#if messagesPerField.existsError('password-confirm')>aria-describedby="input-error-password-confirm"</#if> />
                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="field-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </#if>

            <div class="secondary-action">
                <a href="${url.loginUrl}" class="auth-link">${msg("backToLogin")}</a>
            </div>

            <div id="kc-form-buttons">
                <input class="btn-primary-custom" type="submit" value="${msg("doRegister")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
