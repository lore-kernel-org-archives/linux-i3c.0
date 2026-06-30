Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC984C43458
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jun 2026 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXcCABhZC6FxIN7I144orn4N0e7TBef27VqM59j+Gu4=; b=g9y8zH9aR6pHws
	u+yEga0BzgOwRgc3iGuAbFEjr1rRHI5js5vIK5NfgRCq+cpl8glcR0g0VWaTyhijAkzi8LuyYfrHU
	SrptCvgrYSM2P48MYYdWbPvC4S7pL8dC634v+RuWneJuVRg++6w21MV2GoZSXTMs0iblh//OqV8Fu
	LHLNBh8QiphDoZy0vSuEfg9EIhNR5EfXZifnDv+23H0G1B6SPBDIJUktuEPZk113F+TM3BPkhkWLF
	CN2aF2RJdI6qJ6/kjSqASIaOzAZOuCmOldep8FfKzQ2ryIRkOK/pSL5kGy3oVnWjT4Bb1hC1u+zbl
	7GEi3bXfFIcnCflod3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webjO-0000000HWoU-1dFB;
	Tue, 30 Jun 2026 16:54:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webjL-0000000HWo4-2ZHx
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jun 2026 16:54:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbfCLYM2wdVm2O9b3A8V/YXQldPqWxPuMmU+25ya0nsuFRwBTsTMuE0cDlYC/pk9noRDe1fvM7VYUYQW+2T2rHM+pLmNKBh7M2gH8NmOSDgJH7rWe9nTQDD1uQkiCh9A/HX/eQLJpyfg44moKF7yENcC5To6aY84FhRoBDgCavWIrF6tW1IhHo3l4ZPIKRwiYiTaHimxzCZTS02JRiW1vSnyiox3wEE20l5hfDyyNsQAs9z5SJH7DORtP5b2Ig+jwy9RfZoS4+pcoC7Yvw9Be/eqAxsbR17xI16585Ev9QyeGRTdLOMDSL0Dl8X3/2EEgiFjfWCWN0FTh7hSd1FLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vr7+SM8Fv6MDralX3gdl1BXLVb2ljnJDCz7JW0JFYJI=;
 b=Pf1pvXvLz5N6bhC0YVmlH+apEzswHYmMp0l3/2eGCysoHihRny1tzIZqQDky4/oQC153F9Nm0ixD/GS6xifhQsUoSSPYY9s1cBPzekYBEGKoLtw8FpWUoursy5ficQUeb2ZZ4mbuV2+IQb4sKpNETCVkD4I4gJNOTfMK8CE73e22C2fq5D/sFdHos7wqF8+WWj1rnRuvYN+J2H08FaWNkEWIaIxufyVI46fiTy1A0h71vE+sWbtcQodLODAVYnvxByf1JvQ0gjM2zIcj0aDjcM+mhoo41j9iJs+YzHvNc0LSOaUq1nPc2xomDyiOaUgT6TuyAN8E7aI+ves1vKfgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vr7+SM8Fv6MDralX3gdl1BXLVb2ljnJDCz7JW0JFYJI=;
 b=NTsuEPWfLTbdIxX24tOXvpK2xVWpgsa8xKqoCttrRdo5IW5eR2PsZbY8Wku4XAVRxPYJcw0PiDVLRYJZ+9w1ZVPRmAxvetohHbZPJvXOJqkiO6tzxB8fIP8ikuXSclHVWVpqtCxcSpVC+t1CKEa3T8t2PQIgsO854fb309G/EMAS1DnT5tGgLDLEjdXYLXA9qbiIqWsFRgpeJ9FCYbYE3KgqH2w3qT4oUdgoXv/1twF+QN2iOgp2GLkoQ/TaXk+XTqDV6Q67Mikgt3v75mpa/U11TZCj1vJNdN31IyXamVgoA4o8xwCHdqQCR0UdIL7JQ8Wyd9kRUvfxvrjed1CczQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 16:54:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 16:54:33 +0000
Date: Tue, 30 Jun 2026 12:54:26 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, adrianhoyin.ng@altera.com, ustc.gu@gmail.com,
	bbrezillon@kernel.org, vitor.soares@synopsys.com
Subject: Re: [PATCH] i3c: dw: avoid shift-out-of-bounds when DAA assigns no
 devices
Message-ID: <akP0wpRY9i5hVa3j@lizhi-Precision-Tower-5810>
References: <20260629233650.2148827-1-kuba@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260629233650.2148827-1-kuba@kernel.org>
X-ClientProxiedBy: SN7PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:806:120::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: d479e28b-e9cc-4cc1-d2b7-08ded6c84273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 65ppQf/biG1Y8LTY+baR8PzlYurXyGBJhUCv+zsWeTnTD3mr8CJLfcKWaziP4+oUvmgs41voBXmxmS62pULrR1aOJzJ/nh/WxiuiUGyDXKA9a8VHP5WxuSSgEiEPfJXrV32F4CqQv6lFLEDo0v91Iwd/Z0Z6CPK5XYG8ynAVOws7qMzs47EymuV1vyJk22oHGkMTdB0hb4m3tP6SHFHEJTBBko3LVzFWEZj9pyE1SvBPAbjtSvIVhuqTKpBGJwzHYTs6VmeBnCi5Nvh38OjQaiQmFP31U8z3FXO9qehp89CjzMnntttBAVD0BDM/73NI6EarwefMSoSTdxQ6jz0jR6mg3iF4J8x8Y44Rr0a1jRDfRIJqSMxB+tyDswJfIGWkh85bDweVnbBtS7K3TzaCa63UGRjHzHvgCaKmBr3KFC7uzFxit9vbBjX6RU0VrqatFLtvWfXz1V0sHaJ1rjhio9LCXzqSU7V+EEWPB84Qth1O7cBlMrYDisp7vE1/W5O/We9rhWjmBxIh4XqZ3O43v59b6goLFGoZwzl8a4qrEockhz1Li8aw45EaTf6XqTP5TkqhdRGVRxy7mIkcNLafSdo0twAORG5/5C2ir+N3CcDDUPybnMqlCrUuiuq/NsHmAxEg9fOmKM8vTY2nySsIlotX8CXYvZLlneAbymiuO5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZrbDvmh8Inqtb/gbeeJ0CgV1yFYnFRIvdcbCNxvhhP68+RAsVBHD4tO4WsGf?=
 =?us-ascii?Q?XXqL7LyIHdaTYCbCiphT6lXvQFp69OH6WkLtytb8kc5yCYCgnNE1D/8o0Q2Y?=
 =?us-ascii?Q?r740GcXXxqIc+tiBNsBjZYYTmxnwOYiGN6i2wW0u76SIQCapm7nau9ssqnOO?=
 =?us-ascii?Q?veZzvTy6Bz/PkWOdYbXp5ZWCwrf1Ca7/iJeihYa59221P+JroNk1muiTn4V2?=
 =?us-ascii?Q?+/YSz7SAsoH9f9un+ScFf98L3R24mpHDKFZErZaSbXb+DI0wMDB9JzD8pUtc?=
 =?us-ascii?Q?dBb3k/a8x6wgv602xah2q6zzMwyBM8WZcfKB+No2P0Hx7FRfCDZKYyXqezv2?=
 =?us-ascii?Q?KzBetKJxdgfAhaFfa1X2ExD2XTMOlUAQC5njU6O4cYQYtTOYcxahnRj94+bn?=
 =?us-ascii?Q?KGABQhv9Pnla5Au6XvXNiL56eruzE5lFCBcvgcpExuUQYLV966B2pmMDdIAW?=
 =?us-ascii?Q?wXW57peR5Nlh2oqbeg18gyd8721g6I92g0e0PNMV+75M0e/AfwNIljyFEOvG?=
 =?us-ascii?Q?2G+Wc83DWKUck/4sryD8Eq0cCI05D5wuN3Nh6TN7X14ksp9I2/McHcjxsxao?=
 =?us-ascii?Q?HT5dn0lZ/nZEgZFfbNsC/uGQXa0pRHn8phl/iRxij28oWYP4LLxSFWJnuSxg?=
 =?us-ascii?Q?t+yrcdODF+XAHJbJMkQ4fsLdB5u6HM7AwhqsrI3eWn5fyJGodKicplqJ6Nzm?=
 =?us-ascii?Q?xZj1PdIl6qY4lGSopeAq9A4k+YtfdXeeK6VylU7MjNTJwS2/tSNeTAFrkLKB?=
 =?us-ascii?Q?xP4ihKrkoLwHsgdXBqK50WVGFTOGBNWSnK3+zuB4ISaZFpBfWw5IAkINXIVx?=
 =?us-ascii?Q?B/UJxIrIrwatrn84YmKaey86pfGkE8pFiZsWjNnyhrNKPfJxfEof8ee0sIVj?=
 =?us-ascii?Q?k8LOy75NieuW7jOGaCF4Pf97P49sKmJQxsLwn/bn8SrDYnspBYQnWhDVBij0?=
 =?us-ascii?Q?F+7pzVwC3sncsmYWXf6sp8TvCAfe8N1Vrm1KvAhd5yzobRkwD9UUqHj3U6Dd?=
 =?us-ascii?Q?r2dCADP8fiEHG3E0psmlgZxVOc6XkPKZCaH6V/yKaADUmxDqBBu77cpoSQq/?=
 =?us-ascii?Q?+biW3qkTPzeEJxzaLVSjVwhow50C6KrOEyv0xwu4h5Dk3JKNuE6aeSAksvRt?=
 =?us-ascii?Q?9XzlOjd4vBtWZw92F88y5VNbw1OFpqfIa38EkODhKBxctEtZEbUIcRFPLgly?=
 =?us-ascii?Q?CO2hMd2nSfeYpLl17q15JqaRHwDAt5p247faaIpD4PJXMhYAlDIIlupaA4e+?=
 =?us-ascii?Q?9dgQWNNESY/BRv0xMtph/BypRBYGzNCU4UQJgsmYKQF4y07H4bxMpQI8jPrK?=
 =?us-ascii?Q?jiZp3NMhnKHO62Dsl1He3/GRgwilZ//m4StyMtG+I4XAdc1epTIy8/RCdQeK?=
 =?us-ascii?Q?PS3ZWPXtIKpgG+3Jkr08wg9UJ2pXQZ9YVRQwdUVYSQcJxOfsy1VMh0h/q9F1?=
 =?us-ascii?Q?GhNSpIh8UswtaSUJKfkGkFERT9Ct/Ka+xV6yE7YynyV7d5dAiiYp7OsJIvLm?=
 =?us-ascii?Q?6Gk9LrcUBeoCZCpYLxyBIfuHb7bwBQlYmBmP7KCTnPNWEudABRdt5gwCE1jX?=
 =?us-ascii?Q?j6A41Scalq2tm3hdD1n6X9Jv/WQKbJxk/Q3hOtTI9uFqu0MtYp3MUIQ0v6Rj?=
 =?us-ascii?Q?/fyvahnC7gEieFj3alQ5BRzzcxApbveq1kUrs8TTAtxCB50lWqtcdDpyz6ml?=
 =?us-ascii?Q?cZhvZXW7yeqyEDy8qV8w/sgqXtuxfv1w8CenVrK/S0etj/KUehEsfltLZc1L?=
 =?us-ascii?Q?Yl7hbP+MiG75kQxD6pvn3YGqxqy7rltPlcRmHyU9f8EQvbUK3sul?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d479e28b-e9cc-4cc1-d2b7-08ded6c84273
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:54:33.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERj8KwnpnxmNbGx2fasP9yd72ZlnJIEvfYQALRdqB0hOph20eU0DHWbt3vhONe/sOvaFpsBde/6x71kkq1FbDVkQh9LkmB4Nny1nJZcu+4hfDbKin18a4mCjBiBzSTji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_095439_660735_B90A6126 
X-CRM114-Status: GOOD (  19.52  )
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

On Mon, Jun 29, 2026 at 04:36:50PM -0700, Jakub Kicinski wrote:
> On an empty bus ENTDAA assigns nothing, so cmd->rx_len (the count
> of addresses left unassigned) equals master->maxdevs.

Add empty line here

> The GENMASK() index master->maxdevs - cmd->rx_len - 1 then becomes -1,
> which trips up UBSAN. We hit this on a Gigabyte/AMD server on
                        ^^^
			avoid use we/you. "This happens every time on a
Gigabyte/AMD server"

> every boot:
>
>     UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:905:12
>     shift exponent 64 is too large for 64-bit type 'long unsigned int'
>     CPU: 7 UID: 0 PID: 963 Comm: (udev-worker) Not tainted 7.0.11-200.fc44.x86_64 #1 PREEMPT(lazy)
>     Hardware name: Giga Computing E163-Z34-AAH1-000/MZ33-DC1-000, BIOS R32_F45 04/01/2026
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x5d/0x80
>      ubsan_epilogue+0x5/0x2b
>      __ubsan_handle_shift_out_of_bounds.cold+0xd7/0x1ab
>      dw_i3c_master_daa.cold+0x1b/0x96 [dw_i3c_master]
>      i3c_master_do_daa_ext.part.0+0x3e/0xf0 [i3c]
>
> Skip the mask when no new device was assigned.
>
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: alexandre.belloni@bootlin.com
> CC: Frank.Li@nxp.com
> CC: adrianhoyin.ng@altera.com
> CC: ustc.gu@gmail.com
> CC: bbrezillon@kernel.org
> CC: vitor.soares@synopsys.com
> ---
>  drivers/i3c/master/dw-i3c-master.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..03321edcd0d3 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -888,7 +888,14 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
> -	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> +	/*
> +	 * cmd->rx_len holds the number of addresses ENTDAA left unassigned.
> +	 * On an empty bus rx_len == maxdevs, so avoid GENMASK(-1, 0).
> +	 */
> +	if (cmd->rx_len >= master->maxdevs)
> +		newdevs = 0;
> +	else
> +		newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);

Add empty line here to make if logic block clear.

Frank
>  	newdevs &= ~olddevs;
>
>  	for (pos = 0; pos < master->maxdevs; pos++) {
> --
> 2.54.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
