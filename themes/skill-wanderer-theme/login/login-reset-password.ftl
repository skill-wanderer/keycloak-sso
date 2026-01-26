<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="px-7 py-6" action="${url.loginAction}" method="post">
            <!-- Logo Section -->
            <div class="text-center py-1.5 mb-4">
                <img src="${url.resourcesPath}/img/cropped-skill-wanderer-logo-768x256.webp" alt="Skill Wanderer Logo" class="h-auto block mx-auto drop-shadow-sm max-w-full">
            </div>
            
            <div class="mb-4 ${properties.kcFormGroupClass!}">
                <label for="username" class="block text-gray-800 font-medium mb-2.5 ${properties.kcLabelClass!}">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
                <input type="text" id="username" name="username" class="form-input-custom ${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}"
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="text-red-600 text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </span>
                </#if>
            </div>
            
            <!-- Email delivery notice -->
            <div class="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-4">
                <div class="flex items-start gap-3">
                    <span class="text-amber-600 mt-0.5">
                        <i class="fa-solid fa-circle-info"></i>
                    </span>
                    <div class="text-sm text-amber-800">
                        <p class="font-medium mb-1">After submitting:</p>
                        <ul class="list-disc list-inside space-y-1 text-amber-700">
                            <li>Please check your <strong>spam/junk folder</strong></li>
                            <li>Email delivery may take up to <strong>10 minutes</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="flex flex-col gap-3 ${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons">
                    <input class="btn-primary-custom w-full ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
                <div id="kc-form-options" class="text-center">
                    <a href="${url.loginUrl}" class="text-brand-500 font-medium hover:text-brand-600 hover:underline transition-all duration-300">${msg("backToLogin")}</a>
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
