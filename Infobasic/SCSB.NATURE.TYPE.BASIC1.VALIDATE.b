SUBROUTINE SCSB.NATURE.TYPE.BASIC1.VALIDATE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT  I_F.SCSB.NATURE.TYPE.BASIC1
*	$INSERT  I_F.EB.ERROR
    
    
    GOSUB INIT
    GOSUB PROCESS
RETURN
    
INIT:
    Y.RATE.TYPE=R.NEW(SM.RATE.TYPE)
	Y.RATE.VALUE.PERIODIC=R.NEW(SM.RATE.VALUE.PERIODIC)
	Y.RATE.VALUE.BASIC=R.NEW(SM.RATE.VALUE.BASIC)
	Y.RATE.VALUE.FIXED=R.NEW(SM.RATE.VALUE.FIXED)
	    
     
    FN.SB = "F.SCSB.NATURE.TYPE.BASIC1"
    F.SB = ""
    CALL OPF(FN.SB,F.SB)
RETURN


PROCESS:
*------------------------------CHECK THAT ONLY ONE RATE VALUE FIELD HAS BEEN INPUT -------------------------------------------
Y.SB.REC = ""
Y.SB.ERR = ""
CALL F.READ(FN.SB,Y.RATE.TYPE,Y.SB.REC,F.SB,Y.SB.ERR)

RATEVALUECOUNT=0
IF Y.RATE.VALUE.FIXED NE "" THEN 
	RATEVALUECOUNT += 1
END 
IF Y.RATE.VALUE.PERIODIC NE "" THEN
	RATEVALUECOUNT += 1
END
IF Y.RATE.VALUE.BASIC NE "" THEN
	RATEVALUECOUNT += 1
END
IF RATEVALUECOUNT NE 1 THEN
	ETEXT ="EB-ONEINPUT"
	CALL STORE.END.ERROR()
END

*----------------------------CHECKING FOR INPUT VALID OR MORE THAN ONE INPUT ---------------------------------------------------

IF Y.RATE.TYPE EQ "Fixed" THEN
	IF Y.RATE.VALUE.FIXED NE "" THEN
	END
	ELSE IF Y.RATE.VALUE.PERIODIC NE "" OR Y.RATE.VALUE.BASIC NE "" THEN
	ETEXT="EB-INVALIDINPUT"
	CALL STORE.END.ERROR()
	END 
	
END

IF Y.RATE.TYPE EQ "Periodic" THEN
	IF Y.RATE.VALUE.PERIODIC NE "" THEN
	END
	ELSE IF Y.RATE.VALUE.FIXED NE "" OR Y.RATE.VALUE.BASIC NE "" THEN
	ETEXT="EB-INVALIDINPUT"
	CALL STORE.END.ERROR()
	END 
	
END

IF Y.RATE.TYPE EQ "Floating" THEN
	IF Y.RATE.VALUE.BASIC NE "" THEN
	END
	ELSE IF Y.RATE.VALUE.PERIODIC NE "" OR Y.RATE.VALUE.FIXED NE "" THEN
	ETEXT="EB-INVALIDINPUT"
	CALL STORE.END.ERROR()
	END 
	
END
    
RETURN
END
