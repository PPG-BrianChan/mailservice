using mailservice_services as ms from './mailservice';

annotate ms.mailrequests with @odata.draft.enabled : true;

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
    attachment @title : '{i18n>Attachment}';
    status     @title : '{i18n>Status}';
}

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
    ]},

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
    ]

};
