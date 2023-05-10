package temp;
import com.temenos.t24.api.complex.eb.templatehook.TransactionContext;
import com.temenos.t24.api.hook.system.RecordLifecycle;
import com.temenos.t24.api.records.eberror.EbErrorRecord;
import com.temenos.t24.api.records.ebscsbnaturetype.EbScsbNatureTypeRecord;
import com.temenos.api.TField;
import com.temenos.api.TStructure;
import com.temenos.api.TValidationResponse;
import com.temenos.t24.api.system.*;

/**
 * TODO: Document me!
 *
 * @author varshar
 *
 */
public class ValidateTemp extends RecordLifecycle {
    @Override
    public TValidationResponse validateRecord(String application, String currentRecordId, TStructure currentRecord,
            TStructure unauthorisedRecord, TStructure liveRecord, TransactionContext transactionContext) {
        
        EbScsbNatureTypeRecord obj = new EbScsbNatureTypeRecord(currentRecord);
        
        DataAccess da = new DataAccess(this);
        EbErrorRecord ebd = new EbErrorRecord(da.getRecord("EB.ERROR", "EB-SCSB.ERROR.MSG"));
        
        
        TField rateType = obj.getRateType();
        TField rateValueFixed = obj.getRateValueFixed();
        TField rateValuePeriodic = obj.getRateValuePeriodic();
        TField rateValueBasic = obj.getRateValueBasic();

        // Check that only one rate value field has been input
        int rateValueCount = 0;
        if (!rateValueFixed.getValue().isEmpty()) rateValueCount++;
        if (!rateValuePeriodic.getValue().isEmpty()) rateValueCount++;
        if (!rateValueBasic.getValue().isEmpty()) rateValueCount++;
        if (rateValueCount != 1) {
            rateType.setError(ebd.getErrorMsg(0).toString());
        }

        // Validate based on rate type
        if (rateType.getValue().equalsIgnoreCase("fixed")) {
            if (!rateValueFixed.getValue().isEmpty()) {
                // Input is valid
            } else if (!rateValuePeriodic.getValue().isEmpty() || !rateValueBasic.getValue().isEmpty()) {
                rateValueFixed.setError(ebd.getErrorMsg(1).toString());
            }
        } else if (rateType.getValue().equalsIgnoreCase("periodic")) {
            if (!rateValuePeriodic.getValue().isEmpty()) {
                // Input is valid
            } else if (!rateValueFixed.getValue().isEmpty() || !rateValueBasic.getValue().isEmpty()) {
                rateValuePeriodic.setError(ebd.getErrorMsg(1).toString());
            }
        } else if (rateType.getValue().equalsIgnoreCase("basic")) {
            if (!rateValueBasic.getValue().isEmpty()) {
                // Input is valid
            } else if (!rateValueFixed.getValue().isEmpty() || !rateValuePeriodic.getValue().isEmpty()) {
                rateValueBasic.setError(ebd.getErrorMsg(1).toString());
            }
        }
        
        return obj.getValidationResponse();
    }

    
    }


    

