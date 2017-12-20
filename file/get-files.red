Red [
	Title:	"get files, optionally recursively"
	Author:	"Koba-yu"
	File:	%get-files.red
]

file: context [
	get-files: function [
		"get files on the directory"
		dir [file! string!] "target directory"
		/deep "get files recursively"
	][
		collect [foreach d read dir [
				either equal? last d #"/" [
					if deep [foreach r get-files/deep join [dir d] "/" [keep r]]
				][
					keep d
				]
			]
		]
	]
]