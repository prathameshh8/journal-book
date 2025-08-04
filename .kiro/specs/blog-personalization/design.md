# Design Document

## Overview

This design implements a comprehensive personalization system for the Zola blog template, transforming it from a generic "Kita" theme into "Prathamesh Daily Journal" with a dark theme and blue accent colors. The design maintains the existing layout structure while updating branding, colors, and profile elements.

## Architecture

The personalization system operates through three main layers:

1. **Configuration Layer**: Updates to `config.toml` for site metadata and profile information
2. **Styling Layer**: CSS modifications in `static/app.css` for dark theme and blue accents
3. **Asset Layer**: Profile image replacement system in `static/` directory

The design preserves the existing Zola template architecture while modifying specific configuration values and CSS variables to achieve the desired personalization.

## Components and Interfaces

### 1. Site Branding Component

**Location**: `config.toml` - `[extra.profile]` section
**Purpose**: Replace template branding with personal information

**Current State**:
```toml
[extra.profile]
name = "Kita - Zola Theme"
bio = "Kita is a clean, elegant and simple blog theme for Zola."
```

**Target State**:
```toml
[extra.profile]
name = "Prathamesh Daily Journal"
bio = "Prathamesh daily journal where I share my experiences"
```

### 2. Color Theme System

**Location**: `static/app.css`
**Purpose**: Implement dark theme with blue accent colors

**Design Approach**:
- Primary background: Black (`#000000`)
- Accent color: Blue (`#0077FF`)
- Text colors: White on dark backgrounds with proper contrast
- Preserve existing CSS utility classes while updating color values

**Key CSS Variables to Modify**:
- Background colors for dark mode
- Accent colors for links and highlights
- Border and shadow colors for dark theme compatibility

### 3. Profile Image System

**Location**: `static/` directory and `config.toml`
**Purpose**: Replace spinning GitHub logo with static profile image

**Current Implementation**:
```toml
avatar_url = "icons/github.svg"
avatar_invert = true
```

**Design Changes**:
- Create placeholder profile image (e.g., `static/profile.jpg`)
- Update `avatar_url` to point to new image
- Remove `avatar_invert` property (not needed for photos)
- Remove `hover:animate-spin` class from profile template

## Data Models

### Configuration Schema

```toml
# Site metadata
title = "Prathamesh Daily Journal"
description = "Prathamesh daily journal where I share my experiences"
author = "Prathamesh"

# Profile configuration
[extra.profile]
name = "Prathamesh Daily Journal"
bio = "Prathamesh daily journal where I share my experiences"
avatar_url = "profile.jpg"
# avatar_invert removed for photo compatibility
```

### CSS Color Scheme

```css
/* Dark theme base colors */
--bg-dark: #000000;
--text-primary: #ffffff;
--text-secondary: #cccccc;

/* Blue accent system */
--accent-primary: #0077FF;
--accent-hover: #0066DD;
--accent-light: #3399FF;
```

## Error Handling

### Image Loading Fallbacks
- If profile image fails to load, maintain existing GitHub icon as fallback
- Ensure proper alt text for accessibility
- Handle different image formats (jpg, png, webp)

### CSS Compatibility
- Maintain existing Tailwind CSS classes
- Preserve responsive design breakpoints
- Ensure dark mode toggle functionality remains intact

### Configuration Validation
- Verify TOML syntax after configuration changes
- Maintain required configuration fields
- Preserve existing menu and social link functionality

## Testing Strategy

### Visual Testing
1. **Color Contrast Testing**
   - Verify text readability on dark backgrounds
   - Test blue accent visibility and accessibility
   - Validate color combinations meet WCAG guidelines

2. **Layout Preservation Testing**
   - Confirm no layout shifts after color changes
   - Verify responsive design maintains functionality
   - Test navigation and interactive elements

3. **Profile Image Testing**
   - Test with different image sizes and formats
   - Verify proper scaling and positioning
   - Confirm removal of spinning animation

### Functional Testing
1. **Configuration Testing**
   - Verify site builds successfully after config changes
   - Test that new branding appears correctly
   - Confirm social links and menu items work

2. **Theme Toggle Testing**
   - Ensure dark mode toggle continues to work
   - Verify color transitions are smooth
   - Test system preference detection

3. **Cross-browser Testing**
   - Test color rendering across different browsers
   - Verify CSS custom properties support
   - Confirm image loading behavior

### Content Testing
1. **Text Rendering**
   - Verify new bio and name display correctly
   - Test text wrapping and overflow handling
   - Confirm typography remains readable

2. **Image Integration**
   - Test profile image displays at correct size
   - Verify image positioning within existing layout
   - Confirm image accessibility attributes