Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3335DC19F5C
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIMR/bXyQnQ4mJZ883B+mNPLevm9ReTRecLnSyDQlv8=; b=bC3KEWAvRuXddb
	FBNg+R2/j71CeULeqcdHD8000TQ/WFAhJYeR7mbIoUw3sK4BTnbGY/vYfe+JjYN+0spHsG2w7H797
	Rza15M3C108S0bnz/yVuV4kgbNgigWhmq4fL0lc8M/GJQ32HjBED1C5hQDD3OERnbryU3N2AHAnzf
	GXZ5ejAMEGtaHu0o9ZVbQiLcxSrvvb1BRpK/caoQcncojA9arlvvbMZPgw08oF/nQEOQZ77g93oCv
	yFyEnZxD/uWCeIges++BD/WQIOPijDgqRghAJd4ZIOnrSc7573tVdK6Lq6efb2S9nHZhpJLKhxyeH
	ANwS1jupvn4xtcGGH7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtbUl-000o3z-2Y;
	Thu, 19 Oct 2023 22:27:59 +0000
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f400:7e1b::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtbUj-000o1V-1g
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 22:27:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4nPIyTpL6vRNo2Y8YKMwXTmAuODuCsK1o9fzmDLscEEZ7/2jReIcZjlSlWy9eOiE0HZwRDLkqeZveH3jwgh0kD8fCM2/4mrlBDWiCE7gizJjEaF41h3A0+CLwUdlJP7216CQlmVc6RMYOffF0mmP1O568NCuSZSJafsGJYlExiLZ/Dqyxn3u6ap1HJ2D3RNAXbPubUKQzgb99lE+HU9Vg1nPXr7pMhlrWTbIQ34W4Vvh5P87DVGpX+cPKVVm9UrpfK3uNYt8weiA96U1cLl7Hkgiui+SgKwGoDtpOCAzDFiBuWK+CYntXdrMkOO5X+gd+adXzBiV9cDinL+ik3ugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaaZQlXiW7kkseAwbfTJKJ8ZOrlWG/SQe5iwfmixt5k=;
 b=mwg600T4Kj/zxFtOijBoxOv9kNcHd63xsJJDKYm9q5+Igfh05w6ntcjt59WpSZXWtdWOYJPldn67NCR/XbrSZp9wwiDFqC8i/s8AaB82oDQSy/Uq2ZGKNs964fspXoJrXn2dlyIMJqOrzcM92BbTsIQyGEjGWRSwTgX12DZKe1QrRuvTqYIiUcHqEy5xsgbIONEHUCKmESnuw879cnGViO6Wadz6VqW5Tu68De0SChB00Ab81aVqKFDkoalBJvaPa9kLlf8sgfXARV59GBV0E0XQTA6LuzQaabbbdA8PgRHmQXs2iRRMHoicTrrbafUDUTbpYwu8fP2k2s7IMzgntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaaZQlXiW7kkseAwbfTJKJ8ZOrlWG/SQe5iwfmixt5k=;
 b=jmzsJVZwcY0ck00JSHY8yKuue9tROLhTp/8KbuGIwI1xOw0kF/aTMDo4ALVRUFsXVFsZtmRueJPsCJIGCAFkqbdGxn0pmljVb3ae6hl51vzbfBENkuB4wqRENYKivE4u2C34TVS8U4JbZmYNytNachgruIhlB/2gM2SnS4kR9e0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB7708.eurprd04.prod.outlook.com (2603:10a6:10:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.10; Thu, 19 Oct
 2023 22:27:48 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 22:27:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] i3c: master: svc: fix ibi may not return mandatory data byte
Date: Thu, 19 Oct 2023 18:27:22 -0400
Message-Id: <20231019222725.3598022-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019222725.3598022-1-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBBPR04MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 115c6ed1-1266-4c36-9333-08dbd0f29fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2cYcjdrFfsAj4hiBkXqd3HO5ayqP2CdB9/CAbOwZmfdT1R0N7SveyF75QY5Rfedmll6aJArFhjSYyUNBWiuHspUIBsKJSfIht5NhtEU6okbQbsSzAbcud31hRZ9mboK6YU1a815quzYSFu4TW7qzPhrarpMtpoKcOpJsJEAu+PFutJSN/uAg+lNCbDqaJaMHZtbZ9VO45f79lqZaYyXBAMBi6LaWC74erTNX3iEe9IWUyLoJZKiJCPMycUwGBxINN526SsH73w3ZIsidHKAlpKbjQsN9Th9SRBuiqI1se7pLtwaPNN3HmofKmJvPRgdH2slVdGLJD5ZRG2tQZXPILCA2PJiZ37mUc9nxMQVWgGrrePKxsehfYxBeTrXCdIHYZ/WUo9GkWJ++lEhfKy4cBJ/A9v1p6+3yn/0EDBLzSj335nVxz36KxbHVqSghIq039DdLf074spbXulHDEQP0xJxZXrGKnUoBfQqeMQUbZoOQevv2y4H1nL82EcCWYMT65PJVzl0rYRzj4ZforAmEhoQRV5eqnRKBwJ9Mhb9OQeKcSC7IzDvnnThKgLT/46kdgLFObsRNLCosH6+xmDLGAHLSJGeahbSMUnLi7OZIr2BJWC6acUEnciyPWJxsr737WP7OJNvLVe5PW/S6VxSF+T0a/EEG1fk20z0HAk051U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(83380400001)(6512007)(38100700002)(478600001)(36756003)(66476007)(66556008)(66946007)(316002)(6916009)(86362001)(6486002)(52116002)(2616005)(1076003)(26005)(6666004)(5660300002)(2906002)(41300700001)(8676002)(8936002)(4326008)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DLR0ZEAy7inq/tfBOC13tKchDd4vxokzqAdbfDuOrVdusaWrNzlWWjyLdaks?=
 =?us-ascii?Q?c7kivxlKDktE7FqlLb1kPUKLnJasi2TeVSmO8/i2IayGKdirL/ZpPRDiR+7v?=
 =?us-ascii?Q?xAWC57mOOPvp5V1//9vEVvTtERhQi0FqFvrBKxvr2Im1XDGtjoa0UcxdxTbL?=
 =?us-ascii?Q?XAWEULsVizRaiH6dFa4d8jCYdDz5EO+3MacTyuJvTmn5eAE+488lDmVaJdln?=
 =?us-ascii?Q?RIfcmibec5MNPFnRqUTOahkEgOUK2u0CEazjWi1B6pfHChpMTRGWLWlCRLbE?=
 =?us-ascii?Q?2SjCfC1M5L4hkcGVfDuPkQYsEsj/HkoTVudYvF61Z2hGcUigdzoNcbwBIAKb?=
 =?us-ascii?Q?CGgA5llMyjSRKk+wln86Gxfq9oml0c8TMNIprZmjXEhqbIVhjeygTDZBIJ+u?=
 =?us-ascii?Q?RxOEQiMEY7CEFC+gCVnqQ60k/PU4G4A6SoS4TSEc1UnNcF8EsIe9eWgS/bIo?=
 =?us-ascii?Q?3NmUyGXVrKZSL8KzSpPJMhp2haAoeVrVl+Z3ubJ0vdYHLAgK8/4fhdhSfRtZ?=
 =?us-ascii?Q?aK1HwRTqsnFj2fdzEx/wq99/rJNnKkwTQcxjnGJfF6FSpP6PRsw7uQAucOek?=
 =?us-ascii?Q?vMuA4HFgMZoMxrrMpiLAjcTtB2HPbQTUZM7AVwW22I8qWTtTXc2o+udZtpZ0?=
 =?us-ascii?Q?XBD1fGgXv+uZ/WwhO65Ny8/qs3Dwk8HpABE32dXwjhtCP/N8FPBp2kH8lXW/?=
 =?us-ascii?Q?K1M2r5MYu8WaPJjt5BtOiqCVqrU9any2/FIXi3/DrBoIj/TC/D83c1617CqI?=
 =?us-ascii?Q?p2N+A6KX9IY8g24KLPEgq2M2XxXAuQjDYVkaAyxAsNgZbLUGOt57Iy/SL6/U?=
 =?us-ascii?Q?5tl1Yh3sAJJhNmogQKx+m/r3GmNQ/WoLH39pq2+s2lnj23fCfHqk8BFxfxac?=
 =?us-ascii?Q?SOZl6Ixy1jiH6Qmf4/Ee6Ow7FfNQnZ56jOhPCrtp9AQApDV8WZvOCRzlQtre?=
 =?us-ascii?Q?XVqEkCp7zaN+A4T3tP8oRvaHPirANLJ9485Yatf67g3TbD91qTGtGJZRt7KP?=
 =?us-ascii?Q?Bhsd83zG55Z3NaLLLYDEV6iaJnkLZMlGXCGp2DWM5wAtO32WjCLrnJWf7xni?=
 =?us-ascii?Q?eMLrqQCaw7ORKz8E1rBisEAGuIcIABc7R9hk9qFRT3xXB35lfT4Ji8mlwjiZ?=
 =?us-ascii?Q?loLNVUFZiZuHTFORUcj5oCxefyxcyskQpTUxG/RfN+yXYzSD7Jo+pTt34XqR?=
 =?us-ascii?Q?aSIDscfOLXUmlUuXCXmeurSMGmaPB447NkFnr4nEueAHKMi64y/BRr/o2TFk?=
 =?us-ascii?Q?/Zbw+3OcdsYMenCNLkicadDzU4j/TktYk9btBqVTpHyGIdvOGRgoBYHcgcq8?=
 =?us-ascii?Q?TZVghxel0YaasJBeOG5TnH/KF5qllxMO6HI7x/bG42O5AbMrT5cebFUBXaqq?=
 =?us-ascii?Q?f/M5lHpBeA5mlBwecdRm9ZHUuGr7/CtNUlKLbOcqGRC2BAQSzb/XtL+4OGk0?=
 =?us-ascii?Q?qTWaaUrLtBQO7HraYoilElq5+qshBLs4KJkof7SSvhLTLSSAK+guVT3XEMRr?=
 =?us-ascii?Q?g8YW0xTPy6gP3DISxK5F2okJunHQKRlsaVXInEPS7BNMQSXIk9CKZAv8XMvt?=
 =?us-ascii?Q?wN7HdkcOdlZooih75mw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115c6ed1-1266-4c36-9333-08dbd0f29fee
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 22:27:48.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d0qLjDjdqwt1obCtePu8p7W17LBtjxdvZFxvQgo23yrMvC/iGNiJsaT8e+5PMpnhtF32UvIp4n/pyvZBNWUvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_152757_560396_D49CA93A 
X-CRM114-Status: GOOD (  12.68  )
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

MSTATUS[RXPEND] is only updated after the data transfer cycle started. This
creates an issue when the I3C clock is slow, and the CPU is running fast
enough that MSTATUS[RXPEND] may not be updated when the code reaches
checking point. As a result, mandatory data can be missed.

Add a wait for MSTATUS[COMPLETE] to ensure that all mandatory data is
already in FIFO. It also works without mandatory data.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
    - update commit message and add no mandatory data in commits message
    
    Change from v1 to v2
    - update commit message
      it also works without mandatory bytes
    
    Change from v1 to v2
    - update commit message
      it also works without mandatory bytes

 drivers/i3c/master/svc-i3c-master.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index abebef666b2bb..dd06b7c9333f1 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -332,6 +332,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	struct i3c_ibi_slot *slot;
 	unsigned int count;
 	u32 mdatactrl;
+	int ret, val;
 	u8 *buf;
 
 	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
@@ -341,6 +342,13 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	slot->len = 0;
 	buf = slot->data;
 
+	ret = readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
+						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
+	if (ret) {
+		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
+		return ret;
+	}
+
 	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS))  &&
 	       slot->len < SVC_I3C_FIFO_SIZE) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
