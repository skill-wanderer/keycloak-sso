<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <div class="px-7 py-6">
            <!-- Logo Section -->
            <div class="text-center py-1.5 mb-4">
                <img src="${url.resourcesPath}/img/cropped-skill-wanderer-logo-768x256.webp" alt="Skill Wanderer Logo" class="h-auto block mx-auto drop-shadow-sm max-w-full">
            </div>
            
            <p class="instruction text-gray-700 mb-4">
                <#if verifyEmail??>
                    ${msg("emailVerifyInstruction1",verifyEmail)}
                <#else>
                    ${msg("emailVerifyInstruction4",user.email)}
                </#if>
            </p>
            
            <!-- Email delivery notice -->
            <div class="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-4">
                <div class="flex items-start gap-3">
                    <span class="text-amber-600 mt-0.5">
                        <i class="fa-solid fa-circle-info"></i>
                    </span>
                    <div class="text-sm text-amber-800">
                        <p class="font-medium mb-1">Can't find the email?</p>
                        <ul class="list-disc list-inside space-y-1 text-amber-700">
                            <li>Please check your <strong>spam/junk folder</strong></li>
                            <li>Email delivery may take up to <strong>10 minutes</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <#if isAppInitiatedAction??>
                <form id="kc-verify-email-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="flex gap-2">
                            <#if verifyEmail??>
                                <input class="btn-primary-custom ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("emailVerifyResend")}" />
                            <#else>
                                <input class="btn-primary-custom ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("emailVerifySend")}" />
                            </#if>
                            <button class="btn-secondary-custom ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" formnovalidate>${msg("doCancel")}</button>
                        </div>
                    </div>
                </form>
            </#if>
        </div>
    <#elseif section = "info">
        <#if !isAppInitiatedAction??>
            <p class="instruction text-gray-600">
                ${msg("emailVerifyInstruction2")}
                <br/>
                <a href="${url.loginAction}" class="text-brand-500 font-medium hover:text-brand-600 hover:underline transition-all duration-300">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
            </p>
        </#if>
    </#if>
</@layout.registrationLayout>
