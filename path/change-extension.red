Red [
	Title:	"function to change file extension"
	Author:	"Koba-yu"
	File:	%change-extension.red
]

path: context [
	change-extension: function [
		"change extension or add extension if it does not have"
		file [file!] "file to be changed"
		ext [string!] "extension after the change"
	][
		parts: split file "/"
		end: last parts

		either find end #"." [
			while [not-equal? last end #"."] [take/last end]
		][
			append end "."
		]

		append end ext
		join parts "/"
	]
]
