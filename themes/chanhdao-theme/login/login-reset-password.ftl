<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="px-7 py-6" action="${url.loginAction}" method="post">
            <!-- Logo Section -->
            <div class="text-center py-2 mb-5">
                <img src="${url.resourcesPath}/img/dharma-wheel.svg" alt="Dharma Wheel" class="w-16 h-16 mx-auto mb-2 drop-shadow-sm">
                <span class="block font-serif text-2xl font-bold text-cd-brand tracking-wide">Chanh Dao</span>
                <p class="text-cd-muted text-sm mt-1 font-sans">Con duong tinh thuc</p>
            </div>

            <div class="mb-4 ${properties.kcFormGroupClass!}">
                <label for="username" class="block text-cd-primary font-medium mb-2 text-sm ${properties.kcLabelClass!}">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
                <input type="text" id="username" name="username" class="form-input-cd ${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}"
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="text-cd-failure text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </span>
                </#if>
            </div>

            <!-- Notice -->
            <div class="notice-box-cd mb-4">
                <div class="flex items-start gap-3">
                    <span class="text-cd-brand mt-0.5">
                        <i class="fa-solid fa-circle-info"></i>
                    </span>
                    <div class="text-sm text-cd-secondary">
                        <p class="font-medium mb-1 text-cd-primary">After submitting:</p>
                        <ul class="list-disc list-inside space-y-1 text-cd-muted">
                            <li>Please check your <strong class="text-cd-primary">spam/junk folder</strong></li>
                            <li>Email delivery may take up to <strong class="text-cd-primary">10 minutes</strong></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="flex flex-col gap-3 ${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons">
                    <input class="btn-primary-cd w-full ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
                <div id="kc-form-options" class="text-center">
                    <a href="${url.loginUrl}" class="text-cd-accent font-medium text-sm hover:text-cd-brand hover:underline transition-all duration-200">${msg("backToLogin")}</a>
                </div>
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
