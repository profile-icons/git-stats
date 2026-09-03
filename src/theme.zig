// created by Adam Ross (https://www.github.com/profile-icons/github-stats-modified), 03/09/26.
const std = @import("std");

pub const Theme = enum { catppuccin, dracula, github, github_high_contrast, github_soft, gruvbox, monokai, nord, one_dark, solarized, tokyo_night };

pub fn parse(value: []const u8) ?Theme {
    if (std.ascii.eqlIgnoreCase(value, "catppuccin")) return .catppuccin;
    if (std.ascii.eqlIgnoreCase(value, "dracula")) return .dracula;
    if (std.ascii.eqlIgnoreCase(value, "github")) return .github;
    if (matches(value, "github-high-contrast", "github_high_contrast")) return .github_high_contrast;
    if (matches(value, "github-soft", "github_soft")) return .github_soft;
    if (std.ascii.eqlIgnoreCase(value, "gruvbox")) return .gruvbox;
    if (std.ascii.eqlIgnoreCase(value, "monokai")) return .monokai;
    if (std.ascii.eqlIgnoreCase(value, "nord")) return .nord;
    if (matches(value, "one-dark", "one_dark")) return .one_dark;
    if (std.ascii.eqlIgnoreCase(value, "solarized")) return .solarized;
    if (matches(value, "tokyo-night", "tokyo_night")) return .tokyo_night;
    return null;
}

fn matches(value: []const u8, hyphenated: []const u8, underscored: []const u8) bool {
    return std.ascii.eqlIgnoreCase(value, hyphenated) or
        std.ascii.eqlIgnoreCase(value, underscored);
}

pub fn overviewCss(theme: Theme) []const u8 {
    return css(theme);
}

pub fn languagesCss(theme: Theme) []const u8 {
    return css(theme);
}

fn css(theme: Theme) []const u8 {
    return switch (theme) {
        .catppuccin => catppuccin_css,
        .dracula => dracula_css,
        .github => github_css,
        .github_high_contrast => github_high_contrast_css,
        .github_soft => github_soft_css,
        .gruvbox => gruvbox_css,
        .monokai => monokai_css,
        .nord => nord_css,
        .one_dark => one_dark_css,
        .solarized => solarized_css,
        .tokyo_night => tokyo_night_css,
    };
}

const catppuccin_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #eff1f5;
    \\  --theme-fg: #4c4f69;
    \\  --theme-muted: #8c8fa1;
    \\  --theme-accent: #1e66f5;
    \\  --theme-success: #40a02b;
    \\  --theme-attention: #df8e1d;
    \\  --theme-danger: #d20f39;
    \\  --theme-done: #8839ef;
    \\  --theme-neutral-muted: #ccd0da;
    \\  --theme-border: #bcc0cc;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #1e1e2e;
    \\  --theme-fg: #cdd6f4;
    \\  --theme-muted: #7f849c;
    \\  --theme-accent: #89b4fa;
    \\  --theme-success: #a6e3a1;
    \\  --theme-attention: #f9e2af;
    \\  --theme-danger: #f38ba8;
    \\  --theme-done: #cba6f7;
    \\  --theme-neutral-muted: #313244;
    \\  --theme-border: #45475a;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const dracula_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #fffbeb;
    \\  --theme-fg: #1f1f1f;
    \\  --theme-muted: #6c664b;
    \\  --theme-accent: #036a96;
    \\  --theme-success: #14710a;
    \\  --theme-attention: #846e15;
    \\  --theme-danger: #cb3a2a;
    \\  --theme-done: #644ac9;
    \\  --theme-neutral-muted: #cfcfde;
    \\  --theme-border: #cfcfde;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #282a36;
    \\  --theme-fg: #f8f8f2;
    \\  --theme-muted: #6272a4;
    \\  --theme-accent: #8be9fd;
    \\  --theme-success: #50fa7b;
    \\  --theme-attention: #f1fa8c;
    \\  --theme-danger: #ff5555;
    \\  --theme-done: #bd93f9;
    \\  --theme-neutral-muted: #44475a;
    \\  --theme-border: #44475a;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const github_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #ffffff;
    \\  --theme-fg: #1f2328;
    \\  --theme-muted: #59636e;
    \\  --theme-accent: #0969da;
    \\  --theme-success: #1a7f37;
    \\  --theme-attention: #9a6700;
    \\  --theme-danger: #d1242f;
    \\  --theme-done: #8250df;
    \\  --theme-neutral-muted: #818b981f;
    \\  --theme-border: #d1d9e0;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #0d1117;
    \\  --theme-fg: #f0f6fc;
    \\  --theme-muted: #9198a1;
    \\  --theme-accent: #4493f8;
    \\  --theme-success: #3fb950;
    \\  --theme-attention: #d29922;
    \\  --theme-danger: #f85149;
    \\  --theme-done: #ab7df8;
    \\  --theme-neutral-muted: #656c7633;
    \\  --theme-border: #3d444d;
    \\  --theme-stroke-width: 0.5px;
    \\}
    \\}
;

const github_high_contrast_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #ffffff;
    \\  --theme-fg: #010409;
    \\  --theme-muted: #454c54;
    \\  --theme-accent: #023b95;
    \\  --theme-success: #024c1a;
    \\  --theme-attention: #603700;
    \\  --theme-danger: #8a071e;
    \\  --theme-done: #512598;
    \\  --theme-neutral-muted: #e0e6eb;
    \\  --theme-border: #454c54;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #010409;
    \\  --theme-fg: #ffffff;
    \\  --theme-muted: #b7bdc8;
    \\  --theme-accent: #74b9ff;
    \\  --theme-success: #2bd853;
    \\  --theme-attention: #f0b72f;
    \\  --theme-danger: #ff9492;
    \\  --theme-done: #d3abff;
    \\  --theme-neutral-muted: #212830;
    \\  --theme-border: #b7bdc8;
    \\  --theme-stroke-width: 0.5px;
    \\}
    \\}
;

const github_soft_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #ffffff;
    \\  --theme-fg: #24292e;
    \\  --theme-muted: #586069;
    \\  --theme-accent: #0366d6;
    \\  --theme-success: #22863a;
    \\  --theme-attention: #b08800;
    \\  --theme-danger: #cb2431;
    \\  --theme-done: #6f42c1;
    \\  --theme-neutral-muted: #e1e4e8;
    \\  --theme-border: #e1e4e8;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #22272e;
    \\  --theme-fg: #adbac7;
    \\  --theme-muted: #768390;
    \\  --theme-accent: #539bf5;
    \\  --theme-success: #57ab5a;
    \\  --theme-attention: #c69026;
    \\  --theme-danger: #f47067;
    \\  --theme-done: #dcbdfb;
    \\  --theme-neutral-muted: #636e7b66;
    \\  --theme-border: #444c56;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const gruvbox_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #fbf1c7;
    \\  --theme-fg: #3c3836;
    \\  --theme-muted: #7c6f64;
    \\  --theme-accent: #458588;
    \\  --theme-success: #79740e;
    \\  --theme-attention: #b57614;
    \\  --theme-danger: #9d0006;
    \\  --theme-done: #8f3f71;
    \\  --theme-neutral-muted: #ebdbb2;
    \\  --theme-border: #bdae93;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #282828;
    \\  --theme-fg: #ebdbb2;
    \\  --theme-muted: #a89984;
    \\  --theme-accent: #83a598;
    \\  --theme-success: #b8bb26;
    \\  --theme-attention: #fabd2f;
    \\  --theme-danger: #fb4934;
    \\  --theme-done: #d3869b;
    \\  --theme-neutral-muted: #3c3836;
    \\  --theme-border: #504945;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const monokai_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #272822;
    \\  --theme-fg: #f8f8f2;
    \\  --theme-muted: #75715e;
    \\  --theme-accent: #66d9ef;
    \\  --theme-success: #a6e22e;
    \\  --theme-attention: #e6db74;
    \\  --theme-danger: #f92672;
    \\  --theme-done: #ae81ff;
    \\  --theme-neutral-muted: #3e3d32;
    \\  --theme-border: #75715e;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #272822;
    \\  --theme-fg: #f8f8f2;
    \\  --theme-muted: #75715e;
    \\  --theme-accent: #66d9ef;
    \\  --theme-success: #a6e22e;
    \\  --theme-attention: #e6db74;
    \\  --theme-danger: #f92672;
    \\  --theme-done: #ae81ff;
    \\  --theme-neutral-muted: #3e3d32;
    \\  --theme-border: #75715e;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const nord_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #eceff4;
    \\  --theme-fg: #2e3440;
    \\  --theme-muted: #4c566a;
    \\  --theme-accent: #5e81ac;
    \\  --theme-success: #a3be8c;
    \\  --theme-attention: #ebcb8b;
    \\  --theme-danger: #bf616a;
    \\  --theme-done: #b48ead;
    \\  --theme-neutral-muted: #e5e9f0;
    \\  --theme-border: #d8dee9;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #2e3440;
    \\  --theme-fg: #eceff4;
    \\  --theme-muted: #81a1c1;
    \\  --theme-accent: #88c0d0;
    \\  --theme-success: #a3be8c;
    \\  --theme-attention: #ebcb8b;
    \\  --theme-danger: #bf616a;
    \\  --theme-done: #b48ead;
    \\  --theme-neutral-muted: #3b4252;
    \\  --theme-border: #4c566a;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const one_dark_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #fafafa;
    \\  --theme-fg: #383a42;
    \\  --theme-muted: #a0a1a7;
    \\  --theme-accent: #4078f2;
    \\  --theme-success: #50a14f;
    \\  --theme-attention: #c18401;
    \\  --theme-danger: #e45649;
    \\  --theme-done: #a626a4;
    \\  --theme-neutral-muted: #e5e5e6;
    \\  --theme-border: #d3d3d3;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #282c34;
    \\  --theme-fg: #abb2bf;
    \\  --theme-muted: #5c6370;
    \\  --theme-accent: #61afef;
    \\  --theme-success: #98c379;
    \\  --theme-attention: #e5c07b;
    \\  --theme-danger: #e06c75;
    \\  --theme-done: #c678dd;
    \\  --theme-neutral-muted: #3e4451;
    \\  --theme-border: #4b5263;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const solarized_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #fdf6e3;
    \\  --theme-fg: #657b83;
    \\  --theme-muted: #93a1a1;
    \\  --theme-accent: #268bd2;
    \\  --theme-success: #859900;
    \\  --theme-attention: #b58900;
    \\  --theme-danger: #dc322f;
    \\  --theme-done: #6c71c4;
    \\  --theme-neutral-muted: #eee8d5;
    \\  --theme-border: #93a1a1;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #002b36;
    \\  --theme-fg: #839496;
    \\  --theme-muted: #586e75;
    \\  --theme-accent: #268bd2;
    \\  --theme-success: #859900;
    \\  --theme-attention: #b58900;
    \\  --theme-danger: #dc322f;
    \\  --theme-done: #6c71c4;
    \\  --theme-neutral-muted: #073642;
    \\  --theme-border: #586e75;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const tokyo_night_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #e6e7ed;
    \\  --theme-fg: #363c4d;
    \\  --theme-muted: #707280;
    \\  --theme-accent: #2959aa;
    \\  --theme-success: #33635c;
    \\  --theme-attention: #8f5e15;
    \\  --theme-danger: #942f2f;
    \\  --theme-done: #5a3e8e;
    \\  --theme-neutral-muted: #d6d8df;
    \\  --theme-border: #c1c2c7;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
    \\
    \\@media (prefers-color-scheme: dark) {
    \\:root {
    \\  color-scheme: dark;
    \\  --theme-bg: #1a1b26;
    \\  --theme-fg: #c0caf5;
    \\  --theme-muted: #787c99;
    \\  --theme-accent: #7aa2f7;
    \\  --theme-success: #9ece6a;
    \\  --theme-attention: #e0af68;
    \\  --theme-danger: #f7768e;
    \\  --theme-done: #bb9af7;
    \\  --theme-neutral-muted: #24283b;
    \\  --theme-border: #3b4261;
    \\  --theme-stroke-width: 1px;
    \\}
    \\}
;

const card_css =
    \\#background {
    \\  fill: var(--theme-bg);
    \\  stroke: var(--theme-border);
    \\  stroke-width: var(--theme-stroke-width);
    \\}
    \\
    \\th {
    \\  color: var(--theme-accent);
    \\}
    \\
    \\td {
    \\  color: var(--theme-muted);
    \\}
    \\
    \\h2 {
    \\  color: var(--theme-fg);
    \\  fill: var(--theme-fg);
    \\}
    \\
    \\.octicon {
    \\  color: var(--theme-muted);
    \\  fill: var(--theme-muted);
    \\}
    \\
    \\.progress {
    \\  background-color: var(--theme-neutral-muted);
    \\}
    \\
    \\.progress-item {
    \\  outline: 2px solid var(--theme-border);
    \\}
    \\
    \\.lang {
    \\  color: var(--theme-fg);
    \\}
    \\
    \\.percent {
    \\  color: var(--theme-muted);
    \\}
;

const catppuccin_css = catppuccin_palette_css ++ card_css;
const dracula_css = dracula_palette_css ++ card_css;
const github_css = github_palette_css ++ card_css;
const github_high_contrast_css = github_high_contrast_palette_css ++ card_css;
const github_soft_css = github_soft_palette_css ++ card_css;
const gruvbox_css = gruvbox_palette_css ++ card_css;
const monokai_css = monokai_palette_css ++ card_css;
const nord_css = nord_palette_css ++ card_css;
const one_dark_css = one_dark_palette_css ++ card_css;
const solarized_css = solarized_palette_css ++ card_css;
const tokyo_night_css = tokyo_night_palette_css ++ card_css;
