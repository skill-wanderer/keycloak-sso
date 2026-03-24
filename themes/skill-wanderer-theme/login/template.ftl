<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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
    <link rel="icon" href="${url.resourcesPath}/img/skill-wanderer-favicon.ico" />
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

<body class="bg-brand-pattern min-h-screen font-sans leading-relaxed text-[#e0e0e0]">
  <div class="min-h-screen flex items-center justify-center p-1.5">
    <div id="kc-container" class="flex items-center justify-center p-1.5">
      <div id="kc-container-wrapper" class="w-full max-w-[420px]">

        <div id="kc-header">
          <div id="kc-header-wrapper" class="text-center">
            <#nested "header">
          </div>
        </div>

        <div class="glass-card rounded-2xl shadow-card animate-fade-in overflow-hidden transition-all duration-300 hover:shadow-card-hover hover:-translate-y-0.5">
          <div id="kc-content">
            <div id="kc-content-wrapper">

              <#-- App-initiated actions should not see warning messages about the need to complete the action -->
              <#-- during login.                                                                               -->
              <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                  <div class="mx-6 mt-4 <#if message.type = 'error'>alert-error-custom<#elseif message.type = 'success'>alert-success-custom<#elseif message.type = 'warning'>alert-warning-custom<#else>alert-info-custom</#if>">
                      <div class="flex items-center gap-2">
                          <#if message.type = 'success'><span class="text-green-600"></span></#if>
                          <#if message.type = 'warning'><span class="text-yellow-600"></span></#if>
                          <#if message.type = 'error'><span class="text-red-600"></span></#if>
                          <#if message.type = 'info'><span class="text-blue-600"></span></#if>
                          <span class="font-medium">${kcSanitize(message.summary)?no_esc}</span>
                      </div>
                  </div>
              </#if>

              <#nested "form">

              <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                    <div>
                        <div class="mb-4">
                            <input type="hidden" name="tryAnotherWay" value="on"/>
                            <a href="#" id="try-another-way"
                               class="text-brand-500 font-medium hover:text-[#FFD93D] hover:underline transition-all duration-300"
                               onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                        </div>
                    </div>
                </form>
              </#if>

              <#if displayInfo>
                  <div id="kc-info" class="border-t border-[rgba(255,107,53,0.1)] px-6 py-5 text-center rounded-b-2xl bg-[rgba(255,255,255,0.03)]">
                      <div id="kc-info-wrapper">
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
