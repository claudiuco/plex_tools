# A streamlined process of adding music to your Plex Media Server

## Intro
Once upon a time, there was a guy that tried very hard to add music to his Plex Media Server. It ended up very dissapointed, not being able to see his favourite tracks in what he called "no more Spotify, Apple Music or other crap". A big fan of selfhosted apps, our hero emabarked in his journey looking for a "explain like I'm 5" tutorial, but no luck. But because he managed to get through this after several hours of hardworking, pain and sweat, $username decided to share with other peeps a streamlined process of adding music to a Plex Media Server. 

And because he believes in the free will of humanity, two versions of the samee script were added in this repo in Powershell and Python (covering both Windows and Linux users needs).

Feel free to change the scripts, but please respect our hero's work and _fork_ them. It will show a great deal of appreciation :) 

## Adding music to your Plex Media Server
### STEP 1: Preparation
1.1 Move all the files, regardless their extensions (.m4a, .mp3, etc.) under a single folder (i.e. /home/user/Music or C:\Users\User\Music) 
1.2 Create a separate folder, **under a different hierarchy** then the previous one (i.e. /home/user/Plex_Library or C:\Users\User\Plex_Library)
> [!TIP]
> Create also a backup for the original directory where all the music is stored so you avoid any surprises such as losing all the music. :) 

### STEP 2: Formatting
2.1 Now we will need to tag the files, so our operating system and implicitly, Plex Server, recognizes them correctly. For this, we will use an opensource tool, called mp3tag: https://www.mp3tag.de/en/ Download it, install it and run it.
2.2 In mp3tag application, follow this path: File > Change Directory > select the directory from STEP 1.
<p align='center'>
<img src=https://github.com/thegoodroot/plex_tools/assets/126617923/d21fbcf6-4b2f-4ce1-aa90-91d995472b76 />
</p>

2.3 Then, select all the tracks, go to Convert > Tag Filename (or ALT+1). You will be prompted which format you like. I strongly recommend to stick with the default one: 
``` 
%artist% - %album% - $num(%track%,2) - %title% 
```
> [!TIP]
> As a precaution, my suggestion is to hit "Preview" first to see if the displayed format corresponds with the one below, and then hit "Ok" as this operation will change the filename format from whatever format to the one wanted by my script. So, ${\color{green}Preview}$ first, ${\color{red}Ok}$ second. 
> ```
> ArtistName - AlbumName - TrackNo - TrackName.extension $${\color{red}Red}$$
> ```
<p align="center">
<img src=https://github.com/thegoodroot/plex_tools/assets/126617923/714796dd-fe94-48ab-86b4-23ec536edf1c />
</p>

2.5 Go through all the files and check if there are any unexpected chain of characters that would alter the functionality of the script. For example, a filename like ``` Pink Floyd - Animals -1- - 01 - Dogs ``` will trigger an error, as the -1- will be intepreted wrongly. So no extra spaces nor extra "-". 
2.6 After this filename formatting being done, move forward to step 3.

### STEP 3: Organizing the Plex Library
3.1 Download the script, put it in your fancy-dandy IDE (VScode is my fav, but don't take it from me) and edit these lines with the absolute paths to your directories:
```
```
3.2 Execute the script. If everything was done correctly, it should work flawlessly. Check the destination folder (the one to be copied to Plex Media Library). 
The hierarchy should look like this:
<p align="center">
<img src=https://github.com/thegoodroot/plex_tools/assets/126617923/30637d52-3fc5-4a34-adfa-964e7cf880e9 />
</p>

### Congrats, now you're ready to copy using rsync (for Linux users) or winscp (for Windows users)! 
