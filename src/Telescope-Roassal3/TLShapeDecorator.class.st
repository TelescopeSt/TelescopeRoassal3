"
TODO
"
Class {
	#name : #TLShapeDecorator,
	#superclass : #Object,
	#instVars : [
		'shape'
	],
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #accessing }
TLShapeDecorator >> children [
	^ #()
]

{ #category : #dimension }
TLShapeDecorator >> dimension [
	^ shape extent
]

{ #category : #accessing }
TLShapeDecorator >> encompassingRectangle [
	^ shape encompassingRectangle
]

{ #category : #dimension }
TLShapeDecorator >> incomingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape children first incomingEdges
		collect: [ :ed |
			decorators at: ed from ].
]

{ #category : #dimension }
TLShapeDecorator >> isNode [
	^ shape isNode
]

{ #category : #dimension }
TLShapeDecorator >> occupyMaxSpace [
	^ false
]

{ #category : #dimension }
TLShapeDecorator >> outgoingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape children first outgoingEdges
		collect: [ :ed |
			decorators at: ed to ].
]

{ #category : #dimension }
TLShapeDecorator >> position [
	^ shape position
]

{ #category : #dimension }
TLShapeDecorator >> position: aPoint [
	shape position: aPoint
]

{ #category : #accessing }
TLShapeDecorator >> shape [
	^ shape
]

{ #category : #accessing }
TLShapeDecorator >> shape: aRSShape [
	shape := aRSShape
]

{ #category : #accessing }
TLShapeDecorator >> translateBy: delta [
	^ shape translateBy: delta
]
