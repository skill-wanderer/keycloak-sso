<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("logoutConfirmTitle")}
    <#elseif section = "form">
        <div class="px-7 py-6">
            <div class="text-center py-2 mb-5">
                <img src="${url.resourcesPath}/img/dharma-wheel.svg" alt="Dharma Wheel" class="w-16 h-16 mx-auto mb-2 drop-shadow-sm">
                <span class="block font-serif text-2xl font-bold text-cd-brand tracking-wide">Chanh Dao</span>
            </div>
            <p class="text-cd-secondary text-center mb-6">${msg("logoutConfirmHeader")}</p>
            <form class="form-actions" action="${url.logoutConfirmAction}" method="POST">
                <input type="hidden" name="session_code" value="${logoutConfirm.code}">
                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input tabindex="4" class="btn-primary-cd ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="confirmLogout" id="kc-logout" type="submit" value="${msg("doLogout")}"/>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
