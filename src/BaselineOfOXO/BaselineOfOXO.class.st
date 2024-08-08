Class {
	#name : #BaselineOfOXO,
	#superclass : #BaselineOf,
	#category : #BaselineOfOXO
}

{ #category : #baselines }
BaselineOfOXO >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Dependencies"
			self
				declareBlocOn: spec.
			"Packages"
			spec
				package: 'OXO' with: [ spec requires: #('Bloc' 'OXO-AI') ];
				package: 'OXO-AI';
				package: 'OXO-Tests' with: [ spec requires: #('OXO' 'OXO-AI') ].
 ]
]

{ #category : #'external projects' }
BaselineOfOXO >> declareBlocOn: spec [
	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:v2.0.0/src' ]
]

{ #category : #accessing }
BaselineOfOXO >> projectClass [
	^ MetacelloCypressBaselineProject
]
