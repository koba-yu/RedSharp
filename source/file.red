Red [
	Title:	"Functions about file"
	Author:	"Koba-yu"
	File:	%file.red
]

file: context [
	get-files: function [
		"Get files on the directory"
		dir [file! string!] "Target directory"
		/deep "Get files recursively"
		return: [block!]
	][
		collect [foreach d read dir [
				either equal? last d #"/" [
					if deep [foreach r get-files/deep join [dir d] "/" [keep r]]
				][keep d]
			]
		]
	]

	change-extension: function [
		"Change extension, or add if it does not have"
		file [file!] "file! to be changed"
		ext [string! word!] "Extension after the change (without .)"
		return: [file!]
	][
		suffix-length: either suffix: suffix? file [length? suffix][0]
		file: copy/part file (length? file) - suffix-length
		to file! rejoin [file "." to string! ext]
	]
]
