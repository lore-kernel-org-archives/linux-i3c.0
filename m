Return-Path: <SRS0=stO+=MH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B2AC47E4B
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 08:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E20D61370
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 08:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E20D61370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzokKFv+G22LqVgfUnZTvKa1zcXatpw93ktE9k5eHHE=; b=wo4vw7mRFIQAbd
	wYpo7SWS0J6CWMlQQWsYwXL4frJQ9vCniW4wZ/27JBa2zZmlR7vxM8MxUCIEOmuou37Cggruy0KlN
	UvTqyZhyTu0iZzRfYTwyFjYWc4EHXWpOkaFWaRzRMBzZp/kB50fHImx4fw4ibrgivhqby/ui+WKS/
	pIA2Xgj0TW+wdYhgHAC6HO0dB3fUomk4If3xAnbgIoe0qmoOXHdJZn3Vi4mQpzpcnIkP6Jia47c2d
	IstajtmPqMkuZFG0DMScMXqJbLZBI/ZwLPYos/nZSjLeQv9T8eTb+QIsbLwBOfLt+wNzYf3P/uur5
	DvwOCwQylbNWWxPwEMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3weE-00HUkb-5N; Thu, 15 Jul 2021 08:23:10 +0000
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3weC-00HUjB-54
 for linux-i3c@lists.infradead.org; Thu, 15 Jul 2021 08:23:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmvcfeQegiCYce8UiCBUA7oIiY/jD6PB3UcmTE8mmvATfHzXIXpBIlVnqeaQ/toH6ozEkBTsfZ2lsCLnvabBCBQglDgXyCjFcPck+tqK/es+/h5VvZTlcbb9wBdeWoSZ4XN8YFrxS0+6exBMdruiMrMQWaySYBKtJMW0xtWQbOFOjPBeugdfIo4+BQ2JqecaOSSdWPUMBsdJDAFOSrdInW9e2z8KpyLz58KN7glNPyXtC7lYeacnvsY4ydzDR0U1h9DzI92IVNAlM0ZQPSPc9tyl3K+PpPGmupN78fm6PblVZ1YXHzN6gzXa8X0m18C7ZC9o7i7zqa43iM9eXjavAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erBSRpybdWToV3lNsun9WFo2Cf0m1sFbCCqcTZyKvnU=;
 b=OAdblWFMj+oN0JmAwA1W+w0etM9+0aeuIjyzfI7sfhrFoQth8aTnDZM8nGIktlF92nWlTDdQXOH4TGTz3E7Z/qw6c1fOszQ3cmo9jaqYgWzuOlCBWpD7OQCVfZhb0SNn7pWaDRvdcFRtXTom/+MQA9ojO3D1j6mYHvzZVznFx6SMBZFjqVJXijkIgXQlLVHOdTXRi5gek1Wda4aJK3Xe+GRItwJK/dChwZgb7BSZgoYt7DtPKvnWEGouaztswSUv91S3AblRI9Y3ngxWBaE6M8BJXm2j7B+w7MrZxyrd76QhijK/1vJ2i9YOLkdoFX7+yZwsd0VNk96dIHJQyOJjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erBSRpybdWToV3lNsun9WFo2Cf0m1sFbCCqcTZyKvnU=;
 b=A5ZibD9qMcKVRX3E+yt2eQfmLLV+l13TA0EZPPe5DZ01tzELPDQCRftZ2IC9JgeZuhSaMbx/rBXRmrKkaYaEGDUR4leAjlK2ZG9T2sP1pGeJ5QNDcem1vuzHBsO69T0AIxkJzoyIztDvscY173Od5rIWcgpp8JYLm8nIcRppYS0=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR04MB4167.eurprd04.prod.outlook.com (2603:10a6:209:4e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 08:23:03 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 08:23:03 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com, vitor.soares@synopsys.com,
 boris.brezillon@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH 1/4] i3c: master: svc: move module reset behind clk enable
Date: Thu, 15 Jul 2021 16:24:10 +0800
Message-Id: <20210715082413.3042149-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
References: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR03CA0142.apcprd03.prod.outlook.com
 (2603:1096:4:c8::15) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR03CA0142.apcprd03.prod.outlook.com (2603:1096:4:c8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Thu, 15 Jul 2021 08:23:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c205bb6b-2c82-412d-27a3-08d94769c394
X-MS-TrafficTypeDiagnostic: AM6PR04MB4167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41676D8540250B1842E73F68F3129@AM6PR04MB4167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMsS9bDqqOTF/x87+TkTnYPwSq/+MeNDZi80UWxlBMOKXGdgmQtOsqdq2SYZT9YlEIGQD5SSnrUMkaHEHXpZ38SWbkaHv73aLgrjbV1gfL5GgNL/cq+6GlE3ydEoARwfw5c4uCjWH/tRncxF9AGPnn2vc2veaqabau4ArNykaBRlWPkAjQ/IMZ1UZDoSgqs7wwHsFxEATwVojCtPaHHZpsA8MQJkFqaqlF2Vrk9/+kacILljrkjGXkKs6DKjHs9w3fztI0jN2tY7oIdxiyw6Vy7SsljOQOj01zC7uRtvpcxlrBZYUf6MEMfAuhxE5dVbBLGisLJQp2pea3qCGD4+qyRQkObBM8CvPT6o1vepT3KhNPhIbQz/7fXKbKBg9IahlDteuSjYGwK0z8MxRcUWXJFG0qBZkL/+VROK+/dxO5dcrN5bu7kzxRzIQSEXSssR5xIUPqQjyxCoiLIg6El44h3HPvLvh61Oz1RYoeZLztP3HHf85RqdSjWch7bzc5HvumXfGHQwVLalApzyWC49nFDQhkdWDyi108URlKU8PnE0KdOuX219DoSpBabHG2YbKkhWey8+jfORKkvszIclPqMBOwBPFmUE2PrajNVUxh3oRaM1Tl4osrXqlhsWzytpgi/Yje/GeF40R0qHQ2PRlwj/hoOrvtslsn28S+DMba7+nJUbShheXvKLmkMFmIf2MNhLWQV/H0+E86vqumCGOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(6512007)(478600001)(4326008)(83380400001)(8676002)(6666004)(8936002)(66946007)(86362001)(316002)(36756003)(2906002)(2616005)(4744005)(52116002)(1076003)(956004)(5660300002)(38350700002)(6506007)(38100700002)(66476007)(186003)(26005)(6486002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pd5TAic2DiBUAJLBbG8VVx036QzOJiwdHysVauc+hDFfkO/JoQ7tJn6uq3jw?=
 =?us-ascii?Q?MhdtXjbkoLPCURFi98usUhb2Qx1zDjWLU2R2kR6GKB9DwtmAQj/My+Jw6e8B?=
 =?us-ascii?Q?ZKRKPC/cudcxAtDNShwrG4npCdAnD/Bhdl4Aujv/GnJXtQBv5UKaOLcliYFp?=
 =?us-ascii?Q?0ABDCsswdQVbnZLWtX6Z5QAHu72vSOHoOKAOczgENfWpXggNyOzx1qHltAt3?=
 =?us-ascii?Q?KE+isPSNadnzDIYGaqDLZHkj3WWqx366NsnGquU0tXe6dWjJkkK7agaPQwkW?=
 =?us-ascii?Q?OgNdoPL1yVab6wBx+kQi4gAnLyuwL5oPnktQ111rX1ZUtpB3xotYKwsP+ZBv?=
 =?us-ascii?Q?VofVvqxJHwh1GnWmXycyzEc3nLq65WTWvE4i00yKqeMZIbKxmCp73V72RW9A?=
 =?us-ascii?Q?aZrQWO5wXoDeUOTwRhN9GL1Yqo/D/QD7m/HzQRPUtSwWA609ZNoZx7PvgyjF?=
 =?us-ascii?Q?hk/9JEXfHrCQ4GZF0QOd78QdidS+PFSvgn3NNhYbpUTvBnR4z5P4l8nWahAW?=
 =?us-ascii?Q?nUmB/qqlSPU0gF9AR017Yu7nTk1Lr9JduzpzTooDx2kK0WZU9ImxqmH/79yB?=
 =?us-ascii?Q?xgLc5oNFmk4fvPcZpYCu7P+g4j4smRmVnaH5epfUl6hbmgJSxlm5HfCmHAqQ?=
 =?us-ascii?Q?dld5Jxz49zfjY2Nr2xF9VMD8rp6xeBmQcTncDR2fl7yBglUqtMlgIh4OIbei?=
 =?us-ascii?Q?BL9QtesDryWVIK1j8CbEMXTXrV703L5BR3DR7ZGHBTnr75mgQljiwKOfct6R?=
 =?us-ascii?Q?uDpExX56b3vEr2E5wO8Cy0SALpHPAcDKvDqfKxviqz3ofyGCf1gc1XDEiIzQ?=
 =?us-ascii?Q?QPA/NpTyv5iswpTa3PaLVb7XBPyv23iAaEFOEv+2gM8hE4xPI6f6gavK+xZa?=
 =?us-ascii?Q?gBxq8Lncs9vmtCkjHnmOLq+fDQ9v1b0F5oxRkbZdF7O47UYrX2qJKeZkRFub?=
 =?us-ascii?Q?VcsHLithbS/7eHpqHgV5TcdApXXdGv2KSsCzHc5Gnv40rse84+4MDcYsKnPs?=
 =?us-ascii?Q?PoDxFZdqn0/yPlcpD5WJblNAg98+/7KvRp7KMFgWgYPW0L3ON3dqRJSdAyWG?=
 =?us-ascii?Q?NQUOLnhIixZ7KoDdXTQX9AMm0TkvC57YaXWOqpyv2ReNAPeRQ9DxoMbpVJEd?=
 =?us-ascii?Q?MeD2f1YVvKPAK2RdQubhFIwfZrvRr8uyQvaZ+aN7vSLCRdNf9gNNEmGaY58V?=
 =?us-ascii?Q?VNx6XbSVHh51LmFQhIp4E2OUSTcJmKOlTGB6PC+aoSFQCWOYh+5PjY9iZIfZ?=
 =?us-ascii?Q?/yX0oThz+xzrCSZlLYy6/N6flW1gXpXdunSMe3HZ+QozvHqezE4bLamqNWc5?=
 =?us-ascii?Q?f3nY3gXJZlVEYdLVrmhUoTrm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c205bb6b-2c82-412d-27a3-08d94769c394
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 08:23:03.1198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5RRPU0r/aYUPu6Z2y/8uZFbe6z4K73G+lE9c+EmhDBcYbt6r500Fdr7ZTqiClq3cmNnHwbyfR4Mh7aVscxksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_012308_216911_978C4DE0 
X-CRM114-Status: GOOD (  10.55  )
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

Reset I3C module will R/W its regs, so enable its clocks first.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 879e5a64acaf..c25a372f6820 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1381,8 +1381,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 
 	master->dev = dev;
 
-	svc_i3c_master_reset(master);
-
 	ret = clk_prepare_enable(master->pclk);
 	if (ret)
 		return ret;
@@ -1419,6 +1417,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, master);
 
+	svc_i3c_master_reset(master);
+
 	/* Register the master */
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &svc_i3c_master_ops, false);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
