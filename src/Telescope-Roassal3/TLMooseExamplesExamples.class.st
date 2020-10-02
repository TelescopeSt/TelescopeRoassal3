"
This class uses methods and models from moose.
"
Class {
	#name : #TLMooseExamplesExamples,
	#superclass : #Object,
	#category : #'Telescope-Roassal3-Examples'
}

{ #category : #'as yet unclassified' }
TLMooseExamplesExamples >> exampleMyClassButterfly [
	<script: 'self new exampleMyClassButterfly'>
	| b |
	b := TLPackageButterfly new.
	b
		mainEntity: RSCanvas >> #zoomToFit;
		leftEntities: [ :met | met senders collect: #compiledMethod ];
		rightEntities: [ :met | met implementors collect: #compiledMethod ].


	b open
]

{ #category : #'as yet unclassified' }
TLMooseExamplesExamples >> exampleOverSimpleMethodEntity [
	<script: 'self new exampleOverSimpleMethodEntity'>
	| parser model context result entity butterfly |
	parser := CPPSCSVParser new.
	model :=  CPPSModel new.
	parser model: model.
	parser entitiesMap
		at: 'Class'
		put:
			(CPPSType new
				name: 'MyClass';
				sourceAnchor: (CPPSFileAnchor new mooseModel: model)).
				
	parser entitiesMap at: 'typeCode' put: CPPSType new.
	parser savePath: 'foo/bar' forId: 'sourceFile'.
	context := PP2Context new.
	parser := parser productionAt: #function.

	result := parser 
		parse: 'methodCode,"myMethod()",typeCode,Class,sourceFile,45,1,48,-1'
		withContext: context.
	entity := model entityNamed: 'MyClass.myMethod()'.

	butterfly := CPPSButterflyVisualization new
		mainEntity: entity.
	butterfly open.
]
