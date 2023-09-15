#!/bin/bash

# Specify the path to the "docs" folder
docs_folder="docs/"

# Check if the "docs" folder exists
if [ -d "$docs_folder" ]; then
  # Navigate to the "docs" folder
  cd "$docs_folder"

  # Find all files named "README.md" and rename them to "index.md"
  find . -type f -name "README.md" -exec rename 's/README.md/index.md/' {} \;

  echo "Renamed all README.md files to index.md in the 'docs' folder."
else
  echo "The 'docs' folder does not exist."
fi
