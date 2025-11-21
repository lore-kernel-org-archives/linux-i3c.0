Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C94CFA474
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLtGnBCd6NtgkjXGN0snAMh/TGdDAy3ghKxVU6hgGsQ=; b=t9DMRkzW2UoYLz
	uewwhTHrc6eHzQsq1eZ1E7qQhL78K4OU8k19ASC8BqBq8PdMg7FEwN2bqTLSljiShietMBeSl/49f
	xp1AWGF9d0iJr4Ffty7j6L+0whpCJTE8um0dn1sP7hPq71LuKxM0AB8FborTWaxcFvn1hu41t8qx+
	CYEmtMrpNJe2sCKV9cIfyml/uaeerOwMDFBNlnfQ29q53We4ahKooc3fs02kT5PANe5FLmSlPcf7F
	b2BWAbJvHdMdT6v7DBoKw7JXZ/kO3ov+jQdBGFW0YUEZDJwmu+QiywDbBUWT/DssiLFeyNRFxuk4D
	rljTeMnIn7M7Xu9kWHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZL-00000007uQ9-3EMU;
	Fri, 21 Nov 2025 06:24:31 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZJ-00000007uOz-3Wji
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 06:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oz2I12rw0Xfo1OwWxp3XQkltTVLpZS3xmCj1ePwMnA3CpAbP1F0ReUSBPzjko7BKp4/MJWL/8kjJ31vKaqxvmw2zLGiGgGq40aSxg7bZAugk0TvPZaEIWER2ISeaWFX4WmkReM3KELAReGVI/ZKG6/+9lz7NrqOnMNpAk7gzzo1DpDcKn3gdCesrSc4n6frHJWXWEkmkGxwmqivEP6r30/n9uQ8VnP8fYUMWKsFBfq4BsXWdt086vX/iWhj+i5XnnyjQjouGgLPXyNB27kGiMttCb8Obr6k4KoCCRLf2MEMtS9ozZemF8L5z9fm4kyPLl0p+V8WrxHuomW8PG64sjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DSmwJJgjt/s92fBsgXuWh9qwDH5JyS6OHmYe95F4/g=;
 b=iGDmmLLrq6dMR8DhoNV5uLwp8fLku+Y+tKDuTSZOT70bhh+dLA37GRxS3HzhZVBL5eBI6tSz1Pap87AmsmT47CdTh7+zSHCrV4VlglgdXeyTCSdXK7E5YfrnfhIMOfv4aIsPxu2Xp97+tG1d8OaX4tgTUIjJ11dowG0wKJzH4UdtJgbF5Ha1YgDP/xw9U9PiwpiH71cIT2Utalf8hy89lSS9c39JGhAvPDbgzgibfH8q6gkvR2yPI+KaNPlWozASStAZRqunnxI8GjahjdbwnN30jzR/QFbd0hfbMjvG6ZE2hj54fG+MqjLtl5OYEU+vqMjZ4PqvqwbhfwhIRIT+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DSmwJJgjt/s92fBsgXuWh9qwDH5JyS6OHmYe95F4/g=;
 b=hBlrrmsBaUlJGHYLllIK7Ykb50KWuc4GmuBus7b9GDP81atg4d6yBmZJgjf+8i2nnTHV5M+GrnFxPrSLEnvaOoL4RMZgDJc88X8RciF2vjcpzND4iZwqkuigCfmazkjLaNHDWlqrLMqBeO3Ni4OKCUeYDmO/bwVBeYM4rNz3O+K764QCwFnomJnKoe5H+cAnXZjmIntEHD+dVcCMZbqmBiYqJx8sRGqLyAZUNPNbuBIQOH8RyL+3XGXDniiK8JAcC/vaY9qcytPxP4C14rz4hpg1ioyRQQw1VoWlc7FXY0MiIIlDHrWDEuZqkswbJDlkR4hRMZZnaY0GnQWbsFILfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by SA6PR03MB7613.namprd03.prod.outlook.com (2603:10b6:806:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 06:24:23 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 06:24:23 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 1/3] i3c: add sysfs entry for Device NACK Retry count
Date: Fri, 21 Nov 2025 14:21:48 +0800
Message-ID: <89b235bf116bae9fc573772c4f52cfc3d2d122b8.1763703573.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1763703573.git.adrianhoyin.ng@altera.com>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0073.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::19) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|SA6PR03MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: d7382b93-7e06-4589-d6b4-08de28c69c70
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uUIvajZ9CaK8l44VIEGB6vVlBHIHJ7c7Bi3vTLMNFE21ed9tSLVctZU6gKA5?=
 =?us-ascii?Q?N+E62Gq9yPITxTHReRiT+pPQv+wtf8S9J9f7oXv/Rn5gtGm/IphwWePjkMVe?=
 =?us-ascii?Q?LbPe5gtlXfSUOB8Yan8lCBMTKGwkiboSObmvitG7OcWCw1MUh+CABhZDk4IA?=
 =?us-ascii?Q?RFHxz+0WKPTec2VbJtS2nO2aOfSao9wbNzYZvQiD0VlI/Uwp74s6wCZ367AK?=
 =?us-ascii?Q?Zni75e4j3uiHDkku4ibxtXS2fcQdfhcd9RbSXo8+X1ImkwXRhj11SvZbHod5?=
 =?us-ascii?Q?9G+IUnQ6+Zi2BY9OWaRwP5tTBzi0pWRY69Sf5MIO4G6L/VfXWhCnbzRAUYPP?=
 =?us-ascii?Q?zypOWsYK1U+KXBnbReLZJoz2d7nXFz8RZfV/NPxxlxJMTlhlnPXJon+a2Ixh?=
 =?us-ascii?Q?kjhX46Pk1qmolMWK0Raj4q9aIHelsL0oBphxtqD2rOH4oCjhk4uCX9MMyXTi?=
 =?us-ascii?Q?skMBhK+zYAMlxTMgyDO2NM96vrPv3Cr0i3YaqSAiAD9I/Hknld8078VmRDyk?=
 =?us-ascii?Q?qXxES3cmLZY/jDMuZyiEXvvPleQxA/wC/weBps9FAIDRrxQH0V8Z92ZI+i2M?=
 =?us-ascii?Q?/CDz1Ieo/hClplmuarEreLY9Q/3blYP+U0t4SYb+X5dHb6V2zx4LezpHQHoT?=
 =?us-ascii?Q?Z8/e1C1gPhl/f5yiWKCrwx8Gr2xFkLRTJ4vqqpHAqIysJ37hvPx2HeiJBqHx?=
 =?us-ascii?Q?kx2ygbd2CAdVXVpyxojE7TLjX22Ae0IslxGef1MJsAkqrvmkTUOsbHqELYHI?=
 =?us-ascii?Q?/5hU3kbbx3EU97lS7VpW/xuigi0U3nk6l5expkiqgvP1Ne6o4wHGKlVtcU8I?=
 =?us-ascii?Q?e7CDF8hfVc7QVF7SHa5rUyT+kGuebSdmk7NPz6R4znmcdNzh1+4NqYFWJPzr?=
 =?us-ascii?Q?eItmtCuppO9e8th08icHBzr0xulAKElOdwYMoytG1p8xYlBXG2ExYq9wGFMo?=
 =?us-ascii?Q?LJSs7Dk92eslN4zDuQZizFwFm+UXb64bYSH924Dz1G1NHSQclI/NHPXMELtu?=
 =?us-ascii?Q?7330oK4IbCs/TL6UemZeyEAwMrThYQTJKYA8GMwac6mNouvkzhKPhRpMxECM?=
 =?us-ascii?Q?5WKd6dPQgrTlNSJhuKSKpHjGFOjQXxzrxqnL8M8gzc2N7YzmwUYRX0CuqgiD?=
 =?us-ascii?Q?v1CNaZgMzBswJ1auiJ5RE+Xvlwyy1KoMUX9ZKO7LyBRpRYGo7gY8KcrhNpuF?=
 =?us-ascii?Q?3DxFZXWXSrfTzo4BgV7rRsYdwyauQuE8o41JUqt6QB2bixC6tzLAqow28HW+?=
 =?us-ascii?Q?+TCC+AsxQLVpyZapKMFnIY6jWJDfuTbq+imQPgM13K2SSV7IjXVzu5KO59XW?=
 =?us-ascii?Q?AYnxtGksC1Tl1WE3Ja8p7Ebl76ZFO1upVsxY2VCNZZB734iEPasUo41gvMbV?=
 =?us-ascii?Q?Ng6XPMMZg2hcD/kLXTl2PePhfMz1y11kceevDjBXU5cZqiFeuhPaS1tsNOKU?=
 =?us-ascii?Q?dh0yWMv1oY55zFHUPnR7EpwA7bg8PDRR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RG/s/l9eO0YmqerHmaYzLduIaqfSYn1LoPrMn8ObBZaSLjqownD9HkjEf0zn?=
 =?us-ascii?Q?9rDMpIAO/0WAEfL0SUZjv4X93tl6vJUWFxUwd6dwNQ/8q7eB4+X13f257sBO?=
 =?us-ascii?Q?a4shQsDVUNfIG7uZJvoHENsCQxI1IsxVQZQ/FWz3zFN2GS0434DbVoTBoTQ4?=
 =?us-ascii?Q?ry1vFZ6y1wN7gkvHi/OzEhjU3uoaoUbC4EhGScdyGLxHE9nyUJnSpmS7cPLL?=
 =?us-ascii?Q?lpZ2v7wdhW1U8rckXT2/PD1umQLog3o6u+0IJ9o702dcHhDaVOiKKIY1PZR5?=
 =?us-ascii?Q?W4wwgJae5wNX908MX2sq77UjgL1B+uRGDXsrl2QtLGPGLdwogOVrXGS04fyX?=
 =?us-ascii?Q?WCPrqBMmbwVu/TH/oYB+Pfdy0J4eC92sc2NL2nJmOefOf+jTP+Sp+gH/FPPQ?=
 =?us-ascii?Q?sCxraiG1ZrAV0kz/wzvBdE1XU48UUeyM/NY8Gm998T4C8UmgvAu4tzJCOXkx?=
 =?us-ascii?Q?sz0MXKi1wfU6wRZooEPQREeQHZPxPxCnG3E5mvEfubcJhBnCsYaN6yVLDza0?=
 =?us-ascii?Q?qGVamKZSMUs5q0rm9PPQTGGxs/aLCMATzB+fIlYkaXzC7TP/dHLtctDAGSuJ?=
 =?us-ascii?Q?5f5YC2Vg1VEkjuglLX0jLb3StEB0LLy3+93ReDM75H6aXhWDUm2TeabObUIj?=
 =?us-ascii?Q?4wKtjNHxehykJqtlGbRX3uEn3uAscXlzPXHNDs9pfn41csKpQ/dnrHLbMfpk?=
 =?us-ascii?Q?c9x/PEHnpuJF9ONr6lgSWY79kLzdlFy1c7mpPvLbZxGoB6ucQlT9DNiC/UQ3?=
 =?us-ascii?Q?1aDVp6uPwZ5Q7DkEEKnWkjVHTahiZ9yrq21lq2RiXABiV8bqp3V0YO74n+Om?=
 =?us-ascii?Q?6r5OEKhX6yP8fbginZ1O68Yp+QxLCNF11cdsD8+MLzl0n3a5F9XAXWRWmOqm?=
 =?us-ascii?Q?KfzAgivyeqkejz0ePMu2eKpVKb8P0Kh4SQS9QFYgWU4/B8c2USGS9sxidS0B?=
 =?us-ascii?Q?DRZezh9l5r1drFB3Hd89D5w+Vcy1pAYvo5YBkXBVaLb9kKmROiV0AleXGwGJ?=
 =?us-ascii?Q?beP4zw5YU0WTYHkNJeKs6qPvWmOIJ1zX22VHW3n061k8STU/vl2UTEL+Vei6?=
 =?us-ascii?Q?FzqMtjcdtCbmJYrsCVnq9SggF6DAWWbhj7gocZR7l4Pxc2mEqCUWm9xqOmW/?=
 =?us-ascii?Q?TV2sVrTa2ZwR5q+H0xtAWgq5T9Ndvw4glG9QhedC2r+HsAqfyQE7CHS34dn1?=
 =?us-ascii?Q?19ZW/4U0x10KqF02XDS+T8dWTflS9g+n5kmeodA0TuyNGXbvD9votHp9mJD+?=
 =?us-ascii?Q?tzpn4J/f/t5TjCgMNLKJDvbuW6dYUuQ6drnlWUsaTWjeAqxto8SPy35LS3Tb?=
 =?us-ascii?Q?TblGy+FS8UXHtWRITTHtSdg/M6RPj0CEIu0qYDoH6Pb9Ikux20PXXIL3YsUK?=
 =?us-ascii?Q?oZdfiYWhqUAxpmoGcZH6fE4bHx1c/NCZvI3SjiAWuB2QJvZO54dFbHTw2J9a?=
 =?us-ascii?Q?ozthJ+A7Bfq6v7hmhXVBW6CUF8AkvUUXRiM6FVakYoe4c+Wea32lcQ75C3Ef?=
 =?us-ascii?Q?Z+modeU9FH8XeSgrldtPUWL7ret+TkD5kHhsGAp1fUrBBiT4dE0GCgk1AJjn?=
 =?us-ascii?Q?Q2EAD7V8pDImCkId4j5wzUTCq7Ivmqo0CxQBhJp4YG0kfnfLEDhcAb191LXP?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7382b93-7e06-4589-d6b4-08de28c69c70
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:24:23.6429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Yk342iM2vMZW6Z1wePN4biR4dzAbwCMhNTezPDUyXhgtWvG0trR6Z9tpMmrulRNeFqlCwVufnW2WrU1zbSXXZKDRUlEFo5d3P2HGNv9JxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_222429_882327_28B36E20 
X-CRM114-Status: UNSURE (   8.17  )
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

Document sysfs attribute dev_nack_retry_cnt that controls the number of
automatic retries performed by the DesignWare I3C controller when a target
device returns a NACK

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 Documentation/ABI/testing/sysfs-bus-i3c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
index c812ab180ff4..d75339330067 100644
--- a/Documentation/ABI/testing/sysfs-bus-i3c
+++ b/Documentation/ABI/testing/sysfs-bus-i3c
@@ -161,3 +161,14 @@ Contact:	linux-i3c@vger.kernel.org
 Description:
 		These directories are just symbolic links to
 		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
+
+What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
+KernelVersion:  6.18
+Contact:	linux-i3c@vger.kernel.org
+Description:
+		Expose the dev_nak_retry_count which controls the number of automatic
+		retries that will be performed by the controller when the target device
+		returns a NACK response. A value of 0 disables the automatic retries. A
+		max value of 3 can be configured.
+
+		Valid values: 0-3
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
