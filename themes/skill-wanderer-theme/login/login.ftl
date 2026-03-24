<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="px-7 py-6">
                <!-- Logo Section -->
                <div class="text-center py-1.5 mb-4">
                    <img src="${url.resourcesPath}/img/cropped-skill-wanderer-logo-768x256.webp" alt="Skill Wanderer Logo" class="h-auto block mx-auto drop-shadow-sm max-w-full">
                </div>
                
                <div class="mb-4">
                    <label for="username" class="block text-[#e0e0e0] font-medium mb-2.5">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="form-input-custom" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="form-input-custom" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error-username-password" class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>

                    </#if>
                </div>

                <div class="mb-4">
                    <label for="password" class="block text-[#e0e0e0] font-medium mb-2.5">${msg("password")}</label>

                    <input tabindex="2" id="password" class="form-input-custom" name="password" type="password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />
                </div>

                <div class="mb-4 flex flex-wrap items-center justify-between gap-2">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="flex items-center">
                                <label class="flex items-center text-[rgba(255,255,255,0.6)] cursor-pointer">
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked class="mr-2 accent-brand-500"> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="mr-2 accent-brand-500"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                    </div>
                    <div>
                        <#if realm.resetPasswordAllowed>
                            <span><a tabindex="5" href="${url.loginResetCredentialsUrl}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("doForgotPassword")}</a></span>
                        </#if>
                    </div>
                </div>

                <div id="kc-form-buttons">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="btn-primary-custom" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="px-7 py-4">
                <hr class="border-[rgba(255,255,255,0.1)] mb-4"/>
                <h4 class="text-center text-[rgba(255,255,255,0.6)] font-medium mb-4">${msg("identity-provider-login-label")}</h4>

                <ul class="flex flex-col gap-2">
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
                    <span class="text-[rgba(255,255,255,0.6)]">${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" class="text-brand-500 font-semibold hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
