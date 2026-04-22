Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955BFF94CB2
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Apr 2026 04:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cptF7C7+D7lDxn9IDQxseLuNcdnQoJ7+A2MyJzeJ0lo=; b=hK9Rdp4h+qxMWV
	ct0zejYCzZQbD6hIFE5u2beic2nhcm0WNXL2JPqQWuIwK8Iu2BxC4GrvUXU7Hbq4b+YbdcMz73VD5
	YDKzeitivdaP07kRymsKhKhFDU043zNpt/f58Zx4SNz6dq5qZlO6SSghnkERFO3vzmt43JFYghYbi
	o3ZhYV4CTEDYytp0pPfEqbR72TG7ImyMmisT3cFUrZVW2LlT8JivMMu5JNkA3IjQETlfDj/UHfy7s
	+5VBf17RNi8/6B9jowGrljq1AibjR7XOtoZUJ215rxL/9PTznBexngMDudM/qWm4SwsEt4xXdoFYT
	6gzJbLQLfZrWvSu4Chhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOpn-00000009ZY9-2i6Z;
	Wed, 22 Apr 2026 04:05:07 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOpl-00000009ZXn-1s9d
	for linux-i3c@lists.infradead.org;
	Wed, 22 Apr 2026 04:05:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g77L+o3g13hlFQdFRcfzDKCcPoTQoiHIzeugcLvSZ/o387OQXBk1sx9k5u/vVqk/xNR/OVImeCrU+VT+sVlCbC8EQ/mL70X8Lw8mVAWanil407DzzNnRsq+P99itPhG81yU07C4nKfgAMiWBEvmkdhhiMF1AHq5B1tdS/Q08hCaLSWTQo3X3SKJkxX7Tpwq73F02ZanHg2zGmTvAtNgpSgdZk8YvlxR6bAMyZPG99AZvdBaopm3rp6KLtIE2gWNiXRgRiA9jjaonluNGUNSoP22P0L2nCnHfZxOMIaTNMEaQK1fZrqS5G8rdICQbvi1wVSgKTAleiTYJUnAMikf8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imjKM7bSnRGyApX4fZqLofJ3fEVnqFxTkDr+a19IrdQ=;
 b=i5dZ679RHBJ4XXiIg5oltJQsPM2vLdlybzoOCWRDGtOtX5p7aAnQEwHcnJibghFsGeolNm+XQ0mXDxu7Aoyew1+cuMCcqYYrLYrJ/++uSOZUzpLzwWqJasHxAPQYDMprrOviskDNtL7icqtr6kNDW9bva7jPQGgtaH+KabFuwwI+y6jRXg9ysbh69WWnCPd2FttOv/w8oIyc05gYe8CQqgqzGyMS2/ITo4QlItO+QSt2iRGtnp+48po2DXTyZ9t4T5e/XoHwzv62uYVAvyipIc1iHSGCAWz3LR7C5hkWmjt6A4m3MGgL5lAigcUUhcJVEGk5iF9XTauPvka4XeQXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imjKM7bSnRGyApX4fZqLofJ3fEVnqFxTkDr+a19IrdQ=;
 b=CRUD7Mw4ZizoJAwLoiq8XbqbURSfiwHg361Ri9gfi51khtIkolHWIx1O5MIjGI6GvEgWZ1bB0ZHWat6EvuBUd74Cej8Mhw4XoHy45lvPl/uf0r2DK9ccz8RE0G/S9+RHvY0fDZBxquTZj4COSXdF2IhnKYOnIZJHd4n10kNDvlc4IF9+qkhI/f+TXcGDoHDPsTF3UArRtGWpOsyFHM+6QGwGMVswMRXuhcyDQm58jz7nRW6mtzYKEy2WuZ3nAMFD5g2QNmXDHD+b26CkvBLTnstGiDX199TG4zf5yB0wj1PwvNj9/nidI8KJKyucLWNGqEWLsHC4jJVE5Ja0t7twcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 04:05:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 04:05:02 +0000
Date: Wed, 22 Apr 2026 00:04:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 02/16] i3c: mipi-i3c-hci: Preserve RUN bit when
 aborting DMA ring
Message-ID: <aehI6WDSNzh9il6R@lizhi-Precision-Tower-5810>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
 <20260421175435.122094-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260421175435.122094-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SA9PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:806:28::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b857de-158c-4217-052c-08dea0245418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yPFdJs53Qewk+P689FwZKA+qMFYrRJA+ohuK5KPqiAjpCnrlpKjt97PZzuwC2vlxsRLHczy2JfnOMpf+K3eRTdcGAjWZK2dexwlu2cv/CwjSR6nz0qvgl2uLT8z3I7KNCZainOf2jpsHnIE6jfO8NZQygSucAMEE0jlHTlPsN6I0c+6DHH9dL0tBgk+3XOGg8nNLas7mdvk6fz2iBEwUgKtfu0+SwN/WiBmk3VqMZp6W7jOsLOnn1d4/fYx4FIS6KA/v4mM3yI10y8AQo78Al5jT2Lyau/ZyqZtB9jzt5bSyJKm+npKf+JqrYR/hldlurIzGlMytoQFyMKQ2dKJ3m8SXvZvue6NXj80oNHocWXMUSRUgVEYP1kPRmlVemgzi5Qx946ujAuaOAX4zUgWll+r0ptlyDkKpMxGBjC+oMx/J/V7qboOgJe2ixcsegbyqgzLO4IqMjHQ4Q5Fd0NMNFRUdADEo2IX7q823BgNhRTqOJb8E0z4vntO/BWuGFWL637FrY+Vn5adul51mEz1GN58AqvilkdAxO/xtrEmTeaw/q/rcZwy6hml5ZAFhw3dViHjNxC2Q+Y9P++NEa84TmKBIv+LZ9xrWkz2DGL3u7l8+MlnBx9M/MaYmEg0oqczGTPMipMAvmL7uG6BEIWZqBvRcDM0ipAKoq0QVo8Z6Xif8Owg7/iEMmKT2/CajEkq3uVi649+EVNyY321SR7xJ/E7ocsboq0iVJwG3g1uea+1vY+czIoff7Evh1uMTciVFoOlrsYRDLh3AkDyqv/2WBTstprmP9eK6RRJiJrt4ROU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IwcaazWt4sbqRyU2x303ORsaG56W2hP5e0WFGACBy4RyTxj5gx+uOsgABFT7?=
 =?us-ascii?Q?zDYG7cphJ0+g+EisS2KjN+JocCmdYax5WieFbOXSz10MlxCW87+0Nfg+CpvT?=
 =?us-ascii?Q?m/eBq+JB8mMYn6cG1ehdhB9aaMtZnL1vG+ikD2ATCNN7x1/FzwVpH7THIkpd?=
 =?us-ascii?Q?y+hxi9mJDHOEaIacDE91GOrW9B3nTv1BAup+HNONbyp4Vh0VeXBAE+1NOBBL?=
 =?us-ascii?Q?1ZgWw4sTI5NgzjAw7dzlSRAvTF8dS35IcNkNMbVuYplsC1SqWBJQh1SrAITZ?=
 =?us-ascii?Q?on4BV0Vg6FdPSa4Enw5+zOUg8KoxOyxCmy3rWYT94zx9MUKwZSOzVJoFPXRm?=
 =?us-ascii?Q?dw1MGW5LzjwlP82BpVUvSAiDUUEzfPdqXEs3d+ZK6rutP/kXB1kdahMd/KBy?=
 =?us-ascii?Q?8gzkCp+HWV1BuBYwgso6wd29+3PWWApm+c8QE52RR8Y9YwBiW25bTB0VpCUz?=
 =?us-ascii?Q?5IWLHNW+u4wPg+AaIvNnoHzthWgXdMLum0Eh4JBvxYPRz4r6CCGPtDbArn4t?=
 =?us-ascii?Q?DPIrZVKeqQyJ4sA8tPL6nW08SffnadIklFwgHDq3M792dIZ6IGoqWG3RV4uX?=
 =?us-ascii?Q?DcRZpq8UAGkyMN/oMQPOUA50snTl7n4xKj1ecP+AzG9fZtan6pf2QmkXYtfg?=
 =?us-ascii?Q?VJT+jOctOBF/QLBCpfVtfq3dXo8a0SFL3eE5KopIGhlWIGaEux0zJ1VqliYO?=
 =?us-ascii?Q?luDHtsC5fOXpkbUmUl7uZQ301JoPcD0TnZsTbCngtoq9ZD01FcBLwvpXWnj+?=
 =?us-ascii?Q?ALSGewyyxoB0HiDLdHLyLa7WUTz93TpZM7Pue4B0UtcWPVzPieyUT6FP434j?=
 =?us-ascii?Q?c9FJ88tmnZbTu7ZFiR9Z1EepPJvx6fYhCRYNiE2UYHfWSrYj8VWv0746KMhK?=
 =?us-ascii?Q?mUobnWjg8J3qKBs08VIxi0bMutk11Lzh3uEEoaoooXyNE/2niq0SZ+mJF2oX?=
 =?us-ascii?Q?6aaewkeLw0x21QB+5EN9CCSPXt1NDF0P6HowRHWxmb2+R1bwdZwMJRyRhMZH?=
 =?us-ascii?Q?cwQERKxlu/tYADAvG9N94FAqYSyrSgLV2PSUD5Bux/bVn5KJpWZeKJBsufTo?=
 =?us-ascii?Q?veMLBhLlatddaguZ32BZ85GFeNonva/mdLX9TGBkfMl84vwRCNxIjbx2IO3C?=
 =?us-ascii?Q?7yMK8DaIhCZdtUm814a26lf/u2GRImmXNbOKHTJ5EEHK6QvpsY1OF9S0jKsC?=
 =?us-ascii?Q?M+3w8O52+BQyKvBPK3EFX1WbT6KlSnbXMKhS4Ib4yUKIbWpNahuY7OP6Mmp1?=
 =?us-ascii?Q?tQyHThTfnfvVYhR2LwS+ueenxXak5Vm+UQg6qM2U2CWMypDW0lRZ4lKtPZ9E?=
 =?us-ascii?Q?ZSF0S9XOxQxUmM8AikHwalYBLC9Wc5n0vt8OCg0cvkSG7CDxshUuQaReZ6jr?=
 =?us-ascii?Q?+MBPovH4R1lxttQBsmKRoUKBMYNkLqEa245cxh3e9uMEQkBK8SrKnSZ25Tq9?=
 =?us-ascii?Q?YbZqObM+CebbJfyXX2guq8tUIiHtxGZxiOA05y0JK7JOSUq3HpRtKjg4rZJx?=
 =?us-ascii?Q?zA7gn6PBA2pE82ri/4RFGI/k48O/7sSC43tWSOihdE9TkN1/lL+Vw2NzpqMo?=
 =?us-ascii?Q?ylhNYwIL2BdT1lMYi9G54d7VrXRRI5zWmBxPRQsjVa70YX6HG1iohKpBlvCw?=
 =?us-ascii?Q?lbJkTdgculRVFgn/4olGbcNIjZc111VG2W7FdLPz//lARQuUofBJHztTw3o8?=
 =?us-ascii?Q?/QrD9EU+a87aVw/6kB57N16ACUgBBYj2OSHYennGpHJysYobBhJc6Z8ABsWj?=
 =?us-ascii?Q?qjJMxH9Kuw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b857de-158c-4217-052c-08dea0245418
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 04:05:02.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlFL5bK68kodrnBgFXZNMECk4pvAiMDVctnaQSK++JiLw+/aW0HAKoWU3kaXqc8NiPpFM/n74iC0KO5p0hLsIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_210505_510789_DB96C0E4 
X-CRM114-Status: GOOD (  21.61  )
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

On Tue, Apr 21, 2026 at 08:54:21PM +0300, Adrian Hunter wrote:
> The MIPI I3C HCI specification does not require the DMA ring RUN bit
> (RUN_STOP) to be cleared when issuing an ABORT.  That allows the DMA ring
> to continue to receive IBIs, although an IBI is anyway not lost because it
> can be received once the ring restarts if the I3C device has not given up.
> Note, currently ABORT is only used on a timeout error path so the change
> has very little effect in practice.  In the more common case of a transfer
> error, the ring (bundle) operation is halted by the controller anyway.
>
> Adjust the RING_CONTROL handling to set ABORT without clearing RUN_STOP,
> bringing the driver into alignment with the specification.
>
> Fixes: b795e68bf3073 ("i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Improve commit message
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index e487ef52f6b4..4cd32e3afa7b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -554,7 +554,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	if (ring_status & RING_STATUS_RUNNING) {
>  		/* stop the ring */
>  		reinit_completion(&rh->op_done);
> -		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
> +		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>  		wait_for_completion_timeout(&rh->op_done, HZ);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
