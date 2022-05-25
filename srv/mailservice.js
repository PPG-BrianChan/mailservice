const cds = require('@sap/cds');
const sendmail = require('./libs/sendmail.js');

module.exports = (srv) => {

    srv.on('sendmail', async (req) => {
        const { mailrequests } = srv.entities;
        const id = req.params[0].ID;
        console.log("Sending mail manually ID:",id);
        const query_get_req_details = SELECT.one
            .from(mailrequests)
            .where`ID=${id}`;
        const result = await cds.run(query_get_req_details);

        sendmail(result);
    })

    srv.after(['CREATE'], 'mailrequests', async (result) => {
        const { mailrequests } = srv.entities;
        try {
            await sendmail(result);
        }
        catch (error) {
            console.log("Error in sending mail:", error.message)
            const query_update_status = UPDATE(mailrequests)
                .set`status = 'O'`
                .where`ID = ${result.ID}`;
            await cds.run(query_update_status);
            return;
        }
        const query_update_status = UPDATE(mailrequests)
            .set`status = 'C'`
            .where`ID = ${result.ID}`;
        await cds.run(query_update_status);
        console.log("Mail request status updated successfully");
    })

}
