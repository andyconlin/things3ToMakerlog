#############
# SETUP
#############

property areaName : null
property apiToken : null
property hashtag : null

property taskSuccess : " "
property taskFail : " "


#############
# GET PROPERTIES
#############
if (areaName is null) then
	set theResponse to display dialog "What is the area name?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set areaName to text returned of theResponse
end if

if (apiToken is null) then
	set tokenResponse to display dialog "What is your Makerlog API token?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set apiToken to text returned of tokenResponse
end if

if (hashtag is null) then
	set hashtagResponse to display dialog "What hashtag would you like to add to the end of each task?" default answer "#ProjectName" buttons {"Cancel", "Continue"} default button "Continue"
	set hashtag to text returned of hashtagResponse
end if

#############
# PROCESS TASKS
#############

tell application "Things3"


	# setting the time comparison date for 1 minute after midnight of today
	set todayStart to date "12:01am" of (current date)
	set logbookToDos to to dos of list "Logbook"

	# SET INITIAL PROGRESS INFO
	set theToDoCount to length of logbookToDos

	my initProgress(theToDoCount)

	repeat with n from 1 to count of logbookToDos

		# UPDATE PROGRESS INFO
		my setProgressMessage("Processing task " & n & " of " & theToDoCount)

		set match to false
		set toDo to item n of logbookToDos

		# check if completed today
		if (completion date of toDo > todayStart) then





			# check if in correct area
			# (or with project within correct area)
			# using "try" because a to do doesn't have to be part of an area
			try
				if ((name of area of toDo) as string = areaName) then
					set match to true
				end if
			end try


			try
				if ((name of area of project of toDo) as string = areaName) then
					set match to true
				end if
			end try


			if match = true then
				# send to makerlog
				my addTaskToMakerlog(name of toDo, hashtag)
			end if


		else
			# completed before today
		end if

		# UPDATE PROGRESS INFO
		my incrementProgress(n)


	end repeat

	display dialog "Successful:
" & taskSuccess
	display dialog "Unsuccessful:
" & taskFail

end tell



#############
# PROGRESS UPDATES
#############
on initProgress(stepCount)
	set progress total steps to stepCount
	set progress completed steps to 0
	set progress description to "Processing completed tasks..."
	set progress additional description to "Preparing to process."
end initProgress

on setProgressMessage(msg)
	set progress additional description to msg
end setProgressMessage

on incrementProgress(steps)
	set progress completed steps to steps
end incrementProgress



#############
# API CALL TO GETMAKERLOG
#############
on addTaskToMakerlog(taskName, hashtag)
	set httpCode to do shell script "curl -i -s -X POST -H 'Authorization: Token " & apiToken & "' -d 'content=" & taskName & " " & hashtag & "&done=true' https://api.getmakerlog.com/tasks/ | grep \"^HTTP\\/\""
	# | grep "^HTTP\/" plus escaping

	if (httpCode as string is not equal to "HTTP/2 201 ") then
		display alert "error: " & httpCode message taskName
		set taskFail to (taskFail & "
+ " & taskName)
		log taskFail
	else
		set taskSuccess to (taskSuccess & "
+ " & taskName)
		log taskSuccess
	end if
end addTaskToMakerlog
