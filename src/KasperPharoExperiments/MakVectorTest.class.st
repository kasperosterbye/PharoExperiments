"
A MakVectorTest is a test class for testing the behavior of MakVector
"
Class {
	#name : 'MakVectorTest',
	#superclass : 'TestCase',
	#category : 'KasperPharoExperiments',
	#package : 'KasperPharoExperiments'
}

{ #category : 'tests' }
MakVectorTest >> testFromTo [
	|vec|
	vec := MakVector from: 0@0 to: 1@0.
	self assert: vec angle closeTo: 0.
	vec := MakVector from: 0@0 to: 0@1.
	self assert: vec angle closeTo: Float pi / 2.
	vec := MakVector from: 0@0 to: 1@1.
	self assert: vec angle closeTo: Float pi / 4.
	self assert: vec length closeTo: 2 sqrt
	
]

{ #category : 'tests' }
MakVectorTest >> testX [
	| vec | 
	vec := MakVector new angle: 0; length: 2; origin: 0@0.
	self assert: vec x equals: 2.
	vec length: -10.
	self assert: vec x equals: -10.
	vec origin: 12@0.
	self assert: vec x equals: 2.
	vec angle: Float pi / 2.
	self assert: vec x closeTo: 12
]

{ #category : 'tests' }
MakVectorTest >> testY [
	| vec | 
	vec := MakVector new angle: Float pi / 2; length: 2; origin: 0@0.
	self assert: vec y equals: 2.
	vec length: -10.
	self assert: vec y equals: -10.
	vec origin: 0@12.
	self assert: vec y equals: 2.
	vec angle: 0.
	self assert: vec y closeTo: 12
]
