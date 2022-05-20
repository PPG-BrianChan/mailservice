using mailservice as ms from '../db/data-model';

service mailservice_services {
    // @requires: 'authenticated-user'
    @requires: 'system-user'
    @Capabilities.Insertable : true
    entity mailrequests as projection on ms.mailrequests

                                                        // action -> POST, parameter in application/json
                                                        // function -> GET, parameter in URL
                                                        // bound -> with keys
                                                        // unbound -> general

                        actions {
        action sendmail();
    }

    action myaction(
        sender    : String,
        recipient : String,
        subject   : String,
        body      : String,
        status    : String(1)
    ) returns Integer;

}
