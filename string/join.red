Red [
	Title:	"function to join string with delimeter"
	Author:	"Koba-yu"
	File:	%join.red
]

string: context [
	join: function [
		"make a concatenated string with the specified delimeter"
		values [block!] "values to be concatenated"
		dlm [string! char!] "seperator string"
	][
		rejoin collect [while [keep take values not empty? values] [keep dlm]]
	]
]