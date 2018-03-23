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
		inner-word: spec/1
		inner: do spec/2
		inner-selector: spec/3
		outer-word: spec/4
		outer: do spec/5
		outer-selector: spec/6
		result-selector: spec/7

		make-hash: function [temp-word items selector][
			make hash! reduce collect [foreach item items [
					set temp-word item
					blk: copy []
					do compose [(load either equal? length? selector 1 ["append"]["append/only"]) blk reduce selector]
					keep append blk item
				]
			]
		]

		inner-hash: make-hash inner-word inner inner-selector
		outer-hash: make-hash outer-word outer outer-selector
		keys: extract outer-hash 2

		collect [foreach key keys [
				set inner-word select/only inner-hash key
				if none? get inner-word [continue]
				set outer-word select/only outer-hash key
				if none? get outer-word [continue]
				keep do result-selector
			]
		]
	]
]