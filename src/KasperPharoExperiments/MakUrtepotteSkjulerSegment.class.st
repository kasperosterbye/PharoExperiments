"
Jeg er et segment af en urtepotte skjuler, som ud fra hjørnerne kan lave en svg path.

sideExtra kan være #højre eller #venstre
"
Class {
	#name : #MakUrtepotteSkjulerSegment,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'sideExtra'
	],
	#category : #KasperPharoExperiments
}

{ #category : #accessing }
MakUrtepotteSkjulerSegment >> a: anObject [

	a := anObject
]

{ #category : #accessing }
MakUrtepotteSkjulerSegment >> b: anObject [

	b := anObject
]

{ #category : #accessing }
MakUrtepotteSkjulerSegment >> c: anObject [

	c := anObject
]

{ #category : #accessing }
MakUrtepotteSkjulerSegment >> center [
	| lower top |
	lower := LineSegment from: a to: d.
	top := LineSegment from: b to: c.
	
	
]

{ #category : #accessing }
MakUrtepotteSkjulerSegment >> d: anObject [

	d := anObject
]

{ #category : #accessing }
MakUrtepotteSkjulerSegment >> sideExtra: anObject [

	sideExtra := anObject
]

{ #category : #'as yet unclassified' }
MakUrtepotteSkjulerSegment >> svg [
	| args |
	args := { a. b. c. d. } collect: [ :p| p x asString, ' ', p y asString ].
	^ '<path d="M{1} L{2} L{3} L{4} Z" />' format: args
]
