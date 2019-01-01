/*\ FntDemo.C
|*|         
|*| See the Read.Me file for details.
\*/         

#define INCL_WINERRORS
#define INCL_WINSYS
#define INCL_WINWINDOWMGR
#define INCL_WINLISTBOXES
#define INCL_GPILCIDS  
#define INCL_GPICONTROL
#define INCL_GPIPRIMITIVES
#define INCL_DEV  
#include <os2.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>   
#include <limits.h>   
#include "esllib.h"
#define NR_ENTRIES(a) (sizeof(a)/sizeof(a[0]))
#define ERRMSG1FROMERRI(erri) (PSZ)((*erri).offaoffszMsg + (PSZ)erri)
    /*\                                                         
    |*| erri is PERRINFO obtained from WinGetErrorInfo ( hab ) ;
    \*/                                                         

/*\                                                         
|*| Miscellaneous Named Constants
\*/                                                         
#define LISTBOX_CLASSNAME  "#7"
#define CLASSNAMEMAXLTH    256
#define POINTFACE_MAXCHARS 255
#define CLASSNAME_MAXCHARS 255     

/*\
|*| Return codes for ChangeHANDLE_FontToPOINTS_FACE_  (CHFTPF)
\*/
#define CHFTPF_OK               0
#define CHFTPF_NOSIZE           1
#define CHFTPF_NOTNUMSIZE       2
#define CHFTPF_NOTVALIDSIZE     3
#define CHFTPF_NOFACE           4
#define CHFTPF_NOFACEMATCH      5     
#define CHFTPF_NOPOINTSIZEMATCH 6    
#define CHFTPF_PRESPARAMSETERR  7  
#define CHFTPF_NOSTGAVAIL       8  
PSZ     CHFTPFErrorMessage [] =
    { "OK"
    , "No font size was specified."
    , "Font size is not numeric."
    , "Font size is not valid."
    , "No font face name was specified."
    , "No fonts are available for this face."
    , "Font is not available in requested size."
    , "supplied by WinGetErrorInfo"
    , "No storage available for font metrics."
    } ;                                               

/*\
|*| Return codes for MakeHANDLE_COLOR   (MHC)
\*/
#define MHC_OK               0
#define MHC_NOTVALIDCOLOR    1
#define MHC_PRESPARAMSETERR  2
PSZ     MHCErrorMessage [] =
    { "OK"
    , "Not a valid EASEL color number."
    , "supplied by WinGetErrorInfo"
    } ;                        

HAB habError = NULL ;         /*  Saved hab for error message processing */
 
int_acrtused = 1 ;            /*  std for C DLL                          */

/*\
|*| Function Headers
\*/
LONG ParseFontSpec
    ( PSZ      pszFont        /*  Font in format pp.FFFF                 */
    , PSZ      pszPointFace   /*  Standardized version of pszFont        */
    , PSZ      pszFaceName    /*  Face name from pszFont                 */
    , PSHORT   sPoints        /*  Point size from pszFont in decipoints  */
    ) ;                       

UCHAR * StrSpace 
    ( UCHAR * pszSource
    , USHORT  NrCopiesPadChar
    , UCHAR * pPadChar  
    , UCHAR * pszTarget 
    ) ;     

LONG APIENTRY MakeHANDLE_PP_COLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    , LONG *  lpp             /*  presentation param for color index     */
    ) ;                        
 
/*\=========================================================================
|*|                                                                         
|*| ChangeHANDLE_FontToDefault
|*|                                                                         
|*| Removes the PP_FONTNAMESIZE presentation parameter from the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY ChangeHANDLE_FontToDefault
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    )                         /*      pp.FFFF  pp=points FFFF=Face name  */
    {  
    LONG        rc = 0;   
    PERRINFO    erri ;
    HAB         hab ;    
    HPS         hps ;    
    FONTMETRICS Metrics ;
    UCHAR       szClassName [ CLASSNAMEMAXLTH ] ;
    SHORT       sClassNameLth ;
    SHORT       sClassNameBufLth = NR_ENTRIES( szClassName ) ; 

    /*\
    |*| Remove the presentation parameter for the font from the control.
    \*/    
    WinRemovePresParam ( (HWND) *phwndControl, PP_FONTNAMESIZE ) ; 
                                     
    /*\
    |*| If the control is a listbox, send an LM_SETITEMHEIGHT to it.
    \*/    
    sClassNameLth = WinQueryClassName 
        ( (HWND) *phwndControl
        , sClassNameBufLth
        , szClassName
        ) ;     

    if  ( !strcmp ( LISTBOX_CLASSNAME, szClassName ) ) /* if a listbox     */
        {
        hps = WinGetPS ( (HWND) *phwndControl ) ;  /* Cached micro ps      */
        GpiQueryFontMetrics ( hps, (LONG)sizeof(FONTMETRICS), &Metrics ) ;
        WinReleasePS ( hps ) ;  
        WinSendMsg                        /* tell listbox how to draw font */
            ( (HWND) *phwndControl  
            , LM_SETITEMHEIGHT 
            , (MPARAM) Metrics.lMaxBaselineExt
            , NULL 
            ) ;   
       }
    return 0L ;
    }                                               

/*\=========================================================================
|*|                                                                         
|*| ChangeHANDLE_FontToPOINTSFACE_                                        
|*|                                                                         
|*|_________________________________________________________________________
\*/
LONG APIENTRY ChangeHANDLE_FontToPOINTSFACE_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , PHSTRING phsFont        /*  name of font face desired              */
    )                         /*      pp.FFFF  pp=points FFFF=Face name  */
    {  
    PSZ         pszFont ; 
    PSZ         pszErrMsg ;
    UCHAR       szPointFace [ POINTFACE_MAXCHARS + 1 ] ;
    UCHAR       szFaceName  [ POINTFACE_MAXCHARS + 1 ] ;
    SHORT       sPoints ;  
    LONG        lFontLength ;  
    LONG        rc = 0;   
    HPS         hps ;    
    HDC         hdc ;    
    FONTMETRICS Metrics ;
    FONTMETRICS *pfmMetrics ;
    LONG        lReqFonts ;
    LONG        lAvailFonts ;
    UCHAR       szClassName [ CLASSNAME_MAXCHARS + 1 ] ;
    SHORT       sClassNameLth ;
    SHORT       sClassNameBufLth = NR_ENTRIES(szClassName) ;
    LONG  alDevCapsFontRes [ 2 ] ;           

    /*\
    |*| Initialize habError for error processing.  
    |*|     (see ErrMsgFromChangeHANDLEFont() ).   
    \*/
    habError = WinQueryAnchorBlock ( (HWND) *phwndControl ) ;    

    /*\
    |*| First, get the name of the requested font.
    \*/
    pszFont = EslQueryStringAddr ( *phsFont ) ;         

    /*\
    |*| Next, parse the font specification into its component face name
    |*|     (szFaceName) and point size (sPoints).  Also create a 
    |*|     standardized form of the specification (szPointFace).
    \*/
    if  ( rc = ParseFontSpec ( pszFont, szPointFace, szFaceName, &sPoints ) ) 
        /*\
        |*| A non-zero return code indicates an invalid font specification.
        |*| Return to the caller.
        \*/
        return rc ;     

    /*\ 
    |*| assert: Face name is a valid non-null string.
    |*| Validate szFaceName as an available one.
    |*| Find out how many fonts there are with this face name.
    \*/            
    hps = WinGetPS ( HWND_DESKTOP ) ; /* Cached micro ps for display       */
    lReqFonts = 0 ;                /* 0 says return how many fonts match.  */
    lAvailFonts = GpiQueryFonts 
        ( hps                      
        , QF_PUBLIC | QF_PRIVATE   /* check both                           */
        , szFaceName               /* facename from font request           */
        , &lReqFonts               /* 0 input means return nr that exist   */
        , (LONG) (NULL)            
        , (PFONTMETRICS) NULL      /* where fontmetrics info is returned   */
        ) ;
    if ( GPI_ALTERROR == lAvailFonts || 0L == lAvailFonts )
        return CHFTPF_NOFACEMATCH ; /* no match on face name               */

    /*\ 
    |*| Allocate storage for and retrieve FONTMETRICS info on all fonts with
    |*|     the specified face name.
    \*/
    pfmMetrics = malloc /* use DosAllocSeg if you want ... */
        ( (UINT) ( lAvailFonts * sizeof(FONTMETRICS) )
        ) ;   
    if (pfmMetrics == NULL) 
        {
        free ( pfmMetrics ) ;      /* free storage for array of FONTMETRICS*/
        return CHFTPF_NOSTGAVAIL ; /* no match on face name                */
        }                     

    lReqFonts = GpiQueryFonts      /* Get fontmetrics for all of this face */
        ( hps
        , QF_PUBLIC | QF_PRIVATE
        , szFaceName
        , &lAvailFonts             /* ask for as many as it said there are */
        , (LONG) sizeof (FONTMETRICS)
        , pfmMetrics               /* returned info in allocated area      */
        )  ;                 

    /*\
    |*| Query the device's font resolution;  these X and Y values will
    |*| be used to select matching fonts.
    \*/                
    hdc = GpiQueryDevice ( hps ) ; 
    DevQueryCaps ( hdc, CAPS_HORIZONTAL_FONT_RES, 2L, alDevCapsFontRes ) ;
    WinReleasePS ( hps ) ;            

    /*\
    |*| Inspect array of available font sizes for the requested face.
    |*| Validate that the requested point size is available.
    \*/                
    for ( 
        ; lAvailFonts 
        ; pfmMetrics++ , --lAvailFonts 
        ) 
        if  (  pfmMetrics[0].sNominalPointSize == sPoints 
            && pfmMetrics[0].sXDeviceRes == (SHORT) alDevCapsFontRes[0] 
            && pfmMetrics[0].sYDeviceRes == (SHORT) alDevCapsFontRes[1]
            ) 
            break ;   

    if ( !lAvailFonts )            /* no match found on point size         */
        {
        free ( pfmMetrics ) ;      /* free storage for array of FONTMETRICS*/
        return CHFTPF_NOPOINTSIZEMATCH ;
        }                

    Metrics = *pfmMetrics ;        /* save FONTMETRICS for matched font.   */
    free ( pfmMetrics ) ;          /* free storage for array of FONTMETRICS*/

    /*\
    |*| Change the presentation parameters for the control to use the
    |*|     validated font.
    \*/ 
    sClassNameLth = WinQueryClassName 
        ( (HWND) *phwndControl
        , sClassNameBufLth
        , szClassName
        ) ;                  

    if  ( !strcmp ( LISTBOX_CLASSNAME, szClassName ) ) /* if a listbox     */
        {
        /*\
        |*| This appears to be necessary to get the proper behaviour from
        |*| the listbox and its vertical scrollbar.  There is an APAR open
        |*| on this;  search on PP_FONTNAMESIZE.  You have to change the
        |*| size twice; the first ever change does NOT result in a proper
        |*| redraw.
        \*/
        ChangeHANDLE_FontToDefault ( phwndControl ) ; 
        }           

    lFontLength = strlen ( szPointFace ) + 1;       
    if  (!WinSetPresParam
        ( (HWND) *phwndControl                                       
        , PP_FONTNAMESIZE                                          
        , lFontLength 
        , (PVOID) szPointFace
        ) )
        return CHFTPF_PRESPARAMSETERR ;   

    if  ( !strcmp ( LISTBOX_CLASSNAME, szClassName ) ) /* if a listbox     */
        {
        WinSendMsg                        /* tell listbox size of new font */
            ( (HWND) *phwndControl  
            , LM_SETITEMHEIGHT 
            , (MPARAM) Metrics.lMaxBaselineExt
            , NULL 
            ) ;  
        }
    return CHFTPF_OK ;
    }                                                

/*\=========================================================================
|*|                                                                         
|*| ErrMsgFromChangeHANDLEFont
|*|                                                                         
|*| Return an error message associated with the given errorlevel number
|*| passed from EASEL.  It is assumed that:
|*|                                                                         
|*|     (1) the errorlevel represents an errorlevel due to the              
|*|         ChangeHANDLE_FontToPOINTSFACE_  call.                           
|*|     (2) no other PM Winxxx errors have occurred between the             
|*|         ChangeHANDLE_FontToPOINTSFACE_  call and this call.             
|*|                                                                         
|*|_________________________________________________________________________
\*/
HSTRING APIENTRY ErrMsgFromChangeHANDLEFont
    ( LONG     errorlevel /*  errorlevel from EASEL                      */
    )                         
    {  
    HSTRING hsErrMsg ;    /*  EASEL string handle                        */
    PSZ     pszErrMsg ;   /*  pointer to error message for errorlevel    */
    PERRINFO erri ;       /*  WinGetErrorInfo()'s returned structure     */ 

    if  ( errorlevel == CHFTPF_PRESPARAMSETERR )
        /*\
        |*| If errorlevel indicates last error was due to an error in the
        |*|     WinSetPresParams() API call, then return the text from the
        |*|     WinGetErrorInfo() API.
        \*/
        {
        erri = WinGetErrorInfo ( habError ) ; 
        pszErrMsg = ERRMSG1FROMERRI(erri) ; 
        hsErrMsg = EslCreateString ( strlen ( pszErrMsg ), pszErrMsg ) ;
        WinFreeErrorInfo ( erri ) ; 
        } 
    else if  ( errorlevel >= 0 && errorlevel < NR_ENTRIES(CHFTPFErrorMessage) )
        /*\
        |*| Else if valid subscript, pull errmsg from array of messages.
        \*/
        hsErrMsg = EslCreateString 
            ( strlen ( CHFTPFErrorMessage [errorlevel] )
            , CHFTPFErrorMessage [errorlevel]
            ) ;
    else
        /*\
        |*| Else substitute dummy error message.
        \*/
        hsErrMsg = EslCreateString 
            ( sizeof("*Bad errorlevel*") - 1
            , "*Bad errorlevel*"
            ) ;
    return hsErrMsg ;
    }              

/*\=========================================================================
|*|                                                                         
|*| ErrMsgFromMakeHANDLECOLOR
|*|                                                                         
|*| Return an error message associated with the given errorlevel number
|*| passed from EASEL.  It is assumed that:
|*|                                                                         
|*|     (1) the errorlevel represents an errorlevel due to one of the       
|*|         MakeHANDLE<xxx>COLOR_ calls.
|*|     (2) no other PM Winxxx errors have occurred between the             
|*|         MakeHANDLE<xxx>COLOR_  call and this call.             
|*|                                                                         
|*|_________________________________________________________________________
\*/
HSTRING APIENTRY ErrMsgFromMakeHANDLECOLOR
    ( LONG     errorlevel /*  errorlevel from EASEL                      */
    )                         
    {  
    HSTRING hsErrMsg ;    /*  EASEL string handle                        */
    PSZ     pszErrMsg ;   /*  pointer to error message for errorlevel    */
    PERRINFO erri ;       /*  WinGetErrorInfo()'s returned structure     */ 

    if  ( errorlevel == MHC_PRESPARAMSETERR )
        /*\
        |*| If errorlevel indicates last error was due to an error in the
        |*|     WinSetPresParams() API call, then return the text from the
        |*|     WinGetErrorInfo() API.
        \*/
        {
        erri = WinGetErrorInfo ( habError ) ; 
        pszErrMsg = ERRMSG1FROMERRI(erri) ; 
        hsErrMsg = EslCreateString ( strlen ( pszErrMsg ), pszErrMsg ) ;
        WinFreeErrorInfo ( erri ) ; 
        } 
    else if  ( errorlevel >= 0 && errorlevel < NR_ENTRIES(MHCErrorMessage) )
        /*\
        |*| Else if valid subscript, pull errmsg from array of messages.
        \*/
        hsErrMsg = EslCreateString 
            ( strlen ( MHCErrorMessage [errorlevel] )
            , MHCErrorMessage [errorlevel]
            ) ;
    else
        /*\
        |*| Else substitute dummy error message.
        \*/
        hsErrMsg = EslCreateString 
            ( sizeof("*Bad errorlevel*") - 1
            , "*Bad errorlevel*"
            ) ;
    return hsErrMsg ;
    }       

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_ForeCOLOR_
|*|                                                                         
|*| Changes the PP_FOREGROUNDCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_ForeCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )                         
    {  
    LONG lpp = PP_FOREGROUNDCOLORINDEX ; 

    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp
        ) ;
    }                            

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_BackCOLOR_
|*|                                                                         
|*| Changes the PP_BACKGROUNDCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_BackCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )                         
    {  
    LONG lpp = PP_BACKGROUNDCOLORINDEX ;

    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp
        ) ;
    }      

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_HiliteForeCOLOR_
|*|                                                                         
|*| Changes the PP_HILITEFOREGROUNDCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_HiliteForeCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )                         
    {  
    LONG lpp = PP_HILITEFOREGROUNDCOLORINDEX ;  

    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp
        ) ;
    }                                                           

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_HiliteBackCOLOR_
|*|                                                                         
|*| Changes the PP_HILITEBACKGROUNDCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_HiliteBackCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )                         
    {  
    LONG lpp = PP_HILITEBACKGROUNDCOLORINDEX ; 

    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp
        ) ;
    }                                          

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_DisabledForeCOLOR_
|*|                                                                         
|*| Changes the PP_DISABLEDFOREGROUNDCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_DisabledForeCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )                         
    {  
    LONG lpp = PP_DISABLEDFOREGROUNDCOLORINDEX ;   
      
    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp 
        ) ;
    }                                              

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_DisabledBackCOLOR_
|*|                                                                         
|*| Changes the PP_DISABLEDBACKGROUNDCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_DisabledBackCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )  
    {  
    LONG lpp = PP_DISABLEDBACKGROUNDCOLORINDEX ;       
  
    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp 
        ) ;
    }                                               

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_BorderCOLOR_
|*|                                                                         
|*| Changes the PP_BORDERCOLORINDEX presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_BorderCOLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    )                         
    {  
    LONG lpp = PP_BORDERCOLORINDEX ;     
    
    return MakeHANDLE_PP_COLOR_ 
        ( phwndControl
        , plColorIndex
        , &lpp
        ) ;
    }                                    

/*\=========================================================================
|*|                                                                         
|*| MakeHANDLE_PP_COLOR_
|*|                                                                         
|*| Changes the specified presentation parameter 
|*| of the control.    
|*|_________________________________________________________________________
\*/
LONG APIENTRY MakeHANDLE_PP_COLOR_
    ( LONG *  phwndControl    /*  handle of Easel dialog control         */
    , LONG *  plColorIndex    /*  desired color index                    */
    , LONG *  lpp             /*  presentation param for color index     */
    )                         
    {  
    LONG lGpiColorIndex ;    
       
    /*\
    |*| Check that LONG's value will fit in an int before the cast
    \*/
    if ( *plColorIndex > INT_MAX )
        return MHC_NOTVALIDCOLOR ;
    if ( *plColorIndex < INT_MIN )
        return MHC_NOTVALIDCOLOR ;   

    switch ( (int) *plColorIndex )
        {
        case  1: lGpiColorIndex = CLR_RED        ; break ;
        case  2: lGpiColorIndex = CLR_GREEN      ; break ;
        case  3: lGpiColorIndex = CLR_YELLOW     ; break ;
        case  4: lGpiColorIndex = CLR_BLUE       ; break ;
        case  5: lGpiColorIndex = CLR_PINK       ; break ;
        case  6: lGpiColorIndex = CLR_CYAN       ; break ;
        case  7: lGpiColorIndex = CLR_WHITE      ; break ;
        case  8: lGpiColorIndex = CLR_BLACK      ; break ;
        case 18: lGpiColorIndex = CLR_DARKGRAY   ; break ;
        case 19: lGpiColorIndex = CLR_DARKBLUE   ; break ;
        case 20: lGpiColorIndex = CLR_DARKRED    ; break ;
        case 21: lGpiColorIndex = CLR_DARKPINK   ; break ;
        case 22: lGpiColorIndex = CLR_DARKGREEN  ; break ;
        case 23: lGpiColorIndex = CLR_DARKCYAN   ; break ;
        case 24: lGpiColorIndex = CLR_BROWN      ; break ;
        case 25: lGpiColorIndex = CLR_PALEGRAY   ; break ;
        case 26: lGpiColorIndex = CLR_BACKGROUND ; break ;
        case 27: lGpiColorIndex = CLR_DEFAULT    ; break ;
        default:  return MHC_NOTVALIDCOLOR ;
        }  

    if  (!WinSetPresParam
        ( (HWND) *phwndControl                                       
        , *lpp
        , (LONG) sizeof(LONG)
        , &lGpiColorIndex
        ) )
        return MHC_PRESPARAMSETERR ;   

    return 0L ;
    }                                        

/*\=========================================================================
|*|                                                                         
|*| ParseFontSpec
|*|                                                                         
|*| ParseFontSpec breaks a font specification into its component parts.     
|*| Format is pp.FFFF, where pp is size in points, FFFF is the face name.   
|*|_________________________________________________________________________
\*/
LONG ParseFontSpec
    ( PSZ      pszFont      /* in   Font in format pp.FFFF                 */
    , PSZ      pszPointFace /* out  Standardized version of pszFont        */
    , PSZ      pszFaceName  /* out  Face name from pszFont                 */
    , PSHORT   psPoints     /* out  Point size from pszFont in decipoints  */
    )                         
    {  
    PSZ      ipsz ;         /*  work pointer for pszFont                   */
    PSZ      ipsz2 ;        /*  work pointer for pszFont                   */ 

    /*\
    |*| Split out the requested font size (in points) and the face name.
    |*| Format is pp.ffff where pp is size in points, ffff is the face name.
    \*/
    for ( ipsz = pszFont ; *ipsz && *ipsz != '.' ; ipsz++ ) ; 

    /*\
    |*| If no period found, then
    |*|     invalid font specification - no size specified. (no period)
    |*|     return an errorlevel code.
    \*/     
    if  ( !*ipsz )
        return CHFTPF_NOSIZE ;          

    /*\
    |*| *ipsz == '.'; a period was found.
    |*| Validate the specified point size as numeric, and greater than zero.
    |*| Allow leading, trailing, and embedded blanks.  Convert it to binary.
    \*/ 
    for ( ipsz2 = pszFont, *psPoints = 0
        ; ipsz2 != ipsz 
        ; ipsz2++ 
        ) 
        {
        if  ( *ipsz2 == ' ' )
            continue ;
        else if  ( isdigit ( *ipsz2 ) ) 
            {
            *psPoints = ( *ipsz2 - '0' ) + *psPoints * 10 ; 
            *(pszPointFace++) = *ipsz2 ;
            }
        else 
            return CHFTPF_NOTNUMSIZE ;
        }               

    if  ( !*psPoints )
        return CHFTPF_NOTVALIDSIZE ;  

    /*\
    |*| Scale up the points value to units called decipoints.
    |*| This is the unit (1/720 inch = 1/10 point) used in the 
    |*|     FONTMETRICS structure.
    \*/       
    *psPoints *= 10 ;  

    /*\
    |*| assert: Point size is numeric, greater than zero.
    |*| Strip leading and trailing blanks in the face name, and   
    |*|     transform each run of multiple embedded blanks into a single blank.
    |*| Copy this standardized face name into szFaceName.
    |*| Append a period and the face name to the point size in iszPointFace.
    \*/ 
    *pszPointFace++ = '.' ;
    strcpy ( pszPointFace, StrSpace ( ++ipsz, 1, " ", pszFaceName ) ) ;
 
    /*\
    |*| return 0 as the return code unless the face name is the null
    |*|     string, in which case set an error code.
    \*/       
    return ( *pszFaceName ) ? 0L : CHFTPF_NOFACE ;
    }                                                          

/*\===========================================================================
|*|
|*| StrSpace
|*|
|*| StrSpace removes all leading and trailing blanks, then replaces every
|*| run of one or more consecutive blanks by NrCopiesPadChar copies of the
|*| pad character in *pPadChar.  The result is placed in pszTarget.  The
|*| original pszSource is not changed.  The value in pszTarget is returned.
|*|
|*| This function is modeled on REXX's SPACE builtin function.
|*|
|*| In general, pszSource and pszTarget may NOT overlap;  however, when
|*| the NrCopiesPadChar is 1 and pszSource = pszTarget, this function
|*| is guaranteed to work properly.
|*|
|*| This function is reentrant, and does not rely upon the C compiler's
|*| string handling functions.
|*|
|*|                                                         Brian Buck 28NOV89
|*|___________________________________________________________________________
\*/
UCHAR * StrSpace 
    ( UCHAR * pszSource
    , USHORT  NrCopiesPadChar
    , UCHAR * pPadChar  
    , UCHAR * pszTarget 
    )
    { 
    PSZ ipszS = pszSource ; 
    PSZ ipsz2 ;
    PSZ ipszT = pszTarget ;
    LONG InBlankRun ;
    USHORT  i ;         

    /*\
    |*| First, strip (run through) leading blanks in the Source string.
    \*/ 
    for ( ipsz2 = ipszS ; *ipsz2 && *ipszS == ' ' ; ipsz2++ ) ;   

    /*\ 
    |*| The next loop copies Source chars to the Target string one by one.
    |*| When we encounter a run of blank characters, we defer copying 
    |*|     until we find a subsequent non-blank character, at which point
    |*|     we copy NrCopiesPadChar of *pPadChar into the Target string.
    |*| 
    |*| ipsz2 runs through the Source string to its end.
    |*| InBlankRun is TRUE when we are pointing anywhere into a run 
    |*|     of consecutive blanks, esle it is FALSE.
    \*/ 
    for ( InBlankRun = FALSE ; *ipsz2 ; ipsz2++ ) 
        {   
        if  ( *ipsz2 == ' ' )  
            InBlankRun = TRUE ;
        else 
            {
            if  ( InBlankRun ) 
                {
                int i ;
                InBlankRun = FALSE ; 
                for ( i = NrCopiesPadChar ; i ; --i )
                    *ipszT++ = *pPadChar ;
                }
            *ipszT++ = *ipsz2 ;
            }
        }          

    /*\ 
    |*| Terminate the Target string with a zero delimiter.
    \*/ 
    *ipszT = '\0' ;  

    /*\ 
    |*| The function return value is the address of the Target string.
    \*/ 
    return pszTarget ;
    }
