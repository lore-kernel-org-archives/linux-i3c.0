Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED07BC4167B
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Dec 2023 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8eGGgEjz1oblNDd16RLvCOFBB/unow5f75q9Bz5PJQ=; b=ZbuUwP1K92d7er
	z7YJW6ZZivykAHJlEtm2Zx84PxM9JoYwZ4wkd/3USPi3t/iy5hZUMRFhojAGi8L+FbgkT2tNAmDPd
	XCmGPll23F0wqD+7ckCft/GI0vYh/+SKo2dFKrrB3vKk3443GSMtjmt5vfg2XRihrO5PjR+FpPh9D
	Imcwph7EU/hKpnRXZgyWTZu1ZhZ3Jr8ZGGnWtidbdW5B4jD7Cpd9wlRcS79ae32mjfDFAUjNriYUm
	e0+gYnN11v5fO1rfHqphoVCbDlkLeXMiLtM2k1A4ML+LVuFr2KXdU4d/t7wg/Qrd3H9T1RwtGLbvK
	X7rjCS+BebBH7BZ40Qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9CDD-00EmVv-1y;
	Fri, 01 Dec 2023 22:42:19 +0000
Received: from mail-db8eur05on20602.outbound.protection.outlook.com ([2a01:111:f400:7e1a::602] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9CDA-00EmUt-2v
	for linux-i3c@lists.infradead.org;
	Fri, 01 Dec 2023 22:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUuYK5msX9ii8yeSTLUcONLGnDftuResJdKkw1kP6xRQ84QgmLZYkk/FP5BVlQvVlqAx6rEWh3Wfc1OZLK27bCJhKJZtNFV276bmD6GffhhszQmLYqUUTsPqGVQJEvubAv/GbBUff351z1EDGtYV720D3JwbSTi6LzPF7/zoRLITQCeugkeOYWmkTQoHiPq9RBadTii2g1QhZ4NFwMzrJlFVDOjCKNxJktREoIbMudd734hLox5pC3AU79oLFN2FzRg2MeH2WQXHPHcxtx2k7g3c37AMccKCxQoVW8aOQ5Rsh5ihQB5BQDBciF+62eGh6i1+Fi3Vcpu9A8T7hMWtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXDAhNm+DCe1srAC+lBUWMnfd6Ayz3DSi20A50myyuQ=;
 b=hw+A5dOaA5rUKnG2EGLSxG4lmQ2TWMKO/bsLgaJQSqQte0nqntArkVIimwEmBmF6jtjh7JKwwT9KQbrnKTQ2UWIwuxDVz2mjIl0R06U2KSx8ILNshlvaZdOG15QbX1QjE/9w4etrdnW0rTMAjGHOtXJ2A6u12K+YzprPX57trz+0OnZm0pOb4yXklsejJKnMRiACcHpDY5l0LvnymgP3CVFwqtgR+lnKj7skiDfCyM41jDpJqVw8xpyblYINbzOw85OaNAv9QZXfSGjfMf7ap5GEzbVycZTbyTl6wbxw3Vsl7idLmXBLjgdzJIlKIEi8+X8UQh9Rs2b37MQiemqvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXDAhNm+DCe1srAC+lBUWMnfd6Ayz3DSi20A50myyuQ=;
 b=BiWV2Yi8BoudG1dCfLMF9dHOMGI0leb0xfaFgasZwD6EFXFgTYGTjnMY5n6LM+i3B3JHn8/l3EpqHV5gD+eyfWLR9pLnFS/pjj+a6HfaMcj8PZ2JiazF4k+q+zZSZGLDKwdAB9uuxNeypR6jWAPVLMpQklqFZaPWALYU9auRHIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS4PR04MB9573.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 22:26:05 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.016; Fri, 1 Dec 2023
 22:26:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [v5 resend 4/6] i3c: master: svc: rename read_len as actual_len
Date: Fri,  1 Dec 2023 17:25:30 -0500
Message-Id: <20231201222532.2431484-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201222532.2431484-1-Frank.Li@nxp.com>
References: <20231201222532.2431484-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS4PR04MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecc0795-faf3-4e4d-d547-08dbf2bc8221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 804oIkrUZLt1JqE32wR/UoPLmiFQWLgj7jwxfMBnDlQ/my1GHEBwVLkqOmrCSWpvVjF4UEEm39GGNOby1sY6U+5v6lA1Zz/CfyFqQn0uWIaoJNf6TUiyVm5OjWUcP1Yr6nc7h9h4S8cwi07UbfTUdzlvkynxj3V4Vtbkn7BHLjxS4NWV+18JkUGq5lwEmw+MfW5sREDBSSJL3uOTiqeZLDGhr0ym1Q9n8OVIE0AwzSdIfjQn6L5fDIE23gsWc/TBL55fxpCMbzBc3u1ZkK8gB8cKcZKBgOo7h1fw/Uvmr1Ous3bw+EZZdsPm+2fZH1VjkpYpeFgeYVfvSzGoMu5fxhXIGTmQ/EzXz1zzbSJQTRTzn1xSMDb4ac9nXPyo9jPHDaU138QyJaqmuwZaiBzk7N9oRmw3AVh1lPxCakx8fz/vizhCgYFwh89jw3+OB3abC2185K/igtEpo51aUfFCKrzRP85+zui1noIfQl+zpqJY+MTC5JROkDiC2/ENGP4BK3/8+pPrkjgVxAdncOBE5lZkcJv5rXKa4Kjof++D+2Q68mP/VAIvtDhwK6kh+V1I6EV2fyc+XNHBSNPqKodSYIfOaLLxzirZxUVbOFns8hW8UYHAG4IN/Bzmd1tjNU9t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(86362001)(6506007)(26005)(1076003)(6666004)(52116002)(2616005)(6512007)(41300700001)(5660300002)(8936002)(8676002)(6486002)(478600001)(2906002)(4326008)(316002)(66556008)(6916009)(66476007)(36756003)(38100700002)(66946007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gMwAQf7vX7kXqhUrSiuBMCVeWFFq7RDOZKpaooKJGo0WWFNMGNHq/LrnlT/g?=
 =?us-ascii?Q?qw0uIpeOmJlQ7CZmfFQMf4k68/LFsiUoE7gIIBmCaqFizms24QGh/+HlCVTC?=
 =?us-ascii?Q?2aU0qp/8GjbD4yxfffiEAOA18YejKe5IczC9VzcPCw0p+KW4PK2WNRXeeiZn?=
 =?us-ascii?Q?UaZFAfunoAfZ+BV65PgCiyNo7042HyybTUXn0v2yCravHbYv+4BIfcn876ML?=
 =?us-ascii?Q?hGpaP3a9sysCRo/hMXxa29OCV0U8iVHJtW9P6qScds8XG6fk624jJqmBVDDC?=
 =?us-ascii?Q?C5GD2+keLuwj3ONPS4t3EaqCIUjUXD8JUtPcxwUWMaujkRSnGMiDdPM6Y73n?=
 =?us-ascii?Q?leRAo3+YQUWmoTwDog4qah60G9d8uxCuZHBo7hYQrFi7wevLt4NVs3JwgQiW?=
 =?us-ascii?Q?M72waAh9cF0f9sOrpX2yGpbOWE8j9cWW1+oW3iXzuqiKSDJYjDYDxP0qE8w7?=
 =?us-ascii?Q?k+YB737Hf8t6HOwuQVAnK7jHlZ42s9+4xiEROGPkqVtBjjz1E8dCuQ1JML0+?=
 =?us-ascii?Q?OKyEGdO5I8khLi8VYEFLrmhcybOMcC5iH/rTolaLuWRKnyF35Fq+6Vmv9hxS?=
 =?us-ascii?Q?YYUubyMBvIJsiEFVny4v2Lekztsj2jybPcZQRVZ93TUTWM6T/oe5B3tRUXBK?=
 =?us-ascii?Q?bzKTkDpa3+ntWGlNLp+aMvhjIk7nANjK7dqx03LShMmEpwqR5yprpfeA1XAn?=
 =?us-ascii?Q?WFqdKH7V3oA38NAJ3M4RCF6vVFyzoMNo2pvkDVd6t4/03QdK3z+LHAKR9AFv?=
 =?us-ascii?Q?s/t4Rbhz5nRmt7wQpXfl1yZ9TnseCoLXP8MAp4ZnuI+0kytMOPqLfIXAt2Cp?=
 =?us-ascii?Q?j1DXNrr39yMSb1xtvP6occXNkkLE0I7jp0T94dugrwjI/wUKUUDe9mmrOy3c?=
 =?us-ascii?Q?UXvbOsUeQswa71XauaRaF+EPR5FGrl4co5zB1MXImfrLiVTswtQ6Tv9Tf0Y1?=
 =?us-ascii?Q?1Tyt1NZPM1T/rRdeKG5d2WA0MTJzJ8XMmep0bilYDFRrppWPtqjo9bm44tn7?=
 =?us-ascii?Q?lMQ40hDNdlx/kMuE2a+YfVJ3QV/gjr71o6vArmRM263mTYrvbysc+cbt5Ywj?=
 =?us-ascii?Q?bzqDkBCj8zPYd/1EIDWWPRNOmEAhF3ZzHooa4HvXSQgwxoLSWTjncJToOBGe?=
 =?us-ascii?Q?XZAk36/72y4ftIwKR/V47O+jgwvdAR0eeW+QsFE8Yiy2najLvWpr+0y3MFMj?=
 =?us-ascii?Q?UCVt5ErHpWpQfVcGznbZv0UYYgLgRYjeuH/Is+w0gSTEIlENjs6rOXKJKrYF?=
 =?us-ascii?Q?BDWj+YOvhM/7ydSajo2tV5MasE6UueCGZFbDv3XzIiq4RyveJgiN8Zg8ZDX8?=
 =?us-ascii?Q?s29xEykg5x/94CndlJO6L8lnuQ5VUVnOLRWu/p8tko52+pik0CrurPzegkJO?=
 =?us-ascii?Q?BWVxVAOtsBhZNPyvlMg/u3NkfIqq27qAi+bJXyLNpE/rSOcyW5JqonHXs94g?=
 =?us-ascii?Q?Q0kULWHIz5zR/W7+JSbA9/GZxmWQKZfsMhdny7bHsDKbqaikB6yTDM8k04FO?=
 =?us-ascii?Q?BRvSzIy/LYTf6fFzZ1LILpO8SkYFKI7NGZxdaOm8mbq1Pjrkyuq5BHtS8a8b?=
 =?us-ascii?Q?6soi/t3C1Q+/kNTe/PKdFlKRgUya7eA0WfOBlYh0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecc0795-faf3-4e4d-d547-08dbf2bc8221
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 22:26:05.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKBLPjwIntT7m4tEhFRpT9nCMr3MJF/sWNsMqlAM0tn8Owx1tKAWzX9eqK3CbS8uOoz89YZobsFiG1rtFb/Ucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_144216_947635_7F6D1BB9 
X-CRM114-Status: GOOD (  11.17  )
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

I3C transfer (SDR), target can early terminate read transfer.
I3C transfer (HDR), target can end write transfer.
I2C transfer, target can NACK write transfer.

'actual_len' is better name than 'read_len'.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    change from v4 to v5:
    use i3c: master: svc: prefix

 drivers/i3c/master/svc-i3c-master.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index f2058a36f869b..13a8b3c2aa541 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -137,7 +137,7 @@ struct svc_i3c_cmd {
 	u8 *in;
 	const void *out;
 	unsigned int len;
-	unsigned int read_len;
+	unsigned int actual_len;
 	bool continued;
 };
 
@@ -1038,7 +1038,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       bool rnw, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
-			       unsigned int *read_len, bool continued)
+			       unsigned int *actual_len, bool continued)
 {
 	u32 reg;
 	int ret;
@@ -1051,7 +1051,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	       SVC_I3C_MCTRL_IBIRESP_NACK |
 	       SVC_I3C_MCTRL_DIR(rnw) |
 	       SVC_I3C_MCTRL_ADDR(addr) |
-	       SVC_I3C_MCTRL_RDTERM(*read_len),
+	       SVC_I3C_MCTRL_RDTERM(*actual_len),
 	       master->regs + SVC_I3C_MCTRL);
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -1089,7 +1089,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		goto emit_stop;
 
 	if (rnw)
-		*read_len = ret;
+		*actual_len = ret;
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
 				 SVC_I3C_MSTATUS_COMPLETE(reg), 0, 1000);
@@ -1171,7 +1171,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 
 		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
-					  cmd->len, &cmd->read_len,
+					  cmd->len, &cmd->actual_len,
 					  cmd->continued);
 		if (ret)
 			break;
@@ -1257,7 +1257,7 @@ static int svc_i3c_master_send_bdcast_ccc_cmd(struct svc_i3c_master *master,
 	cmd->in = NULL;
 	cmd->out = buf;
 	cmd->len = xfer_len;
-	cmd->read_len = 0;
+	cmd->actual_len = 0;
 	cmd->continued = false;
 
 	mutex_lock(&master->lock);
@@ -1277,7 +1277,7 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 					      struct i3c_ccc_cmd *ccc)
 {
 	unsigned int xfer_len = ccc->dests[0].payload.len;
-	unsigned int read_len = ccc->rnw ? xfer_len : 0;
+	unsigned int actual_len = ccc->rnw ? xfer_len : 0;
 	struct svc_i3c_xfer *xfer;
 	struct svc_i3c_cmd *cmd;
 	int ret;
@@ -1295,7 +1295,7 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 	cmd->in = NULL;
 	cmd->out = &ccc->id;
 	cmd->len = 1;
-	cmd->read_len = 0;
+	cmd->actual_len = 0;
 	cmd->continued = true;
 
 	/* Directed message */
@@ -1305,7 +1305,7 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 	cmd->in = ccc->rnw ? ccc->dests[0].payload.data : NULL;
 	cmd->out = ccc->rnw ? NULL : ccc->dests[0].payload.data,
 	cmd->len = xfer_len;
-	cmd->read_len = read_len;
+	cmd->actual_len = actual_len;
 	cmd->continued = false;
 
 	mutex_lock(&master->lock);
@@ -1314,8 +1314,8 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 		svc_i3c_master_dequeue_xfer(master, xfer);
 	mutex_unlock(&master->lock);
 
-	if (cmd->read_len != xfer_len)
-		ccc->dests[0].payload.len = cmd->read_len;
+	if (cmd->actual_len != xfer_len)
+		ccc->dests[0].payload.len = cmd->actual_len;
 
 	ret = xfer->ret;
 	svc_i3c_master_free_xfer(xfer);
@@ -1365,7 +1365,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 		cmd->in = xfers[i].rnw ? xfers[i].data.in : NULL;
 		cmd->out = xfers[i].rnw ? NULL : xfers[i].data.out;
 		cmd->len = xfers[i].len;
-		cmd->read_len = xfers[i].rnw ? xfers[i].len : 0;
+		cmd->actual_len = xfers[i].rnw ? xfers[i].len : 0;
 		cmd->continued = (i + 1) < nxfers;
 	}
 
@@ -1405,7 +1405,7 @@ static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		cmd->in = cmd->rnw ? xfers[i].buf : NULL;
 		cmd->out = cmd->rnw ? NULL : xfers[i].buf;
 		cmd->len = xfers[i].len;
-		cmd->read_len = cmd->rnw ? xfers[i].len : 0;
+		cmd->actual_len = cmd->rnw ? xfers[i].len : 0;
 		cmd->continued = (i + 1 < nxfers);
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
