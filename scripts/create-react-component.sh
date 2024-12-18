#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ComponentName>"
    exit 1
fi

if [ ! -f "package.json" ]; then
    echo "Error: This script must be run inside an npm project directory containing package.json."
    exit 1
fi

if [ ! -d "src" ]; then
    echo "Error: 'src' directory not found. Please run this script from the root of your npm project."
    exit 1
fi

if [ ! -d "src/components" ]; then
    echo "Error: 'src/components' directory not found. Please run this script from the root of your npm project."
    exit 1
fi

# Set the component name
component="$1"

# Create the component directory and files
mkdir -p "src/components/$component"
echo -e "import React from \"react\";\nimport style from \"./$component.module.css\";\nimport classNames from \"classnames\"\n\nexport const $component: React.FC = () => {\n   return (<></>);\n};" > "src/components/$component/$component.tsx" && \
echo -e "* {\n  margin: 0;\n  padding: 0;\n  box-sizing: border-box;\n}" > "src/components/$component/$component.module.css"

echo "Component '$component' created successfully."

