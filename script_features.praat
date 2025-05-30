directory$ = "D:\CogSciMSc\SEM4\AP\project\data"
fileappend D:\CogSciMSc\SEM4\AP\project\results.xls Filename 'tab$' Interval 'tab$' Label  'tab$' duration'tab$' intensity'tab$' pitch'tab$' startpitch(0%) 'tab$' 10%'tab$' 20%'tab$' 30%'tab$' 40%'tab$' 50%'tab$' 60%'tab$' 70%'tab$' 80%'tab$' 90%'tab$' endpitch(100%)'tab$' 'newline$'

Create Strings as file list... list 'directory$'/*.wav
numberOfFiles = Get number of strings
for ifile to numberOfFiles
   select Strings list
   fileName$ = Get string... ifile
   Read from file... 'directory$'\'fileName$'
   fileName$ = selected$("Sound")
   Read from file... 'directory$'\'fileName$'.TEXTGRID
   	select Sound 'fileName$'
	  	plus TextGrid 'fileName$'
	Clone time domain
Read from file... 'directory$'\'fileName$'.TEXTGRID
    n = Get number of intervals... 1
	for i from 1 to n
	select TextGrid 'fileName$'
	label$=Get label of interval... 1 i
	if label$ <> ""
	#The previous line can be used to specify a particular label from which you want to extract values,
	#Example: If you want only values from the "a" labels just add [and label$ = "a"]

	vowelstart=Get starting point... 1 i
	vowelend=Get end point... 1 i
	vowelmid= (vowelstart+vowelend)/2
	
	duration=(vowelend-vowelstart)*1000
	
	select Sound 'fileName$'
	To Intensity... 100 0 yes
	intensity= Get mean... 'vowelstart' 'vowelend' energy

	select Sound 'fileName$'
	To Pitch... 0 75 600
	sd = Get standard deviation... 'vowelstart' 'vowelend' Hertz
	print 'vowelstart' 'tab$' 'vowelend' 'newline$'

	pitch = Get mean... vowelstart vowelend Hertz
	startpitch = Get value at time... 'vowelstart' Hertz Linear
	startpitch10 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.1 Hertz Linear
	startpitch20 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.2 Hertz Linear
	startpitch30 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.3 Hertz Linear
	startpitch40 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.4 Hertz Linear
	startpitch50 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.5 Hertz Linear
	startpitch60 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.6 Hertz Linear
	startpitch70 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.7 Hertz Linear
	startpitch80 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.8 Hertz Linear
	startpitch90 = Get value at time... 'vowelstart'+('vowelend'-'vowelstart')*0.9 Hertz Linear
	endpitch = Get value at time... 'vowelend' Hertz Linear

	fileappend D:\CogSciMSc\SEM4\AP\project\results.xls 'fileName$''tab$''i''tab$''label$''tab$''duration:3''tab$''intensity:3''tab$''pitch:3''tab$''sd:3''tab$''startpitch:3''tab$''startpitch10:3''tab$''startpitch20:3''tab$''startpitch30:3''tab$''startpitch40:3''tab$''startpitch50:3''tab$''startpitch60:3''tab$''startpitch70:3''tab$''startpitch80:3''tab$''startpitch90:3''tab$''endpitch:3''newline$'
endif
endfor

select all
minus Strings list
Remove

endfor
select Strings list
Remove
print 'newline$' 'fileName$' is Done
