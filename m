Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9531CD4F25
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqaApncl0z4ycwFpSydeay+Kklr5mXBRBAicRTAtplc=; b=wj4ioTSqlwcDxz
	rF/7IBeT+f5jor/BBoIjiOvElUDLFIVaHXSTNmIH7oRNcNyEdUZh59dbpYpugwT9EhRn//IdndBON
	f2l5VjtwrMTbBLzO99QssgApu2suo/cxgI5uodLFaosMAYmg8MPY8HQBzFy7UTPFTztyHEwwAZjRB
	zkUl/zrWnBM0yZhz5BfgLMTESd4MnpyD8evLfqurwcOCEnsPd2XugoTXde43DucDyIw6COD1urxOC
	cXAAo4M2OfJSIMCDMw4YCqDaZn6Zfi20NZ1Hhnh24Hi2vChULwXZzLEXArAw5eglFE3ldmipwD9Vo
	wkLv7FzIdCA50+7BcbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqF7-0000000HQOb-28Cq;
	Tue, 12 May 2026 16:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqF6-0000000HQO3-0wLL
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BF+IyaN4bXTEAJ8y95z295QilqdU2IBVUwdVTrSG3Z0=; b=TiWKzPXU+rbvbfFkyCV9zbMQA2
	gWdEzwpxy7mvsd6RG+KVEXDWoHlPfLTGlLQ5ar3ZRuRqQjoF9jTmXOQamm7YdJIu2OkXyzhqo7wdN
	dqUe2SLDRy2Rnbyj+o3PPN3PWiDilFPbF99tiMcJXCodzeG39qZZDl8X3P+UIPBl8zYXY8yuylkEk
	yPQYi8FQo59Z/o/3cAz0hpJHboclIowarcHNTsIZrvvmBP66haC4jd62SQEj5tXeRb1TxcOS3U+KJ
	WKlRtpb7ZecKYZNL9v4mGNLY9zJQCuApuiB49h7tXuDIG8pW+9JOy9RJCmX3Afjs19uKqf6f5LJQl
	AC+KzJKQ==;
Received: from mail-francecentralazon11013044.outbound.protection.outlook.com ([40.107.162.44] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqF2-0000000FNs6-3UXk
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3rXe1cjgtp3fuP5vl1iymGaAQxfN8yvAuvfMDXpoczSrytQaK0ozZFXW2UidQNHZNCbAq/cc3eURZfj0ELAKUGCTn5AECJmq5/qqP7bmaKvHRnKSyHE0qmw+pkJutKuYQkZ4dX/dfTT3U6IaOfgs716f6+YcDMI6e/izq2z1VMPBCxmSncME1i+bWV8Awm0v0IpVxpO+9P1iWGoDOHuJl0ZXlT7t7y+pRffcJT3lItjyKfftiy5cbg5/5hT7J1QE65cHv0G63cZSMnPnG+oJ54VIuqJYw7uSW5DnnoG/8jxvGbkB+SAo8LUNJO1//5vPEHMrMXRCOeRQn6G6b4t/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BF+IyaN4bXTEAJ8y95z295QilqdU2IBVUwdVTrSG3Z0=;
 b=lhleCNQqgyCRaUm2cpZ/GTYOQT+Gs8VAo6jWbF/JbT1hqimYz6UDDcJ452fwmOsk7YptdR7imtNH37V5DrfT0X0Bf57cJqKbggVR86fGWqqIi2k0ECeMwXjVDMOT+ya8VVKd6XbR5gs5AbkMhrnR2abRpv09NyvIAXvbgLkgnKHT7IetYyoF3QCnyNW+WpEQczCzwCfZGPmJE3k/0Y672GgPXA9MQrbQMAlbzXaE057RnNk/Tx14hNgwwQ2+t5noBzaVRcYcZaU9nUahGGCupGqJwbIs8Mjy491fT4QvNfEeDp3Pc8fOWijh91ghjwiX/PMrxunrinl1saOnIFBJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF+IyaN4bXTEAJ8y95z295QilqdU2IBVUwdVTrSG3Z0=;
 b=aAB18tmSi3laM47OdZPjCdJ0qytlX3TP3ZrCeozOvPYA5Kg5vqNC15jdaAuR9dSl42vziFvp4BTZn+rx56j8y4NyXQwyCbQwlDk/OZzDCwqBbAkl1gZDU2OAxojztTUUwAXHWpKZGY7MeUkOwrlj5XI0SAEDkcHjbXaNPlm2XDFpctgpCNRWSuM++rYvMPiDi7SBZ1TyYQkHW2GX7uB7u8gTJScmy4H4o0z2x6t+3wTVmUIrr4yArP8PgMPnVlm3ZKMQLh1BA4PamDDMw4256zPW4bPP0BBQJO7la/GRi+guQWzo28/Wl2PF8gz0ykqS7IV3oPkv771ScL0GE3Bgrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:45:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:45:54 +0000
Date: Tue, 12 May 2026 12:45:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 04/16] i3c: mipi-i3c-hci: Wait for DMA ring restart to
 complete
Message-ID: <agNZPLM7GfVhxg38@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 95279717-6cd2-4b42-56c0-08deb045ef49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|56012099003|18002099003|22082099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 1uDND9JINGFGU0eiQGeESoRCdRgDX0jaBblT2+xQGMJuouxie2kY0dxgg6R6PpSqjQnVSjBAfGPSV+Xzm9und+6C4LpBPHpcFAJ9Rvrju+/KOjG6f+pCgjdIjOMyJHHEJbM6qoLGQGDU3ErNSv1dppVayGRTf1ceCH05a3oScdBoP6559Td2STZwKOTrqLW4Rs4PRcxf865/2DX/tymC5FEC4tR0Pi8Hms+3gA56gElt0F6UrBfkdRNVmgoogyS20L82sHzF3l9h0iocvGeRQKagtFRYj345H+tC2kkEourWykttMSIO2Gkx5phOw7Jk9Cobtb1ZN1z74Pys1TRTpmTleTt8b4kQ5WpZ5gQyShC98Oo8+6OQ9f25oxJ48fXdRSe6Jn2et/ypwmSWI/2F8UinlFa8cZHHZNQeSI5STYLJZOLUudERndTNJ9xUmuu07U4nuTkUIapzuPOWDCaAUxzollZMfl/OlNMySSA2HdKdcnQzAHGJSwU1Y28vL9U3VWZqZUbT0xLZAZTPMZa0Tz2569IInUWD59aWAZULMLupTfP+ZKkcTbSRH+4q/R9yuSB/4/35fyW4k6J1ZjNf4BgZQlNQ/VijY0l2xRQkIYaRY8HVNVEe0BbKWZX2f5fOg+Ue+FubIOp8Q2+YJRiaSACK2lRqoa12cuhp1M1/7hDEQwBOblyJTyRZWckb/CI3B6mgVXB1n/u9hh03vlgj9Z/HDUkd4lyIMLXoiWyPMiklk9BoisWop/Lu0LALqwo0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/qY78mZ1qPGkcpPVA+oTJ8OO8qWoOFxS+yPi9v2adouyGhAvsDbdPihxR+y?=
 =?us-ascii?Q?PQVFLtQQBtM8k8l2waa7ZnqqddPhNDCn4X0om3njws4l9T4savnFbKZt3JLm?=
 =?us-ascii?Q?+PUAsLdT0m4CpqeR1ZOs+5VoAKgV/V0CgFJi6wX1yllGRVa3L4pDT0FunsjV?=
 =?us-ascii?Q?49KgeQYnlnVPdOuQ5ohcQkBneFhoIMqyWkOspkJAPSc3Oqr/YO0JUsGIOoO4?=
 =?us-ascii?Q?6OJfILY6l/96p7Qh/UCexJ9bsZR1SgSIzTH3k+pErAYMytVpKDJfEON7WoIj?=
 =?us-ascii?Q?tj/vWQ99awY5rt/5XcMLgzNpvoBGNboTXAiASs+mUuDjb6RpKOMUxNtNIYJ3?=
 =?us-ascii?Q?9aIkjxO+Zk4xLDd6JuB8DQnQLQB5h7KpQbUAgR7kNoMM8SVdcFp/ldvQtUrk?=
 =?us-ascii?Q?9ZEpxmgSvn7WCOtnSP/X4AEkWim2SIVfE31UurzMaKymtsa8FhHx54psL6K2?=
 =?us-ascii?Q?DsaUuqm7h/hogyWA07k5IM/6PIXfKClAC9nl1UMTBgV2pVu+apQysLdHZo9n?=
 =?us-ascii?Q?MHeSBSKF7W+qThAt7lM6oYswun3qUQO58dAfR9k5PV1cQX4SYPDm1MTxqMs+?=
 =?us-ascii?Q?N3WzS86dCmWW/Vz/9IVR6YTm1VrMN2seqMUGKhAU2Lao305G/O/ABP0Lv989?=
 =?us-ascii?Q?H8d3NRLJAy8/1UNRLWZx+3qiZU0g5d62WAePxcF48LkLOHpBB3z9LTsRuGIZ?=
 =?us-ascii?Q?FOqDIQDTX/6Y5R6qsBEfKSNiUdyUCgv2xEnw0OWBZ38GcPzjqknNyApx04EK?=
 =?us-ascii?Q?H56zG4RRM2nmh+QBHPBw6nl+0mqBxKLMkb831tn+P9s0KuRhycohgYZPlqRI?=
 =?us-ascii?Q?S5aPSOeWvN7clzbnF8EYYCKAyCwz5M+2qJoHVapvLh+1qknmPT6dAWYVHvzq?=
 =?us-ascii?Q?QD0og2vPZKXXGQknMREgFCVWgzoTI9yjh0YhwEhWTfyvlwx5jIgch3deqNs5?=
 =?us-ascii?Q?utFukhfBiZNwmCmUrzxqg24ed1eASgxyIjM7a+SjBbdg/iB+esPxn0nxP/Gf?=
 =?us-ascii?Q?TMLjOIhJ66+lF4H+dhMTL+JLkjmndmgUDtd+aAOP1XHNzo1bX2Hj10PXSrGG?=
 =?us-ascii?Q?9olzy/sBdB4eUUfVthXI0dEFb9KqeO5T4UaBcXW6DAkG3v++TW7+ymT9855m?=
 =?us-ascii?Q?EgNsAWaqz4lJsh8uaG5iP1LCjdutoBEjtRHBJIOKvm8ZGpH+geu3lR/RNdx1?=
 =?us-ascii?Q?gZuui1F6t7A8bC1MOGb2QN73DTIJshri6W9q5cJ45R+ybzISnwUOj5Q+ouJ9?=
 =?us-ascii?Q?zzqX6X/3vveBXfIZbYegP+o70g3eUD7LAXvLuKqpaZ3FOaEQF1fSqFIRPHvj?=
 =?us-ascii?Q?w3l8ScTeItXkplg7sErDK7+ydOJj6A2gtaMEy7069KvXizA2sx6PUE0dR296?=
 =?us-ascii?Q?z86rBLoUBr2eKajbAV5M3mgMEJAdFmAuA/VaYRwqafB6rKpBbySpCIuPOZTM?=
 =?us-ascii?Q?d3HvYTdItuBB8sLMtyzfQAb7SRBVDM3zXw3q5/HXFP44Ul2Vnyjl5Fie+RFO?=
 =?us-ascii?Q?NxMcLzAh9vpWzFXsISSYnFumEr4ji0gdnjQJs5V1Xu2ORtrQMxh5unHT37Yf?=
 =?us-ascii?Q?J1FF416lCrn7fm6sU4ZXzGOW4KdwOY2S3aopvIXRvGv/25PYM+P13ipImsKs?=
 =?us-ascii?Q?ztF8xCbbAPfantekt7I6ajdbfAWwkXE4srgcyPjGfUVccvv5ybl8KzrJYWWA?=
 =?us-ascii?Q?PSsO2IdRovUU4J+4yGbOU1wGji0uGdxJ13Eczdvln5Vhnj+I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95279717-6cd2-4b42-56c0-08deb045ef49
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:45:54.8742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFWkgG3q8wriRS45Gwm4kgChQcZa35s2228VLZnr0DUXhXvWFJocCds9otxYdy6+0aPpvHb6Gac8eBNpmvV0/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_174557_395824_FF701915 
X-CRM114-Status: GOOD (  19.32  )
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

On Mon, May 04, 2026 at 02:33:40PM +0300, Adrian Hunter wrote:
> Although hci_dma_dequeue_xfer() is serialized against itself via
> control_mutex, this does not guarantee that a DMA ring restart
> triggered by a previous invocation has fully completed.
>
> When the function is called again in rapid succession, the DMA ring may
> still be transitioning back to the running state, which may confound or
> disrupt further state changes.
>
> Address this by waiting for the DMA ring restart to complete before
> continuing.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 314635e6e190..28614fdbf558 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -617,6 +617,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	}
>
>  	/* restart the ring */
> +	reinit_completion(&rh->op_done);
>  	mipi_i3c_hci_resume(hci);
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
> @@ -625,6 +626,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	spin_unlock_irq(&hci->lock);
>
> +	wait_for_completion_timeout(&rh->op_done, HZ);
> +
>  	return did_unqueue;
>  }
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
