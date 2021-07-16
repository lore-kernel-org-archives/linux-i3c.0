Return-Path: <SRS0=KHFp=MI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64E6C12002
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CAE613EB
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93CAE613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2HRQZPESA5fmeA2c7tfBWcZYapGZ2/IQkSmxwckAcM=; b=0LM0vryPNL+uoD
	b+eM63Gc0g7zRieQmrUFFXUFgsPax6ZchzktBb4RrWAFKX4/AKqydsrjuwzhYz5aMuiRZgVn/OtkY
	LWjS8L11pd7sMi6hITmYCSn9w6ep1uD9OtrTuXuqnawE6mgLhPr9pzg16zkpZMRTxt0119IwT8zZj
	ppLUpbVXu14nbhVbhpKAxa1Kk3jTqQNuPdoxf76VwpLNkWaunN+tG5/7zBEdbMtp0K6cUP9qQsb4+
	jVZFQvtw4jCvOjdGmTdrgKOzXCkoVCcGRQuhUBlyHtl69aOM+NZjPf8Gw/DIufdAvWj13RuyPLZDq
	ID5frqPFN0a0rs5w+IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Ja3-003rWo-4A; Fri, 16 Jul 2021 08:52:23 +0000
Received: from mail-eopbgr140074.outbound.protection.outlook.com
 ([40.107.14.74] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Ja0-003rSM-D8
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 08:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Drwk+z6QJBfgNTnwnsp3xRDT7EChLnlLKvNv5Ah5JtZpFKW/M+FYgMWJZ/Cv8EX0ME05G3VwpSqEnuqrcUaGOYoy2H/vjCIUtVJJZ2Z9ywDCJ8Y+lHK0FUW5gi2aSDJZbhmrVLG2yM8AmmXKnZNIkxbAls2UKTyX0epiUrgwSQpK8A1sgUYZpSvjiI81yntEyaBdffAYjT20QcMA8U+CHYsGptN8Zxv6Qc493obc9ol+QAU9IE6AXsY4JqS7r6Df3tjzcpaM8zIKjvKV5MJgZIRjtBBj71MkFCfLBrmm2mOXOqxIdr3UfISQd09AxFk1graFhXHnCvTzwwzbnaBOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzNerl5RycHV0szSWiucsBQNntFy6TdjIuRE9P5VxXM=;
 b=PCt2DvuXldYyM20cPnmLXizEJVdvSIQoL5xuFUvGCaoOaFcwueG3oQ0iy7MuP56SpPVsoAf6Bw4Ap8064cWXC6rSd3NAfBmHyvdFOp9Mfzf7EK6s1c69LHd426qKEYWbp59jH+MWzNWQS1ulKs9FKnyt1A5MFNgCulQGkvGVSkTlK2FYbwf4x0heyKHHckGJ8iS1wU0QJuk7aLvvKdG7b7SVy5JNITrwko+F9oc1RLNqp5d1aZ3lxwadI+8w0mwJUj/LeF+OkJSKcMIUtqJwfwbsRDG0VO80pdJ37w+i77xIMj1M3kwsc4vUjWuw3MlCBYrtqcONpI0SfUphoo6rbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzNerl5RycHV0szSWiucsBQNntFy6TdjIuRE9P5VxXM=;
 b=duJn/Qq1UnHYJlr3v07kATju+Bbh9rvJiVvFgzJlLxYEUBXKonCPBMJflnmfvBVC6HTiszWhTgZIGBCFqUYO4kExN6pgzXeO1dJ9iwPK5PnggOL5fUZiiLhb6zdh5868qczdUoTd0Grg0qaucQl/1yoemJ4Wnh0r0Pp6yx5ixbw=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 08:52:15 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 08:52:15 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH V3 4/5] i3c: master: svc: set ODSTOP to let I2C device see the
 STOP signal
Date: Fri, 16 Jul 2021 16:53:16 +0800
Message-Id: <20210716085317.3572224-5-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716085317.3572224-1-xiaoning.wang@nxp.com>
References: <20210716085317.3572224-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 08:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 790100e4-c39f-4a60-1cce-08d948370279
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71426982F432ACD338FCFADCF3119@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eB3AjaBsSU/tfbypnivETYcs6BwoKWE3euNIPQHdHA2zhbU7DUJCnDKuY1+ZEpq2ZmIqSCrGm6Kp80FbQWGRrdthT3/8x/7ord2vRTUnBHuUxbnBumdwFxqri4h9eAKHM3jhJbVO4wPXmyOb4g1YfyGpPS3hAqjvn1wHfUnD4sYNiTYuLeJCMphhbU9ULCY3yztdb9+NfeR6mKosahGHROuq5okfsWofXfSUDGttnndLiK+bGyimgR0n5WyEwzEdNdzlEWo7PkURcq7e0fiNbVbObkOoBqwuJ8T79J5A0iFcrNf6q0n3bxQRhpqY6jX5QLL0HfNqxY5CC7cnf9rN6/3UDLvdWkVgMCLeMSX1Xy2rgWQlCZ5Yz4WavAByQpn+LBhIL2DIdiPKqXlEbMtysl4x/B5Ow7pQ9lSFWYzxQfFccrPrw6Pw8DtnYExfvR8j89jGqaZMH0hidQpKqAWj3uT1knbLtsgAZPbZrAMGQid16tUwwexsB/7405Tekp9iwuO2y3Mxow4O2o2dBqtYcZ6pze7wzV+ZW5Z0Ogv7joI2aEckSqfOwCDwlEw+y/J/XNK7ki3uEGQaQbUVy/ugtwibwa7mKasgB+7TmzeX4cu5nX4Bqjj0jtBmCWl1+2a3YhT+w8FSfxhXDmSQzITr9WW0z2EBSjZjy5P6gzDx6dlUuuVvTsn/MCL79ndIAoIyi/1EPTaIFqiP33JNfEaJtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(36756003)(478600001)(5660300002)(8936002)(316002)(66556008)(66476007)(8676002)(4326008)(86362001)(6512007)(1076003)(66946007)(26005)(2616005)(956004)(6506007)(52116002)(2906002)(6486002)(186003)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/50bgkW/darEW98A1e8lClM6L9Z5rn91vgK02eFQkSDBFnp0nGkdYSwrJTA?=
 =?us-ascii?Q?3oAnyO+os3hKN6FQwXFiPiynrRH7OzNFaUuL78yF8jbPPnL2MZp/wpmNplLq?=
 =?us-ascii?Q?7B85zIPyWNqjifXX0DENhW9hybU4MMDnln3S+x7Ro+aFQ85YTr4emZB6yKvY?=
 =?us-ascii?Q?b2RjdaYYITiEwP5q083vgNMEfiGrBogKO31AT8IHYFrt1ODCAF0MWYsDzUrC?=
 =?us-ascii?Q?+g5MEx9I9SLQRZtBHirPRsXr+9NGRqb+yCsLKcsVPjz4XVy7/cnySr19oroT?=
 =?us-ascii?Q?mmqniIjevVpT3q4X7E/nyQOvfgY/wKE6ibR9l/0OK8uI8SyiziwzjYHWdn0M?=
 =?us-ascii?Q?tpaAbQe7aHT4v6vT2g/WCdHtjxjka3YX5EqHERn18DU8FdwUv3tLghu0Ib66?=
 =?us-ascii?Q?uzyzyLYXarc3GTq7idVSXXqE42+4cbBqqIDFlmK1UIdZmcwyXGdYfiF9lCDO?=
 =?us-ascii?Q?wHS8x4XJsaLcsVeIkLXkg1Jf7bzhUaI/NZGQA2nHLPWdYrlpV0WzvIuwey1M?=
 =?us-ascii?Q?HNOxsn0TIkJtLhhAsk4ionqGcgfiSTKPAIo0aeKFrU7QqueS/HAScQZHGvWr?=
 =?us-ascii?Q?R5eb5cUarWvu58FMb7do3IbeVtiurhJdKkb27SHzGrvQHUyp32nimaq97KBU?=
 =?us-ascii?Q?CNwaVtkFiBac3LvsCAAdu+PaqmHDA+Ci+TAes9TUfva8herzYe3CCjxpHCZg?=
 =?us-ascii?Q?uQA53bx2RDfFlSYa3wnAimCjhlmBf3rNzQ2YPBlBnw5m+XwO2D8Sl7EZGa+R?=
 =?us-ascii?Q?hsKgMRMQs6VVJsdKKkCFrf2BVo4ziXHUwfrFotBt3yiafy6c1Z4ez1ZnWcF9?=
 =?us-ascii?Q?e8UXwJpEcKM2C80CsGeQG4ZaIlGrseg3NKzEOT7N9xi17OrHtPpKYziT1WzI?=
 =?us-ascii?Q?5dnVfX8RQhWORWTf8clfGz+QEJPptaqi27YEsu+TYUwmsvlPuKBEza2JdY7F?=
 =?us-ascii?Q?+vnIqsJcEMNOGg2DTeIz73ebugA5f4E+Soy7hfWkxdZiifX17jpltXMxdhjK?=
 =?us-ascii?Q?ABevmoQeIGzu7yzg/jRGa+sNW4xyLqsm4gH3VHhDQc5hijKlLGv0PnyAO8Ro?=
 =?us-ascii?Q?btby6eOcH9TcwhOG+Dfr/KowoWHZ1jP5foUz7F0LD2v21wpjjf5V7ZmiEvLq?=
 =?us-ascii?Q?5Tr9YlOe0dL1i7ypFcc5t333QIEUtxLxjyjCZ6390l5J/5DsjfsjZ6k9lUh+?=
 =?us-ascii?Q?IIFm3WFVglUJcUQxBKnTkaxv36xFOqfoeNrhZi9mRdlg4GdHl7t2RjyHmP7f?=
 =?us-ascii?Q?gpaYEn2DIaF98PXxWfq2FD+iKkXiceM58WAY2CxqQV5iZajll2tMgxaZuBRU?=
 =?us-ascii?Q?ukD0fgCWOfDry10cNPUtUDQO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790100e4-c39f-4a60-1cce-08d948370279
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 08:52:15.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYBRZVzaO4Enol+cksOBuJ7XxOAn+gClKWf+QvgCTGXiRr4/2u0Tx7QTqculdesFnBF7h0M50/IwYJVZaiRnEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_015220_468934_19E93A79 
X-CRM114-Status: GOOD (  11.88  )
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

If using I2C/I3C mixed mode, need to set ODSTOP. Otherwise, the I2C
devices cannot see the stop signal. It may cause message sending errors.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
V2/V3: No change.
---
 drivers/i3c/master/svc-i3c-master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 91358cc5ca07..5677b5b31a86 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -449,7 +449,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	struct i3c_device_info info = {};
 	unsigned long fclk_rate, fclk_period_ns;
 	unsigned int high_period_ns, od_low_period_ns;
-	u32 ppbaud, pplow, odhpp, odbaud, i2cbaud, reg;
+	u32 ppbaud, pplow, odhpp, odbaud, odstop, i2cbaud, reg;
 	int ret;
 
 	/* Timings derivation */
@@ -479,6 +479,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	switch (bus->mode) {
 	case I3C_BUS_MODE_PURE:
 		i2cbaud = 0;
+		odstop = 0;
 		break;
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -487,6 +488,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 		 * between the high and low period does not really matter.
 		 */
 		i2cbaud = DIV_ROUND_UP(1000, od_low_period_ns) - 2;
+		odstop = 1;
 		break;
 	case I3C_BUS_MODE_MIXED_SLOW:
 		/*
@@ -494,6 +496,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 		 * constraints as the FM+ mode.
 		 */
 		i2cbaud = DIV_ROUND_UP(2500, od_low_period_ns) - 2;
+		odstop = 1;
 		break;
 	default:
 		return -EINVAL;
@@ -502,7 +505,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	reg = SVC_I3C_MCONFIG_MASTER_EN |
 	      SVC_I3C_MCONFIG_DISTO(0) |
 	      SVC_I3C_MCONFIG_HKEEP(0) |
-	      SVC_I3C_MCONFIG_ODSTOP(0) |
+	      SVC_I3C_MCONFIG_ODSTOP(odstop) |
 	      SVC_I3C_MCONFIG_PPBAUD(ppbaud) |
 	      SVC_I3C_MCONFIG_PPLOW(pplow) |
 	      SVC_I3C_MCONFIG_ODBAUD(odbaud) |
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
