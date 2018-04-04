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

people2: [#(
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

results: enumerable/join [
	x people1 [x/名前 x/年齢]
	y people2 [y/名前 y/年齢]
	[context [name: x/名前 gender: y/性別 address: x/アドレス]]
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
