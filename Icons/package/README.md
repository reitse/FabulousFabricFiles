# @fabric-msft/svg-icons

This library is a publicly available collection of SVG icons for use in Microsoft Fabric platform extension development.

To use these icons, import the package into your project, then use individual SVG files as an image source or as an SVG.

These icons can be implemented a number of ways:

### Implement as React Component

```javascript
import { SvgAiSkills20Item } from "your-package-name";

function App() {
  return (
    <div>
      <h1>My SVG Icon</h1>
      <SvgAiSkills20Item />
    </div>
  );
}

export default App;
```

Since each SVG is its own React component, the impact on bundle size and runtime performance should be minimal when importing only the icons you need. However, for a very large number of icons, consider dynamic imports or other strategies to further optimize performance.

### Direct File Import

```javascript
import React from "react";
import { ReactComponent as AISkillsIcon } from "@fabric-msft/svg-icons/ai_skills_20_item.svg";

const Component = () => {
  return <AISkillsIcon />;
};
```

### Using a Path

```javascript
<img
  src="node_modules/@fabric-msft/svg-icons/ai_skills_20_item.svg"
  alt="Warning!"
/>
```
