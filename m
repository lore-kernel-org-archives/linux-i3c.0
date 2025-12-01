Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9329CD116F3
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzqsMLwAhJYs0shOEkSKl0nfSYqNhxJtI9wL2NWf7BU=; b=xpRVAyLjNm9tDe
	CN4s5iG+tUAO0/IesRDzzBM6iL3N+JIzDC3Zdq7VUP4oigNc4WV8PTmuyJ2rSTVtXlAfXP/m6Memt
	bEhdekMeq3LAOrmjOPfp/gCoT3yJ272jIKfTSRbPeL4WUZCefAUC+iYRPCCe9zU3OUAsv7NypQk9g
	ZUGnXiEVcTVRUgOHIQAy5aKmtHOFM/u5th2JDwiDzQR2OTIYMMZBOPpm8vVnPFEu6lOTOBFdSSYd/
	LbPnx41g5CzToOjrThl9zk5RSkORnaumtYFJ1HdjEzbJZVUaqJamjHuxUnoFtYSWWr1VkD5nks20v
	a+H9ZilLBqzvNlbmyImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeL-000000030iY-1PRU;
	Mon, 01 Dec 2025 06:44:41 +0000
Received: from mail-eastus2azon11010056.outbound.protection.outlook.com ([52.101.56.56] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeJ-000000030gH-19BA
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 06:44:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyOlrl2avV+q1B0lNa9HNlRRnY0/j0S55ywcXBZnnzlgqHrODtPdm2R5/03MXlQeoVVbn5nSjtmkQpZxDay0YKE6uWoK73Z2TmAN9bCAnZhDUFqfwmOv8CitFe0Ktehv4iCSmh64zon+Bo1IccRmPq03TW7qDCI2CYwewZxBKuXLLtX2lNl5Qb+sVohxt4V2OQI6zu7b98rYSllmqbt5r2x3XpoW/2O3HmIUmJvo2w7Ekwiy+ZNZE1o0WDxK5jGdhiIdicwLwZ6eQ9ozuYhyjzu01Y1JN88nTuSSlm6sUVJdzqXHnt4Y/DOxsvs2eGVMH+ErXDF9UWJu6otN1cUd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vUbZlWGfHDFWkbbEmXNn616B5NaiEuSC9imT6CS/eY=;
 b=qRMh9QzfSEodPO+EOAMQlxylh5PaTVcJbLbmDUd2HduwzWDJArFKPG2hkbJFpGTDomSqpi+asXpx5Vtn0M73mmuKUAZPb4cGwnQ6KdP/PvW69EpxGikVB9wsTbLjmjaWLGQDUGsitjGbE2bVOyWwfsYYO97rDKQz3r3+Gq+Zt9ljc3suFiC9I1TdIp8QQ+AXtaUE6b/iU/iEinzYKdMTPmLbfH9X1YmTh1e99pNpi3cXL6c9+m9Eh5wHDv+uA6iPH0reRXiIGa7bMeWsWmQPx6RR/3SZCdHsiuRk2p5Pnctlx0fusmC778NB/uIsc7Nhge3a9Fh3Ne18XK6x/h3K/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vUbZlWGfHDFWkbbEmXNn616B5NaiEuSC9imT6CS/eY=;
 b=O/88dGV3B/H+n0QAqpqgoEOFh0vRbDYg+pFiGcPcPD/z8GAE8YQZ8X8OSJf65a6SayDgnv4RNOosFOEGg4ty0VtLEEVxoXognI5rbIU7SN0hlrpGvDaJXFB/2SL5NTcP9qSEujmfPaZjVVRb5n/Q4zEmsdw0kgKmg7rq29FsxNuDCrZqjImJl3YMvKIfKVCNwQPRcO9QIsN9HxCu6NptfrO02IjFrMbGQJ0WsG3VoF5N6LnsHEDTigM3UXZQZZ3Pfpw+eRupIc4UiZM8avJ86zh4q1/gN/UHDlBKCrxAtmrMoeQUcIrHdAYSA6Xrq8fJAij0QafCOKFqBQVuZzalKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:44:34 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:44:34 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 2/5] i3c: make bus maintainenance lock helpers public
Date: Mon,  1 Dec 2025 14:41:55 +0800
Message-ID: <64d97386e65f48b77b9f981589c421fd52dc4973.1764571045.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764571045.git.adrianhoyin.ng@altera.com>
References: <cover.1764571045.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: b01a4b17-c844-4f44-04a9-08de30a516b0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?17AMpymRjXv8uH9Zad6e8nKLUmNlBP7TGctobUQRHBIIGtSfXIn4KJNbEpzi?=
 =?us-ascii?Q?7TS0nI19WW8mSjWdH5vPtAJiAjoVPHLB7FmT2uUCl/s0yZXKkj6FfwQOFjPT?=
 =?us-ascii?Q?/0r7yJSzDxCx7SMrKOPEpnkXJnFSj85Xa/fwOaOdpQJ74klAwlqHgn7SbHYH?=
 =?us-ascii?Q?tiMWdfEQ2t/f9CqjUWqJ6GBWx05u9UJfuMGaRow5dP2odn2CmMDE47o1M6Mk?=
 =?us-ascii?Q?6MGiTtbk1uq9VLLLDBoSuhy5Bl3fOK/sUL7a4vG+0Id4pwD7EsKIYLs/SBIv?=
 =?us-ascii?Q?QUqMHj0juOeI8H8O9GIbV9RkbII7Kw/QJdkuizMIDN+XU7O1SwKcF8wq/lrJ?=
 =?us-ascii?Q?kITN64qgvgSpSlzp7a9Y0X7LO6PsQ6deuMrEn0jyEqUOQm8vGIhi72+50LQC?=
 =?us-ascii?Q?gLZQhIMSrwTmhLGR2hoPI70VqgmpgNthG5abykq9Nh/I6ynh7LlkUdNSHpJw?=
 =?us-ascii?Q?CQvSoZtJAv0GTGWnlEzIOPqdGJwNbvj1RCfzwalv6UoBYsnMhciVQr7XucGA?=
 =?us-ascii?Q?l155MhIAd2szlUd0EkrrBeoEBMjO4Gc2FgWzceISjKeLZmper7rjU/lvQBZa?=
 =?us-ascii?Q?tLBE4d4CtLC4jT9dU3pmPwPVQS8oMLbkSiPt4N3t4tmuApmU5h9yP0eAQ4GE?=
 =?us-ascii?Q?Ay8/j6hzqQxKYtL2OlvsntpsVo/aQjqhBOvHIIfnp/7WL/fAxzz+9Yy0Ivji?=
 =?us-ascii?Q?IoDsERtrkhylvbIhIpIJNlagyqccpY3fpnbyO+38TpjcvCaVGkuF1ers47Tx?=
 =?us-ascii?Q?kwtikZeRM9anBM3bd7a3NdCeETPrlu6G058y1V7+94S2d4wm/Nzv8rsrALIS?=
 =?us-ascii?Q?sa4CFK3hDQVoNfFWt5yFEaNcQ+J8h7zzwSR5qYg+6vUahY3OEmX90A8EIama?=
 =?us-ascii?Q?uaPj+V/qLLdEDfM13BfkI+Vmaeet37cdV1/Kk7DW+kUY0bOfABE/efae5sD3?=
 =?us-ascii?Q?eUM/7r8Epi22dvhUbgF4vqwVbl3lyeQfv10wxaPAZa5iQ5hK2OFRIfsR7jAS?=
 =?us-ascii?Q?PDlL85ltFOhVFnjzjtdJb4v5xMR2o0oIRDNDVmn/LeeYqa3+Z8EdzoaQbmeh?=
 =?us-ascii?Q?tvQ45Y4E3xTMKzaPApnrESndv4awMF2ol4o6rfnCLYrZbq0mSUXZV7/tDk6u?=
 =?us-ascii?Q?E8e/9qlpEUE47D5UedUqkvRDWJt2cqDWdo6TuflSVWrgdlZ0gKghz4yaC45X?=
 =?us-ascii?Q?OxaKVF0dscNxNN7NSpOh7SSVJeT8VuXOux6agZDC5N6RjBPJuDTYzdVvhjMc?=
 =?us-ascii?Q?csAPxWz7wYfLGNPP1NRRr3XsQ9K6CWwaR7vhVrr7gCxQYsQeizKe2C+UeRM9?=
 =?us-ascii?Q?Eq5MaVW4U1vJIXLfgGSUdacDskx2dg6fdP4Z9S8TFqwhDdRHDjrPKlB21YDi?=
 =?us-ascii?Q?37/Bk/WN6txptL+jKNGifvlZEiOj9GJc2xy6RFCObXQ2F65oUboSl9N5TR4N?=
 =?us-ascii?Q?fc3+JhzuMi40GeeH4EK/3O4uZY3MgEH3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L6wDI/7+LlYuSax3RlprTKj9q34Dgh3Mz55ADKw2Z8gINzHHXCAcJvE05fWh?=
 =?us-ascii?Q?Z2sbV5p6DxRTbQ+B9/YAd0xwyTYa2TOMdERKZxNemVUKuFEbb0vCrkMuAEkf?=
 =?us-ascii?Q?ZTZiXZ0WwlsPFq0XsDevMWgHPV8BP/Tqe0LIcs19JX0MJYuOoHTCUQ9xm2lb?=
 =?us-ascii?Q?mBxWC71tb/ZduTtPe7yvzqW2fHsqSUHtTflnUsPRPS6u7boPZGJ68syba02P?=
 =?us-ascii?Q?9+0P3aSqfwJzyu0CfD4qeedSkKfm/61GIl3tK+/16mtyK83BufDK0DvqlJGv?=
 =?us-ascii?Q?WvGGdH2oig4Csk9R2RMtsIefuISMMeDcPp9SoEm1vziq0L29iPFiZdmz0WVy?=
 =?us-ascii?Q?HKsZV093C3sOKndZhmvaSdSTEOI+cpIw43EifaGFdxqE9F0S93AUGBbEp4ut?=
 =?us-ascii?Q?x8eK4lI0fckpsmhpTfjgDRVYxuJ3LQFdsUsfr2tSAMm/s25cQIhj+wBtB/cQ?=
 =?us-ascii?Q?xDu/REtSpKwUDSgwEXmcW81xEkLFb1tzOrXqfWx7SSxUV/G3JyPhEdDe7CVu?=
 =?us-ascii?Q?AkGA3Lu2Yq3JCAuRkp+Q8pMtJJK4BxeQlJ8BrlR+ZN72l8JQjkUDRDimRsh9?=
 =?us-ascii?Q?FWi8y3Np+LtQ2DLpEJSVwO+ROPrzFlIeP66cLR93uwxWDcVOaaAZJeip95Cz?=
 =?us-ascii?Q?m8MTtEgEyHzrHiAgAzxjBRfkdB2b8kuHQiKGT3sHne3kA8k/Rc5fnRUc1yYk?=
 =?us-ascii?Q?973hSz1mbby4DoiHY5nlWHPcK2QLNTWQ4E4MBygOYX8Ano12MIxk2XGnbTwN?=
 =?us-ascii?Q?e0Uth5UJTdUSinQqGOyXeU2Ka8ymtSvnVT4kdxQ1eXdadYsqSZMxGXzcrL8W?=
 =?us-ascii?Q?OLWcLZDokOWmNokbKhlBiVAKXofFlmrIXBAWAbmBsn9ipfjDAo8kqAf+90z1?=
 =?us-ascii?Q?MPXDrV3GNnt2fUPhFVB4jIXVykqlrxWIp8QbyXX14b89wOzTRiqu3N8bv0ju?=
 =?us-ascii?Q?HXs59aof/hnMeMNzIBxubFik+NnHWifw6p4XK4DsQ6OA86j/+8gk1CIQeo3X?=
 =?us-ascii?Q?TWRH/FPMik+fI1s2aQ+0+A14M7zSZbRwCXGuyC4t8zztk7SAr7kyyQ6HnRZL?=
 =?us-ascii?Q?Y4yoEpLHKkJhawknjhahfJ7iFUpx2JDsVROs/tXXzGyPdHeJufQvOl8rmaoh?=
 =?us-ascii?Q?mEBbADrR38q2u4WEpAlAo4KhOCWOlc+obUFqb58uerBl9Gg+2djb9Mek2P80?=
 =?us-ascii?Q?dXVzixQkp2C7vbfYfWyDEOx64gqPDgsLrxhwnjLiXT7nFRIR1rtQgczKN4hl?=
 =?us-ascii?Q?UP196msPtRYzNWFPGw+wAe6QP1n0OWjexJwQo6EjOYySLOxDBCzW23Jqp820?=
 =?us-ascii?Q?1CibbNBKIotBZMEkRZpBt53je6FwyNy/DHnys4Knr/OuyEZDJY/5NpBQC856?=
 =?us-ascii?Q?jmorlQuoSpCPD64ZaWz0FBg7OzGKxBpyNPv/lh/Z0Po+sJ0ntlUHXri3+hhm?=
 =?us-ascii?Q?Jvv8hifOSZPGRlUZ+PyungWm/SYl9xvKUryjReYF7fVdwi2XToDbcRbNEWh+?=
 =?us-ascii?Q?HQh74hLj4aD3JtqGhH6dP5eAXBpu0Ww30BoO88qSXQNc4Kk1xx0JzN7OeP3Q?=
 =?us-ascii?Q?RK8vmRoAKBW+Ym6Hb0+ilWwWZgWOirtlxarz65brEfN62E9b+QUZ1BFvbuEI?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01a4b17-c844-4f44-04a9-08de30a516b0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:44:34.4058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkvfiEDNp3POfxPOoILA7XQzLkyBrLDPblR/Pqcd2v8ik69w8X4pxNnPlK9Zheg7sNjod6BAHTIa3/tbYZPW7XyGrCr8OZFA3bPAiEFH3/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_224439_313384_D8270B8F 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Make i3c_bus_maintenance_lock() and i3c_bus_maintenance_unlock()
non-static and add their declarations to the public I3C master header, so
master drivers can safely take the bus maintenance lock when performing
bus-wide updates.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master.c       | 4 ++--
 include/linux/i3c/master.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d946db75df70..870e0dc14377 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -42,7 +42,7 @@ static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
  * logic to rely on I3C device information that could be changed behind their
  * back.
  */
-static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
+void i3c_bus_maintenance_lock(struct i3c_bus *bus)
 {
 	down_write(&bus->lock);
 }
@@ -56,7 +56,7 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
  * i3c_bus_maintenance_lock() for more details on what these maintenance
  * operations are.
  */
-static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
 {
 	up_write(&bus->lock);
 }
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c52a82dd79a6..ba86deb2e07b 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -726,4 +726,7 @@ void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
 int i3c_register_notifier(struct notifier_block *nb);
 int i3c_unregister_notifier(struct notifier_block *nb);
 
+void i3c_bus_maintenance_lock(struct i3c_bus *bus);
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
+
 #endif /* I3C_MASTER_H */
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
