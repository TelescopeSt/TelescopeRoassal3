accessing
nodesShapesAvailableForConnector
	"I should return all TL shape that can apply on a node for this connector."

	^ TLSimpleShape allSubclasses
		select: [ :each | 
			[ each trachelNodeShape.
			true ]
				on: TLRoassal3NotSupportedFunctionalityException
				do: [ false ] ]