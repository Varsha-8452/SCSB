# SCSB

Here I have uploaded some of my workshops that I have implemented for the problem statement

For Java:
write a validation routine in java by creating a version of the template SCSB.NATURE.TYPE,INPUT
if the RATE.TYPE is fixed he should only input to the field RATE.VALUE.FIXED if he inputs RATE.VALUE.PERIODIC and RATE.VALUE.BASIC u should throw error "invalid rate type"
if the  RATE.TYPE is Periodic he should only input to the field RATE.VALUE.PERIODIC if he inputs RATE.VALUE.FIXED and RATE.VALUE.BASIC u should throw error "invalid rate type"
if the  RATE.TYPE is basic he should only input to the field RATE.VALUE.BASIC if he inputs RATE.VALUE.FIXED and RATE.VALUE.PERIODIC u should throw error "invalid rate type"
and only one field should be input below three 
RATE.VALUE.PERIODIC,RATE.VALUE.FIXED,RATE.VALUE.BASIC if more then one is input u should throw error "Only one rate should be input"
All the logic should be done in a single routine or program, and Create EB.ERROR for messages so that we can change error messages whenever requried

For Infobasic:
Create the same template using TEMPLATE PROGRAMMING with the name SCSB.NATURE.TYPE.BASIC and write the validation routine in infobasic
