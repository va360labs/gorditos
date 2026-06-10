/* @ds-bundle: {"format":3,"namespace":"GorditOSDesignSystem_613d73","components":[{"name":"BottomNav","sourcePath":"components/app/BottomNav.jsx"},{"name":"GardenGrid","sourcePath":"components/app/GardenGrid.jsx"},{"name":"HabitTile","sourcePath":"components/app/HabitTile.jsx"},{"name":"Avatar","sourcePath":"components/core/Avatar.jsx"},{"name":"Badge","sourcePath":"components/core/Badge.jsx"},{"name":"Button","sourcePath":"components/core/Button.jsx"},{"name":"Card","sourcePath":"components/core/Card.jsx"},{"name":"Chip","sourcePath":"components/core/Chip.jsx"},{"name":"IconButton","sourcePath":"components/core/IconButton.jsx"},{"name":"GordiBubble","sourcePath":"components/feedback/GordiBubble.jsx"},{"name":"ProgressRing","sourcePath":"components/feedback/ProgressRing.jsx"},{"name":"Input","sourcePath":"components/forms/Input.jsx"},{"name":"SegmentedControl","sourcePath":"components/forms/SegmentedControl.jsx"},{"name":"Switch","sourcePath":"components/forms/Switch.jsx"}],"sourceHashes":{"components/app/BottomNav.jsx":"ccad8500857b","components/app/GardenGrid.jsx":"e6c4b5b600c8","components/app/HabitTile.jsx":"7e9b557ca891","components/core/Avatar.jsx":"84249cadefba","components/core/Badge.jsx":"435051d08688","components/core/Button.jsx":"ba1b47c891f7","components/core/Card.jsx":"bf451ba23ccc","components/core/Chip.jsx":"c400b5a52e68","components/core/IconButton.jsx":"40ecb0b3e5e9","components/feedback/GordiBubble.jsx":"6fdfa731f5d7","components/feedback/ProgressRing.jsx":"00b5b38bcbd6","components/forms/Input.jsx":"025003fe3c7e","components/forms/SegmentedControl.jsx":"5a55bb60ca2d","components/forms/Switch.jsx":"5b1e242f3804","ui_kits/gorditos_app/app.jsx":"9a1812b0b972","ui_kits/gorditos_app/ios-frame.jsx":"be3343be4b51","ui_kits/gorditos_app/screens.jsx":"f9863aa6b1e6"},"inlinedExternals":[],"unexposedExports":[]} */

(() => {

const __ds_ns = (window.GorditOSDesignSystem_613d73 = window.GorditOSDesignSystem_613d73 || {});

const __ds_scope = {};

(__ds_ns.__errors = __ds_ns.__errors || []);

// components/app/BottomNav.jsx
try { (() => {
/** Bottom tab bar. `items` = [{id,icon,label}]. Controlled via `current`. */
function BottomNav({
  items = [],
  current,
  onChange
}) {
  return /*#__PURE__*/React.createElement("nav", {
    className: "gds-bottomnav"
  }, items.map(it => /*#__PURE__*/React.createElement("button", {
    key: it.id,
    "aria-current": current === it.id ? 'page' : undefined,
    onClick: () => onChange && onChange(it.id)
  }, /*#__PURE__*/React.createElement("span", {
    className: "ico",
    "aria-hidden": "true"
  }, it.icon), it.label)));
}
Object.assign(__ds_scope, { BottomNav });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/app/BottomNav.jsx", error: String((e && e.message) || e) }); }

// components/app/GardenGrid.jsx
try { (() => {
const STATE_STYLE = {
  soil: {
    background: 'var(--garden-soil)'
  },
  sprout: {
    background: 'var(--garden-sprout)'
  },
  grown: {
    background: 'var(--garden-grown)'
  },
  bloom: {
    background: 'var(--garden-bloom)'
  }
};
const STATE_GLYPH = {
  soil: '',
  sprout: '🌱',
  grown: '🌿',
  bloom: '🌸'
};

/**
 * The "jardín de hábitos". `days` is an array of states
 * ('soil' | 'sprout' | 'grown' | 'bloom'). Empty day = soil, never a wilted plant.
 */
function GardenGrid({
  days = [],
  columns = 7
}) {
  return /*#__PURE__*/React.createElement("div", {
    className: "gds-garden",
    style: {
      gridTemplateColumns: `repeat(${columns}, 1fr)`
    }
  }, days.map((s, i) => /*#__PURE__*/React.createElement("div", {
    key: i,
    className: "gds-garden__day",
    style: STATE_STYLE[s] || STATE_STYLE.soil,
    title: s
  }, /*#__PURE__*/React.createElement("span", {
    "aria-hidden": "true"
  }, STATE_GLYPH[s] || ''))));
}
Object.assign(__ds_scope, { GardenGrid });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/app/GardenGrid.jsx", error: String((e && e.message) || e) }); }

// components/app/HabitTile.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/**
 * One-tap habit row for the "Hoy" screen. The whole tile is the tap target.
 * `done` toggles the celebratory checked state; `color` tints the icon chip.
 */
function HabitTile({
  icon,
  name,
  meta,
  done = false,
  color = 'var(--habit-comida)',
  onToggle,
  ...rest
}) {
  return /*#__PURE__*/React.createElement("button", _extends({
    className: "gds-habit",
    "data-done": done ? 'true' : 'false',
    onClick: onToggle
  }, rest), /*#__PURE__*/React.createElement("span", {
    className: "gds-habit__icon",
    style: {
      background: `color-mix(in srgb, ${color} 16%, white)`,
      color
    },
    "aria-hidden": "true"
  }, icon), /*#__PURE__*/React.createElement("span", {
    className: "gds-habit__body"
  }, /*#__PURE__*/React.createElement("span", {
    className: "gds-habit__name"
  }, name), meta ? /*#__PURE__*/React.createElement("span", {
    className: "gds-habit__meta"
  }, meta) : null), /*#__PURE__*/React.createElement("span", {
    className: "gds-habit__check",
    style: done ? {
      background: color,
      borderColor: color
    } : null,
    "aria-hidden": "true"
  }, done ? '✓' : ''));
}
Object.assign(__ds_scope, { HabitTile });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/app/HabitTile.jsx", error: String((e && e.message) || e) }); }

// components/core/Avatar.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Round avatar. Pass `src` for image, else `initials` on a tinted circle. */
function Avatar({
  src,
  initials = '',
  size = 40,
  alt = '',
  ...rest
}) {
  const style = {
    width: size,
    height: size,
    fontSize: Math.round(size * 0.42)
  };
  return /*#__PURE__*/React.createElement("span", _extends({
    className: "gds-avatar",
    style: style
  }, rest), src ? /*#__PURE__*/React.createElement("img", {
    src: src,
    alt: alt,
    style: {
      width: '100%',
      height: '100%',
      objectFit: 'cover'
    }
  }) : initials);
}
Object.assign(__ds_scope, { Avatar });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Avatar.jsx", error: String((e && e.message) || e) }); }

// components/core/Badge.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Small status pill. Tones map to brand roles. `mono` for stat-style labels. */
function Badge({
  children,
  tone = 'green',
  mono = false,
  ...rest
}) {
  const cls = ['gds-badge', `gds-badge--${tone}`, mono ? 'gds-badge--mono' : ''].filter(Boolean).join(' ');
  return /*#__PURE__*/React.createElement("span", _extends({
    className: cls
  }, rest), children);
}
Object.assign(__ds_scope, { Badge });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Badge.jsx", error: String((e && e.message) || e) }); }

// components/core/Button.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/**
 * GorditOS primary action button. Rounded, warm, springy press.
 * Variants: primary | secondary | soft | ghost | outline. Sizes: sm | md | lg.
 */
function Button({
  children,
  variant = 'primary',
  size = 'md',
  block = false,
  icon = null,
  iconRight = null,
  disabled = false,
  type = 'button',
  onClick,
  ...rest
}) {
  const cls = ['gds-btn', `gds-btn--${variant}`, `gds-btn--${size}`, block ? 'gds-btn--block' : ''].filter(Boolean).join(' ');
  return /*#__PURE__*/React.createElement("button", _extends({
    className: cls,
    type: type,
    disabled: disabled,
    onClick: onClick
  }, rest), icon ? /*#__PURE__*/React.createElement("span", {
    className: "gds-btn__icon",
    "aria-hidden": "true"
  }, icon) : null, children, iconRight ? /*#__PURE__*/React.createElement("span", {
    className: "gds-btn__icon",
    "aria-hidden": "true"
  }, iconRight) : null);
}
Object.assign(__ds_scope, { Button });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Button.jsx", error: String((e && e.message) || e) }); }

// components/core/Card.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Rounded paper surface. Variants: default | raised | flat | tint. */
function Card({
  children,
  variant = 'default',
  interactive = false,
  className = '',
  ...rest
}) {
  const cls = ['gds-card', variant !== 'default' ? `gds-card--${variant}` : '', interactive ? 'gds-card--interactive' : '', className].filter(Boolean).join(' ');
  return /*#__PURE__*/React.createElement("div", _extends({
    className: cls
  }, rest), children);
}
Object.assign(__ds_scope, { Card });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Card.jsx", error: String((e && e.message) || e) }); }

// components/core/Chip.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Selectable filter chip (e.g. recipe filters). Controlled via `selected`. */
function Chip({
  children,
  selected = false,
  icon = null,
  onClick,
  ...rest
}) {
  return /*#__PURE__*/React.createElement("button", _extends({
    className: "gds-chip",
    "aria-pressed": selected,
    onClick: onClick
  }, rest), icon ? /*#__PURE__*/React.createElement("span", {
    "aria-hidden": "true"
  }, icon) : null, children);
}
Object.assign(__ds_scope, { Chip });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Chip.jsx", error: String((e && e.message) || e) }); }

// components/core/IconButton.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Circular icon-only button. Use `bare` for toolbar/inline contexts. */
function IconButton({
  children,
  label,
  bare = false,
  onClick,
  ...rest
}) {
  const cls = ['gds-iconbtn', bare ? 'gds-iconbtn--bare' : ''].filter(Boolean).join(' ');
  return /*#__PURE__*/React.createElement("button", _extends({
    className: cls,
    "aria-label": label,
    onClick: onClick
  }, rest), /*#__PURE__*/React.createElement("span", {
    "aria-hidden": "true"
  }, children));
}
Object.assign(__ds_scope, { IconButton });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/IconButton.jsx", error: String((e && e.message) || e) }); }

// components/feedback/GordiBubble.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/**
 * Gordi's voice — a speech bubble paired with the mascot.
 * `from="gordi"` (left, mascot shown) or `from="user"` (right, green bubble).
 */
function GordiBubble({
  children,
  from = 'gordi',
  avatarSrc,
  ...rest
}) {
  const cls = ['gds-gordi', from === 'user' ? 'gds-gordi--user' : ''].filter(Boolean).join(' ');
  return /*#__PURE__*/React.createElement("div", _extends({
    className: cls
  }, rest), from === 'gordi' ? avatarSrc ? /*#__PURE__*/React.createElement("img", {
    src: avatarSrc,
    alt: "Gordi"
  }) : /*#__PURE__*/React.createElement("span", {
    className: "av",
    "aria-hidden": "true"
  }, "\uD83C\uDF31") : null, /*#__PURE__*/React.createElement("div", {
    className: "bubble"
  }, children));
}
Object.assign(__ds_scope, { GordiBubble });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/GordiBubble.jsx", error: String((e && e.message) || e) }); }

// components/feedback/ProgressRing.jsx
try { (() => {
/**
 * Adaptive goal ring. `value`/`max` drive the arc; center shows label + sub.
 * Color via `color` (defaults to brand green). Never frames "failure".
 */
function ProgressRing({
  value = 0,
  max = 100,
  label,
  sub,
  size = 120,
  stroke = 12,
  color = 'var(--green-500)'
}) {
  const r = (size - stroke) / 2;
  const c = 2 * Math.PI * r;
  const pct = Math.max(0, Math.min(1, max ? value / max : 0));
  const off = c * (1 - pct);
  return /*#__PURE__*/React.createElement("svg", {
    width: size,
    height: size,
    viewBox: `0 0 ${size} ${size}`,
    role: "img",
    "aria-label": `${label || ''} ${sub || ''}`
  }, /*#__PURE__*/React.createElement("circle", {
    className: "gds-ring__track",
    cx: size / 2,
    cy: size / 2,
    r: r,
    fill: "none",
    strokeWidth: stroke
  }), /*#__PURE__*/React.createElement("circle", {
    className: "gds-ring__value",
    cx: size / 2,
    cy: size / 2,
    r: r,
    fill: "none",
    strokeWidth: stroke,
    stroke: color,
    strokeDasharray: c,
    strokeDashoffset: off,
    transform: `rotate(-90 ${size / 2} ${size / 2})`
  }), label != null ? /*#__PURE__*/React.createElement("text", {
    className: "gds-ring__label",
    x: "50%",
    y: "48%",
    textAnchor: "middle",
    dominantBaseline: "middle",
    style: {
      fontSize: size * 0.24
    }
  }, label) : null, sub != null ? /*#__PURE__*/React.createElement("text", {
    className: "gds-ring__sub",
    x: "50%",
    y: "66%",
    textAnchor: "middle",
    dominantBaseline: "middle",
    style: {
      fontSize: size * 0.11
    }
  }, sub) : null);
}
Object.assign(__ds_scope, { ProgressRing });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/ProgressRing.jsx", error: String((e && e.message) || e) }); }

// components/forms/Input.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Labelled text field with optional hint. */
function Input({
  label,
  hint,
  id,
  type = 'text',
  ...rest
}) {
  const fid = id || `f-${Math.random().toString(36).slice(2, 8)}`;
  return /*#__PURE__*/React.createElement("div", {
    className: "gds-field"
  }, label ? /*#__PURE__*/React.createElement("label", {
    className: "gds-label",
    htmlFor: fid
  }, label) : null, /*#__PURE__*/React.createElement("input", _extends({
    id: fid,
    className: "gds-input",
    type: type
  }, rest)), hint ? /*#__PURE__*/React.createElement("span", {
    className: "gds-hint"
  }, hint) : null);
}
Object.assign(__ds_scope, { Input });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Input.jsx", error: String((e && e.message) || e) }); }

// components/forms/SegmentedControl.jsx
try { (() => {
/** Segmented control. `options` = [{value,label}]. Controlled via `value`. */
function SegmentedControl({
  options = [],
  value,
  onChange
}) {
  return /*#__PURE__*/React.createElement("div", {
    className: "gds-seg",
    role: "tablist"
  }, options.map(o => /*#__PURE__*/React.createElement("button", {
    key: o.value,
    role: "tab",
    "aria-selected": value === o.value,
    onClick: () => onChange && onChange(o.value)
  }, o.label)));
}
Object.assign(__ds_scope, { SegmentedControl });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/SegmentedControl.jsx", error: String((e && e.message) || e) }); }

// components/forms/Switch.jsx
try { (() => {
function _extends() { return _extends = Object.assign ? Object.assign.bind() : function (n) { for (var e = 1; e < arguments.length; e++) { var t = arguments[e]; for (var r in t) ({}).hasOwnProperty.call(t, r) && (n[r] = t[r]); } return n; }, _extends.apply(null, arguments); }
/** Toggle switch (controlled). */
function Switch({
  checked = false,
  onChange,
  label,
  ...rest
}) {
  return /*#__PURE__*/React.createElement("label", _extends({
    className: "gds-switch"
  }, rest), /*#__PURE__*/React.createElement("input", {
    type: "checkbox",
    checked: checked,
    onChange: onChange,
    "aria-label": label
  }), /*#__PURE__*/React.createElement("span", {
    className: "track",
    "aria-hidden": "true"
  }), /*#__PURE__*/React.createElement("span", {
    className: "thumb",
    "aria-hidden": "true"
  }));
}
Object.assign(__ds_scope, { Switch });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Switch.jsx", error: String((e && e.message) || e) }); }

// ui_kits/gorditos_app/app.jsx
try { (() => {
/* GorditOS app shell — device frame, screen routing, bottom nav. */
const DS_ = window.GorditOSDesignSystem_613d73;
const {
  BottomNav
} = DS_;
const {
  IOSDevice
} = window;
const {
  HoyScreen,
  JardinScreen,
  GordiScreen,
  CocinaScreen,
  OnboardingScreen
} = window;
function App() {
  const [onboarding, setOnboarding] = React.useState(true);
  const [tab, setTab] = React.useState('hoy');
  let screen;
  if (tab === 'jardin') screen = /*#__PURE__*/React.createElement(JardinScreen, null);else if (tab === 'gordi') screen = /*#__PURE__*/React.createElement(GordiScreen, null);else if (tab === 'cocina') screen = /*#__PURE__*/React.createElement(CocinaScreen, null);else screen = /*#__PURE__*/React.createElement(HoyScreen, {
    openGordi: () => setTab('gordi'),
    openProfile: () => setOnboarding(true)
  });
  return /*#__PURE__*/React.createElement(IOSDevice, null, /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--bg-app)',
      fontFamily: 'var(--font-body)'
    }
  }, onboarding ? /*#__PURE__*/React.createElement(OnboardingScreen, {
    onDone: () => {
      setOnboarding(false);
      setTab('hoy');
    }
  }) : /*#__PURE__*/React.createElement(React.Fragment, null, /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflow: 'auto',
      paddingTop: 6
    }
  }, screen), /*#__PURE__*/React.createElement("div", {
    style: {
      paddingBottom: 20,
      background: 'var(--surface-card)'
    }
  }, /*#__PURE__*/React.createElement(BottomNav, {
    current: tab,
    onChange: setTab,
    items: [{
      id: 'hoy',
      icon: '☀️',
      label: 'Hoy'
    }, {
      id: 'jardin',
      icon: '🌱',
      label: 'Jardín'
    }, {
      id: 'gordi',
      icon: '💬',
      label: 'Gordi'
    }, {
      id: 'cocina',
      icon: '🥗',
      label: 'Cocina'
    }]
  })))));
}
ReactDOM.createRoot(document.getElementById('root')).render(/*#__PURE__*/React.createElement(App, null));
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/gorditos_app/app.jsx", error: String((e && e.message) || e) }); }

// ui_kits/gorditos_app/ios-frame.jsx
try { (() => {
// @ds-adherence-ignore -- omelette starter scaffold (raw elements/hex/px by design)

/* BEGIN USAGE */
// iOS.jsx — Simplified iOS 26 (Liquid Glass) device frame
// Based on the iOS 26 UI Kit + Figma status bar spec. No assets, no deps.
// Exports (to window): IOSDevice, IOSStatusBar, IOSNavBar, IOSGlassPill, IOSList, IOSListRow, IOSKeyboard
//
// Usage — wrap your screen content in <IOSDevice> to get the bezel, status bar
// and home indicator (props: title, dark, keyboard):
//
//   <IOSDevice title="Settings">
//     ...your screen content...
//   </IOSDevice>
//   <IOSDevice dark title="Search" keyboard>…</IOSDevice>
/* END USAGE */

// ─────────────────────────────────────────────────────────────
// Status bar
// ─────────────────────────────────────────────────────────────
function IOSStatusBar({
  dark = false,
  time = '9:41'
}) {
  const c = dark ? '#fff' : '#000';
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 154,
      alignItems: 'center',
      justifyContent: 'center',
      padding: '21px 24px 19px',
      boxSizing: 'border-box',
      position: 'relative',
      zIndex: 20,
      width: '100%'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      height: 22,
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      paddingTop: 1.5
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      fontFamily: '-apple-system, "SF Pro", system-ui',
      fontWeight: 590,
      fontSize: 17,
      lineHeight: '22px',
      color: c
    }
  }, time)), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      height: 22,
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      gap: 7,
      paddingTop: 1,
      paddingRight: 1
    }
  }, /*#__PURE__*/React.createElement("svg", {
    width: "19",
    height: "12",
    viewBox: "0 0 19 12"
  }, /*#__PURE__*/React.createElement("rect", {
    x: "0",
    y: "7.5",
    width: "3.2",
    height: "4.5",
    rx: "0.7",
    fill: c
  }), /*#__PURE__*/React.createElement("rect", {
    x: "4.8",
    y: "5",
    width: "3.2",
    height: "7",
    rx: "0.7",
    fill: c
  }), /*#__PURE__*/React.createElement("rect", {
    x: "9.6",
    y: "2.5",
    width: "3.2",
    height: "9.5",
    rx: "0.7",
    fill: c
  }), /*#__PURE__*/React.createElement("rect", {
    x: "14.4",
    y: "0",
    width: "3.2",
    height: "12",
    rx: "0.7",
    fill: c
  })), /*#__PURE__*/React.createElement("svg", {
    width: "17",
    height: "12",
    viewBox: "0 0 17 12"
  }, /*#__PURE__*/React.createElement("path", {
    d: "M8.5 3.2C10.8 3.2 12.9 4.1 14.4 5.6L15.5 4.5C13.7 2.7 11.2 1.5 8.5 1.5C5.8 1.5 3.3 2.7 1.5 4.5L2.6 5.6C4.1 4.1 6.2 3.2 8.5 3.2Z",
    fill: c
  }), /*#__PURE__*/React.createElement("path", {
    d: "M8.5 6.8C9.9 6.8 11.1 7.3 12 8.2L13.1 7.1C11.8 5.9 10.2 5.1 8.5 5.1C6.8 5.1 5.2 5.9 3.9 7.1L5 8.2C5.9 7.3 7.1 6.8 8.5 6.8Z",
    fill: c
  }), /*#__PURE__*/React.createElement("circle", {
    cx: "8.5",
    cy: "10.5",
    r: "1.5",
    fill: c
  })), /*#__PURE__*/React.createElement("svg", {
    width: "27",
    height: "13",
    viewBox: "0 0 27 13"
  }, /*#__PURE__*/React.createElement("rect", {
    x: "0.5",
    y: "0.5",
    width: "23",
    height: "12",
    rx: "3.5",
    stroke: c,
    strokeOpacity: "0.35",
    fill: "none"
  }), /*#__PURE__*/React.createElement("rect", {
    x: "2",
    y: "2",
    width: "20",
    height: "9",
    rx: "2",
    fill: c
  }), /*#__PURE__*/React.createElement("path", {
    d: "M25 4.5V8.5C25.8 8.2 26.5 7.2 26.5 6.5C26.5 5.8 25.8 4.8 25 4.5Z",
    fill: c,
    fillOpacity: "0.4"
  }))));
}

// ─────────────────────────────────────────────────────────────
// Liquid glass pill — blur + tint + shine
// ─────────────────────────────────────────────────────────────
function IOSGlassPill({
  children,
  dark = false,
  style = {}
}) {
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: 44,
      minWidth: 44,
      borderRadius: 9999,
      position: 'relative',
      overflow: 'hidden',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      boxShadow: dark ? '0 2px 6px rgba(0,0,0,0.35), 0 6px 16px rgba(0,0,0,0.2)' : '0 1px 3px rgba(0,0,0,0.07), 0 3px 10px rgba(0,0,0,0.06)',
      ...style
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      inset: 0,
      borderRadius: 9999,
      backdropFilter: 'blur(12px) saturate(180%)',
      WebkitBackdropFilter: 'blur(12px) saturate(180%)',
      background: dark ? 'rgba(120,120,128,0.28)' : 'rgba(255,255,255,0.5)'
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      inset: 0,
      borderRadius: 9999,
      boxShadow: dark ? 'inset 1.5px 1.5px 1px rgba(255,255,255,0.15), inset -1px -1px 1px rgba(255,255,255,0.08)' : 'inset 1.5px 1.5px 1px rgba(255,255,255,0.7), inset -1px -1px 1px rgba(255,255,255,0.4)',
      border: dark ? '0.5px solid rgba(255,255,255,0.15)' : '0.5px solid rgba(0,0,0,0.06)'
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'relative',
      zIndex: 1,
      display: 'flex',
      alignItems: 'center',
      padding: '0 4px'
    }
  }, children));
}

// ─────────────────────────────────────────────────────────────
// Navigation bar — glass pills + large title
// ─────────────────────────────────────────────────────────────
function IOSNavBar({
  title = 'Title',
  dark = false,
  trailingIcon = true
}) {
  const muted = dark ? 'rgba(255,255,255,0.6)' : '#404040';
  const text = dark ? '#fff' : '#000';
  const pillIcon = content => /*#__PURE__*/React.createElement(IOSGlassPill, {
    dark: dark
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      width: 36,
      height: 36,
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center'
    }
  }, content));
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 10,
      paddingTop: 62,
      paddingBottom: 10,
      position: 'relative',
      zIndex: 5
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      padding: '0 16px'
    }
  }, pillIcon(/*#__PURE__*/React.createElement("svg", {
    width: "12",
    height: "20",
    viewBox: "0 0 12 20",
    fill: "none",
    style: {
      marginLeft: -1
    }
  }, /*#__PURE__*/React.createElement("path", {
    d: "M10 2L2 10l8 8",
    stroke: muted,
    strokeWidth: "2.5",
    strokeLinecap: "round",
    strokeLinejoin: "round"
  }))), trailingIcon && pillIcon(/*#__PURE__*/React.createElement("svg", {
    width: "22",
    height: "6",
    viewBox: "0 0 22 6"
  }, /*#__PURE__*/React.createElement("circle", {
    cx: "3",
    cy: "3",
    r: "2.5",
    fill: muted
  }), /*#__PURE__*/React.createElement("circle", {
    cx: "11",
    cy: "3",
    r: "2.5",
    fill: muted
  }), /*#__PURE__*/React.createElement("circle", {
    cx: "19",
    cy: "3",
    r: "2.5",
    fill: muted
  })))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: '0 16px',
      fontFamily: '-apple-system, system-ui',
      fontSize: 34,
      fontWeight: 700,
      lineHeight: '41px',
      color: text,
      letterSpacing: 0.4
    }
  }, title));
}

// ─────────────────────────────────────────────────────────────
// Grouped list (inset card, r:26) + row (52px)
// ─────────────────────────────────────────────────────────────
function IOSListRow({
  title,
  detail,
  icon,
  chevron = true,
  isLast = false,
  dark = false
}) {
  const text = dark ? '#fff' : '#000';
  const sec = dark ? 'rgba(235,235,245,0.6)' : 'rgba(60,60,67,0.6)';
  const ter = dark ? 'rgba(235,235,245,0.3)' : 'rgba(60,60,67,0.3)';
  const sep = dark ? 'rgba(84,84,88,0.65)' : 'rgba(60,60,67,0.12)';
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      minHeight: 52,
      padding: '0 16px',
      position: 'relative',
      fontFamily: '-apple-system, system-ui',
      fontSize: 17,
      letterSpacing: -0.43
    }
  }, icon && /*#__PURE__*/React.createElement("div", {
    style: {
      width: 30,
      height: 30,
      borderRadius: 7,
      background: icon,
      marginRight: 12,
      flexShrink: 0
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      color: text
    }
  }, title), detail && /*#__PURE__*/React.createElement("span", {
    style: {
      color: sec,
      marginRight: 6
    }
  }, detail), chevron && /*#__PURE__*/React.createElement("svg", {
    width: "8",
    height: "14",
    viewBox: "0 0 8 14",
    style: {
      flexShrink: 0
    }
  }, /*#__PURE__*/React.createElement("path", {
    d: "M1 1l6 6-6 6",
    stroke: ter,
    strokeWidth: "2",
    fill: "none",
    strokeLinecap: "round",
    strokeLinejoin: "round"
  })), !isLast && /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      bottom: 0,
      right: 0,
      left: icon ? 58 : 16,
      height: 0.5,
      background: sep
    }
  }));
}
function IOSList({
  header,
  children,
  dark = false
}) {
  const hc = dark ? 'rgba(235,235,245,0.6)' : 'rgba(60,60,67,0.6)';
  const bg = dark ? '#1C1C1E' : '#fff';
  return /*#__PURE__*/React.createElement("div", null, header && /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: '-apple-system, system-ui',
      fontSize: 13,
      color: hc,
      textTransform: 'uppercase',
      padding: '8px 36px 6px',
      letterSpacing: -0.08
    }
  }, header), /*#__PURE__*/React.createElement("div", {
    style: {
      background: bg,
      borderRadius: 26,
      margin: '0 16px',
      overflow: 'hidden'
    }
  }, children));
}

// ─────────────────────────────────────────────────────────────
// Device frame
// ─────────────────────────────────────────────────────────────
function IOSDevice({
  children,
  width = 402,
  height = 874,
  dark = false,
  title,
  keyboard = false
}) {
  return /*#__PURE__*/React.createElement("div", {
    style: {
      width,
      height,
      borderRadius: 48,
      overflow: 'hidden',
      position: 'relative',
      background: dark ? '#000' : '#F2F2F7',
      boxShadow: '0 40px 80px rgba(0,0,0,0.18), 0 0 0 1px rgba(0,0,0,0.12)',
      fontFamily: '-apple-system, system-ui, sans-serif',
      WebkitFontSmoothing: 'antialiased'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      top: 11,
      left: '50%',
      transform: 'translateX(-50%)',
      width: 126,
      height: 37,
      borderRadius: 24,
      background: '#000',
      zIndex: 50
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      top: 0,
      left: 0,
      right: 0,
      zIndex: 10
    }
  }, /*#__PURE__*/React.createElement(IOSStatusBar, {
    dark: dark
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column'
    }
  }, title !== undefined && /*#__PURE__*/React.createElement(IOSNavBar, {
    title: title,
    dark: dark
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflow: 'auto'
    }
  }, children), keyboard && /*#__PURE__*/React.createElement(IOSKeyboard, {
    dark: dark
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      bottom: 0,
      left: 0,
      right: 0,
      zIndex: 60,
      height: 34,
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'flex-end',
      paddingBottom: 8,
      pointerEvents: 'none'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      width: 139,
      height: 5,
      borderRadius: 100,
      background: dark ? 'rgba(255,255,255,0.7)' : 'rgba(0,0,0,0.25)'
    }
  })));
}

// ─────────────────────────────────────────────────────────────
// Keyboard — iOS 26 liquid glass
// ─────────────────────────────────────────────────────────────
function IOSKeyboard({
  dark = false
}) {
  const glyph = dark ? 'rgba(255,255,255,0.7)' : '#595959';
  const sugg = dark ? 'rgba(255,255,255,0.6)' : '#333';
  const keyBg = dark ? 'rgba(255,255,255,0.22)' : 'rgba(255,255,255,0.85)';

  // special-key icons
  const icons = {
    shift: /*#__PURE__*/React.createElement("svg", {
      width: "19",
      height: "17",
      viewBox: "0 0 19 17"
    }, /*#__PURE__*/React.createElement("path", {
      d: "M9.5 1L1 9.5h4.5V16h8V9.5H18L9.5 1z",
      fill: glyph
    })),
    del: /*#__PURE__*/React.createElement("svg", {
      width: "23",
      height: "17",
      viewBox: "0 0 23 17"
    }, /*#__PURE__*/React.createElement("path", {
      d: "M7 1h13a2 2 0 012 2v11a2 2 0 01-2 2H7l-6-7.5L7 1z",
      fill: "none",
      stroke: glyph,
      strokeWidth: "1.6",
      strokeLinejoin: "round"
    }), /*#__PURE__*/React.createElement("path", {
      d: "M10 5l7 7M17 5l-7 7",
      stroke: glyph,
      strokeWidth: "1.6",
      strokeLinecap: "round"
    })),
    ret: /*#__PURE__*/React.createElement("svg", {
      width: "20",
      height: "14",
      viewBox: "0 0 20 14"
    }, /*#__PURE__*/React.createElement("path", {
      d: "M18 1v6H4m0 0l4-4M4 7l4 4",
      fill: "none",
      stroke: "#fff",
      strokeWidth: "1.8",
      strokeLinecap: "round",
      strokeLinejoin: "round"
    }))
  };
  const key = (content, {
    w,
    flex,
    ret,
    fs = 25,
    k
  } = {}) => /*#__PURE__*/React.createElement("div", {
    key: k,
    style: {
      height: 42,
      borderRadius: 8.5,
      flex: flex ? 1 : undefined,
      width: w,
      minWidth: 0,
      background: ret ? '#08f' : keyBg,
      boxShadow: '0 1px 0 rgba(0,0,0,0.075)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      fontFamily: '-apple-system, "SF Compact", system-ui',
      fontSize: fs,
      fontWeight: 458,
      color: ret ? '#fff' : glyph
    }
  }, content);
  const row = (keys, pad = 0) => /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 6.5,
      justifyContent: 'center',
      padding: `0 ${pad}px`
    }
  }, keys.map(l => key(l, {
    flex: true,
    k: l
  })));
  return /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'relative',
      zIndex: 15,
      borderRadius: 27,
      overflow: 'hidden',
      padding: '11px 0 2px',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      boxShadow: dark ? '0 -2px 20px rgba(0,0,0,0.09)' : '0 -1px 6px rgba(0,0,0,0.018), 0 -3px 20px rgba(0,0,0,0.012)'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      inset: 0,
      borderRadius: 27,
      backdropFilter: 'blur(12px) saturate(180%)',
      WebkitBackdropFilter: 'blur(12px) saturate(180%)',
      background: dark ? 'rgba(120,120,128,0.14)' : 'rgba(255,255,255,0.25)'
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      inset: 0,
      borderRadius: 27,
      boxShadow: dark ? 'inset 1.5px 1.5px 1px rgba(255,255,255,0.15)' : 'inset 1.5px 1.5px 1px rgba(255,255,255,0.7), inset -1px -1px 1px rgba(255,255,255,0.4)',
      border: dark ? '0.5px solid rgba(255,255,255,0.15)' : '0.5px solid rgba(0,0,0,0.06)',
      pointerEvents: 'none'
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 20,
      alignItems: 'center',
      padding: '8px 22px 13px',
      width: '100%',
      boxSizing: 'border-box',
      position: 'relative'
    }
  }, ['"The"', 'the', 'to'].map((w, i) => /*#__PURE__*/React.createElement(React.Fragment, {
    key: i
  }, i > 0 && /*#__PURE__*/React.createElement("div", {
    style: {
      width: 1,
      height: 25,
      background: '#ccc',
      opacity: 0.3
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      textAlign: 'center',
      fontFamily: '-apple-system, system-ui',
      fontSize: 17,
      color: sugg,
      letterSpacing: -0.43,
      lineHeight: '22px'
    }
  }, w)))), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 13,
      padding: '0 6.5px',
      width: '100%',
      boxSizing: 'border-box',
      position: 'relative'
    }
  }, row(['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p']), row(['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'], 20), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 14.25,
      alignItems: 'center'
    }
  }, key(icons.shift, {
    w: 45,
    k: 'shift'
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 6.5,
      flex: 1
    }
  }, ['z', 'x', 'c', 'v', 'b', 'n', 'm'].map(l => key(l, {
    flex: true,
    k: l
  }))), key(icons.del, {
    w: 45,
    k: 'del'
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 6,
      alignItems: 'center'
    }
  }, key('ABC', {
    w: 92.25,
    fs: 18,
    k: 'abc'
  }), key('', {
    flex: true,
    k: 'space'
  }), key(icons.ret, {
    w: 92.25,
    ret: true,
    k: 'ret'
  }))), /*#__PURE__*/React.createElement("div", {
    style: {
      height: 56,
      width: '100%',
      position: 'relative'
    }
  }));
}
Object.assign(window, {
  IOSDevice,
  IOSStatusBar,
  IOSNavBar,
  IOSGlassPill,
  IOSList,
  IOSListRow,
  IOSKeyboard
});
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/gorditos_app/ios-frame.jsx", error: String((e && e.message) || e) }); }

// ui_kits/gorditos_app/screens.jsx
try { (() => {
/* GorditOS app — screens. Composes design-system primitives from the bundle.
   Attaches all screens to window for the shell (app.jsx) to consume. */

const DS = window.GorditOSDesignSystem_613d73;
const {
  Button,
  IconButton,
  Badge,
  Chip,
  Card,
  Avatar,
  Input,
  Switch,
  SegmentedControl,
  GordiBubble,
  ProgressRing,
  HabitTile,
  GardenGrid
} = DS;
const GORDI = '../../assets/gordi.svg';
const pad = 'var(--screen-pad)';
function ScreenHead({
  eyebrow,
  title,
  right
}) {
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'flex-end',
      justifyContent: 'space-between',
      padding: `8px ${pad} 4px`
    }
  }, /*#__PURE__*/React.createElement("div", null, eyebrow ? /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-mono)',
      fontSize: 12,
      letterSpacing: 'var(--ls-label)',
      textTransform: 'uppercase',
      color: 'var(--ink-500)'
    }
  }, eyebrow) : null, /*#__PURE__*/React.createElement("h1", {
    style: {
      fontFamily: 'var(--font-display)',
      fontSize: 'var(--text-h1)',
      color: 'var(--ink-900)',
      margin: '2px 0 0'
    }
  }, title)), right);
}

/* ───────────────────────── HOY ───────────────────────── */
function HoyScreen({
  openGordi,
  openProfile
}) {
  const [done, setDone] = React.useState({
    agua: true,
    mover: false,
    comida: false,
    calma: false
  });
  const t = k => setDone(d => ({
    ...d,
    [k]: !d[k]
  }));
  const count = Object.values(done).filter(Boolean).length;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      paddingBottom: 24
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      padding: `4px ${pad}`
    }
  }, /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-mono)',
      fontSize: 12,
      color: 'var(--ink-500)',
      textTransform: 'uppercase',
      letterSpacing: 'var(--ls-label)'
    }
  }, "Lunes, 10 jun"), /*#__PURE__*/React.createElement("h1", {
    style: {
      fontFamily: 'var(--font-display)',
      fontSize: 'var(--text-h1)',
      margin: '2px 0 0'
    }
  }, "Hola, Valen \uD83D\uDC4B")), /*#__PURE__*/React.createElement("button", {
    onClick: openProfile,
    style: {
      border: 'none',
      background: 'transparent',
      cursor: 'pointer',
      padding: 0
    },
    "aria-label": "Perfil"
  }, /*#__PURE__*/React.createElement(Avatar, {
    initials: "VA",
    size: 44
  }))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `12px ${pad} 0`
    }
  }, /*#__PURE__*/React.createElement(Card, {
    variant: "tint",
    style: {
      display: 'flex',
      gap: 12,
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("img", {
    src: GORDI,
    alt: "Gordi",
    width: "52",
    height: "52"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)',
      fontWeight: 700,
      fontSize: 15,
      color: 'var(--ink-900)'
    }
  }, "Tip de hoy"), /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 14,
      color: 'var(--ink-700)',
      lineHeight: 1.45
    }
  }, "Bebe un vaso de agua nada m\xE1s despertar. Peque\xF1o gesto, gran energ\xEDa \uD83C\uDF31")))), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      padding: `20px ${pad} 8px`
    }
  }, /*#__PURE__*/React.createElement("h2", {
    style: {
      fontFamily: 'var(--font-display)',
      fontSize: 'var(--text-h3)'
    }
  }, "Tus h\xE1bitos de hoy"), /*#__PURE__*/React.createElement(Badge, {
    tone: "green",
    mono: true
  }, count, " de 4")), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 10,
      padding: `0 ${pad}`
    }
  }, /*#__PURE__*/React.createElement(HabitTile, {
    icon: "\uD83D\uDCA7",
    name: "Beber agua",
    meta: "6 / 8 vasos",
    color: "var(--habit-agua)",
    done: done.agua,
    onToggle: () => t('agua')
  }), /*#__PURE__*/React.createElement(HabitTile, {
    icon: "\uD83E\uDD38",
    name: "Moverme un poco",
    meta: "Rutina suave \xB7 10 min",
    color: "var(--habit-ejercicio)",
    done: done.mover,
    onToggle: () => t('mover')
  }), /*#__PURE__*/React.createElement(HabitTile, {
    icon: "\uD83E\uDD57",
    name: "Comida casera",
    meta: "Hoy: salteado expr\xE9s",
    color: "var(--habit-comida)",
    done: done.comida,
    onToggle: () => t('comida')
  }), /*#__PURE__*/React.createElement(HabitTile, {
    icon: "\uD83E\uDDD8",
    name: "Un momento de calma",
    meta: "3 min de respiraci\xF3n",
    color: "var(--habit-calma)",
    done: done.calma,
    onToggle: () => t('calma')
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `16px ${pad} 0`
    }
  }, /*#__PURE__*/React.createElement(Card, {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 16
    }
  }, /*#__PURE__*/React.createElement(ProgressRing, {
    value: 4300,
    max: 5200,
    label: "4.300",
    sub: "pasos hoy",
    size: 104,
    color: "var(--habit-pasos)"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-display)',
      fontWeight: 700,
      fontSize: 16,
      color: 'var(--ink-900)'
    }
  }, "Vas a tu ritmo"), /*#__PURE__*/React.createElement("p", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 13.5,
      color: 'var(--ink-500)',
      marginTop: 4
    }
  }, "Tu objetivo se adapta a ti. Cada paso suma, sin presi\xF3n.")))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `14px ${pad} 0`,
      display: 'flex',
      gap: 10
    }
  }, /*#__PURE__*/React.createElement(Button, {
    variant: "primary",
    block: true,
    onClick: openGordi,
    icon: "\uD83D\uDCAC"
  }, "Hablar con Gordi"), /*#__PURE__*/React.createElement(Button, {
    variant: "ghost",
    onClick: () => alert('Te propongo algo de 5 minutos 🌱')
  }, "Hoy no puedo con todo")));
}

/* ───────────────────────── JARDÍN ───────────────────────── */
function JardinScreen() {
  const days = ['grown', 'bloom', 'sprout', 'soil', 'grown', 'grown', 'bloom', 'soil', 'sprout', 'grown', 'grown', 'soil', 'bloom', 'grown', 'grown', 'sprout', 'soil', 'grown', 'bloom', 'grown', 'soil', 'grown', 'sprout', 'soil', 'grown', 'bloom', 'soil', 'soil', 'grown', 'grown'];
  return /*#__PURE__*/React.createElement("div", {
    style: {
      paddingBottom: 24
    }
  }, /*#__PURE__*/React.createElement(ScreenHead, {
    eyebrow: "Junio",
    title: "Tu jard\xEDn"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `8px ${pad} 0`,
      display: 'flex',
      gap: 10
    }
  }, /*#__PURE__*/React.createElement(Card, {
    style: {
      flex: 1,
      textAlign: 'center'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-display)',
      fontWeight: 800,
      fontSize: 30,
      color: 'var(--green-600)'
    }
  }, "18"), /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 13,
      color: 'var(--ink-500)'
    }
  }, "d\xEDas activos este mes")), /*#__PURE__*/React.createElement(Card, {
    style: {
      flex: 1,
      textAlign: 'center'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-display)',
      fontWeight: 800,
      fontSize: 30,
      color: 'var(--apricot-600)'
    }
  }, "21"), /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 13,
      color: 'var(--ink-500)'
    }
  }, "tu mejor mes \uD83C\uDF38"))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `16px ${pad} 0`
    }
  }, /*#__PURE__*/React.createElement(Card, null, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center',
      marginBottom: 12
    }
  }, /*#__PURE__*/React.createElement("h2", {
    style: {
      fontFamily: 'var(--font-display)',
      fontSize: 'var(--text-h3)'
    }
  }, "Cada d\xEDa que apareces, crece")), /*#__PURE__*/React.createElement(GardenGrid, {
    columns: 7,
    days: days
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 14,
      marginTop: 14,
      flexWrap: 'wrap'
    }
  }, [['var(--garden-soil)', 'Aún sin plantar'], ['var(--garden-sprout)', 'Brote'], ['var(--garden-grown)', 'Crecida'], ['var(--garden-bloom)', 'Floreció']].map(([c, l]) => /*#__PURE__*/React.createElement("div", {
    key: l,
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 6
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      width: 14,
      height: 14,
      borderRadius: 4,
      background: c
    }
  }), /*#__PURE__*/React.createElement("span", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 12.5,
      color: 'var(--ink-500)'
    }
  }, l)))))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `14px ${pad} 0`
    }
  }, /*#__PURE__*/React.createElement(Card, {
    variant: "tint",
    style: {
      display: 'flex',
      gap: 12,
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("img", {
    src: GORDI,
    alt: "Gordi",
    width: "46",
    height: "46"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 14,
      color: 'var(--ink-700)',
      lineHeight: 1.45
    }
  }, /*#__PURE__*/React.createElement("b", {
    style: {
      color: 'var(--ink-900)'
    }
  }, "Aqu\xED no se pierde nada."), " Si faltaste unos d\xEDas, tu jard\xEDn te espera tal cual. Se retoma sin culpa."))));
}

/* ───────────────────────── GORDI (chat) ───────────────────────── */
function GordiScreen() {
  const [msgs, setMsgs] = React.useState([{
    from: 'gordi',
    text: '¡Hola! Soy Gordi 🌱 ¿Cómo te encuentras hoy?'
  }, {
    from: 'user',
    text: 'Un poco sin energía la verdad…'
  }, {
    from: 'gordi',
    text: 'Te entiendo. ¿Probamos algo suave? Un vaso de agua y 5 minutos de estiramientos. Yo te acompaño y lo celebramos.'
  }]);
  const [val, setVal] = React.useState('');
  const send = () => {
    if (!val.trim()) return;
    const u = val.trim();
    setMsgs(m => [...m, {
      from: 'user',
      text: u
    }]);
    setVal('');
    setTimeout(() => setMsgs(m => [...m, {
      from: 'gordi',
      text: '¡Genial que lo cuentes! Vamos pasito a pasito, sin prisa y sin presión 💚'
    }]), 600);
  };
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      height: '100%'
    }
  }, /*#__PURE__*/React.createElement(ScreenHead, {
    eyebrow: "Tu copiloto",
    title: "Gordi",
    right: /*#__PURE__*/React.createElement(Badge, {
      tone: "green"
    }, "en l\xEDnea")
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflow: 'auto',
      display: 'flex',
      flexDirection: 'column',
      gap: 12,
      padding: `12px ${pad} 16px`
    }
  }, msgs.map((m, i) => /*#__PURE__*/React.createElement(GordiBubble, {
    key: i,
    from: m.from,
    avatarSrc: GORDI
  }, m.text))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `10px ${pad} 16px`,
      background: 'var(--surface-card)',
      boxShadow: '0 -2px 16px rgba(74,56,30,.06)',
      display: 'flex',
      gap: 8,
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("input", {
    value: val,
    onChange: e => setVal(e.target.value),
    onKeyDown: e => e.key === 'Enter' && send(),
    placeholder: "Escribe a Gordi\u2026",
    className: "gds-input",
    style: {
      flex: 1
    }
  }), /*#__PURE__*/React.createElement(Button, {
    variant: "primary",
    size: "md",
    onClick: send
  }, "Enviar")));
}

/* ───────────────────────── COCINA ───────────────────────── */
function CocinaScreen() {
  const [filter, setFilter] = React.useState('rapido');
  const recipes = [{
    emoji: '🥘',
    name: 'Salteado exprés de verduras',
    meta: '15 min · sartén',
    tag: 'rapido'
  }, {
    emoji: '🍲',
    name: 'Lentejas de bote en 1 olla',
    meta: '20 min · batch',
    tag: 'nevera'
  }, {
    emoji: '🥗',
    name: 'Bowl de garbanzos y aguacate',
    meta: '10 min · sin cocinar',
    tag: 'rapido'
  }, {
    emoji: '🍳',
    name: 'Tortilla de calabacín',
    meta: '18 min · nevera normal',
    tag: 'nevera'
  }];
  const shown = recipes.filter(r => filter === 'todo' || r.tag === filter);
  return /*#__PURE__*/React.createElement("div", {
    style: {
      paddingBottom: 24
    }
  }, /*#__PURE__*/React.createElement(ScreenHead, {
    eyebrow: "Sin dietas",
    title: "Cocina"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 8,
      padding: `8px ${pad}`,
      overflowX: 'auto'
    }
  }, /*#__PURE__*/React.createElement(Chip, {
    selected: filter === 'rapido',
    onClick: () => setFilter('rapido')
  }, "\u226430 min"), /*#__PURE__*/React.createElement(Chip, {
    selected: filter === 'nevera',
    onClick: () => setFilter('nevera'),
    icon: "\uD83E\uDDCA"
  }, "Lo que tengo"), /*#__PURE__*/React.createElement(Chip, {
    selected: filter === 'todo',
    onClick: () => setFilter('todo')
  }, "Todo")), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 10,
      padding: `4px ${pad} 0`
    }
  }, shown.map(r => /*#__PURE__*/React.createElement(Card, {
    key: r.name,
    interactive: true,
    style: {
      display: 'flex',
      gap: 14,
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      width: 56,
      height: 56,
      borderRadius: 'var(--radius-md)',
      background: 'var(--apricot-50)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      fontSize: 28
    }
  }, r.emoji), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-display)',
      fontWeight: 600,
      fontSize: 16,
      color: 'var(--ink-900)'
    }
  }, r.name), /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 13,
      color: 'var(--ink-500)'
    }
  }, r.meta)), /*#__PURE__*/React.createElement("span", {
    style: {
      color: 'var(--ink-400)',
      fontSize: 20
    }
  }, "\u203A")))), /*#__PURE__*/React.createElement("div", {
    style: {
      padding: `16px ${pad} 0`
    }
  }, /*#__PURE__*/React.createElement(Card, {
    variant: "flat",
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 12.5,
      color: 'var(--ink-500)',
      lineHeight: 1.5
    }
  }, "Ideas orientativas, sin calor\xEDas ni gramos. Para una pauta personalizada, consulta a un dietista-nutricionista colegiado.")));
}

/* ───────────────────────── ONBOARDING ───────────────────────── */
function OnboardingScreen({
  onDone
}) {
  const [step, setStep] = React.useState(0);
  const [feel, setFeel] = React.useState('energia');
  const [nivel, setNivel] = React.useState('empezando');
  const steps = [{
    title: '¿Cómo te quieres sentir?',
    sub: 'Esto guía a Gordi. Nunca te pediremos peso, altura ni edad.',
    body: /*#__PURE__*/React.createElement("div", {
      style: {
        display: 'flex',
        flexDirection: 'column',
        gap: 10
      }
    }, [['energia', '⚡', 'Con más energía'], ['calma', '🧘', 'Más en calma'], ['fuerte', '💪', 'Más en forma'], ['constante', '🌱', 'Constante, sin agobios']].map(([v, e, l]) => /*#__PURE__*/React.createElement("button", {
      key: v,
      onClick: () => setFeel(v),
      className: "gds-card",
      style: {
        display: 'flex',
        gap: 12,
        alignItems: 'center',
        cursor: 'pointer',
        border: feel === v ? '2px solid var(--green-500)' : '2px solid transparent',
        background: feel === v ? 'var(--green-50)' : 'var(--surface-card)',
        textAlign: 'left'
      }
    }, /*#__PURE__*/React.createElement("span", {
      style: {
        fontSize: 24
      }
    }, e), /*#__PURE__*/React.createElement("span", {
      style: {
        fontFamily: 'var(--font-display)',
        fontWeight: 600,
        fontSize: 16,
        color: 'var(--ink-900)'
      }
    }, l))))
  }, {
    title: '¿Por dónde empezamos?',
    sub: 'Tú marcas el ritmo. Puedes cambiarlo cuando quieras.',
    body: /*#__PURE__*/React.createElement("div", {
      style: {
        display: 'flex',
        flexDirection: 'column',
        gap: 16,
        alignItems: 'flex-start'
      }
    }, /*#__PURE__*/React.createElement(SegmentedControl, {
      value: nivel,
      onChange: setNivel,
      options: [{
        value: 'empezando',
        label: 'Empezando'
      }, {
        value: 'ritmo',
        label: 'Cogiendo ritmo'
      }, {
        value: 'marcha',
        label: 'En marcha'
      }]
    }), /*#__PURE__*/React.createElement(Input, {
      label: "Sin gimnasio: \xBFqu\xE9 tienes en casa?",
      placeholder: "Ej. una esterilla y ganas"
    }))
  }, {
    title: 'Te presento a Gordi',
    sub: 'Tu copiloto. Te acompaña, te celebra y nunca te juzga.',
    body: /*#__PURE__*/React.createElement("div", {
      style: {
        textAlign: 'center',
        padding: '8px 0'
      }
    }, /*#__PURE__*/React.createElement("img", {
      src: GORDI,
      alt: "Gordi",
      width: "140",
      height: "140"
    }), /*#__PURE__*/React.createElement(GordiBubble, {
      from: "gordi",
      avatarSrc: GORDI
    }, "\xA1Encantado! Vamos a tu ritmo, \xBFvale? \uD83C\uDF31"))
  }];
  const s = steps[step];
  const last = step === steps.length - 1;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      height: '100%',
      padding: `4px ${pad} ${pad}`
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      padding: '4px 0 14px'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-display)',
      fontWeight: 800,
      fontSize: 22
    }
  }, "Gordit", /*#__PURE__*/React.createElement("span", {
    className: "gordi-os-accent",
    style: {
      color: 'var(--green-600)',
      fontSize: 17
    }
  }, "OS")), /*#__PURE__*/React.createElement("button", {
    onClick: onDone,
    style: {
      border: 'none',
      background: 'transparent',
      fontFamily: 'var(--font-body)',
      fontWeight: 700,
      color: 'var(--ink-500)',
      cursor: 'pointer'
    }
  }, "Saltar")), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 6,
      marginBottom: 18
    }
  }, steps.map((_, i) => /*#__PURE__*/React.createElement("span", {
    key: i,
    style: {
      height: 6,
      flex: 1,
      borderRadius: 99,
      background: i <= step ? 'var(--green-500)' : 'var(--sand-300)',
      transition: 'background var(--dur-base)'
    }
  }))), /*#__PURE__*/React.createElement("h1", {
    style: {
      fontFamily: 'var(--font-display)',
      fontSize: 'var(--text-h1)',
      color: 'var(--ink-900)'
    }
  }, s.title), /*#__PURE__*/React.createElement("p", {
    style: {
      fontFamily: 'var(--font-body)',
      fontSize: 15,
      color: 'var(--ink-500)',
      margin: '6px 0 20px',
      lineHeight: 1.5
    }
  }, s.sub), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflow: 'auto'
    }
  }, s.body), /*#__PURE__*/React.createElement("div", {
    style: {
      paddingTop: 14
    }
  }, /*#__PURE__*/React.createElement(Button, {
    variant: "primary",
    size: "lg",
    block: true,
    onClick: () => last ? onDone() : setStep(step + 1)
  }, last ? 'Empezar a mi ritmo' : 'Siguiente')));
}
Object.assign(window, {
  HoyScreen,
  JardinScreen,
  GordiScreen,
  CocinaScreen,
  OnboardingScreen
});
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/gorditos_app/screens.jsx", error: String((e && e.message) || e) }); }

__ds_ns.BottomNav = __ds_scope.BottomNav;

__ds_ns.GardenGrid = __ds_scope.GardenGrid;

__ds_ns.HabitTile = __ds_scope.HabitTile;

__ds_ns.Avatar = __ds_scope.Avatar;

__ds_ns.Badge = __ds_scope.Badge;

__ds_ns.Button = __ds_scope.Button;

__ds_ns.Card = __ds_scope.Card;

__ds_ns.Chip = __ds_scope.Chip;

__ds_ns.IconButton = __ds_scope.IconButton;

__ds_ns.GordiBubble = __ds_scope.GordiBubble;

__ds_ns.ProgressRing = __ds_scope.ProgressRing;

__ds_ns.Input = __ds_scope.Input;

__ds_ns.SegmentedControl = __ds_scope.SegmentedControl;

__ds_ns.Switch = __ds_scope.Switch;

})();
