Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1085C5B549
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzZzOhQUgv4aZAgKF+QsjKJpO+oPM6TjzfWgqyWrcOM=; b=abEomg3jOtxEoX
	S2z/P6Ra8x1M3k4QmTauE98ImhiGVbePO51CkxE0ZWsrpgLHpFEf5TuGExif8bsgQnCpeeQBlK+Tk
	gAXMnl5j+oKtmzK2f6uiePI0GLoqROiNAUq2KAO0Kj5I/o7+8btl0s8fjuOMXJ3goSJbQdx+VtLwe
	s88ANWwdW5PAMXYogalNRQZz5Sf1AV/Ai+/6q2I/SOAqV46eTfjFOgP+v4Oyh75QQwFWI+EPdK+Vn
	AkQGqnn+PsTwal1cOZWEq+8m/r3N9prALHOy57eHDAfZS2y+P1UbsCUYKFiinTuhRd9itUu/ho0zJ
	y18RnA22JNDQOAY9CHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpcp-0000000De86-34VJ;
	Wed, 04 Jun 2025 15:01:55 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpby-0000000Ddx7-3T2B
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 15:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg9elIDUgvn1HDyJb8HV7c3LjuXnWVSors2305g2NytxLWKJTV4/80prnG5cjfK5nqHTXlGbJQeBsLHbD102Cc7k+sqL2UMA0NkNCO45esVTAz9XMdgxtnbAYN5voUGBWJDYJvMCy8/4i4kpl8w/Dht2hRWYcy7is45tY9NWeGSJ0hMs/+x/Jgk+mG0LOodfOmEuaB6cZgiYNkmKIxlRgoudibPcsespZ7Vueysq9dpnX+FS+U8IiUj9qiaecy2A1mKA/81fzlRsvHuDQn/1j3A2IdlXg582Tyf+sf/LSC0uCZkOBqjjsP7ydrh/lkV+lBqk4y3SSUyC6JViia8rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW/jczaJRsERs/Fxl8gY4W2QORlaJEbFoBirSuDwDRw=;
 b=iVVloODYwrvTPRtiphmOjKZi/3BcKqDvwpzgWVNkVwIJUVH7kR3wDY7cDqY4rA9wYUC+vHuWfhdWUHjSIeVO8DBixXu1a0Y01bEqENkrMvFJtoEOmFsq8YjKcl9wT1U5BQrAy+A9Eub9UfBm7EhoGgAwdRF30enkrqHk8ynU8RkSOJAdzMUeshrAGazFJNfzm8KzWwBKcsD2OQbsB1DFkKd6UsT3DQ14Q2dv+ih1EO2mhWiltbIZFpB2K47EFtqT/K8GbJyoD5qyIgq4Uj2VfQVJlTwwD+D+NlYrcPis4pzK0xoes156THcZ4CoZKEd0xjBIpA4u4HnQHhYxtGwzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW/jczaJRsERs/Fxl8gY4W2QORlaJEbFoBirSuDwDRw=;
 b=TsKa9Ge6HdqrWGsjaNQTjc13nCBTtgG/eKbHlhpFwUBtT4Po6LAitxr5AlkL9yZwoN2Qb5/GK+Va0URn3WWhyd/PQ3CAAn74gqJ0OTWHXubFwnvU/i2JD7hBnXtdBtxiCdqnXecnKDSKsyRQ+LwK8WEclmOS+obLfSe01h8TfRgK92itDSxuNBLn1IvQNNqipBY7pMWtLQ0XxYwP6evrJoDBB5dDW8MddLCHoQRsBzTV88eHp6t9xtl7m5J0kbyYcUphPwl4/jIZLKdG6qQbyDGZ8WyRSYifiHkDZxwoYhbvW34rBe10V/Jv8GVtUGRLXN2SFhXbHh9/7qMb8+y8pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7530.eurprd04.prod.outlook.com (2603:10a6:10:1f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 15:00:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 15:00:57 +0000
Date: Wed, 4 Jun 2025 11:00:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c397032-be89-4a64-b6c3-08dda3789c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UrIV8LHKAldTUac0BXa+t6J1vmC5bzi2kRE5yiZiHxST4gZ8pGoyQEdOKeMn?=
 =?us-ascii?Q?GS4EGYaX0QUDa9Ds6zuKMI2TpHMhzNCiywf7/BuaWTTu56DrYRohmn6WC83y?=
 =?us-ascii?Q?3eKwyxl2c8Cyx3u9QNhGOrkF2csyb5loPwTe3PdWutgobDHCLWRTOQQMEsdM?=
 =?us-ascii?Q?lHXS4NbCoA9hDoOg3e4bdQAERktLDeGlbF7kU3PBsXN5HyCqkC54TrcwqYob?=
 =?us-ascii?Q?TIzKfE/7E7yaBgc7u8drSJtsVtoklxzpeTjgDdfCFBu5yw8tdt3K5y/XNJG3?=
 =?us-ascii?Q?2ltSdJzvskKpUV0DekTBLmkgsn+uhjrFuRuNlF9ayEUTsermEdyc1cPx8FZH?=
 =?us-ascii?Q?8vw5KyfPeQ8xSRFA6MifkSejsQyp4wnkKcjFUZGcjDHNNSfu8JG3FnxxhELe?=
 =?us-ascii?Q?BeBqn5Pnepl2UIno+ihfioDiCCfkd/hh8cM5XuaNJaSE/UBXJfUA9Q8n5MUM?=
 =?us-ascii?Q?i5FCrDCJdGl8zBcpdJv3kKqjw25iJctYmbCD4eGjZX1pYNPxgjX5TyJC6Ly5?=
 =?us-ascii?Q?PV24268/QNpiZXa5CxsxLN39MXBmbpiIadWvpU7sVMPkrhg6BF5bEdr9Vp2C?=
 =?us-ascii?Q?YSsOpmOeJ3eqT2BjrnAvceuaDOaVJZAc7WkqW8lrYm2aD8QI7Nwbl3nevp+v?=
 =?us-ascii?Q?17ukSyGq5ls7J9qEN/YvwBkAl1q9TKebBoxgZV/OZp0Z1gobdKg9aJOWpwCI?=
 =?us-ascii?Q?MwyP3bUptqEYf4XzK0NYfoB/bAxAxKjGZ6zNdnoF4dLVyQ+cC18NYZAMffeN?=
 =?us-ascii?Q?gBYDxRJhZgXVWeuJn4xw10lzQEmkAKR1kkl88IrXuK9Nf18w+0O3Xl5jL6wc?=
 =?us-ascii?Q?4/FimUu2bNtnsme98wQBykBynbV+PfPGaOM7GygauBRLMYedR8iN4bUXexpC?=
 =?us-ascii?Q?AbiLBfMtdQ9dm2qNZPmCLGnQUg1AcktldHRCVnV4vQ6xonPda85a5epqWoRV?=
 =?us-ascii?Q?Coph+DJoiZ05mC3DoPjF8chTJ0GZbMxngda+dqt2K53aINuzwa0F8ef3+qMk?=
 =?us-ascii?Q?Qo/N4iZVf5WCJIphnPoceD4WvyyjLAQTXQWu+KPAcAqgQecENZ2TrhjqDMkw?=
 =?us-ascii?Q?L11M44YgsBVyixzKzpvmu99EAtXaT+0Gy5+ZaAhGG7Wg1vvuMmROZNGzUm3a?=
 =?us-ascii?Q?QPC3oJy+75B08Y8Zoyf5FgI6qF2DM43wzHicYoqqD32EPuTy+hcvz4VKkbTC?=
 =?us-ascii?Q?aCn+U9kN9Wxi41r6n35df0gR7ZSuDmPxWnv6R4P66ph6S8KzabZWKxDt+yc6?=
 =?us-ascii?Q?l1DwsCgUV0/5HscK0wJkVJk6gnyWuWsdLNIN4lsCpFK1h8D6DB0LJBewwJTA?=
 =?us-ascii?Q?PvhTmmSEO4Lzrs9ozjN1Xkp62or5imU9UsM2tNbzEe+r7oykeQaTzIUtib9C?=
 =?us-ascii?Q?/CWKpTsxD5aCLky8QbJE4SzyM/vu79Sm6EKbGUn7TV7y/TRtH2yEdSQBOBLy?=
 =?us-ascii?Q?zxHOf5t93dfrOAu7RSJV1gQM5fhSkMxUqMhH327pdPCwfj39eLyT463xUCuU?=
 =?us-ascii?Q?fk7E6RcWwU5GS18=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JRP2pk++ziZCAd23Wpo4YQ2B9DaTi9gZ7/ghNx3TIKKbLz0+KCLzreKQamMk?=
 =?us-ascii?Q?MoYOLufnqjfvaFquqCPkkH8Det7maL8bKFUVkJ7Q7WTCHmQDhtCSyS71g2n7?=
 =?us-ascii?Q?ZO6ABPprquTog9VH/nMODTgJUZS4BFhs9YuZZ7qxSH0fcI5Ua+rXqfKjOI1u?=
 =?us-ascii?Q?uWmPWBrbXg3DwBels9JJf1ll/ertUn9fG6y9YFLKqW7flvCxLgqUPdVY30Bx?=
 =?us-ascii?Q?tF7KWYLc8ULy4fO5nSMSQWCgATGXHiAPFU3Agm8EOpgtZgsbGQ9gCYpz6t3K?=
 =?us-ascii?Q?lxYz+VR9xmbPoIlYzt66ktN5G1ga2LwwurUaKTAV5DdDpm9EmgUjgS7pdefx?=
 =?us-ascii?Q?f08c8ghLRDiQqLTraqCVdBWd2bSzqo3FBT6pBGKJcGJ0eogJ4UYomAlXVEev?=
 =?us-ascii?Q?9T06TzB7xi9Rur8AnN+mdNAgWScVyENLXxUNE6wfXwfCyH8qnKm6E8LFbJUa?=
 =?us-ascii?Q?10CP0GIA0oNlMdMK1LGy3jDmsCwvgL+XoA8KdFEnx7y3chJ+ZHeueGYlHhFT?=
 =?us-ascii?Q?ijRsgVYOSRkJEQ4LkHMu111OCVqtJ8bsV61D0qb7szozG2ZU+tVp6MWZERVB?=
 =?us-ascii?Q?Bh0aN7rbG87WRfdjq+7/gco7+A70hZyTByPrZ4tb2Yvxg14qVmobws5D6c4q?=
 =?us-ascii?Q?hxbbskKGK5rjKoEDCiwL3b2g3Mo78Q1C07BFVYZNg6KFef7eBV/ODf+tbVU8?=
 =?us-ascii?Q?vwo+ai1PRHNgkIiJ0FKREVmjUQz2bDBlLbWw3cZppV3iETBxJ/sHLbW/CEVg?=
 =?us-ascii?Q?zSYN1Khv0R3Lfzeva78nGQbSUsGxuAePUSTJq0kQceEsl7Qor2YPVqrogkTk?=
 =?us-ascii?Q?0hKmK4POlebPHo/DPQdSuriAoSp7dTgMNsbozxCTNedOJkO1VP5WpZiwfgTn?=
 =?us-ascii?Q?I7/ToBzJgKUKDkQkdPcLBrwxbCiFvLhy4RQYLPzUOSsWCiusY+Z6gPqSV5ZP?=
 =?us-ascii?Q?VvFjxjtotWz6bEJl/vRsGJUPTQarikV1XBff6NM5BE54zOxB9L1U9FcnASRo?=
 =?us-ascii?Q?JCFg8htp7YEJrYxhi0ffmEMSIwPbJoT3fH54o8LhcWelHwQq98VutbXmjPXU?=
 =?us-ascii?Q?a2Xo81eVRthyjvdVxJ/G6tpj6gqzyrlzKB3zdaIhW18eRXcs11Cp96TPjFqK?=
 =?us-ascii?Q?70kgu53rbtGijbMxzFpD4xKJbBB4MS5irCjgKBxo10Uz/tfbEoVL3L/BH8sT?=
 =?us-ascii?Q?H/nSb0sR0QX2pYlFT7mxd8CQDpDKcc8hKqDmb64786LvYCTMBHcPII8ukvTs?=
 =?us-ascii?Q?yxPtIZ9QH4+2oHFoI7D4Z8QFEAAzT2J3s7gIY+Wy/v3HAvImDs6pfZiCA/p0?=
 =?us-ascii?Q?8TqS19RKiM1FAko4T0j5fCBYC8eFCBXfErK66yVdiEPKMXFSvdcAC5YdRCnp?=
 =?us-ascii?Q?9d0xJX6fymlXHn5p+rkWebh2076xLvb/N+4wMDji4N31Bcv1423E6MKxtVcF?=
 =?us-ascii?Q?hpLcapv7+IprbSoqswaA8bJXS4mrBetEbHJvAYjWXHLVDdRyqHWixOlm3hjE?=
 =?us-ascii?Q?vw5oqQ+FpGi0HCeqnsSkS4aNjZWnvyrz/nyKWcUhEz5HeakgdfEIWCza4tiu?=
 =?us-ascii?Q?FcRHuU9k2kJuc1jwieRpRVOWXVIxBVj5fU5ukrpu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c397032-be89-4a64-b6c3-08dda3789c65
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 15:00:57.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6Obu7oj9YVmcrHSYJnuqhdMPl7nLyzOn5nfx4LhsGLAyMzk9B2+Rxvji1ChSpXhzA3K+hWL3/3NkHZgmr1T7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_080102_869776_330FA98E 
X-CRM114-Status: GOOD (  32.41  )
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

On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
> Move DMA bounce buffer code for I3C private transfers to be generic for
> all DMA transfers, and round up the receive bounce buffer size to a
> multiple of DWORDs.
>
> It was observed that when the device DMA is IOMMU mapped and the receive
> length is not a multiple of DWORDs, the last DWORD is padded with stale
> data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
>
> A similar issue, though less severe, occurs when an I3C target returns
> less data than requested. In this case, the padding does not exceed the
> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>
> Therefore, all I3C private transfer, CCC command payload and I2C
> transfer receive buffers must be properly sized for the DMA being IOMMU
> mapped. Even if those buffers are already DMA safe, their size may not
> be, and I don't have a clear idea how to guarantee this other than
> using a local bounce buffer.
>
> To prepare for the device DMA being IOMMU mapped and to address the
> above issue, implement a local, properly sized bounce buffer for all
> DMA transfers. For now, allocate it only when the buffer is in the
> vmalloc() area to avoid unnecessary copying with CCC commands and
> DMA-safe I2C transfers.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
>  2 files changed, 46 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index bc4538694540..24c5e7d5b439 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>  	return hci->cmd->perform_daa(hci);
>  }
>
...
>  }
>
> +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
> +					 struct hci_xfer *xfer)
> +{
> +	if (!is_vmalloc_addr(xfer->data))
> +		return xfer->data;
> +
> +	if (xfer->rnw)
> +		/*
> +		 * Round up the receive bounce buffer length to a multiple of
> +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
> +		 * transfers may corrupt the last DWORD when transfer length is
> +		 * not a multiple of DWORDs. This was observed when the device
> +		 * DMA is IOMMU mapped or when an I3C target device returns
> +		 * less data than requested. Latter case is less severe and
> +		 * does not exceed the requested number of bytes, assuming the
> +		 * device DMA is not IOMMU mapped.
> +		 */
> +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
> +					   GFP_KERNEL);
> +	else
> +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
> +					   GFP_KERNEL);
> +
> +	return xfer->bounce_buf;

Why need use bounce_buf? why not use dma_map_single()?, which will check
alignment and size to decide if use swiotlb as bounce buffer.

Frank

> +}
> +
> +static void hci_dma_free_safe_xfer_buf(struct i3c_hci *hci,
> +				       struct hci_xfer *xfer)
> +{
> +	if (xfer->bounce_buf == NULL)
> +		return;
> +
> +	if (xfer->rnw)
> +		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
> +
> +	kfree(xfer->bounce_buf);
> +}
> +
>  static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  			       struct hci_xfer *xfer_list, unsigned int n)
>  {
> @@ -352,6 +390,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  		dma_unmap_single(&hci->master.dev,
>  				 xfer->data_dma, xfer->data_len,
>  				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
> +		hci_dma_free_safe_xfer_buf(hci, xfer);
>  	}
>  }
>
> @@ -391,7 +430,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
> +			buf = hci_dma_alloc_safe_xfer_buf(hci, xfer);
> +			if (buf == NULL) {
> +				hci_dma_unmap_xfer(hci, xfer_list, i);
> +				return -ENOMEM;
> +			}
> +
>  			xfer->data_dma =
>  				dma_map_single(&hci->master.dev,
>  					       buf,
> @@ -401,6 +445,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  						  DMA_TO_DEVICE);
>  			if (dma_mapping_error(&hci->master.dev,
>  					      xfer->data_dma)) {
> +				hci_dma_free_safe_xfer_buf(hci, xfer);
>  				hci_dma_unmap_xfer(hci, xfer_list, i);
>  				return -ENOMEM;
>  			}
> --
> 2.47.2
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
