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
            
            <div class="mb-4">
                <label for="username" class="block text-[#e0e0e0] font-medium mb-2.5">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
                <input type="text" id="username" name="username" class="form-input-custom" autofocus value="${(auth.attemptedUsername!'')}"
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="text-red-600 text-sm mt-1 block" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </span>
                </#if>
            </div>
            
            <!-- Email delivery notice -->
            <div class="notice-box mb-4">
                <div class="flex items-start gap-3">
                    <span class="text-[#FFD93D] mt-0.5">
                        <i class="fa-solid fa-circle-info"></i>
                    </span>
                    <div class="text-sm text-[rgba(255,255,255,0.7)]">
                        <p class="font-medium mb-1 text-[#e0e0e0]">After submitting:</p>
                        <ul class="list-disc list-inside space-y-1 text-[rgba(255,255,255,0.6)]">
                            <li>Please check your <strong class="text-[#e0e0e0]">spam/junk folder</strong></li>
                            <li>Email delivery may take up to <strong class="text-[#e0e0e0]">10 minutes</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="flex flex-col gap-3">
                <div id="kc-form-buttons">
                    <input class="btn-primary-custom w-full" type="submit" value="${msg("doSubmit")}"/>
                </div>
                <div id="kc-form-options" class="text-center">
                    <a href="${url.loginUrl}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("backToLogin")}</a>
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
