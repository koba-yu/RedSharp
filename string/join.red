Red [
	Title:	"function to join string with delimeter"
	Author:	"Koba-yu"
	File:	%join.red
]

string: context [
	join: function [
		"Make a concatenated string with the specified delimeter"
		values [block!] "Values to be concatenated"
		dlm [string! char!] "Seperator string"
		return: [string!]
	][
		values: copy values
		rejoin collect [while [
				keep take values
				not empty? values
			][
				keep dlm
			]
		]
	]
]