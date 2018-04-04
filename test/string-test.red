Red [
	Title: "String test"
	Author: "Koba-yu"
	File: %string-test.red
	Tabs: 4
]

;
; tests
;
tests: make map! [
	test1: [equal? string/join [1 2 3] "" "123"]

	test2: [equal? string/join [1 2 3] "," "1,2,3"]
]