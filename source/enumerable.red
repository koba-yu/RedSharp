Red [
	Title:	"Function for enumerable"
	Author:	"Koba-yu"
	File:	%enumerable.red
]

enumerable: context [
	join: function [
		spec [block!]
		return: [block!]
	][
		inner: get spec/1
		outer: get spec/2
		inner-word: spec/3
		inner-selector: spec/5
		outer-word: spec/6
		outer-selector: spec/8

		if not-equal? mold spec/4 "=>" [throw "4th item must be '=>'"]
		if not-equal? mold spec/7 "=>" [throw "5th item must be '=>'"]

		make-hash: function [temp-word items selector][
			make hash! collect [foreach item items [
					set temp-word item
					keep get selector
					keep item
				]
			]
		]

		inner-hash: make-hash inner-word inner inner-selector
		outer-hash: make-hash outer-word outer outer-selector
		keys: extract outer-hash 2

		collect [foreach key keys [
				set inner-word select inner-hash key
				if none? get inner-word [continue]
				set outer-word select outer-hash key
				if none? get outer-word [continue]
				keep do at spec 9
			]
		]
	]
]