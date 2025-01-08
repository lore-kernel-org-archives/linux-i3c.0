Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12234E77188
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jan 2025 22:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qu+8tWW9YP4axJWzlzrEUUaVgmHCPL14TuP0w4JDT6s=; b=DcT4OB9LhN2fAQ
	Ns4qTBQ7CSYABDB111d+yCNXkz/n18OePqgFOIScjlMhA8lzfEpXtaXm/AFg5u7ix+G6znTI8ipvY
	yiMaGiA0XAkOvPxV8mkOcNWBaqfxHHa+8+IQY37P9exS9D5PhFhWWSLwkZU74WJBq/O7LowwoXJfd
	S2iUMJyr5+Q1fhIB03vC5iNGAK+SxwBF5DRZMD4Gj1LDKrV0MSZ0y94s1YZ32kbqkiYTPbwxXxIy+
	8l4NAFpViKuxeRVK3qIpvWZIKNMbvb/5X7XMICb8FLnyRZ72TNgdeaWHs+WNdywzv4FtnNgWJSWfm
	VID2zH+0lAn3+rw4k2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVezu-0000000A6Hy-3Txt;
	Wed, 08 Jan 2025 22:57:58 +0000
Received: from mail-am6eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2612::630] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeyd-0000000A61i-2Ikz
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jan 2025 22:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIeTvU2M2JucUxQZ8HcAge7bHMszXDHmfFOXyviMyYnT92egEAO6VcjKwTaG5pOLezFbWH1aBaGPM58g3BEEuOv83aNIHexzjBdU69g6Le6O3b0YiU8lasdxnXAR4nDAh7PKzeVJo4t2O5o9XODE+fvdi1HS3i5ZZ+yFdd+sa2TGfRIGZQJG3fkKjOwbvPVLgttDeGQB5aXAGAhMKiacEsZTwJ/uGIwA13OZvwZ8eV97AqJ+A4TVYoWhvx4egQ06W/o6V6TjyOcWCoJCRqbSVbpdXhlaw9inAP9mWCOPus2fPNMrJ2iqo1JoPMPLxCtNUG8hEJ/5jHVcBWZH90hAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU/DfcuvPq/oewguk9qc5sNyWJt6ifirB/E3tdEiLYc=;
 b=UhqmN0qoChrwdnmQBWI639AVjC22qfGR2zlg1Tmln3ZBQg79kSaxf5vsqudGEnxUihju9NpHvpZYkWHlbj6RbQo1W1OS+77wUx+riXl45X9P5F6DEazNcDETRzGn1KctV598lnLHlYOmZk4K1x9N0FJwpMajHrtMMZYPDOfR3Tlhu3ahP7182sq/7+Gvx/xWib9W3odIcom9tFnr6S8dzfBDpn3u2dQnNhLRbyF9u3PcR5A0ti3YxsGi0pXc0bJ9Wa4OkH/9hqi8svJHmPr/lhAjZCj7lsUllWF1g7l8HKZga5LfPRRyv8/UJtTiBuAy16lW4qYYSeLuZpfDkqjTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU/DfcuvPq/oewguk9qc5sNyWJt6ifirB/E3tdEiLYc=;
 b=gj2DFCVKrFXJLU9TA+vBGrIXOImTEKz57bGJVvj8banH1tVw16HkYzEhdVt7xX0QHBdeglF1MnUtIRsfHPhbKJo0PTKa8De7ihJhlVfnuTI9y3DwdAUjMM3rgu1LtTqcnsEKwZBkZRsppL/NQWOiS3OPLnuxppBT3dZ3LSUY+J0ZmEi0rOjYjSIqasqt98lLWaB5amU6KRP7GfvqSyp+cQtNr1x3Oa0bqKT7EdQjhzJvazraaKSfST65k5yjDFW3U1SfnRV5TIetZqyr/m5bfJDsa6PwoZwrUo0jxwuCdGBK+kCDtTLvvXsBHxGukUGvGyKjW4oZ7x3jTVyH0Zwngw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7201.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 22:55:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 22:55:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:I3C SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in set_speed()
Date: Wed,  8 Jan 2025 17:55:33 -0500
Message-Id: <20250108225533.915334-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9381a252-9c7b-4800-c1f2-08dd303798e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qS6Fj63TEi8MSRHXdlBxMGCUpJYLdpg2E417NoGporERtfM1Sy2JLoet1VkG?=
 =?us-ascii?Q?ZNzgjSmKkw+5KSldV+UyQrT2AHsA61nKAW544KWBPFItH9lmNiuTyjYeyonq?=
 =?us-ascii?Q?lIWofq9XwSgKvjZSWuQxgG8PU46f3L89vH9mqeOyrtW3u/n77WeaBmxgvfuk?=
 =?us-ascii?Q?YYRpaMMQ1SUcQOAORMw2raXF9KuERIFi9Qa850mjz+z4jr+hBa8wqSEILVaO?=
 =?us-ascii?Q?mrnZH4YxUmmOodcWFrPywgUEoGJDrYQ5deHe0oXgXojDHULcZ8hFYaBOlgoY?=
 =?us-ascii?Q?hmEpgE16zwks3HJkW1wFsT5C0gkr1oqMc8Gv0ALuRmaVoxS+PsBiSKe2o/j7?=
 =?us-ascii?Q?cpdXJ4VRpleBM+5vNVxb4KOy1yCiD5GY7ZixGco3jn30hkzLgX0QhzYaGtJd?=
 =?us-ascii?Q?jNqGvTeS6QQUmXTVBAIhF28Xt+Y3avtwU8T7s8fgr9dPKxcqB1prWKt+ps7J?=
 =?us-ascii?Q?7AoDPfSj638MPZaCiF0g0/uJkRTng1PAAgkm9vuOlMpSFPIQocPtBmsJu90q?=
 =?us-ascii?Q?5UG5TC/XZ1zV9MXXMwsasOerqUBYayx3yKx7FlQF2jsz83i6DJVzjDCYOL9V?=
 =?us-ascii?Q?KpS3oiLikSQO5RiQtFPdL1bTmIx+gHDReSzSzw1ApDI6Jx4XFvx5H0JQb6/g?=
 =?us-ascii?Q?AwcxZdew9arAAFTFR2rlrlMPF+aeZa7U0seXhh9T4ZYqyC6TcEabk0QIptBW?=
 =?us-ascii?Q?GX+3iaKsetFyXF7zDUf1Pd31gMOCwHJCkViJXiARkU5MDZmFoDot45IwXgPf?=
 =?us-ascii?Q?SoiFMy0YXO+pxz9lsjUwCmwxIdbvwIBsBELoqB6XKQE4eu8xkl9KTldwd5+9?=
 =?us-ascii?Q?G4C2GTlr2R5VkM/MZLaMQLfLgQ0WRWvU0fSNOaX6w3FByjDg7Og+wMV/BwPJ?=
 =?us-ascii?Q?e67CWhpwqJMRsJny4xEnowk5UR64eCJHrYzqbmnG0w7s6F5ViNrNOzcLJc3K?=
 =?us-ascii?Q?symSpQHhDbTa8ohbX3xSOJ4eQN/sPqH3B3VdRzYPT8MR0kARu0iNrzIYG3Zr?=
 =?us-ascii?Q?OOR4EG/gfIlVB8l+EQQBGgXBHlmeponlIgT+uIXNH4mXYq2GjX8vdZbaX01B?=
 =?us-ascii?Q?njztgpt954m1q9/GZLJDquj0430w5dWQ6qgBANTjsUD/2uhSVVKVPwnhRU52?=
 =?us-ascii?Q?1lcTORM3vEbjIEDakwOh0itRn+vyGWqc2vk9i6kUr2xvQ0YxwerCwuhiQaiu?=
 =?us-ascii?Q?kuGrDqeblRmM4gQNQVFUGfu21QeEOuJVy8PUT0bzBH9wnCRLafBiGW2/GFCb?=
 =?us-ascii?Q?E8zgYJHIGv6fnD6RuU6xB9KpbFumgcMszEpxiyuu46A+Qz4hDvTmCE7x+qr3?=
 =?us-ascii?Q?rNw6ZrXpeK9RLzgHCzmJ1z1D6A3Z6pet8V2pKNmgSWA3gwq05h8v9BjdJfHS?=
 =?us-ascii?Q?Hr5Opa3A4cGKeS2WD+XEkB6mwh9wx6QUMWFGKiMIP0tuWxUMGPFS6RIXgEXB?=
 =?us-ascii?Q?PBUkHhdZ5V99ip+Rx6kU4CgU4s2LB6gl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDx7jxxB9Pib3d/h2ZDLQlV6gZabdTrg4nZSWzKtbzbLLbHEiR/6PtZ5x/is?=
 =?us-ascii?Q?dNkV9BUjfOxonjNKUVbEsp0/Jr2wn60FxvAD6kXnsXQZ8CbRoIXh1arbDp3P?=
 =?us-ascii?Q?8DvOLrcJrwWO8oqkoGjtUWwr4Xdlfy1idIEJxl7tsrTd/88rIjc2WsGhHl/a?=
 =?us-ascii?Q?WBdS4ATYHsjOlGkgC89VEerNOT+AAso5iFtpvxAkIWkfkk3oBO62c7GHwmo9?=
 =?us-ascii?Q?41qzFsPAyrK4eOLqSqtEOVgKcTtV0Ub2jXq2ZONhhJgS9aYqmDWU9VJgDXhy?=
 =?us-ascii?Q?y37y12hIPo57d6WyRe8CLieKKkw9WCMEEsvdhFNc0hRZyzeYYCJhIQV+ayFK?=
 =?us-ascii?Q?ro7/GEIP5gK3QvTNE5IQYQ/rwvJUvAzgT4QPTYnp+1nfQGmDlbS3/p6yKB+I?=
 =?us-ascii?Q?obKAjmJp7r3V2CSb1BpCknsw1hhJ91WOO/jXSpmJuNvU3Gchddr1tjp7pMQW?=
 =?us-ascii?Q?DcIQ9XI27CRvA1RRa4QbXvVJZ3NqcweWc8UmpvMEgxtpNzbFFYwncHUD6exd?=
 =?us-ascii?Q?fZZobEXsIWqzJOYuxm7GEuZn3tn+wTJjbFd9suCm1Yg7JmI8mufW8WLbQoqM?=
 =?us-ascii?Q?bkZsaWRn55O0yzCJHu8v38v8sss8MLD7UtFK7ACJJsdAegsT/XbkpHDzPnsj?=
 =?us-ascii?Q?FKHFod4zUrkGE2qAuY6oZpAXcNqgVOsqBSoTXckSnI0eRdw85X6YPNQUF6SB?=
 =?us-ascii?Q?iShwhrX/jw5XdGantOlxHfoUhn+q+SHZGQ9/2I7tmowHfk1ScVp3SN7SHYCu?=
 =?us-ascii?Q?cp7+qGrHMRoh0Cqoz+Ism4F2/XweS5YZ+8Tr9OJGcr/DR8NKXD0R96QSzfKd?=
 =?us-ascii?Q?2cAO34AbOuxx+nrottCJtnfOUnvz3Kh0wKp3TiJ3PaYr4S5oc92Eot/fgnEc?=
 =?us-ascii?Q?sValBw0Ta303cNvmkaN3rwzDgctQmejFNvqihiBMILR5eFLe2f+eV19msVlZ?=
 =?us-ascii?Q?8xF+MZh+Cyk+vZqtHMH3m7AMFfGaINfjhvl4/Uy1zcOj0sNW0GU9MvZtx2QD?=
 =?us-ascii?Q?f0Fq9v+GyX3FbD5yGcpX0lyFaG5bJDCxjsbfq4c3nCfitayIEU9bo1vKiMq8?=
 =?us-ascii?Q?ROi1b3KTgJo+Pwc7/my9EIleDyUxJYA5iSJnVf80LUGJF5UARbhxE85pX79x?=
 =?us-ascii?Q?z5bM/3XX2ytjuuq0Q8jeO/S5TGCSkqvP4URzrunupdQNsCAFM1gb3Y76Lzx1?=
 =?us-ascii?Q?SMNf0pyvvJpW2JEurJgQPJ2lL1ZT3c6Mz+NzW7wAtBbApE03UawQ3v1T6wv9?=
 =?us-ascii?Q?qiKcWUaKrux9YhJm0de56CkjLrNco3aRqBiTE/8YgUJJap+tE6HMSMXOvcKt?=
 =?us-ascii?Q?iM8KVLhlUy65vW6I8oBKbXvNAUGdVghLSLUjeORBoi8+IMzdvsyuwyPUFhaQ?=
 =?us-ascii?Q?dwYUMPxyMn3mj5TkaiWax3/NiLWALEVytMj1r4LWu1r+ZwciAnFJGqAxXC2N?=
 =?us-ascii?Q?vRx9kAqKppeuTRnk4vXUfxwKIwCrqaNU+R2w5cVj/16TH94LKwFa0AakSv9o?=
 =?us-ascii?Q?WVvmQLZb4dAwSA/cFDr4+tZwd/5iCypPumeWcgcppFvbqFQsG7EplpJ+ZDHz?=
 =?us-ascii?Q?Iuh5vVhG6P3SFGhSBe4avxolCQkH4J1uFLscUEH6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9381a252-9c7b-4800-c1f2-08dd303798e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 22:55:50.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtDHRVpuHF6rYotWbKlm1cyiHRkx5YUDLs7AxquaAkyxCpB2g4HxKeiwtzAoZP9qyUYaeOGJSCiaUW6i621vig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_145639_583978_3DD53B4D 
X-CRM114-Status: GOOD (  12.44  )
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

Fix a probe failure in the i3c master driver that occurs when no i3c
devices are connected to the bus.

The issue arises in `i3c_master_bus_init()` where the `ret` value is not
updated after calling `master->ops->set_speed()`. If no devices are
present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
incorrectly proceed to `err_bus_cleanup`.

Cc: stable@vger.kernel.org
Fixes: aef79e189ba2 ("i3c: master: support to adjust first broadcast address speed")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 42310c9a00c2d..53ab814b676ff 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1919,7 +1919,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 		goto err_bus_cleanup;
 
 	if (master->ops->set_speed) {
-		master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
+		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
 		if (ret)
 			goto err_bus_cleanup;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
