const cds = require('@sap/cds');
const sendmail = require('./libs/sendmail.js');

module.exports = (srv) => {

    // srv.before(['POST'], 'mailrequests', async (req) => {
    //     console.log(`before create`);
    //     const { mailrequests } = srv.entities;
    //     const query_get_reqno = SELECT.one
    //         .from(mailrequests)
    //         .columns("max(req_no) as req_no");
    //     const result = await cds.run(query_get_reqno);
    //     const jsonobj = JSON.parse(JSON.stringify(result));
    //     var req_no = `${jsonobj.req_no} + 1`;
    //     req.data.req_no = JSON.stringify(eval(req_no));
    // })

    srv.on('sendmail', async (req) => {
        const { mailrequests } = srv.entities;
        const id = req.params[0].ID;
        console.log("ID:", id);
        const query_get_req_details = SELECT.one
            .from(mailrequests)
            .where`ID=${id}`;
        const result = await cds.run(query_get_req_details);

        sendmail(result);
    })
}