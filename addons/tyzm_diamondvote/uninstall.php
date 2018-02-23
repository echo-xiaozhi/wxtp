<?php

$sql =<<<EOF
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_count`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_fansdata`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_friendship`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_gift`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_looklist`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_redpack`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_reply`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_viporder`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_votedata`;
DROP TABLE IF EXISTS `ims_tyzm_diamondvote_voteuser`;
EOF;
pdo_run($sql);