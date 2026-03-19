<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <div class="px-7 py-6">
            <!-- Logo Section -->
            <div class="text-center py-2 mb-5">
                <img src="${url.resourcesPath}/img/dharma-wheel.svg" alt="Dharma Wheel" class="w-16 h-16 mx-auto mb-2 drop-shadow-sm">
                <span class="block font-serif text-2xl font-bold text-cd-brand tracking-wide">Chanh Dao</span>
                <p class="text-cd-muted text-sm mt-1 font-sans">Con duong tinh thuc</p>
            </div>

            <p class="instruction text-cd-secondary mb-4">
                <#if verifyEmail??>
                    ${msg("emailVerifyInstruction1",verifyEmail)}
                <#else>
                    ${msg("emailVerifyInstruction4",user.email)}
                </#if>
            </p>

            <!-- Notice -->
            <div class="notice-box-cd mb-4">
                <div class="flex items-start gap-3">
                    <span class="text-cd-brand mt-0.5">
                        <i class="fa-solid fa-circle-info"></i>
                    </span>
                    <div class="text-sm text-cd-secondary">
                        <p class="font-medium mb-1 text-cd-primary">Can't find the email?</p>
                        <ul class="list-disc list-inside space-y-1 text-cd-muted">
                            <li>Please check your <strong class="text-cd-primary">spam/junk folder</strong></li>
                            <li>Email delivery may take up to <strong class="text-cd-primary">10 minutes</strong></li>
                        </ul>
                    </div>
                </div>
            </div>

            <#if isAppInitiatedAction??>
                <form id="kc-verify-email-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="flex gap-2">
                            <#if verifyEmail??>
                                <input class="btn-primary-cd ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("emailVerifyResend")}" />
                            <#else>
                                <input class="btn-primary-cd ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("emailVerifySend")}" />
                            </#if>
                            <button class="btn-secondary-cd ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" formnovalidate>${msg("doCancel")}</button>
                        </div>
                    </div>
                </form>
            </#if>
        </div>
    <#elseif section = "info">
        <#if !isAppInitiatedAction??>
            <p class="instruction text-cd-muted">
                ${msg("emailVerifyInstruction2")}
                <br/>
                <a href="${url.loginAction}" class="text-cd-accent font-medium hover:text-cd-brand hover:underline transition-all duration-200">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
            </p>
        </#if>
    </#if>
</@layout.registrationLayout>
