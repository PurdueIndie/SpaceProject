#! /usr/bin/env python3
# godot-auto-doc.py - Automatic documentation creator for GDscript
# usage: should be in docs/ directory

import re, os, pprint

# paths to relevant directories
path_to_scripts = '../game/script/'

# Get list of all *.gd files to read in files
file_regex = re.compile(r'.*\.gd')
files = []
for folder_name, sub_folders, file_names in os.walk(path_to_scripts):
	all_file = filter(file_regex.match, list(file_names))
	for f in (list(all_file)):
		files.append(f)


# opens one file at a time and stores in file_data
full_regex = re.compile(r'(((#.*\n)*)func +([^_].*)\((.*)\):|enum(.*){(([^,}]*,)*.*)})')
comment_regex = re.compile(r'ret +(.*), *arg +(.*)')
#function_regex = re.compile(r'((#.*\n)*)func +([^_].*):')
#enum_regex = re.compile(r'enum(.*){(([^,}]*,)*.*)}')
file_data = {}
for f in files:
	file_data[f] = []
	file = open(path_to_scripts + f)
	text = file.read()
	file.close()
	# searches text by regex to get info to put into file_data
	result_list = full_regex.findall(text)
	for index, result_groups in enumerate(result_list):
		if result_groups[3] == '':
			#enum
			print("Enum.")
		else:
			#func
			comment_group = result_groups[1].split('\n')
			function_data = {"function_name": result_groups[3]}
			comments = ''
			for i in range(len(comment_group) - 1):
				if i == len(comment_group) - 2:
					match = comment_regex.match(comment_group[i][1:].strip())
					if match != None:
						arg_types = match.group(2).split(',')
						args_raw = result_groups[4].split(',')
						args = []
						for i in range(len(args_raw)):
							if i < len(arg_types):
								args.append(arg_types[i].strip() + " " + args_raw[i].strip())
							else:
								args.append(args_raw[i].strip())
						function_data["arguments"] = args
						function_data["return_type"] = match.group(1).strip()
						continue
				# need refactoring
				comments += comment_group[i][1:].strip() + "  \n"
			if comments != '':
				function_data["comments"] = comments
			file_data[f].append(function_data)


pprint.pprint(file_data)

# Opens api file in api_file and writes file_data to it
api_file = open('API.md', 'w')

# writing


api_file.close()
