printing
printPassingResults
	| title |
	self printTravisFold: 'passing_tests' action: 'start'.
	title := runner passingTests asString, ' passing Tests'.
	self setModeBold; setModeGreen; print: title; newLine; resetMode.
	
	[ runner results keysAndValuesDo: [ :class :results | | passing |
		passing := results select: [ :result | result passed ].
		passing ifNotEmpty: [
			self printClassTitle: class.
			passing do: [ :result | self printResult: result ] ] ]
	] ensure: [ self printTravisFold: 'passing_tests' action: 'end' ]