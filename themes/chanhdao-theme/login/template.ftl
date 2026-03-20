<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" type="image/svg+xml" href="${url.resourcesPath}/img/dharma-wheel.svg" />
    <!-- Google Fonts: Lora (serif heading) + Inter (sans body) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Lora:wght@500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome 6 Free -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="bg-cd-pattern min-h-screen font-sans leading-relaxed text-cd-primary ${properties.kcBodyClass!}">
  <div class="min-h-screen flex items-center justify-center p-4 ${properties.kcLoginClass!}">
    <div id="kc-container" class="flex items-center justify-center p-2 ${properties.kcContainerClass!}">
      <div id="kc-container-wrapper" class="w-full max-w-[420px] ${properties.kcContainerWrapperClass!}">

        <div id="kc-header" class="${properties.kcHeaderClass!}">
          <div id="kc-header-wrapper" class="text-center ${properties.kcHeaderWrapperClass!}">
            <#nested "header">
          </div>
        </div>

        <div class="cd-card rounded-2xl shadow-cd-card animate-fade-in overflow-hidden transition-all duration-300 hover:shadow-cd-brand hover:-translate-y-0.5 ${properties.kcFormCardClass!}">
          <div id="kc-content">
            <div id="kc-content-wrapper">

              <#-- App-initiated actions should not see warning messages about the need to complete the action -->
              <#-- during login.                                                                               -->
              <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                  <div class="mx-6 mt-4 <#if message.type = 'error'>alert-error-cd<#elseif message.type = 'success'>alert-success-cd<#elseif message.type = 'warning'>alert-warning-cd<#else>alert-info-cd</#if> ${properties.kcAlertClass!}">
                      <div class="flex items-center gap-2">
                          <#if message.type = 'success'><span class="text-cd-success ${properties.kcFeedbackSuccessIcon!}"></span></#if>
                          <#if message.type = 'warning'><span class="text-yellow-600 ${properties.kcFeedbackWarningIcon!}"></span></#if>
                          <#if message.type = 'error'><span class="text-cd-failure ${properties.kcFeedbackErrorIcon!}"></span></#if>
                          <#if message.type = 'info'><span class="text-cd-growth ${properties.kcFeedbackInfoIcon!}"></span></#if>
                          <span class="font-medium ${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                      </div>
                  </div>
              </#if>

              <#nested "form">

              <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
                    <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                        <div class="mb-4 ${properties.kcFormGroupClass!}">
                            <input type="hidden" name="tryAnotherWay" value="on"/>
                            <a href="#" id="try-another-way"
                               class="text-cd-accent font-medium hover:text-cd-brand hover:underline transition-all duration-300"
                               onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                        </div>
                    </div>
                </form>
              </#if>

              <#if displayInfo>
                  <div id="kc-info" class="border-t border-cd-border px-6 py-5 text-center rounded-b-2xl bg-cd-surface-alt ${properties.kcSignUpClass!}">
                      <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                          <#nested "info">
                      </div>
                  </div>
              </#if>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</body>
</html>
</#macro>
