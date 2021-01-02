# HPPenShortcuts
A journey on how to apply custom actions to your HP Pen or Tilt Pen like firing shortcuts, running a program or a script


Hi, my name is Lennart.
Disclaimer: This is the first time, I'm doing this open source thing so I'm very open towards feedback of any kind as I am probably going to do a LOT wrong here :D
If you don't care and want the technical stuff right away, skip to the file **Technical Stuff Tutorial**. If you get stuck however, I suggest going back to what I did here and learn from my mistakes. 

## The Beginning
This year, I started studying computer science in Germany. As many students today, I wanted to get myself a convertible tablet or laptop as my first non-stationary device with support for a digital pen. After a lot of looking around, I decided against a Surface Pro X (get your chipset done MS...) and for an **HP Envy x360**. So now that I had an HP computer, a **pen from the same brand** would be a nice idea, wouldn't it? Well, Microsoft obviousely has legitimate interest in pushing their own hardware and therefor having horrible pen support - or maybe HP doesn't care so much about user friendlyness? However it turned out, that today, 30. Dec 2020 you could - though there is custom OneNote in-app support for all buttons on all pens - only set three very limited actions for the Tilt Pen in the Windows Settings:

+ Single tap on the back
+ Double tap on the back
+ Tap and hold on the back

The last of which is only available to certain pens whatever that means; it doesn't work with mine. The second button at thumb level cannot be accessed here, though it seemed fine for Surface pens. In addition to that, the actions that are suported out of the box are very limited. Some key features, as **starting OneNote, Ink, Whiteboard, making a screenshot or launching Cortana** are included but simple actions like defining a custom shortcut are not. In addition to that, we can also launch executables or apps that we have installed from the MS Store or as an app from Edge and therefor technically websites - but for inexperienced users, this can be quite a headache. Later we will exploit (or use?) this exact feature but for now, let's look at me fail the usual way.

## The Assumptions
Naive as I am, I hoped that I could tell the pen to **undo (ctrl + z) the last action taken in OneNote** on a tap on its back instead of having to switch to the erazer by turning the pen or accessing it in the upper left corner. But neither OneNote nor the settings page allowed me to configure my pen that way. As this was my main issue and the reason I started this little project, it will be used as an example guide throughout this project and will show up in the code snippets for some orientation.

Fist, I looked for additional drivers or other software by HP. It turned out that there is an [**unsupported, non-downloadable MS Store app**](https://www.microsoft.com/store/productId/9PJ3VGVQ4NMP) by HP to fix this but appearantly HP has stopped the support, taken it down and only some dirty tricks could - for some people (not me) get it running. If you want to try this, [feel free](https://h30434.www3.hp.com/t5/Notebook-Video-Display-and-Touch/update-to-HP-Pen-Control-not-installing/td-p/6074702/page/3) but since it's depricated I would advise you not to do so.

After that, I thought that every button press or maybe even double taps on the pen would be recognised as a custom button press just [**like on a multi button mouse**](https://stackoverflow.com/questions/18693881/detect-what-button-is-pressed/). This way they could be detected by [**AutoHotkey**](https://www.autohotkey.com/) (AHK) and all my problems would be gone. I have some experience with AHK but even for beginners it's extremely easy to get into or just look up a solution online, so in this situation, where I had some form of publishing in my head it was a nice opportunity. Suprise, you cannot detect the button taps as taps. In some forums I found somebody say that the communication happens at a level AHK cannot detect and one should try [**AHKHID**](https://autohotkey.com/board/topic/38015-ahkhid-an-ahk-implementation-of-the-hid-functions/), which is basicly advanced AHK but sadly - no changes.

## The Way to Go
A lot of frustration later, I decided to go back to better known territorty than wired frequency-wave stuff and tried PowerShell. Up to that point I didn't know that you could just tell PowerShell to emulate key strokes but appearently you can, so here I go. Some inspiration from the internet later and I could [**execute key strokes in PowerShell**](https://stackoverflow.com/questions/17849522/how-to-perform-keystroke-inside-powershell). Nice. Now, the script as [**.ps1 had to be compiled to an executable .exe unsing PS2EXEGUI**](https://github.com/MScholtes/TechNet-Gallery/tree/master/PS2EXE-GUI) so that Windows would recognize it as a program and we were good, right? Technically yes. Now it's time for some late architecture, deciding **where the scripts go**, how to distribute them and so on. If you dont have a local store for your scripts yet, I'd put them somewhere on your C drive in a fresh new folder where your to be AHK scripts can be stored as well. Architecture done.

## The Result
We now have PowerShell scripts in .exe form that can basicly do anything. You can again look at the **Technical Stuff Tutorial** to get a condensed form of this and with some inspiration of mine or your own PowerShell skills fulfill your dreams regarding your pen.

## What I learned
Not much yet sadly. Just like in other projects, I've just biten my way through the problem and came somehow to a solution. I have some whacky docs (more than usually xD) and no community for feedback, so I guess I'll wait until the next lost soul searches the internet for help on pen shortcuts and leaves some feedback. Again, although I did primary publish this for non-scripters I still want to improve on my open source practices and therefor I need YOUR, yes actually your feedback because you read all this and probably profit from it :P So what about this: We help each other out in improving this project and in the end everybody get's a better product. Yeah? Nice!
