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
            
            <p class="instruction text-[rgba(255,255,255,0.7)] mb-4">
                <#if verifyEmail??>
                    ${msg("emailVerifyInstruction1",verifyEmail)}
                <#else>
                    ${msg("emailVerifyInstruction4",user.email)}
                </#if>
            </p>
            
            <!-- Email delivery notice -->
            <div class="notice-box mb-4">
                <div class="flex items-start gap-3">
                    <span class="text-[#FFD93D] mt-0.5">
                        <i class="fa-solid fa-circle-info"></i>
                    </span>
                    <div class="text-sm text-[rgba(255,255,255,0.7)]">
                        <p class="font-medium mb-1 text-[#e0e0e0]">Can't find the email?</p>
                        <ul class="list-disc list-inside space-y-1 text-[rgba(255,255,255,0.6)]">
                            <li>Please check your <strong class="text-[#e0e0e0]">spam/junk folder</strong></li>
                            <li>Email delivery may take up to <strong class="text-[#e0e0e0]">10 minutes</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <#if isAppInitiatedAction??>
                <form id="kc-verify-email-form" action="${url.loginAction}" method="post">
                    <div>
                        <div id="kc-form-buttons" class="flex gap-2">
                            <#if verifyEmail??>
                                <input class="btn-primary-custom" type="submit" value="${msg("emailVerifyResend")}" />
                            <#else>
                                <input class="btn-primary-custom" type="submit" value="${msg("emailVerifySend")}" />
                            </#if>
                            <button class="btn-secondary-custom" type="submit" name="cancel-aia" value="true" formnovalidate>${msg("doCancel")}</button>
                        </div>
                    </div>
                </form>
            </#if>
        </div>
    <#elseif section = "info">
        <#if !isAppInitiatedAction??>
            <p class="instruction text-[rgba(255,255,255,0.6)]">
                ${msg("emailVerifyInstruction2")}
                <br/>
                <a href="${url.loginAction}" class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
            </p>
        </#if>
    </#if>
</@layout.registrationLayout>
