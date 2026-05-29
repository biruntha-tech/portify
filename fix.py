with open('update_templates.py', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('${s', '\\${s').replace('${p', '\\${p')

with open('update_templates.py', 'w', encoding='utf-8') as f:
    f.write(content)
