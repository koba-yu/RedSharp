Red [
	Title: "RedSharp test"
	Author: "Koba-yu"
	File: %red-sharp-test.red
	Tabs: 4
]

do %../redsharp.red

tests: make map! [
	test1: [
		equal? file/change-extension %test "txt" %test.txt
	]

	test2: [
		equal? file/change-extension %test.txt "md" %test.md
	]

	test3: [
		equal? string/join [1 2 3] "" "123"
	]

	test4: [
		equal? string/join [1 2 3] "," "1,2,3"
	]
]

result: collect [foreach test keys-of tests [
		unless do tests/:test [keep rejoin [test " is failed"]]
	]
]

print either empty? result ["All passed"][result]