"
TODO
"
Class {
	#name : #TLMyDemoButterfly,
	#superclass : #TLButterfly,
	#category : #'Telescope-Roassal3-Examples'
}

{ #category : #building }
TLMyDemoButterfly >> backgroundColor [

	^ Color white
]

{ #category : #building }
TLMyDemoButterfly >> buildVisualization [
	"This is a demo build do not use it on real applications"
	| leftEntitiesValues rightEntitiesValues leftGroup rightGroup entities centralGroup |
	self styleSheet nodeLabel: #selector.
	self styleSheet compositeExpandedByDefault: true.
	entities := self mainEntity.
	
	leftEntitiesValues := entities flatCollect: [:e |
		(self obtain: self leftEntities on: e) asOrderedCollection ].
	rightEntitiesValues := entities flatCollect: [:e |
		(self obtain: self rightEntities on: e) asOrderedCollection ].

	leftGroup := leftEntitiesValues groupedBy: #methodClass.
	centralGroup := entities groupedBy: #methodClass.
	rightGroup := rightEntitiesValues groupedBy: #methodClass.
	(self > #left) nodeCreationStrategy 
		childrenProperty: [ :assoc | assoc value ].
	
	(self > #central) nodeCreationStrategy 
		childrenProperty: [ :assoc | assoc value ].
		
	(self > #right) nodeCreationStrategy 
		childrenProperty: [ :assoc | assoc value].

	self styleSheet
		nodeLabel: [ :assoc | assoc key name ] position: #top;
		backgroundColor: self backgroundColor.

	self > #central addNodesFromEntities: centralGroup associations.
	self > #left addNodesFromEntities: leftGroup associations.
	self > #right addNodesFromEntities: rightGroup associations.
	
	((self > #left) styleSheet > #children)
		nodeLabel: #selector.
	((self > #central) styleSheet > #children)
		nodeLabel: #selector.
	((self > #right) styleSheet > #children)
		nodeLabel: #selector.
	entities do: [ :e | 
		| centralNodes left senders |
		centralNodes := (self > #central) allChildrenNodes 
			select: [ :node | node entity selector = e selector ].
		senders := e senders collect: [:s | s compiledMethod selector ].
		left := ((self > #left) allChildrenNodes 
				select: [ :node | senders includes: node entity selector ]).
		left connectTo: centralNodes.
		centralNodes
			connectTo: ((self > #right) allChildrenNodes 
				select: [ :node | node entity selector = e selector ])
	 ].
	
]
