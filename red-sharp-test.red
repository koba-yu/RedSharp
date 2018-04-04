Red [
	Title: "RedSharp test"
	Author: "Koba-yu"
	File: %red-sharp-test.red
	Tabs: 4
]

do %./redsharp.red

files: collect [foreach x read folder: %./test/ [
		insert c: reduce [load to-file reduce [folder x]] [in context]
		append c to-lit-word 'tests
		keep context [
			name: x
			tests: get do c
		]
	]
]

result: collect [foreach f files [
		foreach test keys-of f/tests [
			print rejoin ["Execute " f/name "'s " test]
			unless do f/tests/:test [keep rejoin [f/name "'s " test " is failed" crlf]]
		]
	]
]

print ""
print either empty? result ["All passed"][result]