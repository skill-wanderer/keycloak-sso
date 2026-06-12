<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("logoutConfirmTitle")}
    <#elseif section = "form">
        <div class="auth-form auth-message-flow">
            <p class="instruction">${msg("logoutConfirmHeader")}</p>
            <form class="form-actions" action="${url.logoutConfirmAction}" method="POST">
                <input type="hidden" name="session_code" value="${logoutConfirm.code}">
                <div id="kc-form-buttons">
                    <input tabindex="4" class="btn-primary-custom" name="confirmLogout" id="kc-logout" type="submit" value="${msg("doLogout")}"/>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
