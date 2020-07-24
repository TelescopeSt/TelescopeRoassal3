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
	^ shape propertyAt: #tlchildren ifAbsent: [ #() ]
]

{ #category : #accessing }
TLShapeDecorator >> children: aCollection [
	shape propertyAt: #tlchildren put: aCollection
]

{ #category : #'as yet unclassified' }
TLShapeDecorator >> defineFixedRelativePosition: aPoint [ 
	self position: aPoint
]

{ #category : #dimension }
TLShapeDecorator >> dimension [
	^ shape extent
]

{ #category : #accessing }
TLShapeDecorator >> encompassingRectangle [
	^ shape encompassingRectangle
]

{ #category : #geometry }
TLShapeDecorator >> extent: aPoint [
	| node |
	shape extent: aPoint.
	shape shapes first extent: aPoint.
	shape shapes size < 2 ifTrue: [ ^ self ].
	
	shape shapes second remove.
	node := shape model.
	shape add: (node generator 
		createLabelFor: node 
		style: node effectiveStyleSheet 
		shape: shape shapes first).
	
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

{ #category : #accessing }
TLShapeDecorator >> parent [
	^ shape propertyAt: #tlparent
]

{ #category : #accessing }
TLShapeDecorator >> parent: aTLShapeDecorator [
	shape propertyAt: #tlparent put: aTLShapeDecorator
]

{ #category : #dimension }
TLShapeDecorator >> position [
	^ shape position
]

{ #category : #dimension }
TLShapeDecorator >> position: aPoint [
	shape position: aPoint.
	self children do: [ :child | 
		child translateBy: aPoint - (shape extent / 2 ) + (10 @ 20).
		 ].
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
