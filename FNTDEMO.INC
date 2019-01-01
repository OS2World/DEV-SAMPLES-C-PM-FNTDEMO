# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# <FntDemo.inc 

subroutine ChangeHANDLE_FontToPOINTSFACE_
    ( integer   : Handle                    # input   handle of CONTROL
    , string    : PointsDotFaceName         # input   e.g., "12.Helv"
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine ChangeHANDLE_FontToDefault
    ( integer   : Handle                    # input   handle of CONTROL
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

function   ErrMsgFromChangeHANDLEFont
    ( integer   : Errorlevel                # input   errorlevel 
    ) 
    returns string                          # output  error message
    library "FNTDEMO"                       #

subroutine MakeHANDLE_PP_COLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : PresParamConstant         # input   e.g., PP_BORDERCOLOR
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_ForeCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_BackCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   color, e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_HiliteForeCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_HiliteBackCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   color, e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_DisabledForeCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_DisabledBackCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   color, e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

subroutine MakeHANDLE_BorderCOLOR_
    ( integer   : Handle                    # input   handle of CONTROL
    , integer   : ColorNumber               # input   e.g., 1
    )                                       #
    library "FNTDEMO"                       # sets errorlevel

function   ErrMsgFromMakeHANDLECOLOR 
    ( integer   : Errorlevel                # input   errorlevel 
    ) 
    returns string                          # output  error message
    library "FNTDEMO"                       #


#                                                              FntDemo.inc> #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
