Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52049CFD2F6
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//bJZqMkPw6OtYruGAaNlMfMe3IB9+yPOXPwIFT5zuY=; b=WOCwp9F11DZ0rK
	9rnnhHgP+DcmMekrue+EvMx2orKSFO+Htg3xRlFh6VoPVH4azq0sCPdMKQKtexpJLgyeT/oEPS7tY
	Xoof6xm1MksJJqGhSAyI/GsnYO3c1QEfLpHIUXRIgg2sfuc6m4s+09GU+Nk3sIfn7Dr8sSXpr+C30
	akVRaoxrYJA3XK41tKOXY13tMpkMbrwflDU1a7OA4cHmeCqAZw0NMfuBO1AMzko7DDNWMS33LdK1l
	YPL656PtPKmf/yz6ntuW5/WEumcVHmYXu8WhPMshqBVQUQSzlTGcetaODX61jbDX+kajzFlHWWQHD
	EYJT3Kgyw9nCknTZOt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkr-0000000536p-09yA;
	Tue, 02 Dec 2025 08:29:01 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLko-0000000533v-2VJI
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 08:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS89UbATQSXYl86/gyz9ceZ8qOSwpedCbVzFs73kJ551pF0wh8QUqEIvgVFkGSO1QDPtctUkeKoEzZE7WaAgGPSCbYFyoSgM1kATGNaZOkBvTManwVGtnTUkCVizx5VoL+mbX2mBbSp+Z7o/Q3j9eKzx98ureO1iiRknKtBQQD2WnFVlZuV+gMCuZCsJ5gC+KRIz6b2dLIvyrlK2xFvrCy1gnCXaBiPhBIypwzAEpQ4GHkzeMsE4vyjBrHEQgLBpNX84q/LiOUBRuaAAkKar8zSJuGIiWe74+WdUuh2QrDhDGsp8PChI9cpkARJSdzes5wA0UfaMhkdmlbk9oZZZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7IzBcugeJunYL3klkfc2jiF0fCgLBmBdkWhqSgJfZU=;
 b=S2P/fDo5dgPYJ6Gzn7or44nZwZpuJpG5USJTJJ3kkTfr/ORQTBo5oftQcMDUMjrphV6bi4w8ihfwK0Zmh6FdUGeb3oeVBQ1xBq4CnMfcwNsYQY/I0BvuB0QftHcjiKjhHn2JktMJ+4Oz5km6Gd5n+6n/oxir6Aqb6wGy2gXpECQ+G+YIrj83HTzLTs2bEXGMJPiiVTdfSINavnNjd5vhSRXlLhfQkixZZA/ckPt5I2nHsWr0kk3vG10oZjmJ0geqo1bkXaTf+b3NREUVI6TrbC+aLHl721Jgts/AxoTOr0yGcyNr91zP7gp8Do0XvMc2SDci90yi5GnfGdF9iu8Row==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7IzBcugeJunYL3klkfc2jiF0fCgLBmBdkWhqSgJfZU=;
 b=iIQDgPXRifx+gT5ix8jrxu4qWFHLe/U0GGQj4ReebmmftJR7b9UUvr9MYm67iajvX1MMUoalxxc4Xj2YziDwvNMquo+ceXJGxmV/CT/liNSO2wTcAMRTrsPs4c1u8eKNtQQQOLb0EMpA785GeG+UdhR4Sc/Q9Pd2DgzsBQuIX0UD66FYemma/7A83gXDChzRAJl4H5en8n4Opoqx+kzXY5EtIW/kofkkSQDMYzICdBXLvHdczNympo9nDLwEGRXhFNT6Pmz33seCjZMwtpxqoazCH2tEscm5lWzDLmmld12ugryPDGoZymuAYCGPTywTjOQ7rA992PB3/Ji7oWZ3jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:28:47 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:28:47 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v5 3/5] i3c: dw: Add support for Device NACK Retry configuration
Date: Tue,  2 Dec 2025 16:26:11 +0800
Message-ID: <6ea3449f6bc533b6fe3d8c4fbfbc0801d786320e.1764663888.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764663888.git.adrianhoyin.ng@altera.com>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7a2ff6-52fd-46b6-3a47-08de317cd06a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BjDCJ6LqlQfjX41IHFzLirqAz7/SVfrwDdS8jVI/ioCWzkg8tdR2GhX0XnpJ?=
 =?us-ascii?Q?78lVrja9nLYpLnNvDN8R2Sa+EtS/BMxG/SIWzjpzvS8is+qYd+sazJW5CtFU?=
 =?us-ascii?Q?XOv9yTMU/uhTCY0utWUvpW4RftlFMUKL37zFXlT/C0K3HqwEQsZwvK4jiMN9?=
 =?us-ascii?Q?69rwXzVxnbInP3zBVaqF4YzIgjnRm1g0eU1kBDCmLten4Zy3410XqraJDB8s?=
 =?us-ascii?Q?TqHG/YKCwPgN0ZpZt4pBheo7AApclie/d32p12oTcygj83kGUN0bFvO3JuDI?=
 =?us-ascii?Q?9njyY/6jZxTkWJ5kB87PdO+X19F0/o7OvFUjDDABSxDaH0rXK3MLv9iMrVL5?=
 =?us-ascii?Q?ieQ3FpTzCjCCAnYdx+KPwJ5jAJmnCjskO6IIUVo/9wkyRAMbXVqqjFIyuiR5?=
 =?us-ascii?Q?3AABEsPKBROfdOjnILI4leeBhlp2EFLpEzQ0o4wY1ROgvt8jd/ergu5bS7Xl?=
 =?us-ascii?Q?GaPObbNJqIjP6955xj/iCW+GsW1/TC7/Me6NFYfrPXOhIJ0K3euXTxJunvYT?=
 =?us-ascii?Q?8+hE5b8RGZuTL5hmI9xgfd67q1mNzEe0ZOxRwF3CA7WN99XIrBDrnMTzCsoj?=
 =?us-ascii?Q?+0Qjx8UmqlBwMS5uyNnxDXgtcb+2dz+y1Q1l2oBdKBbVIkxeSoliHYI59Y8x?=
 =?us-ascii?Q?v/Rohluex+cU2rwtqS7DTdJ60tyRwAqrt/4EoPbVqRA9iIPSqEyjihuhD/Oq?=
 =?us-ascii?Q?gY6+35tjyhBU9A2PR2AoOYkyEr2cHmeMoSbAJg0WMPLHQ1PpqJfa6u0N1j4C?=
 =?us-ascii?Q?JxXpSyBvEYut8hDQgaOSnmm32D3VLZAOMTRQXTPxEHZTJAZWi61dcmyzdTiR?=
 =?us-ascii?Q?K4U9ZPvPy/2MSVbbms6vsHjDMRkYxEW+75a5je+v9xM+Ic8diRKr0QXuEFBo?=
 =?us-ascii?Q?0nBT95pvmc0dCaVn5NBZfpPzghRVJjFpNpdnq2x8LceIIlnb4o2Rskks+2iw?=
 =?us-ascii?Q?+kx/f4dG3E6rS1J6i1f2p9MVaJrE4YPJLfxZoud4UPUwt+M6GtyhoDRS6PgE?=
 =?us-ascii?Q?yv6N8kQvIcDZ0oMC7kjAi2TIvV+nntE4uwrCYSX3JgPh3EGfnNIulP9/ib56?=
 =?us-ascii?Q?WQzz2L65dd2WnrgQbVcXVPslNtpikevy7XicWxygZ6+efyzZYQ3cLrkMFz3n?=
 =?us-ascii?Q?fC5gAX+sRcB0HJQHe+WzGKbZehnGxlJnaP8Ufyr/gS9K995somXA2PVv+p6I?=
 =?us-ascii?Q?1ldICnXK5cI6vowxF/8LOOKWMLPRJnf/9tMq86iSeGJLdK0SCBno5L+KsG0t?=
 =?us-ascii?Q?HxI4TYhNXfgpVNcKNo0PCcEFWrACuTvEfd4URlDshUmug0bJAGoAcjr+hoRc?=
 =?us-ascii?Q?6zErwsq9FZfrUSJSey6WGrFGthVXjByeW6VBjUoN6jibLIm/8DMC2kPEciOU?=
 =?us-ascii?Q?KP8FS1zWGnHu8Fi3qxM16OVAoJ7lhJWqvexXzUfisDyO7Dg/CoH+FIgVYFCs?=
 =?us-ascii?Q?a/1Sxq+M8c/a2DaBGLN4a59hRMgqjgiJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkOB8pboZJYVKI26eZwgNmwM1FASqy9rU87Mfvt9N+sruvZqrv2tnJ2i6xGo?=
 =?us-ascii?Q?N/XNQiAwe3B70hcMkTkMk0jP0twCkB5DzLyqBqRmXpZLovrJrFkTkMqapk19?=
 =?us-ascii?Q?DpzyHzhPyDFDu8NMBYBlBVwwFw7dbrX2ao+Wpneo/Z/ShRjUGYdWU2oZw/jg?=
 =?us-ascii?Q?5Uh6zoaAI6TVySSIUGmZskEIBBayebfcL8LfENqe5S6MJKLl6YpB/a5X5wKe?=
 =?us-ascii?Q?H1QTlk6hG5fAljmy6b6PEZDvdrySUaM28L5pCHCSqjeobRqT4WpLquEMviEv?=
 =?us-ascii?Q?n1yBzg17vD7Dco/GFiMwxLFXzazeU78bf0+H40Ammmbj7zNp1jcfGZyqlQUk?=
 =?us-ascii?Q?AkJgcY2RzFtd5hFqUuKgMEFw2boKZ+LOjX4oKh68/+TkddSvCvxYUbh+DZPX?=
 =?us-ascii?Q?8tVOLyrJ5S551Uryd4BV/mdl0+z88rkXO1DJYgpw7bn8uBszBil2UeindFW1?=
 =?us-ascii?Q?uqoGst4rzR8iMPlgRfVkxpgSOda8AyeQ4HMP3ZGf+ZS7OZm9Sx1FRznoamiZ?=
 =?us-ascii?Q?VlpIbirzF30jeGlLVcQiRazwIyPch6KNK2ijk78I1zMakaLUo4eEHf/HZxNZ?=
 =?us-ascii?Q?C0Tg/LyYmOCIvBhV90gX3XfmzHga0K0JiHlj1GqDw41EX20/bi7CxlfhaVsH?=
 =?us-ascii?Q?9hd/X2CL2fZpMzw3KHr/SuEZqCz+CMfuKHxtsRB8cqvvPoRjTJhBcCQ2OrML?=
 =?us-ascii?Q?xQ/Ex8ANlLXAWp9KnbR+WMcMk1jFw0xckNbWk0wVEpJzqKAPFL4eC2TRddyO?=
 =?us-ascii?Q?8zoeCeeKeYvHBm80NdkqO57gSOlIexksM5uWIKkxXsY5suvj6vCwhwxSKa4B?=
 =?us-ascii?Q?a9jRlTAsen6p8HQkPyPx275Chj4zhNGBLJxKLHi8RPdSsEZtk1KtW4fOfnVH?=
 =?us-ascii?Q?uBBHBsQPn2G8h3ksuIsFkj0oggDzKhBv3FXvOy336UdJNTfmDg8Qqv5N7XZs?=
 =?us-ascii?Q?AmDIx3vFw/VDQJxOu73yr92Wrn/3yLQPHPDw7aCzKjFmbooMh+dSJ/bZoZ2m?=
 =?us-ascii?Q?EC+4KPdhqhFASwQVgfCj648pavfqehb8K6cT8YHDLrKjX39cB5e/5n7pT1Xl?=
 =?us-ascii?Q?8tdqrXqG5iZYFvIhV/4a4F9XB4jZEt1+hfEDhY2j6xVLMPvJ/pZsZh0sBav0?=
 =?us-ascii?Q?SIz4ArBvggmvLBFOMwGfuTs7CkplILaA24C9oKFFy1/JXDFEv/Nk+aWtb+BR?=
 =?us-ascii?Q?FxCgV4rc2zpfSDn/QbNyEVdHtjDyIdcgM6TFpXySjqfRTizDF+Ts/Nsp79Dq?=
 =?us-ascii?Q?H6AgnduwyW6RujZ0308U76YXuVuewn6a1a0qvajINo8MSBTz5B/e1uVpAbsP?=
 =?us-ascii?Q?NcDPadAI2/vG73hJlQcYNBMKXv0HNYatsNzaUkPzldq3XtMgaRnNf7CeY2pR?=
 =?us-ascii?Q?vc7lEhgzrCc6iq7BUooer1pUi6YcMoU9vV4EFuYmRsuVd9N0ojVNCn6aXHz6?=
 =?us-ascii?Q?zLrW+boDMU/N9d9lBh7HM325usepjYUPh4RvxNL6SYtqH5ytLQxkLPvxsi14?=
 =?us-ascii?Q?Rg1kCJsurxZHGUWOfPrxPmGs7qtyRe9EKZha/q1JqaC60gvjWxrT6p3LK3eD?=
 =?us-ascii?Q?6Jb1NINN2D6jnVpd2eaCBWinUTrzT259mwxj20RZcc/UD1WJE6hWj65dI+4Y?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7a2ff6-52fd-46b6-3a47-08de317cd06a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:28:47.6204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TeRbNpjp6jB8EoAaCeXZjqrGWD1X8rUuZjFXSPOHl+1o4QnKyT3BpunU2lkZ0MnKWbiwMmWAF/Vib7AvFW1TR9QN0mQtOCUvLUeGkir7/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002858_643554_95CDEE71 
X-CRM114-Status: GOOD (  13.73  )
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

The DesignWare I3C controller supports automatically retrying transactions
when a device NACKs. This is useful for slave devices that may be
temporarily busy and not ready to respond immediately.

Add new ops to configure all active DAT entry with dev_nack_retry during
runtime. Returns error when value exceeds hw specified limit.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..8288888be591 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -204,8 +204,10 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -1484,6 +1486,39 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	u32 reg;
+	int i;
+
+	if (m->dev_nack_retry > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_err(&master->base.dev,
+			"Value %x exceeds maximum %d\n",
+			m->dev_nack_retry, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
+		return -ERANGE;
+	}
+
+	/*
+	 * Update DAT entries for all currently attached devices.
+	 * We directly iterate through the master's device array.
+	 */
+	for (i = 0; i < master->maxdevs; i++) {
+		/* Skip free/empty slots */
+		if (master->free_pos & BIT(i))
+			continue;
+
+		reg = readl(master->regs +
+				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+		reg &= ~GENMASK(30, 29);
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(m->dev_nack_retry);
+		writel(reg, master->regs +
+			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+	}
+
+	return 0;
+}
+
 static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.bus_init = dw_i3c_master_bus_init,
 	.bus_cleanup = dw_i3c_master_bus_cleanup,
@@ -1504,6 +1539,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
 /* default platform ops implementations */
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
