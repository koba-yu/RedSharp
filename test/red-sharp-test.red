Red [
	Title: "RedSharp test"
	Author: "Koba-yu"
	File: %red-sharp-test.red
	Tabs: 4
]

do %../redsharp.red

;
; test data
;
dummies1: [#(
    名前: "諏訪 紗季"
    ふりがな: "すわ さき"
    アドレス: "suwa_saki@example.com"
	年齢: "68"
) #(
    名前: "倉本 みき"
    ふりがな: "くらもと みき"
    アドレス: "kuramoto_miki@example.com"
	年齢: "58"
) #(
    名前: "越智 ジョージ"
    ふりがな: "おち じょーじ"
    アドレス: "ochi_george@example.com"
	年齢: "48"
) #(
    名前: "河合 康晴"
    ふりがな: "かわい やすはる"
    アドレス: "kawai_yasuharu@example.com"
	年齢: "50"
)]

dummies2: [#(
    名前: "諏訪 紗季"
    性別: "女"
    年齢: "68"
    誕生日: "1949/10/9"
) #(
    名前: "倉本 みき"
    性別: "女"
    年齢: "24"
    誕生日: "1959/2/4"
) #(
    名前: "越智 ジョージ"
    性別: "男"
    年齢: "48"
    誕生日: "1969/6/16"
) #(
    名前: "田中 宏"
    性別: "男"
    年齢: "50"
    誕生日: "1967/2/14"
)]

single-key-results: enumerable/join [
	x dummies1 [x/名前]
	y dummies2 [y/名前]
	[context [name: x/名前 gender: y/性別 address: x/アドレス]]
]

double-key-results: enumerable/join [
	x dummies1 [x/名前 x/年齢]
	y dummies2 [y/名前 y/年齢]
	[context [name: x/名前 gender: y/性別 address: x/アドレス]]
]

;
; tests
;
tests: make map! [
	test1: [equal? file/change-extension %test "txt" %test.txt]

	test2: [equal? file/change-extension %test.txt "md" %test.md]

	test3: [equal? string/join [1 2 3] "" "123"]

	test4: [equal? string/join [1 2 3] "," "1,2,3"]

	test5: [equal? single-key-results/1/name "諏訪 紗季"]

	test6: [equal? single-key-results/1/gender "女"]

	test7: [equal? single-key-results/1/address "suwa_saki@example.com"]

	test8: [equal? single-key-results/2/name "倉本 みき"]

	test9: [equal? single-key-results/2/gender "女"]

	test10: [equal? single-key-results/2/address "kuramoto_miki@example.com"]

	test11: [equal? single-key-results/3/name "越智 ジョージ"]

	test12: [equal? single-key-results/3/gender "男"]

	test13: [equal? single-key-results/3/address "ochi_george@example.com"]

	test14: [none? single-key-results/4]

	test15: [none? single-key-results/5]

	test16: [equal? double-key-results/1/name "諏訪 紗季"]

	test17: [equal? double-key-results/2/name "越智 ジョージ"]

	test18: [none? double-key-results/3]

	test19: [none? double-key-results/4]

	test20: [none? double-key-results/5]
]

result: collect [foreach test keys-of tests [
		unless do tests/:test [keep rejoin [test " is failed"]]
	]
]

print either empty? result ["All passed"][result]