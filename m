Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB41CD6E56
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 02:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SLWwJJIUYlKrWsCT2Vj4AQ9nF+p7Fk/r4j2kMjnSaA=; b=X1w/O5hJMmAmDD
	K16X1wdm6H38G4gLfcG0aaGw/NPQ9+npnHELUdewWRUz+MvH/zIVXUBFicRw1sw23KtjIJturuHcL
	LSXmb/42JDgrMpcgKkfAZhF6kg14AJFV2ItKy35HYojgYtUeng6+Zrcql5VdaU7pLbc3bwdfdMisH
	9mwPR0pnRtm3NVrBFA7d2G6YSC+z0QL48LLc3eygbTPT8p2wA8TALQqHeaGTFmHG2prf8uc1xgv/G
	o2XjmG6IMe7lr6ssbENWdlqSBOtt+OD45VvjsjtdsePAgADGVPS94VPy0USSQeLt8nsPgasbz0VT6
	ZauPStmjhe7I75R7+tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFGT-0000000CCTV-0Tdw;
	Tue, 02 Jun 2026 02:54:01 +0000
Received: from mail-francecentralazon11013046.outbound.protection.outlook.com ([40.107.162.46] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFGM-0000000CCT5-3J1k
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 02:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8WJ7aFL/QvkXB8V+7lMqhWIygL+7hwXqzyJZ6kQgHQljndyjDSjMgglXOgV2tmOCNiSys+Bfj2hE8XhgrJP40V/B5hUEr2nM3zaZAp1PAtZoAowomIarWNtpXzzFd2ouCNI0G6B7fkPP2+rEkDdqoOJ4t/fXtXm9BEHKgHYR8fmnKIsJKe5Cwssk+/RiggKt3qf6y2PTCYMgE5FbmdO7pjLDRjYSjbVDmA3RH8K31bJ6uNhUbd4eKznaMml8B47vmHl0NFIBWmBaREkWUTa1UgBi/n1B0FDlPegXCp8fx3tnv79LX7FxuH9Sjl9cD7I7TW41n30YMeJvHS8ZpWLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JubfElTjBkyFyI5XTIy4KPmnsXVfrcpqCYljxfsE6ow=;
 b=c5wpVq5HfCbUnnkJaZE9k90p5xbjkquIDQKFB+Gc1dksNl1qpsWMiVLhTk5Wy8/Q5ojNDmtWhZB1fTeqmpHY2Rnfrtt5xfZWx4JY123a28ptMhzmPim38XZgHvkbyErlSulLFudXvb3nWttncqIeoKCYyktwXAauLpwjUu5Bn1t1vbr13MJ7GV03ZrcbVZP2Na5eo7Z/d86EXInMsHFDu2U4qvGdbhV2wTnQS7GurauncR8h9NqdIdD8JImgtRUqNiw1dDp5LMY3E4Lx485RUG9m4p6ZFIksgxfsGPw1Bg7u5o9ZyYfXc+0IqKAIQ/qLJ1hVlO2AKfId2K7RDP6FuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JubfElTjBkyFyI5XTIy4KPmnsXVfrcpqCYljxfsE6ow=;
 b=h4ZQW9pCA8U3b7P+Jq3NZm3FJuvO7kWpNtTemgq0kIkL2zWJo07cpjXj/9lO5sVrY3ND2YFHTuqx08WVVSWvFsu09laBqzljsrrnBiYtuS2USS4r1onyVOjaVk6sKoZ97bYq12CWqG8L+xacaSoNDCCBjRJ/YG7ekqTEcAJv0wXI/Rh+BEySqWrMwOtdVUgFpag+KzEVSXtrcDajNdAeM/4Gj/0C2+7N+oupS9cmy+MLjqYk3RUdlQ3TsovBQyHd/eq6Dy9pEUuT8wxDqPrP3nHv40nJixT5cMSa+lHod//cIRnJXzANzpecm7aWia/WqfHModw5/ka5d5X+T4s2zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12149.eurprd04.prod.outlook.com (2603:10a6:10:642::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:53:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:53:49 +0000
Date: Mon, 1 Jun 2026 22:53:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 10/17] i3c: mipi-i3c-hci: Factor out hci_dma_abort()
Message-ID: <ah5Ft66NzjlTveBR@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-11-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12149:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d254dc-d227-4ab8-2b6e-08dec0522c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|11063799006|4143699003|18002099003|56012099006|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: S1m2ZOoX2fPkZXxdDd6jOozy8a5e9QondYztYJXeAtN4fPxxy3A7KTxxNyBDTHm3WJ6k4XR0y1wjwfLWUmpYD5WKZGtZBxWgo8EHHB2xbt5BYPQMbHI9Y9XLKvLx34oU+Zn/H1mNj5Dm421JcBQ7LUuDgC3hY2NzOWEq3e6Fh+ZP6hKDHHqN+CVrgtOKlImiz31X8S34krdpLbH42i1ELcKIQj8GzeQEfmjBv9TXfRTCm9AYk9G1ykPFzuGEh/czuYqDw5tG3nan/FT01xDTtu1gWcmVzXgF8QCYeTJCEeMJwu8Aya98bcLES1+wkVTp3UUML78T385OSJM1VMR9nTrRKHSmU+vC81pk6+Xr9yZCXN4CLy52I27CoGYIznXXuZHRu9glppQK7M8Zyj7o5o9MIrduG9rEWQBD4QvL3NbdUG9TM1JK91YEU6Bfe4pzgFRes7p2IAuIvFGc0iQcI/6bwJ8dcOZod9HiHVY9E9Qo65JljVU6SB30tYL0HNVmyPkQQi2XnmWIuzWsvIVabRzVoU2I3T2ISi8iCL69D8GihFpCQDbcDPHh0tRRU1xeSIebVSeTmss0Q3WuQO8Hsgl03YF7olazvfaIi3un3d7fAlf7AfIri8CI61Xso8aJbhcMmAqiufobnS3tQUiWKz+ygaG9dvpSGpFRLxTKFvHTMSWDJO5We0d3GH7+hKJCbGor9JgX0p3IHPqeE5n2N9gkLHzqAsHmQ88d8oCK0tu5eCa+2meyAYQyKBcuNlMa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KHDPZpuXobTpYVEbERkfGc92uUeqDGp0zhXT5DQvWoZK+/AqCL+119y3pqJc?=
 =?us-ascii?Q?fnSief7CgHtPgoiwh4AqPhybcK4jAYXw36BetK2GhaeL1KfVWom67TJ3XMca?=
 =?us-ascii?Q?OHnc8/fwv6ZoN5AL+TFIyGgemQMxUx0LQiV1bKynL0v7B7vRn4NxNMu41Ykm?=
 =?us-ascii?Q?FmdS5kYC26PC2UI3somUNNppAL8njPyV5A4K+M8jOEk3Ntz/wGUmthudh6ya?=
 =?us-ascii?Q?NfSDwPzI1G6nPKMoqOrbKf44fabwvUz6TpgpOLCFJ729JVuCZx71Mtmcqgvk?=
 =?us-ascii?Q?Srtxe6tszmyDW3ZXjUF0XdsvohJVUsoi9RgX+MzCFNiFG6TQ2sOy2VasYdRY?=
 =?us-ascii?Q?oJB4+WepvsYVXyYdENCfjIqWzvbvEREkauq8X6/aiPoKBvYqusrGK+tTu5V5?=
 =?us-ascii?Q?UsqIfhRt2x4tSh2p7pOgmOkRuwknXEFuBdLQgK5aut7jriXPyduoaxKOf40g?=
 =?us-ascii?Q?kUO+CM+/Y+V6vQ7WZrDNrUk1vTOoTsBYGlUzlcjRNZ+58kB+dLyDvJ8VpnlB?=
 =?us-ascii?Q?xN7nEHs/4Xu7/qHX3xwJO7drKToG0NWiY49GvF1m1aegMZkW4LBTUqKtxaTG?=
 =?us-ascii?Q?rMXAnVytfHQn4UlMlUdCxcHECdgCrNtCR9sTL1jxZ2tY6U+VJz0imngYqvYg?=
 =?us-ascii?Q?YMCOzhmd7KgqaW8m3OjGAgZXR+y0AEZBjxcro6y5jSCn9dvjdS/YNLv/yqS5?=
 =?us-ascii?Q?iDgMKKMsjfHa4vFY9HonVReGDwgKQdzo8Z6v5lgxd+ME2PlLZTwVv6Gw5/+P?=
 =?us-ascii?Q?bZ+Tw3JYgYUp9is6ace/RH9Wz11v3O4cLncufzZ8oL+e4M0GIBaQR6TAaqTV?=
 =?us-ascii?Q?ZZKqubS2lxl95C45r4KdMIr4ICTr/asY2DFfbq41wO8qdImO8uzk8tG8sFsZ?=
 =?us-ascii?Q?1yACpAD4TeK9F6RowY28tEYMhYNfcPBsBBP2GLrXHGE/AmMMWvFqbJLN1TIY?=
 =?us-ascii?Q?p5daEGwFlPjjHrxqTGm7fMt5WAfflinPifgpfXTz9ga31bbP9vDVV/qw4Top?=
 =?us-ascii?Q?BQaEgTPC/EHZqnStGCZMwZeSlaRYctXnjniT/zEBlPb/tll8ehuGKpvdvb79?=
 =?us-ascii?Q?ifCtN4ONac/r5NCz2/cst5JaOTHwaPPpba8kdoq85SWy4dyAMthZU9eX9UK1?=
 =?us-ascii?Q?rXuWTORxJpwTWkbgqyUYXO82xa76OVIqWgis23mnYsSoxF4gJ09dokYfhu1g?=
 =?us-ascii?Q?90U702Y5q3LE9bsmQjMvmM/Q8zRuoWSC+BR4witiolIzcVM/Y4BEZKUoER/7?=
 =?us-ascii?Q?KJkwp4rVG59B2OlL3W9gwY+X6fThuRAh/6KktHLvKkX2J/yKRtOVO//biL0s?=
 =?us-ascii?Q?I5KouXSsyuPJZTBfu8d56l5smm7waVQW0eIjseiYJl0B/RePDF0jnOFMM45j?=
 =?us-ascii?Q?oRdNI9vBAgJAkMtPDq3bkVObbShVqfOxpA2xNkxOF/IUGWBW0N31sHHbEyC7?=
 =?us-ascii?Q?1D4uvJEDUZc4dIVJR5ok0Iagx1PkkiPg14yvmCB1C8NHUBCs+Gm75tn2hTx4?=
 =?us-ascii?Q?7t3NpXzXwsVlsB/jUK0DWQwKpdflt/v+B7yDNdcjGck0/Sl0dNaK1ZNPcUtt?=
 =?us-ascii?Q?HXjvDTcojtMd9qv8ka7sDPVfaczwRBAFX7ZKbontDt/mYqXGUSiYAAxVCS16?=
 =?us-ascii?Q?0ZzEm+GeOgoha4m8D3mv5cKPRmmnhca6aUXsOk8w9sXApclX1F0EXGCbK3CZ?=
 =?us-ascii?Q?BDSuSHrxPhPc6gnyXqGj0z3AxZje/v6zlMtKWxpjWXKTniMj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d254dc-d227-4ab8-2b6e-08dec0522c19
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:53:49.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOAb6QmChMfzcBO+X54O/9YL817fg0ZW0jTURRzumpucrvw26BJeR3qclTOG6UF6O4LURWR0jT13Q5rM1j5Wiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_195354_940556_7BD8CAF1 
X-CRM114-Status: GOOD (  17.88  )
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

On Fri, May 15, 2026 at 07:26:14PM +0300, Adrian Hunter wrote:
> Factor out hci_dma_abort() from hci_dma_dequeue_xfer() in preparation
> for further changes.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V4:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 906de7dbfdb5..f2d33068b8df 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -597,6 +597,13 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	rh_reg_write(RING_OPERATION1, op1_val);
>  }
>
> +static void hci_dma_abort(struct hci_rh_data *rh)
> +{
> +	reinit_completion(&rh->op_done);
> +	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> +	wait_for_completion_timeout(&rh->op_done, HZ);
> +}
> +
>  static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
>  {
>  	if (hci->enqueue_blocked) {
> @@ -623,9 +630,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		hci->enqueue_blocked = true;
>  		spin_unlock_irq(&hci->lock);
>  		/* stop the ring */
> -		reinit_completion(&rh->op_done);
> -		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> -		wait_for_completion_timeout(&rh->op_done, HZ);
> +		hci_dma_abort(rh);
>  		spin_lock_irq(&hci->lock);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
