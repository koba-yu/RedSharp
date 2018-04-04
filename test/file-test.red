Red [
	Title: "File test"
	Author: "Koba-yu"
	File: %file-test.red
	Tabs: 4
]

;
; tests
;
tests: make map! [
	test1: [equal? file/change-extension %test "txt" %test.txt]

	test2: [equal? file/change-extension %test.txt "md" %test.md]
]