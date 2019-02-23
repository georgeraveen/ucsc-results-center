const express = require('express');
const _ = require('lodash');
const router = express.Router();
const log = require('perfect-logger');

let mysql = require('../../../modules/database');

router.post('/add', function (req, res) {
    let alert = {
        title: "Notice",
        text: "",
        template: "info",
        autoDismiss: 1,
        autoDismissDelay: 5000,
        showAlways: 0
    };

    log.debug(`Add new alert request received from ${req.facebookVerification.name}`);
    log.writeData(req.body);

    if (req.body['title'] === undefined){
        res.status(400).send({success: false, error: "Title cannot be empty"});
    }

    if (req.body['text'] === undefined){
        res.status(400).send({success: false, error: "Text cannot be empty"});
    }

    if (['info', 'warn', 'success', 'error'].indexOf(req.body['template']) === -1){
        res.status(400).send({success: false, error: "Invalid template"});
    }

    alert = Object.assign(alert, req.body);
    let query = "INSERT INTO `alerts` (`title`, `text`, `template`, `autoDismiss`, `autoDismissDelay`, `showAlways`) " +
        "VALUES (?, ?, ?, ?, ?, ?);";
    mysql.query(query,[
        alert.title,
        alert.text,
        alert.template,
        alert.autoDismiss > 0 ? 1 : 0,
        alert.autoDismissDelay > 0 ? alert.autoDismissDelay : 5000,
        alert.showAlways > 0 ? 1 : 0
    ],function (err,payload) {
        if (!err){
            res.send(payload);
            log.info(`New alert '${ alert.title}' added by ${req.facebookVerification.name}`)
        } else{
            log.crit(`Failed to add new alert as requested by ${req.facebookVerification.name}`, err);
            res.status(500).send({success:false,error:err});
        }
    });
});

router.post('/edit', function (req, res) {
    log.debug(`Edit alert request received from ${req.facebookVerification.name}`);
    log.writeData(req.body);

    if (req.body['id'] === undefined){
        res.status(400).send({success: false, error: "Id cannot be empty"});
    }

    if (req.body['title'] === undefined){
        res.status(400).send({success: false, error: "Title cannot be empty"});
    }

    if (req.body['text'] === undefined){
        res.status(400).send({success: false, error: "Text cannot be empty"});
    }

    if (['info', 'warn', 'success', 'error'].indexOf(req.body['template']) === -1){
        res.status(400).send({success: false, error: "Invalid template"});
    }

    mysql.query('SELECT * FROM `alerts` WHERE `id` = ?', [req.body.id], function (q_err, q_payload) {
        if (!q_err){
            if (q_payload.length === 0){
                res.status(404).send({success: false, error: "alert not found"});
                return;
            }
            
            const alert = q_payload[0];
            mysql.query('UPDATE `alerts` SET `title`=?, `text`=?, `template`=?, `autoDismiss`=?, `autoDismissDelay`=?, `showAlways`=? WHERE `id`=?;',
                [
                    req.body.title || alert.title,
                    req.body.text || alert.text,
                    req.body.template || alert.template,
                    parseInt(req.body.autoDismiss) > 0 ? 1 : 0,
                    req.body.autoDismissDelay || alert.autoDismissDelay,
                    parseInt(req.body.showAlways) > 0 ? 1 : 0,
                    alert.id
                ],
                function (err, payload) {
                    if (!err){
                        res.send(payload);
                        log.info(`Alert #${alert.id} (${alert.title}) was edited by ${req.facebookVerification.name}`)
                    } else{
                        log.crit(`Failed to edit alert #${alert.id} (${alert.title}) as requested by ${req.facebookVerification.name}`, err);
                        res.status(500).send({success:false,error:err});
                    }
                })

        }else{
            log.crit(`Failed to edit alert as requested by ${req.facebookVerification.name}. (0x1)`, q_err);
            res.status(500).send({success:false,error:q_err});
        }
    })


});

router.get('/list', function (req, res) {
    let query = "SELECT * FROM alerts";
    mysql.query(query, function (err,payload) {
        if (!err){
            res.send(payload);
        } else{
            log.crit(`Failed to list alerts as requested by ${req.facebookVerification.name}`, err);
            res.status(500).send({success:false,error:err});
        }
    });
});

router.delete('/delete/:id', function (req, res) {
    let id = parseInt(req.params['id']);
    let query = "DELETE FROM `alerts` WHERE `id`=?;";
    mysql.query(query, [id],function (err,payload) {
        if (!err){
            log.info(`Alert #${id} was deleted as requested by ${req.facebookVerification.name}`);
            res.send(payload);
        } else{
            log.crit(`Failed to delete alert as requested by ${req.facebookVerification.name}`, err);
            res.status(500).send({success:false,error:err});
        }
    });
});

module.exports = router;