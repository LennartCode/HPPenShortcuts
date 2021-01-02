# Tech Stuff Tutorial

So, you want to get straight into it and start making your own custom shortcuts for your HP pen or tilt pen? You've come to the right place. Below you find a step by step guide on how to set the technical stuff up. If you want to know how I found out about what to do, learn from my mistakes or get to know about alternatives to some software I use here, read the **readme.md**, where I tell you about my journey.

## Knowing what you want to do
Before you start with your project, you should know what features are already supported in Windows. If you go to **Settings -> Devices -> Pen and Windows Ink** there are some actions for single, double or hold tapping the pen. In addition  to that, **some software supports custom features** that sometimes sadly cannot be changed. For example OneNote interprets holding the thump-button as using the selection tool. If you have already found your desired feature you don't need to read on - everything is supported by default.

## Overview
Here is a short overview over what we want to do in this project:

1. Writing a PowerShell script that does what you want the pen to do
1. Converting the PowerShell script into an executable (.exe) and saving it in a local folder
1. Setting the pen action to the executable

## Workload
The hardest part of this project is writing the PowerShell script to do what you want. If you are already familiar with PowerShell - good for you, otherwise I will have some examples and - as PowerShell is a script language - it is fairly easy to learn and you find a lot of examples and help online (see below). The estimated time for this project is one hour and probably a bit longer, depending on how complicated your action is.

## Terminologie
I will use some terms in this tutorial and just to make sure we are on the same page, here is a list of what I mean by them.

| Term | Meaning |
| --- | --- |
| Action | Something that happens when a certain button on your pen is pressed |
| Script | Code written in PowerShell and saved as .ps1 to execute your action |
| .ps1 | Script file with your code |
| .exe | Executable file holding your script created by the PS2EXE-GUI compiler |

## Examples
In this repository there are some examples for special actions. For example I have written a script that executes custom button presses such as STRG + Z for undoing actions in basicly any software. Feel free to use and modify those if they suit your needs. Otherwise continue with the tutorial.

## Step One: The Script
In the fist step, we want to write a script in PowerShell to execute our action. If you are already familiar with PowerShell, just make sure that the script must work as is. There is **no way to pass any parameters** as only a press of the button executes the script. If you want to read data from the system however, feel free to do so just keep in mind that it might take some time and will probably interrupt your workflow.

**Alternatively, you can write a script in any language you like.** Just make sure that it can be compiled to an executable (.exe) and it works as intended just by executing the file. The steps below will be for PowerShell however as it work excellent with Windows.

### What is PowerShell?
PowerShell is a script language developed by Microsoft to help managing Windows. It is a very powerful tool to do basicly anything you like in Windows and some Microsoft applications. If you want to learn PowerShell (I recommend it although it would be quite an overkill for this project) here is an amazing [YouTube tutorial series by TechThoughts](https://youtube.com/playlist?list=PL2j0_s2VJe2hzQuQyn6yfMS2olhhs4UnQ) and a link to the [official documentation](https://docs.microsoft.com/en-en/powershell/).

### Getting Started Scripting
To start writing your script, you just need a **text editor. Any works** if you stick to the syntax and save the file as .ps1 as this is the standard script format for PowerShell. Besides the Editor, Notepad(++) or the very old PowerShell ISE you definitely should not use anymore, we have our modern, light-weight text editor Visual Studio Code. If you plan on writing some more PowerShell you should install it and use the PowerShell extension to enable syntax highliting, snap-ins and much more. For tutorials on how to set it up, refer to the ducumentation or tutorial series mentioned above.

### Your Script
From here on, I'll assume that you have an editor set up to edit your scripts with, at least some very basic knowledge of PowerShell and know exactly what you wnat to do. Also you have checked that your desired feature is not available in Windows natively and that none of my examples do what you want to do.

The first thing every good programmer does when starting a new project is looking for complete solutions for the problem on the internet. Why work if somebody else has already done and shared their solution? So just go for it and look up **<Your action> with PowerShell**. You are pretty likely to find some decent results online. Copy the code, modify it untill it fits your needs and you are done.

If you are not as lucky, good luck piecing your code together. Some tips:
+ Check again, if your feature is not supported by default
+ Learn the PowerShell basics. It usually takes less time than finding a stupid mistake you made, because you dont know the syntax (e.g. calling functions with parenthesis)
+ If the action is tied to a special program, look up the keyboard shortcut and use PowerShell to execute the key strokes
+ If you have multiple actions to execute and you have problems with the execution order, let PowerShell take some time for each action using the StartSleep commandlet
+ If you work with shortcuts and want to know which keys are pressed, use [**AutoHotkey**](https://www.autohotkey.com/). You can find a decent explaination [here](https://stackoverflow.com/questions/18693881/detect-what-button-is-pressed/57718403)
+ Only if you have really tried yourself: Ask people online

## Step Two: Compiling the Script to .EXE
Now that the script does what you want it to do, we need to compile it to an executable (.exe) so that windows can execute it on the press of a button. Luckily there is a nice piece of software by Markus Scholtes and Ingo Karstein that does the job for us. It is called [**PS2EXE-GUI**](https://github.com/MScholtes/TechNet-Gallery/tree/master/PS2EXE-GUI).

### Compiler settings
After you have downloaded and extracted all the files, run **Win-PS2EXE.exe**. A window should have shown up, were we can customize our compilation.

+ In **Source File**, we want to put the URI to our .ps1 script file (e.g. C:\files\myCustomScript.ps1).
+ **Target file** is a link to the to-be executable. So you have to include the file name and extension although the file does not exist yet (e.g. C:\scripts\pen\PenUndo.exe).
+ **Icon File** is the link to a custom icon for the exe. Since we don't actively work with the file and ideally you want to never see it again, this can be skipped.
+ **Version, Product Name and Copyright** are also optional but can be used to customize the exe further.
+ The text in **File Description** is also optional but will be shown in the Windows settings later. Choose a short name or description for your script, as it will be cut-off. (e.g. Pen Undo).
+ Make sure to set **Suppress Output and Suppress Errors** to true if you don't want to be distracted while working. Leave it to false if you feel uncomfortable doing so.
+ **Require administrator rights** should be false. Make sure that your script doesn't need these privileges.
+ The rest can be left to default.

After clicking Compile, an executable should appear in your set location.

## Step Three: Linking the Action to your Pen
The last step is to run your exe if the desired button presses are performed. Go to **Settings -> Devices -> Pen and Windows Ink** and set the task of your certain tap patterns to **Run classic App**. Below, select the path to your freshly compiled executable. Now, you should see the file name and description text if the box.

### Testing the feature
Now it's time. Connect your pen to the device using bluetooth, open your app and test your very own, custom feature. Keep in mind that running the executable is a little bit slower than natively implemented features but now, it should work :)

## Not working :/
Some tips:
+ Make sure the scipt (as .ps1) does what you want it to do. Prepend a **StartWait 5** to your script (Wait 5 seconds before running it), quickly open the application you want to test the feature with and see if it works correctly.
+ Make sure that Windows can execute your file (accessible, privileges...)
+ Make sure the pen is connected properly
+ Choose different settings when compiling (e.g. showing errors)
+ Run the .exe by hand

## Working! :D
Nice, congratulations! I am very happy I could help you out with my first open source project. If you want to give something back, leave some feedback under **Issues** and if you think others could profit from your code, make sure to set up a **Post Request**. Your script will be included in the repository as an example then - with proper credit of cause.

I am looking foreward to hearing from you! :D
