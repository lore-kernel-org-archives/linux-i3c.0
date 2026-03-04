Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF595EFCE42
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 20:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGIARDF9JdmHvL+WYQ9vtvJHSoeMZVpv4ZKoDoPYP50=; b=mhO+Vt7gzds3Ba
	IExRyqbl9+zEaA9xeYB1RrvUp6HzZHN6e3d6iAV0rNcN8TLphs6A2VU7VciynjvIujthkrekn2Zj/
	K1DSAfpRgc3FBEjbYcLPke4baBVbuDwCZJUEul8tI9Vn2Zr9l8nW6KR6wFBaofpgz+5mBjk04AHjx
	6F5MbYdY2dK7jp69KXd2MvIJY74FOEawgaQZDnYUqBKseZe8LQnjvOGbw23RmCqbdcKfjU6XoyUbJ
	xfFiLbSthWiBMWoKLixOFPF19Ooeq6Q+Ix+qL8Hg5M2zmBn2GTUNq6RzDO4wRubFT8naLVH5MU7t+
	jJJGGYqnw2c6K61QPY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsXm-00000000RKP-21Ef;
	Wed, 04 Mar 2026 20:10:06 +0000
Received: from mail-francesouthazon11011049.outbound.protection.outlook.com ([40.107.130.49] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsXj-00000000RK2-1GlN
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 20:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIa2Bs8kCsk114MOkm5oaadNksNk29O7nijmB0rzBeWh4R+uSZJMeFGiwMBLVaWVkuL6fk2J8JpHXC9m4JKL15ECmERaLfFVkY4wEhTEnQ7M5v6anIxSpdoXcoEL99WkBBAWCbM2MR7BTw1NyJOFht69qbCEkwQZFSh60YF4JIkBSkHLZA+1v3m62Q00tD/eMZzRFzKRZlHMpnwKm+T0R7A+I+fke1bz6zjvSu5STCj/sqS5t6xI2ddq12wP0qKh5wytoR8AEH270wm/il7TQrgoSU4rrot50P/a+qd9cDL/fHhAQugwVcBUaBo9dNpPI84oFdHVuspTg3SIFH0mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSxRhKqLM3LSEKdA7R/yJGC5hAsLhBRRYitWGKSkoBs=;
 b=KzYUrQyXibT/zBrMwSOfrk7FlDgw00SjlrBJFjtBPf1dc1Fqu5/Yg7KkQXh1sET/kqz/tmVQMq1cB0zXsE63l5pZup2VQdloW69mPZB4AIt09U3dLhOYHb8ajpnr7ZB+4mBOBWvtOTmWCLdsGET4ppV/RQL+3oIaEd18ltzunNaRYHNweRYRsSupGjL3c7AiimWXSnh0SbsDkIzWxnkUKQwwZAwetDLwWJMkwnWeKebXBKaxezzPdPVLcQVlUII099pjJ22s/kzR6jYsuhhgYqCNJIijOxvZbqPMc+rrK/ApqSFAPso9NuUZxGg3AUW7U0CRZdPwTJRbPHERLmBnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSxRhKqLM3LSEKdA7R/yJGC5hAsLhBRRYitWGKSkoBs=;
 b=GIucPh2MjzzbvsH3wzhQSxKU8TkUkbTqsjfQKzmoFjKJizwKDHxXaRBJGb0nuH1/hP3KjtgCe+EykvFe3PWRq+dpUXOVPzp/uRccv0kF0UZDK2oX7K+0ZoefpjMjKXIj8CR7e91u1YsXohrKVxPuRQhEIN76QkX7d8VCaXXM3a7wL2CciUzWRLA/VdYL3mPux660L+MySCN7R+60pIr4p+VbBzZxWSR4bGfUDwTNWXJ5EUvd9yLqodP/+eVCknxII+fTfNgMLbM4LNy64IywNPQBYjQOBBaVko32ir4XWAeSw2bACmmBrtGTR7bmw/ENIVHnmgHGrShIkNEXrrO2xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:09:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 20:09:57 +0000
Date: Wed, 4 Mar 2026 15:09:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 12/14] i3c: mipi-i3c-hci: Fix race in DMA error
 handling in interrupt context
Message-ID: <aaiRjg5Ieb0ZkLmo@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-13-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-13-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a37701-9b1f-42cd-8b1f-08de7a2a01d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: KaUzVe4lXb0W2Cog7LEdL8OLssX0HQp78pYvoQm+xF1oMhCTsHTTU78WKERSxZxG1rEre34IiUMNyt6+KS41JXBx+4UUfFHyNaqlga2MTdKnCuRUUTrO9cUcjYw5XfIRLHSlFg95z3v0IK4vVlN3QDTbgMd+WDWA5cb+BW03ud0guX46N/6rZ/PfvWy7/l+AabsrwvetZEOocj1XrBBkfhr81Y1Q8gv6AXu4idLFUc/d463HPgjW4ZbuS7/H/kT6IIKizbgbGxzlmvmLUmOdAr3mm3ASAaFI7Zd7Q7U8hEiodndK3jqzXmyoX/9FPgarqbuvdOoGRKhgJPrgBNvk3kVu2aIcfmjELhdPJUCrx2Pjvf/bD+OecjEI3EWF1Y6JXC7OiQLCQ9/8GjPRox/M+rmXBU44GIWJDf/VlcGtMR2KYxoBzRiWEBWQrakLLCGzXBsf3OklyN9YaJsvkMyo4lBKfagWcjk9KR3h8Vo6wiGlvjb04U3pIdnBkgTLoti0WA382ndjuXDfGRB/c0vAYcE4Vjq07Sb2z6yVolP+zJUChdQFExXfYQYCWTMieLDe1USn0sXmve+nyKONOSLnOAbW3ykgoDynqJG4EnRXJVSylttT9u7LIdr8sw/RMT4DSclyiBBB0kPSP7hiqReb1zkLni4tNjlgGG7e4vGRAUl56Hr55qGAd3LvVww5/mOvawjNOT+oaPwSS1HVZ3tLhh9UTqgl6epA/wz60g2gCcuz2FxMJm1JixHIvEc4dr7VTFgirom+zXf/apJy9myFX3f73xL1RL138K24uLZXV3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNiphXazHkuI1fVnckmT88vQ/Yd4agabaqzjgR30U9X3Ut6KWNf/RZEDFKOw?=
 =?us-ascii?Q?1osptDLXwTUqC4kSolYbHNCSE4qQUqNbyRimJEDHfI6CeuJHGI2QlJadsGxE?=
 =?us-ascii?Q?nfAOD7lDrPeiQeBrzm/2UQRvEyecIbDLvE4MRo1DduanPyaYxdt+IIPzxcRA?=
 =?us-ascii?Q?RcXITATAzSTggeIycxUgJwNn1EIR/180n9L14aywT9MSyeQ/OiIlU8+w8fHM?=
 =?us-ascii?Q?UJI9oBi15rvQdo34iQb1nKJirDKai6T9xVJAYTy5Vy5JHJaystOfH7GQUBjd?=
 =?us-ascii?Q?GxN8v92SkpxjdWIJlJgc3UVgzpj2UEkQLA4jQb9EyUF2g3P+ak1Sbqu3r0VT?=
 =?us-ascii?Q?IAT2OLzAyOAt+Yo7qbE8vl4Se0tog6A59d/30HhQ7GJ2Jz9ZUtR8YsGeXviB?=
 =?us-ascii?Q?dnN2q6Xve3hjGzq94N9f0AJcNwY19A2t8VbVtMmm5LVDVOeO9vy8Jp6LYsw9?=
 =?us-ascii?Q?gjYCwaVH0NLnAlB6/3Zbz6kGpWr5cMYoDIyCLrG8pXmKkRU2puHlpXKj2I01?=
 =?us-ascii?Q?schTXRdVGBOEsV1zJtFHhKzyndQHf1LbgQeMr2lTrAFfPVjMvJX9eufww0wb?=
 =?us-ascii?Q?xMVGhZqhwhXkvEf0nOSUTLuoEP0af9fhu8esZ7KQQ0POuQPfP3BcMSVV5bI7?=
 =?us-ascii?Q?3UBYpSuZvKLsisBdwVwcn2mUgpS4hlpHiD/tuVOejmyEgy6cw43VQUIojdK3?=
 =?us-ascii?Q?s/i/9RsyP11AxCWUgZKDv98ePodZIjdFt5PtfGGoDE7al/C48cMobLAYbKzj?=
 =?us-ascii?Q?0O4Y0FRiJVCRjliTLdubgZZnvcEc4YsoP7Q9OubAduT6bJRkgZ4qfw08/hps?=
 =?us-ascii?Q?3BQhSGZ3G8/lYyk3B7XnZtDcLyfZaQw22+YU1OCfyU+dusAkHpU+Z78EI0iw?=
 =?us-ascii?Q?c+BbJeCUS+AGVzgzWqJTXCcA2S4MpqUfdYPoor0wIZKhwgvxrkolKMQbsJ3p?=
 =?us-ascii?Q?+93bq5ErNZ7P+lBosRopj6CZ7NVPSvn8+PXDUAA3kWZU0z38lKbfzEWGCAy6?=
 =?us-ascii?Q?7pikdx0d4TCul83ieFo69gx0iP5iSBgOMyPyo5jw9RPu6WoskGSa8On+mF/0?=
 =?us-ascii?Q?Rk8/B32FbarQfvH7p2yG/UE6MaW8wZk9ua9rohXZgcCTFFraoJ13rd/Wo2QK?=
 =?us-ascii?Q?rirm9cZeHQ8xMIkbPeZ4L1vyBU3ms99Pm1XhZ8G5e1LS3dZDYJSNz4pVY25a?=
 =?us-ascii?Q?QKpi5Q/J3gQVEnBHusj3a8E/IXb0go/QYsMAZjzdlrABEOBEG+VIiyUw/0JY?=
 =?us-ascii?Q?6XqiQetGfszbTI1m3IdNMFhpPQsWDPTEjeVgGCVtu758lmfZ270uetoyuEqJ?=
 =?us-ascii?Q?glOM775vSjZW+R2+zCTTu7cYAuwFWSPZKVJ/UEs9rx5cpumRZcrF/EscyIsj?=
 =?us-ascii?Q?tgpKJiOKOQ7LdRDY4RdqVoDm+qEnwHdGh5Hwt4eTs9X4fnqxGmLW51Xd89zY?=
 =?us-ascii?Q?u6XHnBYZIAy+PFG14rBDHUfnzxWChcge8cdKiMrNp+C0N/NWSn6CtLi9Rhnc?=
 =?us-ascii?Q?0PBcaO0zqiKhuxnEm+h4wKHGHElG7K9i+iAS4pLj14inUcnYHAROXMAFlxc4?=
 =?us-ascii?Q?Y1usmqJTJPV4PR5RqxrmA/FRKZaF7Tka7vcymIjVRg0tdbBpMF744eNKxRPS?=
 =?us-ascii?Q?d/SBcesLf5VKbTWoH8/6dmEfDwmCaSchaTXRhNHB5LzUXmez9NgmRfKkVJIA?=
 =?us-ascii?Q?K87vE5r64HiX7EXPmWbF73CGqff2GwMsqIdr/PzE5YYQeAMVG37kS99tH1n8?=
 =?us-ascii?Q?f0gZzAct5g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a37701-9b1f-42cd-8b1f-08de7a2a01d9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:09:57.3189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MspY/DH0CgW4ZHpMNlEJ1zTzUgu1Jpl1+UHBrgZriahsR6AcpilJvpegoesqRhk4W13vJmB/Zyv1bZozBE5Tbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_121003_371673_9DFA0A6B 
X-CRM114-Status: GOOD (  31.19  )
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

On Wed, Mar 04, 2026 at 08:17:03PM +0200, Adrian Hunter wrote:
> The DMA ring halts whenever a transfer encounters an error. The interrupt
> handler previously attempted to detect this situation and restart the ring
> if a transfer completed at the same time. However, this restart logic runs
> entirely in interrupt context and is inherently racy: it interacts with
> other paths manipulating the ring state, and fully serializing it within
> the interrupt handler is not practical.
>
> Move this error-recovery logic out of the interrupt handler and into the
> transfer-processing path (i3c_hci_process_xfer()), where serialization and
> state management are already controlled. Introduce a new optional I/O-ops
> callback, handle_error(), invoked when a completed transfer reports an
> error. For DMA operation, the implementation simply calls the existing
> dequeue function, which safely aborts and restarts the ring when needed.
>
> This removes the fragile ring-restart logic from the interrupt handler and
> centralizes error handling where proper sequencing can be ensured.
>
> Fixes: ccdb2e0e3b00d ("i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++----
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 31 +++++++-------------------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  3 files changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 4a80671536f0..b98952d12d7c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -223,10 +223,21 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  	if (ret)
>  		return ret;
>
> -	if (!wait_for_completion_timeout(done, timeout) &&
> -	    hci->io->dequeue_xfer(hci, xfer, n)) {
> -		dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
> -		return -ETIMEDOUT;
> +	if (!wait_for_completion_timeout(done, timeout)) {
> +		if (hci->io->dequeue_xfer(hci, xfer, n)) {
> +			dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
> +			return -ETIMEDOUT;
> +		}
> +		return 0;
> +	}
> +
> +	if (hci->io->handle_error) {
> +		bool error = false;
> +
> +		for (int i = 0; i < n && !error; i++)
> +			error = RESP_STATUS(xfer[i].response);
> +		if (error)
> +			return hci->io->handle_error(hci, xfer, n);
>  	}
>
>  	return 0;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 41b83f07fdab..e487ef52f6b4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -609,6 +609,11 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	return did_unqueue;
>  }
>
> +static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n)
> +{
> +	return hci_dma_dequeue_xfer(hci, xfer_list, n) ? -EIO : 0;
> +}
> +
>  static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
>  	u32 op1_val, op2_val, resp, *ring_resp;
> @@ -870,29 +875,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  			hci_dma_xfer_done(hci, rh);
>  		if (status & INTR_RING_OP)
>  			complete(&rh->op_done);
> -
> -		if (status & INTR_TRANSFER_ABORT) {
> -			u32 ring_status;
> -
> -			dev_notice_ratelimited(&hci->master.dev,
> -				"Ring %d: Transfer Aborted\n", i);
> -			mipi_i3c_hci_resume(hci);
> -			ring_status = rh_reg_read(RING_STATUS);
> -			if (!(ring_status & RING_STATUS_RUNNING) &&
> -			    status & INTR_TRANSFER_COMPLETION &&
> -			    status & INTR_TRANSFER_ERR) {
> -				/*
> -				 * Ring stop followed by run is an Intel
> -				 * specific required quirk after resuming the
> -				 * halted controller. Do it only when the ring
> -				 * is not in running state after a transfer
> -				 * error.
> -				 */
> -				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
> -				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
> -							   RING_CTRL_RUN_STOP);
> -			}
> -		}
> +		if (status & INTR_TRANSFER_ABORT)
> +			dev_dbg(&hci->master.dev, "Ring %d: Transfer Aborted\n", i);
>  		if (status & INTR_IBI_RING_FULL)
>  			dev_err_ratelimited(&hci->master.dev,
>  				"Ring %d: IBI Ring Full Condition\n", i);
> @@ -908,6 +892,7 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
>  	.cleanup		= hci_dma_cleanup,
>  	.queue_xfer		= hci_dma_queue_xfer,
>  	.dequeue_xfer		= hci_dma_dequeue_xfer,
> +	.handle_error		= hci_dma_handle_error,
>  	.irq_handler		= hci_dma_irq_handler,
>  	.request_ibi		= hci_dma_request_ibi,
>  	.free_ibi		= hci_dma_free_ibi,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 850016e3d4fe..9ac9d0e342f4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -123,6 +123,7 @@ struct hci_io_ops {
>  	bool (*irq_handler)(struct i3c_hci *hci);
>  	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>  	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
> +	int (*handle_error)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>  	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
>  			   const struct i3c_ibi_setup *req);
>  	void (*free_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev);
> --
> 2.51.0
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
