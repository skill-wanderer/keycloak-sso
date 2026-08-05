<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="icon" type="image/svg+xml" href="${url.resourcesPath}/img/favicon.svg" />
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

<body class="reltroner-auth ${bodyClass}">
  <main class="auth-page">
    <section id="kc-container" class="auth-shell" aria-labelledby="kc-page-title">
      <div id="kc-container-wrapper" class="auth-card">
        <header id="kc-header" class="auth-header">
          <div class="auth-brand">
            <img class="auth-brand-mark" src="${url.resourcesPath}/img/favicon.svg" alt="" aria-hidden="true" />
            <div>
              <p class="auth-brand-name">${msg("reltronerBrandName")}</p>
              <p class="auth-brand-tagline">${msg("reltronerTagline")}</p>
            </div>
          </div>
          <div id="kc-header-wrapper" class="auth-page-title">
            <h1 id="kc-page-title"><#nested "header"></h1>
          </div>
        </header>

        <div id="kc-content" class="auth-content">
          <div id="kc-content-wrapper">
            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="kc-alert <#if message.type = 'error'>alert-error-custom<#elseif message.type = 'success'>alert-success-custom<#elseif message.type = 'warning'>alert-warning-custom<#else>alert-info-custom</#if>" role="alert" aria-live="polite">
                    <span class="alert-indicator" aria-hidden="true"></span>
                    <span class="alert-summary">${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <#nested "form">

            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
              <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" class="auth-alt-action">
                  <input type="hidden" name="tryAnotherWay" value="on"/>
                  <a href="#" id="try-another-way" class="auth-link"
                     onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
              </form>
            </#if>

            <#if displayInfo>
                <div id="kc-info" class="auth-info">
                    <div id="kc-info-wrapper">
                        <#nested "info">
                    </div>
                </div>
            </#if>
          </div>
        </div>
      </div>
    </section>
  </main>
</body>
</html>
</#macro>
