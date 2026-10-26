<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="px-7 py-6" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <!-- Logo Section -->
            <div class="text-center py-1.5 mb-4">
                <img src="${url.resourcesPath}/img/cropped-skill-wanderer-logo-768x256.webp" alt="Skill Wanderer Logo" class="h-auto block mx-auto drop-shadow-sm max-w-full">
            </div>

            <div class="mb-4">
                <label for="password-new" class="block text-[#e0e0e0] font-medium mb-2.5">${msg("passwordNew")}</label>
                <div class="relative" dir="ltr">
                    <input type="password" id="password-new" name="password-new" class="form-input-custom pr-12"
                           autofocus autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />
                    <button class="password-toggle-custom" type="button" aria-label="${msg('showPassword')}"
                            aria-controls="password-new" data-password-toggle
                            data-icon-show="fa-solid fa-eye" data-icon-hide="fa-solid fa-eye-slash"
                            data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                        <i class="fa-solid fa-eye" aria-hidden="true"></i>
                    </button>
                </div>
                <#if messagesPerField.existsError('password')>
                    <span id="input-error-password" class="text-red-600 text-sm mt-1 block" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="mb-4">
                <label for="password-confirm" class="block text-[#e0e0e0] font-medium mb-2.5">${msg("passwordConfirm")}</label>
                <div class="relative" dir="ltr">
                    <input type="password" id="password-confirm" name="password-confirm" class="form-input-custom pr-12"
                           autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                    <button class="password-toggle-custom" type="button" aria-label="${msg('showPassword')}"
                            aria-controls="password-confirm" data-password-toggle
                            data-icon-show="fa-solid fa-eye" data-icon-hide="fa-solid fa-eye-slash"
                            data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                        <i class="fa-solid fa-eye" aria-hidden="true"></i>
                    </button>
                </div>
                <#if messagesPerField.existsError('password-confirm')>
                    <span id="input-error-password-confirm" class="text-red-600 text-sm mt-1 block" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </span>
                </#if>
            </div>

            <div id="kc-form-options">
                <label class="flex items-center text-[rgba(255,255,255,0.6)] cursor-pointer">
                    <input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" class="mr-2 accent-brand-500"> ${msg("logoutOtherSessions")}
                </label>
            </div>

            <div id="kc-form-buttons" class="flex flex-col gap-3">
                <input name="login" class="btn-primary-custom" type="submit" value="${msg("doSubmit")}"/>
                <#if isAppInitiatedAction??>
                    <button class="btn-secondary-custom w-full" type="submit" name="cancel-aia" value="true">${msg("doCancel")}</button>
                </#if>
            </div>
        </form>
        <#-- Toggle script ships with the base theme; resources resolve up the theme hierarchy -->
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    </#if>
</@layout.registrationLayout>
