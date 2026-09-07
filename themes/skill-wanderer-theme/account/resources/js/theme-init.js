/**
 * Skill-Wanderer account console – colour scheme pin.
 *
 * The Skill-Wanderer design system is dark-first, so the account console should
 * render dark for everyone, not only for visitors whose OS is set to dark.
 *
 * `darkMode=false` in theme.properties strips the upstream prefers-color-scheme
 * listener out of index.ftl, so nothing competes with us for this class.
 * PatternFly's own dark palette then does the heavy lifting and css/account.css
 * only has to restate the Skill-Wanderer brand colours on top of it.
 */
const DARK_MODE_CLASS = "pf-v5-theme-dark";

document.documentElement.classList.add(DARK_MODE_CLASS);

// The console mounts asynchronously and a few PatternFly portals (modals,
// dropdowns) are appended straight to <body>; re-assert the class if anything
// ever strips it so those portals inherit the dark tokens too.
new MutationObserver(() => {
  if (!document.documentElement.classList.contains(DARK_MODE_CLASS)) {
    document.documentElement.classList.add(DARK_MODE_CLASS);
  }
}).observe(document.documentElement, {
  attributes: true,
  attributeFilter: ["class"],
});
