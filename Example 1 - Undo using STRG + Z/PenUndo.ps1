# Set your values here:
[String]$applicationName = 'OneNote'            # Select the application, you want your keys to be stroken in
[String]$keyCombination = '^z'                  # Keys to be stroken (in this case CTRL + z to execute UNDO)
                                                # A table of all valid keys can be found here:
                                                # https://docs.microsoft.com/de-de/office/vba/language/reference/user-interface-help/sendkeys-statement
                                                # eg CTRL + ALT + DEL would be '^%{DEL}'

# Don't change anything below here:
$wshell = New-Object -ComObject wscript.shell;  # Create new Com Object
$wshell.AppActivate($applicationName)           # Set active app
# Start-Sleep 1                                   # Wait a second to let Windows catch up (I found this unneccessary but the people, I stole this code from had it included.
                                                # Maybe it will help you out in trouble xD)
                                                
$wshell.SendKeys($keyCombination)               # Execute keys



# Remember, the next step is to compile this .ps1 file to an .exe file (for example using PS2EXE)