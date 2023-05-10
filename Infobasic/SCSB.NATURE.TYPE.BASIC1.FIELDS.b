* @ValidationCode : N/A
* @ValidationInfo : Timestamp : 19 Jan 2021 11:14:56
* @ValidationInfo : Encoding : Cp1252
* @ValidationInfo : User Name : N/A
* @ValidationInfo : Nb tests success : N/A
* @ValidationInfo : Nb tests failure : N/A
* @ValidationInfo : Rating : N/A
* @ValidationInfo : Coverage : N/A
* @ValidationInfo : Strict flag : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version : N/A
* @ValidationInfo : Copyright Temenos Headquarters SA 1993-2021. All rights reserved.

*-----------------------------------------------------------------------------
* <Rating>-7</Rating>
*-----------------------------------------------------------------------------
    
    SUBROUTINE SCSB.NATURE.TYPE.BASIC1.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author tcoleman@temenos.com
* @stereotype fields template
* @uses Table
* @public Table Creation
* @package infra.eb
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/10/07 - EN_10003543
*            New Template changes
*
* 14/11/07 - BG_100015736
*            Exclude routines that are not released
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_DataTypes
    
*** </region>
*-----------------------------------------------------------------------------
* Define Table id

    ID.F="ID"
    ID.N=10
    ID.T="A"
  
*-----------------------------------------------------------------------------

CALL Table.addFieldWithEbLookup("RATE.TYPE","RateType","")
CALL Table.addFieldDefinition("RATE.VALUE.PERIODIC",20,'A','')
CALL Field.setCheckFile('PERIODIC.INTEREST')
CALL Table.addFieldDefinition("RATE.VALUE.BASIC",20,'A','')
CALL Field.setCheckFile('BASIC.INTEREST')
CALL Table.addFieldDefinition("RATE.VALUE.FIXED",20,'A','')
CALL Table.addFieldWithEbLookup("ALLOW.BROKER.UPDATE","Options","")
CALL Table.addFieldWithEbLookup("ALLOW.FIDU.UPDATE","Options","")
CALL Table.addFieldDefinition("PRODUCTS.ALLOWED",20,'A','')
CALL Field.setCheckFile('AA.PRODUCT.CATALOG')
CALL Table.addFieldWithEbLookup("CURRENCY","SCSB.NATURE.TYPE","")



*-----------------------------------------------------------------------------
    CALL Table.setAuditPosition ;* Populate audit information
*-----------------------------------------------------------------------------
    RETURN
*-----------------------------------------------------------------------------
    END
