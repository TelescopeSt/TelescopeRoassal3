"
This class uses methods and models from moose.
"
Class {
	#name : #TLMooseExamplesExamples,
	#superclass : #Object,
	#category : #'Telescope-Roassal3-Examples'
}

{ #category : #visualization }
TLMooseExamplesExamples >> exampleMyClassButterfly [
	<script: 'self new exampleMyClassButterfly open'>
	<tlFilter: #style>
	<tlFilter: #visuTemplate>
	| b |
	b := TLMyDemoButterfly new.
	b
		mainEntity: {RSCanvas >> #zoomToFit. RSCanvas >> #privateEdges};
		leftEntities: [ :met | met senders collect: #compiledMethod ];
		rightEntities: [ :met | met implementors collect: #compiledMethod ].
	^ b
]
