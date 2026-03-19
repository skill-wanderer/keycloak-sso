<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="px-7 py-6">
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

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="form-input-cd ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="form-input-cd ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error-username-password" class="text-cd-failure text-sm mt-1 block ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>

                    </#if>
                </div>

                <div class="mb-4 ${properties.kcFormGroupClass!}">
                    <label for="password" class="block text-cd-primary font-medium mb-2 text-sm ${properties.kcLabelClass!}">${msg("password")}</label>

                    <input tabindex="2" id="password" class="form-input-cd ${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />
                </div>

                <div class="mb-4 flex flex-wrap items-center justify-between gap-2 ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="flex items-center">
                                <label class="flex items-center text-cd-secondary text-sm cursor-pointer">
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked class="mr-2 accent-cd-brand"> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="mr-2 accent-cd-brand"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                    </div>
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if realm.resetPasswordAllowed>
                            <span><a tabindex="5" href="${url.loginResetCredentialsUrl}" class="text-cd-accent text-sm font-medium hover:text-cd-brand hover:underline transition-all duration-200">${msg("doForgotPassword")}</a></span>
                        </#if>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="btn-primary-cd ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="px-7 py-4 border-t border-cd-border ${properties.kcFormSocialAccountSectionClass!}">
                <hr class="border-cd-border mb-4"/>
                <h4 class="text-center text-cd-muted font-medium mb-4 text-sm">${msg("identity-provider-login-label")}</h4>

                <ul class="flex flex-col gap-2 ${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="block w-full py-3 px-4 text-center rounded-[50px] border border-cd-border bg-white text-cd-primary font-medium hover:bg-cd-card-hover hover:border-cd-brand transition-all duration-200 ${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
                </ul>
            </div>
        </#if>
    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span class="text-cd-secondary text-sm">${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" class="text-cd-accent font-semibold hover:text-cd-brand hover:underline transition-all duration-200">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
