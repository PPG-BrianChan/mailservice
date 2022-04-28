namespace mailservice;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity mailrequests : cuid, managed {
    // req_no : String(8);
    sender : String;
    recipient : String;
    subject : String;
    body : String;
    // attachment : String;
    status : String(1)
}

entity Media {

   key id:Integer;
   @Core.MediaType: mediaType
   content : LargeBinary ;

   @Core.IsMediaType: true
   mediaType : String;
   fileName : String;
   applicationName:String;
}