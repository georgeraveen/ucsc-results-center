const express = require('express');
const _ = require('lodash');
const router = express.Router();

let log = require('perfect-logger');
let mysql = require('../../modules/database');

router.get('/status', function (req, res) {
    let query = "SELECT *, id as remoteId FROM alerts WHERE id > ? or showAlways != 0;";
    mysql.query(query,[req.facebookVerification.alert_version],function (err,payload) {
        if (!err){
            res.send(payload);
        } else{
            res.status(500).send({success:false,error:err});
            log.crit(`Unable to fetch alert status for ${req.facebookVerification.name}`, err)
        }
    });
});

router.get('/ack/:remoteId', function (req, res) {
    let remoteId = parseInt(req.params['remoteId'] || 0);
    log.debug(`Alert acknowledgement for id #${remoteId} received from ${req.facebookVerification.name}`);
    if (req.facebookVerification.alert_version < remoteId){
        let query = "UPDATE facebook SET alert_version = ? WHERE id = ? AND alert_version < ?";
        mysql.query(query,[remoteId, req.facebookVerification.id, remoteId],function (err,payload) {
            if (err){
                log.crit(err.toString(), err);
            }
        });
    }
    res.send({});
});

module.exports = router;