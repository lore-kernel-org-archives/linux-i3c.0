Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF1CD8CAA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tADfXBRfZNaTLMDKqDEmvIDIVgu37f9ozDHxp3vZ2s=; b=Q5v1WTDwXoWc1t
	+UI4ggOMpoidmXBtvLHie5CSI2nlqbV81DLxVeEFmkiQupsISuhW5cjEtx0x7ZwQsPgVWHe/Dqk+j
	iEbUjBvvTCLyoy1QnD/1AwwgoJgRyBINDXWapLZ4BqmWAVmj5cWvIluH2Pr1CViBxBJlBLQ7Ii0XR
	pYFSpzuKt9B0ZV78Rljy6ABDjHlFRpPrZ17iYJH1d2dmyJRsHSLCmChy4rQ/60JHsRhR+kdiF/JdL
	3h/vtbtF+QduY5enoXtKVDINmB+IztlX2opYfnTdzC3ZkJZ65hDJFre0cfJ/MjHJ3ObU8TrkH83k8
	AV+hR4GYpCj3cih9lypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXG-00000005KXg-0rh0;
	Tue, 09 Jun 2026 10:18:18 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXD-00000005KWP-0Eg5
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 10:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bg/0OMyxkteFjeGVgQFatZ6h4GyheG1TyvPBv9Yb37ucuZrxJCZU4oBTKyHud+lXL/Pqkv3hkPPFQoasd3Tcnq20GL8zJK2JhwwaWMI5w96Ec32EDE2XlfDiHpbN53mI96FjnTW5MsaD2UqrCFjGJ2I6VTr/ai2ggZQjF+HLsjCjwE2G5zt4sAI19OP5WWAjPl+VYyHBYHhuQ8xKt2JYc7i72OSXGihuRnd6Vajdz5rGzFEEDIsr+nSE+CukZPkXhfZI0Zq2YZn475MhWUG3iguf8CxtCRkpzkyNfrljKcK1nu1KVZhmAPhlkdiZ2UPtOUESG3TrCL0q2QP2mh7TGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuj0mYMKaxPhXyxtOtN7AbWXf1zoqQK3ot/sUewpPOw=;
 b=QkAs2VBsG7jp6f6ml5wvR59dRZwY5hNFZipzmZrPLyVQQRe8+Cv6zAa5Re1u7xyyf/YKPYxc05c10IwWu7viB4XTtqYzPZTWYnDiFCWernqToOKp8mc78vY4ow7NVDfY7kX+4S2wc/wQqemBSujDjqL3zHcW8Nenm/SN0aQlC2oqEH4IBZ9C30MrioZfCRbE1qt/pgHqI8RqUK+U4CMICCLJD49HCZoc1/6u31v/+iZR/2WBDYBTd+KMYTfauA2rIRN8NTRM19pHfCzDazE9gxSV3sIou0XvFaGNl1CaTA2q8El8N1+St61fgqbZEiCBWUHv99TEhXn5hNXRQPDRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuj0mYMKaxPhXyxtOtN7AbWXf1zoqQK3ot/sUewpPOw=;
 b=F+SdJ8Npzz8WJNIAP+czSzJlg5ULopOPYg0GSJ5nT9JouY2Q97P7lMof+FVvSGcGJvdNRkbFxzj5U4Iw7t42pegrHPOHDOzSXngGwv45gOimcMaGD4J8hEa9rqo88RkN+zlDAuOOlRzCXrH6HlK0oEZAjiUur4gJpwi6Au4F1wYTOkSRVFVM77CtBRmK/PrbfDXXVz3/S0OWJg8HwsiFEcQ0SpDciE7CXdz3ZP/QahyVD0X2vS6cjuAMaRkssZhMgeXaL8MdNBsIEjnzyaiwS9h/hqAj4xlPYG3Ins/LKMRWaHUcftFvQ1Fy5MQxj74i4ecNIncNLP+bKpVVlsPorA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA6PR03MB7759.namprd03.prod.outlook.com (2603:10b6:806:43e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:18:09 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%4]) with mapi id 15.21.0092.010; Tue, 9 Jun 2026
 10:18:09 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] i3c: master: dw: Report actual GET CCC payload length on success
Date: Tue,  9 Jun 2026 03:18:05 -0700
Message-ID: <b7dff215ce161fbff18949a12442eac5d189347e.1780999511.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1780999511.git.tze.yee.ng@altera.com>
References: <cover.1780999511.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|SA6PR03MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e82227d-98e1-46b6-75e8-08dec61067b6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099006|18002099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: 8TVgPFeB7aYIb8GB8OxYIrKMWGWto4+UrARMtfoxmnQUg7UzFOc9WLCcPogxZCZ7HHI+U/V3kX+FQoew7vacqcSJCpFlq6RJoXBeFWDdtwZIOFtCqM0S9DuDfd3ndkA6XxIb7rqBkk036eoZud5s7UnoWgvBiiBcPFgm8OGpL7oJurEpncUNgtdsUY6LQfIKZO8Ckdjul78F4LGy7HOKISRzxzrUMLzIjhBLpWL/JfFDz6AwwF80qvfFHlqTHLWR9EPwe3WCe4hfi0jbRYeOdalCY8C8BghEBSi53zlnX4it+i9Wv2nt/KnnA7HsDFmyUY3FixNibFKyORW0aCtT2srzw2iCKN9nUPe6avXPijapSvDmDapjdonFjMCf3vDIpRUBYQl2i5tKpTPdWAAx+J+u9d5nwcjVm4PiL5ZbTQzo3mXDLsD7wUZEYEMHc5rWc7LZ3q3/XQHPO0qn+ASyHMNmUG6AoDODPS0ZBxTcwoUBR+J0GMpQxkU7BWuhXd4BLLkxW9GzJJ6PEDyUgDktB3+gw66eyKCcqrx4kxXtCkS3VhS+5Grw8KGFXgTb1VUr8unnLVkKf6/d6h7gRnpBHJ6wqFEIrNDo+Pe8hKqGjE4dqFDGxf54pFkUjhkBzXueL+5TXCee3ul1CiLaejsrj9N4IdR57/k/jKdGb9jdDlRetJOTNsNhyc97VkuPwKoM6Zwx447gGcis35jikXBlz5HgzkXaJ1bkQ+7g6/0XnHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VkiEHWZghzV2pTSYTc3M3yOtPVksDBv7o7r1klg1jnY2VOIkwEAL93XrFY3O?=
 =?us-ascii?Q?Pe3dM390a5wSEjQL/UJJajnh7HgBuCUK6n6nPHsglY4vPlGqOYe4cFcucuUD?=
 =?us-ascii?Q?dMQ/Fb8eSrd2fk2GX+6EtRZH83UQMpRWTNRdW85ymNcJrGVo4iVkdcxT8sMZ?=
 =?us-ascii?Q?oFkitALyx3AelxpYEbr3S4KXKqig2w5Kza5g+f//L4VWpEUP5v29KI5aUquu?=
 =?us-ascii?Q?iyozC8KYFlOy6d+DeGZPabogIwV/BcCA5S/El34jbLmIUtqd1O7ZnHf2ybwa?=
 =?us-ascii?Q?uzOgvNV52VmWnFQ5z5DmVhJ5UCDwg7evDZkNcndofWkO2a8zCsMuwLiFgjE9?=
 =?us-ascii?Q?yORyvwR73nPglN2GdX+G23NPsqonCrrMBclnL+tZdXKFvRPb1RH98m60NzfB?=
 =?us-ascii?Q?haGmK8mSrTobsJCeVANrKJsFJlBk9nivngyL68xcp21s0+LcTQhVXvdKtHsc?=
 =?us-ascii?Q?qytvmo1R+5NdMT/S1gZ8wlfM1OdL+fDlBmeirqrjmfpJr9xR1dwSitYu1h18?=
 =?us-ascii?Q?uXYDiwpczWUJXIBm09eYQHQJoI6qpOZFaWfXTBTnG5TTS6wo23YQ60QdrKFW?=
 =?us-ascii?Q?Ga9T0+31kO3g5pesCy6JXBVXVcs9KlZYh18zbOkyMOTmUfIqg6gAsSRlu3G0?=
 =?us-ascii?Q?oDrcG9Fe9DRKbiZzqzd+Gz+lmUiD7UcvwvIP3tKRD+sIQiBc5ukpYqeyM1Li?=
 =?us-ascii?Q?jMRTW0pndQ03/NfHU3gxJPqB//3FZns2F3HwLsdm7EWSlnr12s7sWs29Enll?=
 =?us-ascii?Q?OieWs1LCEf2fdsGtBpoOXN2pt3aitbQKORo9Pr6z97gK03O/bEW44BV4Lz+4?=
 =?us-ascii?Q?y8tgwRU8jjEKjvKvwzaXiYAlX4FBsuWU460czeVoZ86YP8ID8z24uYU9K6Iv?=
 =?us-ascii?Q?qII5OsCigDdAIZrgpbLb4D3Rz3XiGNTER47bjK6cbtXnbNmY0BfFUdewVrIL?=
 =?us-ascii?Q?LEXlW10kwe+l2RH67DQEPzxu0LVqLqGJnBSZjgPFSQU5S7G7tsz1ic/57SAP?=
 =?us-ascii?Q?BPREQJo7QFM3QBo1nt41LCLWCoQ7rdTn/de71eTOfs0BYA2X3fETs+66ys4L?=
 =?us-ascii?Q?VoD9mPolYe2tDn/a/mKh0gqm+TeVnlGAr2c4+0CZRDdXFT320IuZ/YERN3h2?=
 =?us-ascii?Q?TGx0Z8lSc8k5XBAytWZmy0jesVLq7DeGXDwDUa3QmJhAXEN/aoCqENvjoEbf?=
 =?us-ascii?Q?DCfUErunNMcur1o6skppIHJA+27f3sBa34bYjz7chvFASZb4C6vVcLozt0dj?=
 =?us-ascii?Q?iYWXLmm7D+HCYcwQ7RLacgtjXc+H1nO08SFbtJ3PNICBNWWW4RyU6JpfuD8k?=
 =?us-ascii?Q?70h/MsueKCnlLYs3xn71wcAJ9dwU5lQ2r/LwgTLIh07V6tjVO4Ron/M4XTwO?=
 =?us-ascii?Q?22kqQMJTfwf5LMgdL9DHBX/8Yy/YiH/IaF8loTRpKQtDVXGXu/BTJtTi5PNO?=
 =?us-ascii?Q?OR67JGNdieJMkjoNjVhChyJQqa6+k1g3CKW0tb29pA0xGK+Br8J270AfE5dJ?=
 =?us-ascii?Q?xQH9TXX3tvDAh7admdNo4XvV3DxXurF0Iz6/TDMerUFLFL02BoUw/3HsPMJ8?=
 =?us-ascii?Q?/1qCiy7GDaRgqi14Xr6Q5Pkje/JqFMVSysvgx55hS54FHu6cv5C8xwUqhLu6?=
 =?us-ascii?Q?/f39uyi9m699Ld5oKFMW1PD0hIB8xSAPHsGDV9En9t6+PGd5S1v4LHlutbXw?=
 =?us-ascii?Q?lu16yfsaeRpEddqmUis3qrZiYA11YXQegz255zXIKPdB9CmZb6PjOJC9hFNP?=
 =?us-ascii?Q?7m1go9a9eQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e82227d-98e1-46b6-75e8-08dec61067b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:18:09.6279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZdhi6L9E3HRdq/2pmgbJRvKswyzwTa1ziCKPBpBRrEPKvloBNi+r/3iGkPxXj0x9IGMPM6V0uxBU89vdAyZtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031815_103909_B8FFAC34 
X-CRM114-Status: GOOD (  11.55  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

On successful GET CCC transfers, set dests[0].payload.len from
RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
actually read. Core helpers such as i3c_master_getmrl_locked() use
dest.payload.len after the transfer to interpret the response.

Save the requested length in a local variable before programming the
hardware so the caller's buffer size is not conflated with the bytes
received.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..06fdf8857b9c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -751,21 +751,24 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 {
 	struct dw_i3c_cmd *cmd;
+	u16 req_len;
 	int ret, pos;
 
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
 
+	req_len = ccc->dests[0].payload.len;
+
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
 	if (!xfer)
 		return -ENOMEM;
 
 	cmd = xfer->cmds;
 	cmd->rx_buf = ccc->dests[0].payload.data;
-	cmd->rx_len = ccc->dests[0].payload.len;
+	cmd->rx_len = req_len;
 
-	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
+	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(req_len) |
 		      COMMAND_PORT_TRANSFER_ARG;
 
 	cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
@@ -780,7 +783,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
+	cmd = &xfer->cmds[0];
+	if (!ret)
+		ccc->dests[0].payload.len = cmd->rx_len;
+	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
 		ccc->err = I3C_ERROR_M2;
 
 	return ret;
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
