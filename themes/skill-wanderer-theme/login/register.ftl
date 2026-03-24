<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="px-7 py-6" action="${url.registrationAction}" method="post">
            <!-- Logo Section -->
            <div class="text-center py-1.5 mb-4">
                <img src="${url.resourcesPath}/img/cropped-skill-wanderer-logo-768x256.webp" alt="Skill Wanderer Logo" class="h-auto block mx-auto drop-shadow-sm max-w-full">
            </div>

            <div class="mb-4 ${properties.kcFormGroupClass!}">
                <label for="firstName" class="block text-[#e0e0e0] font-medium mb-2.5 ${properties.kcLabelClass!}">${msg("firstName")} <span class="text-brand-500">*</span></label>
                <input type="text" id="firstName" class="form-input-custom ${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>" />
                <#if messagesPerField.existsError('firstName')>
                    <span class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="mb-4 ${properties.kcFormGroupClass!}">
                <label for="lastName" class="block text-[#e0e0e0] font-medium mb-2.5 ${properties.kcLabelClass!}">${msg("lastName")} <span class="text-brand-500">*</span></label>
                <input type="text" id="lastName" class="form-input-custom ${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>" />
                <#if messagesPerField.existsError('lastName')>
                    <span class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="mb-4 ${properties.kcFormGroupClass!}">
                <label for="email" class="block text-[#e0e0e0] font-medium mb-2.5 ${properties.kcLabelClass!}">${msg("email")} <span class="text-brand-500">*</span></label>
                <input type="text" id="email" class="form-input-custom ${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email"
                       aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" />
                <#if messagesPerField.existsError('email')>
                    <span class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                    </span>
                </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="mb-4 ${properties.kcFormGroupClass!}">
                    <label for="username" class="block text-[#e0e0e0] font-medium mb-2.5 ${properties.kcLabelClass!}">${msg("username")} <span class="text-brand-500">*</span></label>
                    <input type="text" id="username" class="form-input-custom ${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username"
                           aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                    <#if messagesPerField.existsError('username')>
                        <span class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="mb-4 ${properties.kcFormGroupClass!}">
                    <label for="password" class="block text-[#e0e0e0] font-medium mb-2.5 ${properties.kcLabelClass!}">${msg("password")} <span class="text-brand-500">*</span></label>
                    <input type="password" id="password" class="form-input-custom ${properties.kcInputClass!}" name="password" autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />
                    <#if messagesPerField.existsError('password')>
                        <span class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="mb-4 ${properties.kcFormGroupClass!}">
                    <label for="password-confirm" class="block text-[#e0e0e0] font-medium mb-2.5 ${properties.kcLabelClass!}">${msg("passwordConfirm")} <span class="text-brand-500">*</span></label>
                    <input type="password" id="password-confirm" class="form-input-custom ${properties.kcInputClass!}" name="password-confirm"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                    <#if messagesPerField.existsError('password-confirm')>
                        <span class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="mb-4 ${properties.kcFormGroupClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </#if>

            <div class="mb-4">
                <span class="text-[rgba(255,255,255,0.6)]"><a href="${url.loginUrl}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">&laquo; ${msg("backToLogin")}</a></span>
            </div>

            <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                <input class="btn-primary-custom" type="submit" value="${msg("doRegister")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
