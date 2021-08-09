Return-Path: <SRS0=LFUb=NA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BF6C4338F
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Aug 2021 06:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C2D60527
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Aug 2021 06:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76C2D60527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tetbT1It9VZFgciWIOGZh8vWsY0dmyv/W9eJ6XOQ1bA=; b=Asz18Ra3pRJJMB
	judRGfNUk6HQLQbin+pMaoMw6r3kHge5qdYan4eHh9NcXNwFqUn4UjtNv2X+lV2cnd2Z69rCFsSRO
	eG7BUQUvai+pu2Gcve82OAeTkcQ+gSKDatm3Q0TlhQiYbTt/Knc9lfl1hZwiLI+Yb1BaEeCqzjV5H
	mpDOAGHBzsepqfSQ1e7hI3pzleaENYXyB0Mu1Rpg1cUILhkjvtyBugJhyqxmyRL5CNQFkM0VTv0DO
	/pwV/bSZmCNfoIl5OVnv48A/grjOGN+j6bZd6n7bIqUiI7O4hhwoRrTwTKObqmfTKYUevljI9msPO
	pSOrZ7doz2x86O3Dx9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCytl-00HGJr-SS; Mon, 09 Aug 2021 06:36:33 +0000
Received: from mail-eopbgr80071.outbound.protection.outlook.com ([40.107.8.71]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCytj-00HGI8-53
 for linux-i3c@lists.infradead.org; Mon, 09 Aug 2021 06:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBUNbYA6euVduSw6wylGe1BcZj3oN3B1nwNcVLVAD23rdKknMcZvYG2NLvzSU9dS9hWmiDitxyIX2JT0G/UX6h7a2vGzgMDjEEQHOfLWxmMbielJsvRv8NHSjOJUqWl//Drc8PWFRanT1tAnPr6vIs8hRYRGkuJlhGeSjOFhHJJtX+g3/g0SMCDD9loZPrY4NrqpO8UhYvAqaefutpgKV1vCRHJ3MIYEKlTff2IAaKLufJiEMpwpak+E5AX8yzLLwGjwJ9I7QdCkIbjuoZlQGzopksiF57uHt0opbDcdTQpmDzjmPIawZALAm6a0/Gh2svYL62V31MZTw+RLxRed6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A+cuLNTH3OSUE1R/W+aeizprv1SFtg8ariKTjAO52c=;
 b=iR9xZ718yD1YuQykYzH5Zw6CuKq979g6zYYn4hYode0jbFjwIYpKt8cSa71PUeQaIxilnjDK7Euwrd41KIMYQjic+kea+r4ftAM/fbj4hlLn+85VyOZpRiYPQMRINRlhBHUHCS8QVRv+6RfUdv4zT3nkdvULcsvIoaIyJaAFuA89wKvtxCFCmYmrL3sPGDFVNUKtF0yxzhlEo7x6+WwJpd9WXRg6XBBDJ3sQqtYlrEwdFQApQdoUTNgbnsGPDIzq2eU0DIbVBXxw4deu14CRDHS7/Ah574NSF5MVE/1gVl/laOBCUXWtFm2f+PKN1JqLsbskrbfmjainefYPo3KRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A+cuLNTH3OSUE1R/W+aeizprv1SFtg8ariKTjAO52c=;
 b=PKsdfjwEzkxp8xgpfJ932aNxTIvfI+AuGbhALFZzcSsT7jQttsntFrr4GNLls1pPCyv3uZpyW4DKiEDNFhCPs6JrDkDnJoTPSyOOR2GJGRihFBIr7Fx9QakY3V5LscLKyBKN6R6vw0Y3sMdHJSQPEmRGULuO6hzbfJVN9NrgCjY=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Mon, 9 Aug
 2021 06:36:28 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4394.022; Mon, 9 Aug 2021
 06:36:28 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com
Subject: [PATCH V4 8/8] i3c: master: svc: enable the interrupt in the enable
 ibi function
Date: Mon,  9 Aug 2021 14:36:45 +0800
Message-Id: <20210809063645.2289988-9-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
References: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR02CA0103.apcprd02.prod.outlook.com (2603:1096:4:92::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Mon, 9 Aug 2021 06:36:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 259888c8-706a-438c-a1ff-08d95b000424
X-MS-TrafficTypeDiagnostic: AS8PR04MB7653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB76534FC12D71FEA519B711D3F3F69@AS8PR04MB7653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcYPwaRO24J8IascH3HPlRatyPHV9T6t0sgG3iWyscDGxGyY8/qIlioMVoU9BUhGt7DT918nKSSzzFklc5I+6f79sIZDTZwFqYAL+2UanE2JiP1jAE+FE/+g85fops7nYKBWAAjLHgJfPdCXsiaHBKDGzYZLH6+yPZgakNQyAjaGd27kPYEfXZFUX6sw/5NbuqAa+/s+Gx+3m7XtTXRYWnrQh2VNBUGQIwsaoqGUSfUgjj/3sMRFvfmFyKGdZkNjsShmD3SWiGBKEMBGStaSvj2r1mMLRscYoKtmjZxYX7fzfjCtkdaEh0zAArAVchASWjBlTY0i2f7FNIBOCjjGE6KA9BfH6YmnmoOt1bFrS2NOusTa1PrO5jxglyESGt9UW1anK5UAklTJzPPOjFek9Ozhhgh6L2iatyn2QR4xdQG4oxMXeVGlYYtxMLJbcd+M+UepkOU9vB50hME2A+7nOS1PrqBcPNvFsDuKHZqxYXjZWbVS6Tj/tAOHQFrJKVNdacGth3MLutLRX1uXmwd8kFiXC+eNK64RWbWKspj7+xCExEfkWNAswA7IY50JGWPft+mMqAnHJ1sixhpZmpyw5Jzx9FVsgxKIxgeJACrVyVDLL1PDgfjviNxlnexRiqLEv7IKOVKqK/2hufr+U5qfdFDNvrEVsldCcAlZ2CrKJEuYA4hkX92vLr1oguhZ70uVmx9DDDRQPbd+ghnIMieheQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(38100700002)(38350700002)(478600001)(86362001)(36756003)(316002)(186003)(2906002)(8676002)(83380400001)(2616005)(956004)(6506007)(4326008)(26005)(52116002)(8936002)(6512007)(1076003)(5660300002)(6486002)(66476007)(66556008)(66946007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUafytBgXPLZkcbqsyJ63MUMNIstaEW4rrSWDzY6aDkyDpoNQbRZ76u0as79?=
 =?us-ascii?Q?CsAoP0PBWpUMq9XcY1PSjiEMrqXoOHdZrs2heLw+n52MFz7AmBOdMPVpRLf/?=
 =?us-ascii?Q?4Up3qX3JsEq3VvCFuMK/LQvqnicanQv+WDlInUhOJfoCU0D9eqcB/eKddfPP?=
 =?us-ascii?Q?crci+Br5I9w7k/lxVYkZJnfT/TEQt0Wt2pmy0j4TFrPG+rhBDyP/Devo5qT1?=
 =?us-ascii?Q?n3hAhbGXYTk19DAYtKGHjMCpOfsPponfjf3ckFW4Lgik6f6IEFoRXdK6Zik9?=
 =?us-ascii?Q?pCTwDGE6K7yL6t+RV+PigApuN3BToERtg27lFP6+X0PMVFykEwUNjiMWdy2G?=
 =?us-ascii?Q?f2VHeoLJT0DI/abTiJgr5jyo1GyzJMj8CTFw9muHgahxGrOj3CUx1boY2Zqt?=
 =?us-ascii?Q?/6O0pQWJc9qzo7DuH3wM0yFuZAsX5KxT6J1v302yz4XXv+faoTsxrW2TdZR5?=
 =?us-ascii?Q?53taYR5/l85HaoRjOG7iPEjGlbM8JKD/1o9GAAL0O8HMdg6NsTKLIQiLoS+q?=
 =?us-ascii?Q?v/fApcMsSTs8hT4Ijy4IHayDYqQZaEXbtf0UJkpKnk7Xt86UGbFobVY1apqD?=
 =?us-ascii?Q?YAIX5+7b1pxi4vpd5lL7GFcf63fshqDfcOrRU3UGqWMtMVHqyTFL1OXaAsod?=
 =?us-ascii?Q?YUafunJje/654MAAmHT8s7nHGCnpEwCoyYSrYxKK+UEmDnJo967teQunELZR?=
 =?us-ascii?Q?DW69LuDQc1r03o6DWA8IZ+7pt1AWo4oWtCv/78A0lCfUvq8GcbVyjD2CTaex?=
 =?us-ascii?Q?JUd2XqclIGLUGAkl4KcnPQcGlnG0WEOeBiSTRTSYOPNVG6ppY6UNWl5GNnek?=
 =?us-ascii?Q?UQZvaqyAd2UtiVLqCY1NEhocNoWX/AnsWZ3+0xchLww6Dy17+bo/A4Dc6Uru?=
 =?us-ascii?Q?Q2Cjot8LU1T1x5zHzfJJogBanM9NhtA37wvvH6ERuCVPfwTZPLh/q8u/s5cR?=
 =?us-ascii?Q?6ganINmoM/QR+mfZsA6XcQBzwj8KbKSGFTeR8JZ2dxvcgXRUw4XcCoEiX26g?=
 =?us-ascii?Q?gX+8C4bct6Ois1ZPWNmXPl7O/xdhETEHnvZ6VuQu1GMe/FFmpnUN3LnHGgsG?=
 =?us-ascii?Q?X+PpBUxt5wg29Q4jOP1zWAR232eMfiuD1GJ0qrLomWmOTfeTgzIr+cnSwkv/?=
 =?us-ascii?Q?7sPicK6R7u2fOYM8GXIQfBT9jX1uuU6RBjl3vgLxKaQTNTmEQkkg4XE2Yx2X?=
 =?us-ascii?Q?Bd8/iMMh/rR2myAjbLhGfDD1+QJarF4wkQi9H9i+t4PBKBwesj0PfrXQTb79?=
 =?us-ascii?Q?iOpzP5DRSf6oKaHI9rDJ1hPOGlOGqlNmTFn0eXvPm0VsSoSsZimvDFDh374z?=
 =?us-ascii?Q?s0wm6uIE7CzDXoMWg0cHoxl3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259888c8-706a-438c-a1ff-08d95b000424
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 06:36:28.0421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mNfvbdmZ+gKDNEhBrY2zcF8+thdMDRLe8xV8YywqdENE1Nbbmp2WvVjLQT2g2P8s8y7R53dgmyJKF93Pq7SQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_233631_307957_1C9AFD8C 
X-CRM114-Status: GOOD (  12.52  )
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

If enable interrupt in the svc_i3c_master_bus_init() but do not call
enable ibi in the device driver, it will cause a kernel dump in the
svc_i3c_master_handle_ibi() when a slave start occurs on the i3c bus,
because the data->ibi_pool is not initialized.
So only enable the interrupt in svc_i3c_master_enable_ibi() function.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V4: New patch in this patchset
---
 drivers/i3c/master/svc-i3c-master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 77f67d407acd..b802afd8eb7d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -569,8 +569,6 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		goto rpm_out;
 
-	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
-
 rpm_out:
 	pm_runtime_mark_last_busy(master->dev);
 	pm_runtime_put_autosuspend(master->dev);
@@ -1398,6 +1396,8 @@ static int svc_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 		return ret;
 	}
 
+	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
+
 	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 }
 
@@ -1407,6 +1407,8 @@ static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 	struct svc_i3c_master *master = to_svc_i3c_master(m);
 	int ret;
 
+	svc_i3c_master_disable_interrupts(master);
+
 	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 
 	pm_runtime_mark_last_busy(master->dev);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
