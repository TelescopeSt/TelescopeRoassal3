"
TODO
"
Class {
	#name : #TLShapeDecorator,
	#superclass : #Object,
	#instVars : [
		'shape',
		'userFixedPosition'
	],
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #accessing }
TLShapeDecorator >> adjustPosition: evt [
	| delta |
	delta := evt newPosition - evt oldPosition.
	self children do: [ :child | 
		child translateBy: delta.
		].
	self parent ifNotNil: #adjustToChildren.
	
	
]

{ #category : #accessing }
TLShapeDecorator >> adjustToChildren [
	| rect box |
	rect := Rectangle merging: (self children collect: #encompassingRectangle).
	box := self shape shapes first.
	box extent: rect extent+20.
	self shape 
		position: rect floatCenter;
		extent: box extent.
	self parent ifNotNil: #adjustToChildren.
]

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
	userFixedPosition := false.
	self position: aPoint.
	userFixedPosition :=  true.
]

{ #category : #dimension }
TLShapeDecorator >> dimension [
	^ self hasChildren
		ifTrue: [ self children extent + 20 ]
		ifFalse: [ shape extent ]
	
]

{ #category : #accessing }
TLShapeDecorator >> encompassingRectangle [
	^ Rectangle center: self position extent: self dimension
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

{ #category : #accessing }
TLShapeDecorator >> hasChildren [
	^ self children isNotEmpty
]

{ #category : #dimension }
TLShapeDecorator >> incomingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape children first incomingEdges
		collect: [ :ed |
			decorators at: ed from ].
]

{ #category : #initialization }
TLShapeDecorator >> initialize [
	super initialize.
	userFixedPosition := false.
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
	self userFixedPosition ifTrue: [ ^ self ].
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
	shape := aRSShape.
	shape when: RSPositionChangedEvent send: #adjustPosition: to: self. 
]

{ #category : #accessing }
TLShapeDecorator >> translateBy: delta [
	^ shape translateBy: delta
]

{ #category : #dimension }
TLShapeDecorator >> userFixedPosition [
	^ userFixedPosition
]
