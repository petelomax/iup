# iup

D language: A "Deimos"-like binding to IUP, a portable Graphical User Interface toolkit.

Among other features, this GUI toolkit focusses on User Interface only (no burden of additional classes/structs for strings, containers ...) and has an abstract layout concept (no positioning by coordinates, no dependency on screen resolution, but the window size will depend on the systems setting for the text size).<br>

For me, an ex-wxWidgets, ex-Qt user, creating, changing windows/dialogs has never been easier than with this toolkit, using a textual LED-syntax file to design the layout and iupview from the 'Tools Executables' download section to inspect the layout. The D code's task is then almost merely to design the behavior by implementing a set of callback functions and connect them.
Possibly a wrapper to encapsulate within classes will follow.

After installing IUP from a prebuilt '...Libraries' binary, I recommend to download 'Tools Executables', run iuptest and pick some test cases like Sample, Tabs... for a live impression of IUP's look and feel. 
https://sourceforge.net/projects/iup/files/3.19.1/Tools%20Executables/

Lua support omitted<br>
C code base developed at Tecgraf/PUC-Rio, http://webserver2.tecgraf.puc-rio.br/iup/<br>
Current source code version 3.19.1

For convenience, D-bindings to the following, independent toolkits/libraries from the same authors will soon be included as well:<br>
IM, an Imaging Toolkit, current source code version 3.11  http://webserver2.tecgraf.puc-rio.br/im/<br>
CD, a 2D Graphics Library, current source code version 5.10  http://webserver2.tecgraf.puc-rio.br/cd/<br>

For simple GUI applications, You won't need IM, CD, just IUP; and from that directly (to mention for linking) only libs iup.so(iup.dll) and iupcontrols.so(iupcontrols.dll).
The dub.json file reflects this situation.

The dub.json file controls how/what to build, and there is a dub.json file provisionally named toberenameddub.json, witch reflects a setting using all IUP, IM and CD binding code and all binary libs on Linux. Adjust to Your needs by stripping from that:<br>
version IM includes the IM binding code, in case You are going to do more on images than just displaying<br>
version CD includes the CD binding code, in case You are going to do more on canvases than just ?<br>
version CD_NO_OLD_INTERFACE may be set additionally, to exclude from CD the old interface<br>

My reasoning for choosing IUP (first on the occasion of an app with heavy use of tables/matrixes for displaying data from database) was:
- My preference would have been a native D Language Cross Platform GUI with a stable/mature API (like e.g. DlangUI is growing to become one; but sadly I couldn't get StringGridWidget (spreadsheet or table like control) to work in editable mode; maybe I didn't try hard enough)
- Thus looking for solutions based on existing D-bindings, going through a couple of (seemingly) abandonned projects and for some unremindable reason skipping GtkD, I stumbled upon IUP and an 'old', 'small' binding at https://bitbucket.org/alphaglosined/libglosined/src/85ab6b2135879848e7efd5f1dfa732f2cfb753f8/iup/?at=default
This toolkit began to fascinate me due to it's design goals/'mission', a thorough documentation and mature/stable API and binaries and a very reactive, serious developping and supporting team.

The only worthily to mention disadvantage of any C language based binding is dealing with the C peculiarities and the D language garbage collection (GC) peculiarity.
You will have to keep in mind:
You'll be dealing with conversions to C's null-terminated strings a lot and watch out that those strings passed to IUP as function parameters, will be copied in IUP where necessary (remind the GC !!)
The function IupSetStrAttribute will definitely be Your friend: "IupSetStrAttribute .... The given string value will be duplicated internally."
The automatic/implicite conversion of D string literals to const(char)* including the \0 terminating byte is very helpfull, IupSetAttribute is sufficient for global const items then.
Carefully read the documentation section about IupSetAttribute (which is roughly the same as pointed to before).
Thoroughly test that You haven't overlooked obeying the IupSetStrAttribute-Or-Not-Rule, i.e. passed away local pointers or anything potentially collected by the GC, that is still in use by a C binary !!!
The binding requires callbacks in D to have nothrow attribute now: Since, the compiler will remind You, in case You used D functions that may throw, without a surrounding try..catch block.
A reasonable naming scheme for callback functions will let You retain overview in which dialog a function is responsible for what kind of slot; I use one that reads similar to an autogenerated Qt-slot function.
My D app is running now in developmentstatus:production/stable on Windows, having been developped almost completely on Linux with one neglectable portability issue.

Once, the IupSetStrAttribute-Or-Not-Rule became second nature to me, it was easy to work with IUP. The organization of IUP's documentation isn't intuitive for me, but complete and I can't come up with a better proposal and had to search a lot while learing IUP. Once, when the tutorial will be complete too, it will be even easyer to get into IUP.
Some examples are transformed to D code, look at dir examples/C and run e.g. ./list2.d

Have fun with IUP from D

