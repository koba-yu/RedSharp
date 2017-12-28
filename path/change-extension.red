Red [
	Title:	"function to change file extension"
	Author:	"Koba-yu"
	File:	%change-extension.red
]

path: context [
	change-extension: function [
		"change extension or add extension if it does not have"
		file [file!] "file to be changed"
		ext [string! word!] "extension after the change (without .)"
		return: [file!]
	][
		suffix-length: either suffix: suffix? file [length? suffix][0]
		file: copy/part file (length? file) - suffix-length
		to file! rejoin [file "." to string! ext]
	]
]
