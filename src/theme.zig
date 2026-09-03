// created by Adam Ross (https://www.github.com/profile-icons/github-stats-modified), 03/09/26.
const std = @import("std");

pub const Theme = enum {
    github,
    github_soft,
    github_colorblind,
    github_dimmed,
    github_high_contrast,
    github_tritanopia,
};

pub fn parse(value: []const u8) ?Theme {
    if (std.ascii.eqlIgnoreCase(value, "github")) return .github;
    if (matches(value, "github-soft", "github_soft")) return .github_soft;
    if (matches(value, "github-colorblind", "github_colorblind")) return .github_colorblind;
    if (matches(value, "github-dimmed", "github_dimmed")) return .github_dimmed;
    if (matches(value, "github-high-contrast", "github_high_contrast")) return .github_high_contrast;
    if (matches(value, "github-tritanopia", "github_tritanopia")) return .github_tritanopia;
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
        .github => github_css,
        .github_soft => github_soft_css,
        .github_colorblind => github_colorblind_css,
        .github_dimmed => github_dimmed_css,
        .github_high_contrast => github_high_contrast_css,
        .github_tritanopia => github_tritanopia_css,
    };
}

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
    \\  --theme-bg: #0d1117;
    \\  --theme-fg: #c9d1d9;
    \\  --theme-muted: #8b949e;
    \\  --theme-accent: #58a6ff;
    \\  --theme-success: #3fb950;
    \\  --theme-attention: #d29922;
    \\  --theme-danger: #f85149;
    \\  --theme-done: #a371f7;
    \\  --theme-neutral-muted: #6e768166;
    \\  --theme-border: #30363d;
    \\  --theme-stroke-width: 0.5px;
    \\}
    \\}
;

const github_colorblind_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #ffffff;
    \\  --theme-fg: #1f2328;
    \\  --theme-muted: #59636e;
    \\  --theme-accent: #0969da;
    \\  --theme-success: #0969da;
    \\  --theme-attention: #9a6700;
    \\  --theme-danger: #be4e02;
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
    \\  --theme-success: #58a6ff;
    \\  --theme-attention: #d29922;
    \\  --theme-danger: #db6d28;
    \\  --theme-done: #ab7df8;
    \\  --theme-neutral-muted: #656c7633;
    \\  --theme-border: #3d444d;
    \\  --theme-stroke-width: 0.5px;
    \\}
    \\}
;

const github_dimmed_palette_css =
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
    \\  --theme-bg: #212830;
    \\  --theme-fg: #d1d7e0;
    \\  --theme-muted: #9198a1;
    \\  --theme-accent: #478be6;
    \\  --theme-success: #57ab5a;
    \\  --theme-attention: #c69026;
    \\  --theme-danger: #e5534b;
    \\  --theme-done: #986ee2;
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

const github_tritanopia_palette_css =
    \\@media (prefers-color-scheme: light) {
    \\:root {
    \\  color-scheme: light;
    \\  --theme-bg: #ffffff;
    \\  --theme-fg: #1f2328;
    \\  --theme-muted: #59636e;
    \\  --theme-accent: #0969da;
    \\  --theme-success: #0969da;
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
    \\  --theme-success: #58a6ff;
    \\  --theme-attention: #d29922;
    \\  --theme-danger: #f85149;
    \\  --theme-done: #ab7df8;
    \\  --theme-neutral-muted: #656c7633;
    \\  --theme-border: #3d444d;
    \\  --theme-stroke-width: 0.5px;
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

const github_css = github_palette_css ++ card_css;
const github_soft_css = github_soft_palette_css ++ card_css;
const github_colorblind_css = github_colorblind_palette_css ++ card_css;
const github_dimmed_css = github_dimmed_palette_css ++ card_css;
const github_high_contrast_css = github_high_contrast_palette_css ++ card_css;
const github_tritanopia_css = github_tritanopia_palette_css ++ card_css;

test "parse supported themes" {
    try std.testing.expectEqual(Theme.github, parse("github").?);
    try std.testing.expectEqual(Theme.github_soft, parse("github-soft").?);
    try std.testing.expectEqual(Theme.github_colorblind, parse("github-colorblind").?);
    try std.testing.expectEqual(Theme.github_dimmed, parse("github-dimmed").?);
    try std.testing.expectEqual(Theme.github_high_contrast, parse("github-high-contrast").?);
    try std.testing.expectEqual(Theme.github_tritanopia, parse("github-tritanopia").?);
    try std.testing.expectEqual(Theme.github_high_contrast, parse("GITHUB_HIGH_CONTRAST").?);
    try std.testing.expect(parse("unknown") == null);
}
