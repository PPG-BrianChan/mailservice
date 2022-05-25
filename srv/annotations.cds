using mailservice_services as ms from './mailservice';

// annotate ms.mailrequests with @odata.draft.enabled : true;

//Mail request annotation

annotate ms.mailrequests with {
    ID         @title : '{i18n>ID}'
               @readonly;
    // req_no     @title : '{i18n>Req_No}'
    //            @readonly;
    sender     @title : '{i18n>Sender}';
    recipient  @title : '{i18n>Recipient}';
    subject    @title : '{i18n>Subject}';
    body       @title : '{i18n>Body}'
               @UI    : @UI.MultiLineText;
    attachments @title : '{i18n>Attachments}';
    status     @title : '{i18n>Status}';
};

annotate ms.mailrequests with @UI : {
    HeaderInfo          : {
        TypeName       : '{i18n>Request}',
        TypeNamePlural : '{i18n>Requests}',
        Title          : {Value : ID},
        Description    : {Value : subject}
    },
    SelectionFields     : [
        // req_no,
        sender,
        recipient,
        subject,
        status
    ],

    LineItem            : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'mailservice_services.sendmail',
            Label  : 'Send Mail',
            Inline: true,
            Enabled : true
        },
        // {
        //     $Type : 'UI.DataField',
        //     Value : req_no
        // },
        {
            $Type : 'UI.DataField',
            Value : sender
        },
        {
            $Type : 'UI.DataField',
            Value : recipient
        },
        {
            $Type : 'UI.DataField',
            Value : subject
        },
        {
            $Type : 'UI.DataField',
            Value : body,
            MultiLineText : true
        },
        {
            $Type : 'UI.DataField',
            Value : attachment
        },
        {
            $Type : 'UI.DataField',
            Value : status
        },
    ],

        Facets              : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Details}',
            Target : '@UI.FieldGroup#Details'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Admin}',
            Target : '@UI.FieldGroup#Admin'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Attachments}',
            Target : 'attachments/@UI.LineItem'
        }
    ],

    FieldGroup #Details : {Data : [
        // {Value : req_no},
        {Value : sender},
        {Value : recipient},
        {Value : subject},
        {Value : body},
        {Value : attachment},
        {Value : status}
    ]},

    FieldGroup #Admin   : {Data : [
        {Value : ID},
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
    ]}

};

// Attachment annotation

annotate ms.attachments with {
    ID           @title : '{i18n>ID}'
                 @readonly;
    name         @title : '{i18n>AttachmentName}';
    contentType  @title: '{i18n>AttachmentType}';
    contentBytes @title: '{i18n>AttachmentContent}'
};

annotate ms.attachments with @UI:{
    LineItem :[
         {
            $Type : 'UI.DataField',
            Value : name
        },
         {
            $Type : 'UI.DataField',
            Value : contentType
        },
         {
            $Type : 'UI.DataField',
            Value : contentBytes
        }
    ],

    Facets              : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>AttachmentDetails}',
            Target : '@UI.FieldGroup#AttachmentDetails'
        }
    ],
    FieldGroup #AttachmentDetails : {Data : [
        {Value : name},
        {Value : contentType},
        {Value : contentBytes}
    ]}

};
