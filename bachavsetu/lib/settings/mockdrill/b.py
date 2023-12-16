import re
import os
import sys

def replace_image_code(file_path):
    pattern = re.compile(r"Center\(\s*child:\s*Image\.network\(\s*'https://placekitten\.com/200/150'\),\s*// Replace with actual image URL\s*\),")

    replacement = "Center(\n                child: Image.asset(\n                  'assets/settingsAssets/avatar.png',\n                ),\n              ),"

    with open(file_path, 'r') as file:
        file_content = file.read()

    if re.search(pattern, file_content):
        new_content = re.sub(pattern, replacement, file_content)

        with open(file_path, 'w') as file:
            file.write(new_content)

        print(f"Replacement successful in {file_path}")
    else:
        print(f"Pattern not found in {file_path}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <dart_file_path>")
        sys.exit(1)

    dart_file_path = sys.argv[1]

    if os.path.exists(dart_file_path):
        replace_image_code(dart_file_path)
    else:
        print(f"Dart file not found at {dart_file_path}")
