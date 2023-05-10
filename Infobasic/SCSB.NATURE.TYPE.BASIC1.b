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
* <Rating>-13</Rating>
*-----------------------------------------------------------------------------
    
    SUBROUTINE SCSB.NATURE.TYPE.BASIC1
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author youremail@temenos.com
* @stereotype Application
* @package TODO define the product group and product, e.g. infra.eb
* </doc>
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 19/10/07 - EN_10003543
*            New Template changes
*
* 18/12/14 - Task: 1202706 / Defect: 1177337
*            Subroutine name modified to avoid compilation failure
*
* ----------------------------------------------------------------------------
* <region name= Inserts>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_Table
* </region>
*-----------------------------------------------------------------------------
    Table.name = 'SCSB.NATURE.TYPE.BASIC1'        ;* Full application name including product prefix
    Table.title = 'SCSB.NATURE.TYPE.BASIC1'       ;* Screen title
    Table.stereotype = 'H'    ;* H, U, L, W or T
    Table.product = 'EB'      ;* Must be on EB.PRODUCT
    Table.subProduct = ''     ;* Must be on EB.SUB.PRODUCT
    Table.classification = 'CUS'        ;* As per FILE.CONTROL
    Table.systemClearFile = 'Y'         ;* As per FILE.CONTROL
    Table.relatedFiles = ''   ;* As per FILE.CONTROL
    Table.isPostClosingFile = ''        ;* As per FILE.CONTROL
    Table.equatePrefix = 'SM'        ;* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    Table.idPrefix = ''       ;* Used by EB.FORMAT.ID if set
    Table.blockedFunctions = ''         ;* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

    RETURN
END
