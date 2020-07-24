"
TODO
"
Class {
	#name : #TLMultiLineLabelBuilder,
	#superclass : #RSMultilineLabelBuilder,
	#instVars : [
		'wrap',
		'wrapMaxWidth'
	],
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #private }
TLMultiLineLabelBuilder >> ellipsisShapeFor: aText [
	| currentText currentTextWithEllipsis shape |
	currentText := currentTextWithEllipsis := aText.
	
	[shape := self shapeFor: currentTextWithEllipsis.
	shape width > wrapMaxWidth and: [currentText isNotEmpty]  ] whileTrue: [ 
		currentText := currentText copyFrom: 1 to: currentText size - 1.
		currentTextWithEllipsis := currentText , '...'.
	].
	^ shape
	
]

{ #category : #initialization }
TLMultiLineLabelBuilder >> initialize [
	super initialize.
	layout := RSVerticalLineLayout new 
		alignCenter;
		gapSize: 1;
		yourself
]

{ #category : #private }
TLMultiLineLabelBuilder >> privateWrapShapeFor: aText [
	| currentLine currentText shape words i times |
	shape := self shapeFor: aText.
	shape width <= wrapMaxWidth ifTrue: [ ^ shape ].
	words := OrderedCollection new.
	i := 1.
	aText doWithIndex: [ :c :index | 
		c tokenish ifFalse: [ 
			words add: (aText copyFrom: i to: index).
			i := index + 1 ].
		 ].
	i < aText size ifTrue: [ words add: (aText copyFrom: i to: aText size) ].
	currentText := ''.
	currentLine  := ''.
	i := 1.
	times := 1.
	[ i <= words size and: [ times < 3 ]
		] whileTrue: [ | label word temp |
		word := words at: i.
		temp := currentLine, ' ', word.
		label := self labelShape copy text: temp.
		label width > wrapMaxWidth 
			ifTrue: [ 
				currentText := currentText, String crlf, currentLine.
				currentLine := ''.
				times := times + 1]
			ifFalse: [ 
				currentLine := temp.
				i := i + 1.
				times := 1 ].
	].
	currentText := currentText , String crlf , currentLine.
	^ self shapeFor: currentText.
	

]

{ #category : #accessing }
TLMultiLineLabelBuilder >> wrap: aString [
	wrap := aString
]

{ #category : #accessing }
TLMultiLineLabelBuilder >> wrapMaxWidth: aNumber [
	wrapMaxWidth := aNumber
]

{ #category : #hooks }
TLMultiLineLabelBuilder >> wrapShapeFor: aText [
	wrap = #wrap
		ifTrue: [ ^ self privateWrapShapeFor: aText ].
	wrap = #ellipsis
		ifTrue: [ ^ self ellipsisShapeFor: aText ].
	^ self shapeFor: aText
]
