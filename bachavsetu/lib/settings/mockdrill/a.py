import sys
import os

def add_alert_dialog(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    target_line = '  Widget build(BuildContext context) {\n'
    index = None
    for i, line in enumerate(lines):
        if line == target_line:
            index = i
            break

    if index is not None:
        base_name = os.path.splitext(os.path.basename(file_path))[0].capitalize()

        alert_message = f"{base_name} Alert In Your Area!"
        
        new_code = f'''
      WidgetsBinding.instance.addPostFrameCallback((_) {{
        showDialog(
          context: context,
          builder: (BuildContext context) {{
            return AlertDialog(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning),
                  SizedBox(width: 8),
                  Text('Alert'),
                  SizedBox(width: 8),
                  Icon(Icons.warning),
                ],
              ),
              content: const Text(
                '{alert_message}',
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {{
                      Navigator.of(context).pop();
                    }},
                    child: const Text('Ensure Your Safety'),
                  ),
                ),
              ],
            );
          }},
        );
      }});'''

        lines.insert(index + 1, new_code)

        with open(file_path, 'w') as file:
            file.writelines(lines)

        print(f'Alert code added successfully in {file_path}')
    else:
        print('Target line not found in the file')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <file_name>")
    else:
        file_name = sys.argv[1]
        add_alert_dialog(file_name)
