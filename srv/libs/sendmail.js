const cdsapi = require('@sapmentors/cds-scp-api');

module.exports = async function (result) {
    const mailcontent = {
        message: {
            subject: result.subject,
            body: {
                contentType: 'Text',
                content: result.body
            },
            toRecipients: [
                {
                    emailAddress: {
                        address: result.recipient
                    }
                }
            ],
            from: {
                emailAddress: {
                    address: result.sender
                }
            }
        },
        attachments: [
            {
                '@odata.type': '#microsoft.graph.fileAttachment',
                name: 'attachment.txt',
                contentType: 'text/plain',
                contentBytes: 'MTIz'
            }
        ],
        saveToSentItems: 'true'
    };

    try {
    console.log("Preparing to send mail");
    const service = await cdsapi.connect.to("Microsoft_Graph_Mail_API");
    return await service.run({
        // url: "/v1.0/me/sendmail",
        url: `/v1.0/users/${result.sender}/sendmail`,
        method: "post",
        headers: {
            'content-type': 'application/json'
        },
        data: mailcontent,
    })
    }

    catch (error) {
        console.log("Error in sending mail:",error.message)
    }
}