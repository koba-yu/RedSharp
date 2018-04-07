Red [
	Title: "Join double key test"
	Author: "Koba-yu"
	File: %join-double-key.red
	Tabs: 4
]

;
; test data
;
people1: [#(
	name: "諏訪 紗季"
	furigana: "すわ さき"
	mail: "suwa_saki@example.com"
	age: "68"
) #(
	name: "倉本 みき"
	furigana: "くらもと みき"
	mail: "kuramoto_miki@example.com"
	age: "58"
) #(
	name: "越智 ジョージ"
	furigana: "おち じょーじ"
	mail: "ochi_george@example.com"
	age: "48"
) #(
	name: "河合 康晴"
	furigana: "かわい やすはる"
	mail: "kawai_yasuharu@example.com"
	age: "50"
)]

people2: [#(
	name: "諏訪 紗季"
	gender: "女"
	age: "68"
	birthday: "1949/10/9"
) #(
	name: "倉本 みき"
	gender: "女"
	age: "24"
	birthday: "1959/2/4"
) #(
	name: "越智 ジョージ"
	gender: "男"
	age: "48"
	birthday: "1969/6/16"
) #(
	name: "田中 宏"
	gender: "男"
	age: "50"
	birthday: "1967/2/14"
)]

results: enumerable/join [
	x people1 [x/name x/age]
	y people2 [y/name y/age]
	[context [name: x/name gender: y/gender address: x/mail]]
]

;
; tests
;
tests: make map! [
	test1: [equal? results/1/name "諏訪 紗季"]

	test2: [equal? results/2/name "越智 ジョージ"]

	test3: [none? results/3]

	test4: [none? results/4]

	test5: [none? results/5]
]
