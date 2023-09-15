#!/bin/bash

# Specify the path to the "docs" folder
docs_folder="./docs"

# Check if the "docs" folder exists
if [ -d "$docs_folder" ]; then
  # Use the find command to locate all "README.md" files recursively
  # and rename them to "index.md"
  find "$docs_folder" -type f -name "README.md" -execdir mv {} index.md \;

  echo "Renamed all README.md files to index.md in the 'docs' folder and its subdirectories."
else
  echo "The 'docs' folder does not exist."
fi
