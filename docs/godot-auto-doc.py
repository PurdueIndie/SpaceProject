#! /usr/bin/env python3
# godot-auto-doc.py - Automatic documentation creator for GDscript
# usage: ./godot_auto_doc.py <start_dir> <doc_dest_dir>

import os, re

function_regex = re.compile(r'((#.*\n)*)func +([^_].*):')
enum_regex = re.compile(r'enum(.*){(([^,}]*,)*.*)}')
full_regex = re.compile(r'(((#.*\n)*)func +([^_].*):|enum(.*){(([^,}]*,)*.*)})')

os.chdir('/Users/jmarshall/GitHub/SpaceProject/')

def document_file( file, f , a ):
    text = file.read()
    result = full_regex.findall(text)
    print("\nFile " + str(f))
    #print(str(text))
    print("result:" + str(result))
    #print("e_result" + str(e_result))
    api_file = a
    api_file.write(f + '\n')
    for i in range(len(f)):
        api_file.write('=')
    api_file.write('\n\n')
    for r in result:
        if len(r) >= 7:
            if r[6] == '':
                comments = r[1].split('#')
                api_file.write('- ' + r[3].strip() + '\n')
                for i in range(len(comments)):
                    api_file.write(comments[i].strip() + '\n')
                api_file.write('\n')
            elif r[1] == '':
                api_file.write('- ' + r[4].strip() + '\n\n')
                iden = r[5].split(',')
                for i in range(len(iden)):
                    api_file.write(iden[i].strip() + '\n')
                api_file.write('\n')
    api_file.write('\n\n')
    print('done')

file_regex = re.compile(r'.*\.gd')
files = []

for folder_name, sub_folders, file_names in os.walk('game/script'):
    all_file = filter(file_regex.match, list(file_names))
    for f in (list(all_file)):
        files.append(f)

print(files)
a = open('docs/api.rst', 'w')

for f in files:
    file = open('game/script/' + f)
    document_file(file, f, a)
    file.close()

a.close()
