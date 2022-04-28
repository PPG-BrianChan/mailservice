using mailservice as ms from '../db/data-model';

service mailservice_services {
    @Capabilities.Insertable : true
    entity mailrequests as projection on ms.mailrequests

                                                        // action -> POST, parameter in application/json
                                                        // function -> GET, parameter in URL
                                                        // bound -> with keys
                                                        // unbound -> general

                        actions {
        action sendmail();
    }

}
