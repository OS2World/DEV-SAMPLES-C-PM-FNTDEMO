:userdoc.
:title.EASEL FntDemo
:author.Brian J. Buck
.* 
:body.
.*
:h1 id=us         .Usage Instructions  
:hp2.How to Use the Contents:ehp2.
.*
:p.:hp1.(The following instructions are taken from the OS/2 online
Command Reference.):ehp1.
.*
:p.When the Contents window first appears, some topics have a plus (+) sign
beside them. 
The plus sign indicates that additional topics are available. 
.*
:p.To expand the Contents if you are using a mouse, click on the plus sign.  If you are 
using the keyboard, use the Up or Down Arrow key to highlight the topic, and press the 
plus (+) key. For example, :hp2.Keyword Instructions:ehp2. has a plus 
sign beside it. To see the complete list of REXX keyword instructions, click on the plus sign or 
highlight that topic and press the plus (+) key. 
.*
:p.To view a topic, double-click on the topic (or press the Up or Down Arrow key to highlight 
the topic, and then press the Enter key). 
.*
:p.:hp2.How to Obtain Additional Information:ehp2.
.*
:p.After you select a topic, the information for that topic appears in a window.
You will notice that 
certain words in the text may be specially highlighted (The default color for this
special highlighting is green). These words are links to additional information.  
If you are using a mouse, 
double-click on the highlighted word.  If you are using a keyboard, press the Tab key to 
move to the highlighted word, and then press the Enter key.  Additional information will 
appear in a pop-up window. 
.*
:p.:hp2.How to Use Action Bar Choices:ehp2.
.*
:p.A number of choices are available for managing information presented in the REXX 
Quick Reference. If you want to see more information about these choices, click on 
the name of the choice (or press the Tab key to move to the choice and press Enter). 
.*
:dl tsize=8 break=all.
:dt.:link reftype=fn refid=fnbookmk.Bookmark:elink.
:dd.Allows you to set a placeholder so you can retrieve information of interest to you. 
(This choice is available from the :hp2.Services:ehp2. pull-down). 
:dt.:link reftype=fn refid=fnsearch.Search:elink. 
:dd.Allows you to find occurrences of a word or phrase in the current topic, selected 
topics, or all topics. (This choice is available from the :hp2.Services:ehp2. pull-down). 
:dt.:link reftype=fn refid=fnprint.Print:elink. 
:dd.Allows you to print one or more topics. (This choice is available from the :hp2.Services:ehp2. 
pull-down). 
:dt.:link reftype=fn refid=fncopy.Copy:elink. 
:dd.Allows you to copy a topic you are viewing to a file you can edit. (This choice is 
available from the :hp2.Services:ehp2. pull-down). 
:dt.:link reftype=fn refid=fnoption.Options:elink. 
:dd.Allows you to change the way your Contents is displayed. 
:edl. 
.*
.* Footnotes
.*
.*
.*
.*
:fn id=fnbookmk.BookMark 
.*
:p.When you place a bookmark on a topic, 
it is added to a list of bookmarks you 
have previously set.  You can view the 
list, and you can remove one or all 
bookmarks from the list.  If you have not 
set any bookmarks, the list is empty. 
.*
:p.To set a bookmark, do the following: 
.*
:ol.
:li.Select a topic from the Contents. 
:li.When that topic appears, choose the :hp2.Bookmark:ehp2. option from the
:hp2.Services:ehp2. pull-down. 
:li.If you want to change the name used for the bookmark, type the new name 
in the field. 
:li.Click on the :hp2.Place:ehp2. radio button (or press the Up or Down Arrow key to 
select it) 
:li.Click on :hp2.OK:ehp2. (or select it and press Enter). The bookmark is then added 
to the bookmark list. 
:eol.  
:efn.
.*
:fn id=fnsearch.Search 
.*
:p.You can specify a word or phrase to be searched.  You can also limit the search 
to a set of topics by first marking the topics on the Contents list. 
.*
:p.To search for a word or phrase in all topics, do the following: 
.*
:ol.
:li.Choose the :hp2.Search:ehp2. option from the :hp2.Services:ehp2. pull-down. 
:li.Type the word or words to be searched. 
:li.Click on :hp2.All sections:ehp2. (or press the Up or Down Arrow keys to select it) 
:li.Click on :hp2.Search:ehp2. (or select it and press Enter) to begin the search. 
:li.The list of topics where the word or phrase appears is displayed. If only one 
topic contains the word or phrase, a window containing that topic appears. 
:eol.
:efn.
.*
:fn id=fnprint.Print  
.*
:p.You can print one or more topics.  You can also print a set of topics by first marking 
the topics on the Contents list. 
.*
:p.To print the document Contents list, do the following: 
.*
:ol.
:li.Choose :hp2.Print:ehp2. from the :hp2.Services:ehp2. pull-down. 
:li.Click on :hp2.Contents:ehp2. (or press the Up or Down Arrow key to select it) 
:li.Click on :hp2.Print:ehp2. (or select it and press Enter). 
:li.The :hp2.Contents:ehp2. list is printed on your printer. 
:eol.
:efn.
.*
.*
.*
:fn id=fncopy.Copy   
.*
:p.You can copy a topic you are viewing into a temporary file named TEXT.TMP.  You can 
later edit that file by using the editor of your choice.
:p.To copy a topic, do the following: 
.*
:ol.
:li.Expand the Contents list and select a topic. 
:li.When the topic appears, choose :hp2.Copy to file:ehp2. from the :hp2.Services:ehp2. pull-down. 
:li.The system puts the text pertaining to that topic in the temporary TEXT.TMP file. 
:eol.
.*
"p.For information on one of the other choices in the :hp2.Services:ehp2. pull-down, highlight the 
choice and press the F1 key. 
:efn.
.*
.*
.*
:fn id=fnoption.Options
.*
:p.You can control the appearance of the Contents list. 
:p.To expand the Contents and show all levels for all topics, choose :hp2.Expand all:ehp2. from the 
:hp2.Options:ehp2. pull-down. You can also press the Ctrl and * keys together. 
.*
:p.For information on one of the other choices in the :hp2.Options:ehp2. pull-down, highlight the 
choice and press the F1 key. 
:efn.
.*
.*
.*
.*
:h1.About this package     
.*
:p.This package contains (among other things) the C code for a DLL
that enables the use of any font (including monospaced ones) in
EASEL listboxes.
.*
:p.I originally changed fonts only in listboxes, and to do so I
subclassed the dialog procedure, and changed the listbox style to
owner draw.  This works just fine, but adds the nuisance of having
to keep around instance data for each listbox while not being able to
use window words (in EASEL) to store it. 
.*
:p.With the advent of OS/2 1.2, I switched techniques for font
manipulation;  I employ the WinSetPresParam API, which does not
require me to store instance data on a per listbox basis.  Now I
can change fonts in any dialog control.  I can change colors, also,
although unless the user is given some options to change them this
is not really CUA.  
.*
:p.The original font changing program was based on the ideas found in a
program called LBFONT that was written by Easel Corp. and given away
at one of their EASEL training classes, and a different program called 
LBFONT that was found on BIX.  The program in this package bears no
real resemblance to either of those;  parts of the logic are based on ideas
in Charles Petzold's fontlist.exe program, and the IBM 1.2 PTI sample
program fonttest.exe.  This was all done pre-1.3, pre-ATM.  It *does* not
appear as though there is any way to specify an outline font for use with
WinSetPresParam.  I would appreciate hearing from anyone who finds a
way to do so.
.*
:p.This package is released into the public domain; use it any way you like.
I would appreciate hearing of any errors or omissions that you find.
.*
:p.Now, to satisfy the lawyers: no warranties, guarantees, etc. are implied,
no liability is assumed.  You break it and you own both halves.
Any opinions expressed herein are my own, not that of
my employer or any vendor.  
.*  
:dl tsize=20 compact break=none.
:dt.Brian Buck 
:dd.23SEP90
:dt.Internet
:dd.76666.60@Compuserve.COM
:dt.Compuserve 
:dd.76666,60
:dt.Phone
:dd.(708) 620-5000
:edl.
.*
:p.:hp2.Trademark Information.:ehp2.
:p.:hp5.EASEL:ehp5. is a trademark of Easel Corporation.
:p.:hp5.OS/2:ehp5. is a trademark of International Business Machines Corporation.
:p.:hp5.Presentation Manager:ehp5. is a trademark of International Business Machines Corporation.
:h1.What's in this package?
.*
:p.The following sections detail the contents of this package.
.*
:h2.Read&period.Me  
.*
:p.The :hp2.Read&period.Me:ehp2. file just tells you how to view this online
reference.
.*
:h2.FntDemo&period.IPF  
.*
:p.:hp2.FntDemo&period.IPF:ehp2. contains (in source form) the information 
you are viewing now.
:p.The Information Presentation Facility (IPF, also known as the Help
Manager) provides an undocumented but nonetheless :link reftype=fn refid=fnsuppor.supported:elink.
method for creating standalone online references like the one you are 
using now, or like the OS/2 Command Reference.  
:p.You can use the IPF compiler to create modular online documentation
for your library of reusable code.  
It is possible to view multiple .INF
files as a composite book -- just look at how the IBM OS/2 1.2 
PTI (Programming Tools and Information, aka toolkit) organizes the 
online programming reference.  
.*
:p.:hp2.How to compile:ehp2.
:p.To compile an IPF file into a standalone reference (an INF file),
you must have the PTI (1.2 toolkit) installed.  Use the following&colon.
.*
:xmp.
ipfc yourfile.ipf /inf /cou=001 /codepage=850 /l=enu
:exmp. 
.*
:p.When you include the :hp2./inf:ehp2. command line switch,
you generate an &period.INF file rather than the default &period.HLP file.
.*
:fn id=fnsuppor.
IBM Level 2 says that the method for creating standalone references
:hp2.will:ehp2. be documented in a future release, and :hp2.is:ehp2.
supported.
:efn.    
.*
:h2.FntDemo&period.INF
.*
The :hp2.FntDemo&period.INF:ehp2. file is the compiled form of the &period.IPF
file for the online reference.  
:p.:hp2.How to view:ehp2.
To view this (or any other &period.INF file) you can simply type&colon.
:xmp.
view fntdemo.inf
:exmp.
:p.from the command line of any OS/2 command session.  You must fully
qualify the name of the &period.INF file if it is not in your current
directory.  You can also install this in an OS/2 program group.
.*
:h2.FntDemo&period.C  
.*
:p.The :hp2.FntDemo&period.C:ehp2. file contains the source code for the
FntDemo&period.DLL dynalink library.  This library contains the 
subroutines&colon. 
:ul compact.
:li.ChangeHANDLE_FontToPOINTSFACE_
:li.ChangeHANDLE_FontToDefault
:li.MakeHANDLE_ForegroundCOLOR_
:li.MakeHANDLE_BackgroundCOLOR_
:li.MakeHANDLE_HiliteForegroundCOLOR_
:li.MakeHANDLE_HiliteBackgroundCOLOR_
:li.MakeHANDLE_DisabledForegroundCOLOR_
:li.MakeHANDLE_DisabledBackgroundCOLOR_
:li.MakeHANDLE_BorderCOLOR_
:li.ErrMsgFromChangeHANDLEFont
:li.ErrMsgFromMakeHANDLECOLOR
:eul.    
:p.Because these subroutines are intended for use in EASEL programs,
an EASEL style nomenclature is used rather than C style.  The idea is
that you would ideally want to be able to code&colon.
:xmp.
change LB_MyListbox font to 10 "System Monospaced"
:exmp.                    
:p.But since EASEL is not fully object-oriented, you can't define new
methods using the same syntax as the underlying language.
So instead you code&colon.
:xmp.  
string FONT_10_SYSTEM_MONOSPACED is "10.System Monospaced"
string Handle
&period.&period.&period.
copy handle of LB_MyListbox to Handle
call ChangeHANDLE_FontToPOINTSFACE_ ( Handle, FONT_10_SYSTEM_MONOSPACED )
if (errorlevel != 0) then
    # handle errors 
    send errorlevel " " 
        ErrMsgFromChangeHANDLEFont ( errorlevel ) 
        to errorlog
    end if
:exmp.                    

.*
:h2.FntDemo&period.INC
.*
:p.The :hp2.FntDemo&period.INC:ehp2. file is the EASEL include file that
contains the subroutine and function definitions for the following
routines&colon.
:ul compact.
:li.ChangeHANDLE_FontToPOINTSFACE_
:li.ChangeHANDLE_FontToDefault
:li.MakeHANDLE_ForegroundCOLOR_
:li.MakeHANDLE_BackgroundCOLOR_
:li.MakeHANDLE_HiliteForegroundCOLOR_
:li.MakeHANDLE_HiliteBackgroundCOLOR_
:li.MakeHANDLE_DisabledForegroundCOLOR_
:li.MakeHANDLE_DisabledBackgroundCOLOR_
:li.MakeHANDLE_BorderCOLOR_
:li.ErrMsgFromChangeHANDLEFont
:li.ErrMsgFromMakeHANDLECOLOR
:eul.    
.*
:h2.FntDemo&period.EAL
.*
:p.The :hp2.FntDemo&period.EAL:ehp2. file contains a trivial EASEL
program that simply demonstrates the use of the FntDemo subroutines.
.*
:h2.FntDemo&period.EBI
.*
:p.The :hp2.FntDemo&period.EBI:ehp2. file contains the compiled form
of the :hp2.FntDemo&period.EAL:ehp2. program.
.*
:h2.FntDemo&period.DEF
.*
:p.The :hp2.FntDemo&period.DEF:ehp2. file is the link definition file
for the :hp2.FntDemo&period.DLL:ehp2. dynalink library.
.*
:h2.FntDemo&period.DLL
.*
:p.The :hp2.FntDemo&period.DLL:ehp2. file contains the compiled and
linked Dynalink library required for EASEL programs to use the 
subroutines.  This file must be in a directory that is specified in
your LIBPATH in your CONFIG.SYS file.  Rather than dedicate one
directory to contain DLLs, I find it convenient to include a "&period."
as the first thing in my LIBPATH.  This means that the current directory
is searched first for DLLs.  A variation is to specify :hp2.&period.\DLL;:ehp2
which will search the \DLL directory of the current directory.  
For example&colon.
:xmp.
LIBPATH=&period.;&period.\DLL;C&colon.\OS2\DLL;E&colon.\EASEL-EE\DLL;&period.&period.&period.:hp1.etc&period.:ehp1.
:exmp.
.*
:h2.FntDemo&period.CMD
.*
:p.Why a &period.CMD file and not a make file?
Because the IBM C/2 Make and the Microsoft C Make are so different
that it is too confusing to provide only one, and too much work for me
to provide both.  A command file is not ambiguous.            
.*
.*
:h2.MakeINF&period.CMD
.*
:p.Compiles the :hp2.FntDemo&period.IPF:ehp2. file with the
IPF compiler.  It compiles it into the :hp2.FntDemo&period.INF:ehp2. file.
.*
:h1.OS/2 1.2 Fonts
:p.The following sections provide some information on the fonts that are
distributed with OS/2 1.2 and are by default installed.
:p.Sources of info are visual comparisons of info from&colon.
:sl compact.
:li.fontlist.exe (Petzold)
:li.fonttest.exe (IBM 1.2 PTI)
:li.system editor (1.2)
:esl.
:h2.VGA Fonts
:lines.
  Font Device Res = 96 x 96
  Cell &colon.= Average character width 
        x Max baseline extent  
:elines.
:cgraphic.
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄ¿ 
³                    ³Character³ Point³
³Face name           ³  Cell   ³ Size ³
ÃÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÅÍÍÍÍÍÍÍÍÍÅÍÍÍÍÍÍ´ 
³System Proportional ³  6 x 16 ³  10  ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄ´
³  System Monospaced ³  9 x 20 ³  12  ³
³  System Monospaced ³  8 x 16 ³  10  ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄ´
³            Courier ³  8 x 13 ³   8  ³
³            Courier ³  9 x 16 ³  10  ³
³            Courier ³ 12 x 20 ³  12  ³  
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄ´
³               Helv ³  5 x 13 ³   8  ³
³               Helv ³  6 x 16 ³  10  ³
³               Helv ³  7 x 20 ³  12  ³
³               Helv ³  8 x 24 ³  14  ³
³               Helv ³ 11 x 29 ³  18  ³
³               Helv ³ 14 x 37 ³  24  ³ 
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄ´
³            Tms Rmn ³  4 x 13 ³   8  ³
³            Tms Rmn ³  5 x 16 ³  10  ³
³            Tms Rmn ³  6 x 19 ³  12  ³
³            Tms Rmn ³  7 x 21 ³  14  ³
³            Tms Rmn ³ 10 x 27 ³  18  ³
³            Tms Rmn ³ 13 x 35 ³  24  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÙ 
:ecgraphic.                     
:h2.EGA Fonts
:lines.
  Font Device Res = 96 x 72
  Cell &colon.= Average character width 
        x Max baseline extent  
:elines.
:cgraphic.
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄ¿ 
³                    ³Character³
³Face name           ³  Cell   ³
ÃÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÅÍÍÍÍÍÍÍÍÍ´ 
³  System Monospaced ³  8 x 12 ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³            Courier ³  6 x 12 ³
³            Courier ³  7 x 15 ³
³            Courier ³  8 x 10 ³
³            Courier ³  8 x 18 ³
³            Courier ³  9 x 12 ³
³            Courier ³ 12 x 10 ³
³            Courier ³ 12 x 15 ³
³            Courier ³ 10 x 22 ³
³            Courier ³ 14 x 28 ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³               Helv ³  5 x 10 ³
³               Helv ³  6 x 12 ³
³               Helv ³  7 x 15 ³
³               Helv ³  8 x 18 ³
³               Helv ³ 10 x 22 ³
³               Helv ³ 14 x 28 ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³            Tms Rmn ³  4 x 10 ³
³            Tms Rmn ³  5 x 12 ³
³            Tms Rmn ³  6 x 15 ³
³            Tms Rmn ³  7 x 16 ³
³            Tms Rmn ³ 10 x 20 ³
³            Tms Rmn ³ 13 x 26 ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ 
:ecgraphic.                     
:h2.CGA Fonts
:lines.
  Font Device Res = 96 x 48
  Cell &colon.= Average character width 
        x Max baseline extent  
:elines.
:cgraphic.
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄ¿ 
³                    ³Character³
³Face name           ³  Cell   ³
ÃÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÅÍÍÍÍÍÍÍÍÍ´ 
³  System Monospaced ³  8 x  8 ³          
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³            Courier ³  8 x  7 ³          
³            Courier ³  9 x  8 ³          
³            Courier ³ 12 x 10 ³          
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³               Helv ³  5 x  6 ³          
³               Helv ³  6 x  8 ³          
³               Helv ³  7 x 10 ³          
³               Helv ³  8 x 12 ³          
³               Helv ³ 11 x 15 ³          
³               Helv ³ 14 x 19 ³          
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³            Tms Rmn ³  4 x  6 ³          
³            Tms Rmn ³  6 x  8 ³          
³            Tms Rmn ³  7 x 10 ³          
³            Tms Rmn ³  7 x 11 ³          
³            Tms Rmn ³ 10 x 14 ³          
³            Tms Rmn ³ 14 x 18 ³          
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ 
:ecgraphic.                     
:h2.8514 Fonts
  Font Device Res = 120 x 72
  Cell &colon.= Average character width 
        x Max baseline extent  
:elines.
:cgraphic.
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄ¿ 
³                    ³Character³
³Face name           ³  Cell   ³
ÃÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÅÍÍÍÍÍÍÍÍÍ´ 
³            Courier ³10 x 10  ³        
³            Courier ³12 x 12  ³        
³            Courier ³15 x 15  ³        
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³               Helv ³ 6 x 10  ³        
³               Helv ³ 7 x 12  ³        
³               Helv ³ 9 x 15  ³        
³               Helv ³10 x 18  ³        
³               Helv ³13 x 22  ³        
³               Helv ³18 x 28  ³        
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
³            Tms Rmn ³ 6 x 10  ³        
³            Tms Rmn ³ 7 x 12  ³        
³            Tms Rmn ³ 9 x 15  ³        
³            Tms Rmn ³10 x 16  ³        
³            Tms Rmn ³13 x 21  ³         
³            Tms Rmn ³17 x 27  ³        
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ 
:ecgraphic.                     
:h1.EASEL Subroutines, Functions 
.*
:p.The following sections describe the EASEL subroutines and functions
provided by the FntDemo package through the FntDemo.INC and FntDemo.DLL
files.
:p.The convention used for naming the subroutines corresponds as closely
as possible with the nomenclature used in the base EASEL language, and 
in the descriptions of EASEL syntax.  A subroutine or function name 
consists of several words.  Words that are descriptive of the function
appear with the first letter capitalized, and the rest in lower case.
Words that represent a parameter to be passed appear in all upper case,
and are suffixed with an underscore character.  For example, in the
subroutine name :hp2.ChangeHANDLE_FontToPOINTSFACE_:ehp2. the words that
describe the function are :hp2.Change, Font,:ehp2. and :hp2.To&period.:ehp2.
The words that represent the parameters to be passed are :hp2.HANDLE&us.:ehp2.
and :hp2.POINTSFACE_&period.:ehp2.    
:p.This naming convention seems to :hp1.mesh:ehp1. best with the native
EASEL language syntax.
.*
:h2.ChangeHANDLE_FontToPOINTSFACE_    
:p.Changes the font used in displaying a dialog control.  Any EASEL
control object can be specified.  
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromChangeHANDLEFont function.
:p.:xmp.
subroutine ChangeHANDLE_FontToPOINTSFACE_
    ( integer   : Handle                    # input   handle of CONTROL
    , string    : PointsDotFaceName         # input   e.g., "12.Helv"
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.ChangeHANDLE_FontToDefault
:p.Restores the dialog control's font to its original font.  
:p.:xmp.
subroutine ChangeHANDLE_FontToDefault
    ( integer   : Handle                    # input   handle of CONTROL
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_PP_COLOR_
:p.This is primarily an internal routine for use by the other EASEL
MakeHANDLE_<xxx>COLOR_ subroutines, but it can be called directly
using the PP_ defined constants from the 'C' header file PMWIN.H.
Only the PP_ constants for color changes should be used; no error
checking is performed on the passed PP_ constant.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_PP_COLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : PresParamConstant         # input   e.g., PP_BORDERCOLOR
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_ForegroundCOLOR_
:p.Changes the foreground color of the specified dialog control by
changing the value of its PP_FOREGROUNDCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_ForegroundCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_BackgroundCOLOR_
:p.Changes the background color of the specified dialog control by
changing the value of its PP_BACKGROUNDCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_BackgroundCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   color, e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_HiliteForegroundCOLOR_
:p.Changes the hilite foreground color of the specified dialog control by
changing the value of its PP_HILITEFOREGROUNDCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_HiliteForegroundCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_HiliteBackgroundCOLOR_
:p.Changes the hilite background color of the specified dialog control by
changing the value of its PP_HILITEBACKGROUNDCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_HiliteBackgroundCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   color, e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_DisabledForegroundCOLOR_
:p.Changes the disabled background color of the specified dialog control by
changing the value of its PP_DISABLEDBACKGROUNDCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_DisabledForegroundCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_DisabledBackgroundCOLOR_
:p.Changes the disabled background color of the specified dialog control by
changing the value of its PP_DISABLEDBACKGROUNDCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_DisabledBackgroundCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   color, e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.MakeHANDLE_BorderCOLOR_
:p.Changes the border color of the specified dialog control by
changing the value of its PP_BORDERCOLORINDEX presentation parameter.
:p.This subroutine sets the builtin EASEL errorlevel function to zero
for a successful change, and to a non-zero value for an unsuccessful
change.  The error message for an unsuccessful change can be retrieved
with the ErrMsgFromMakeHANDLECOLOR function.
:xmp.
subroutine MakeHANDLE_BorderCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel
:exmp.
:h2.ErrMsgFromChangeHANDLEFont
:p.
:p.Returns an error message associated with the given errorlevel number
passed from EASEL.  It is assumed that&colon.                            
:ol compact.                                                       
:li.the errorlevel represents an errorlevel due to the
ChangeHANDLE_FontToPOINTSFACE_  call.                      
:li.no other PM Winxxx errors have occurred between the
ChangeHANDLE_FontToPOINTSFACE_  call and this call.        
:eol.
:xmp.
function   ErrMsgFromChangeHANDLEFont
    ( integer   : Errorlevel                # input   errorlevel 
    ) 
    returns string                          # output  error message
    library "FNTDEMO"                       #
:exmp.
:h2.ErrMsgFromMakeHANDLECOLOR
:p.Returns an error message associated with the given errorlevel number
passed from EASEL.  It is assumed that&colon.                            
:ol compact.                                                       
:li.the errorlevel represents an errorlevel due to one of the
MakeHANDLE_<xxx>COLOR_ calls.
:li.no other PM Winxxx errors have occurred between the
MakeHANDLE_<xxx>COLOR_  call and this call.        
:eol.
:xmp.
function   ErrMsgFromMakeHANDLEColor 
    ( integer   : Errorlevel                # input   errorlevel 
    ) 
    returns string                          # output  error message
    library "FNTDEMO"                       #
:exmp.
:euserdoc.
