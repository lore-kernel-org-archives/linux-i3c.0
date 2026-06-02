Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD41ECD5BD1
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=001XvA7EFV/egOEMv9d+LPuDZwmbDqHQLm0gpImHNi4=; b=QydnF8VOx7wdLU
	NhLZn8zHw8GCPnOm/fJ5w6YT/zV/mnxGBqAl03DiLQIDz/ELcvNEJYfV45YGc1HpCqedRbKn31Ktv
	qHECIeuoGrH+cpjFvJEi61lbFCpt4AEU/x3sx1bkMUTzzxRPXX7kmsmWxOUcHz9FxRzOZZuDb9fJH
	8DzFjDC9rxIzesPFPgMi2S04bPN4MygAub2DXxpqG+cBbfuwFMfVJ4kJ8xBY6Q1rR6G073oMhRI+d
	upkzmjhI/Wwv6ZYd0FOCM5BdGVA/4DC1i5zDgqE/gJ914GAjVhvVKSfVpqJje0w5y3BD4m7rh7Nhr
	kXjDRN15Y7iwOM7eUgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSF3-0000000DUGy-290N;
	Tue, 02 Jun 2026 16:45:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSF1-0000000DUGO-0nSS
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 16:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgetIYvqujsIoi2bmHPop6KB31cPtNsnyvKeT8sz5ob3pmgmEVGFU7xGHkEZ6wu9x/kRUgOvAvfJHcvSQA3SCljwX7RVDqAQVDr/Oek1Zh1PtNQYSaoKwaQnC/+qcerG22J8wzYMSEZ2vkKVrbpiya2gQUF1zQovm8s3Y07ZRv4LJNg0ZFvR0qoxWTGGkEESBmI1oB/3Nv79Df4aH3SE5LrbjzPUtzEYxW4ZUwnb4+d4jDkh+Pcd+SEBHJq7clSNpstOfQ3tz3vNmSTbT4qec5jhT6iq2rlLFmU55c3CFjvGQWcAalWe68gZh9s0ajKnyxyi7iKa0q6KUljjxDliKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ymg3RJdFMEPLesflvH/YPl+iYciIavSr9hugJH47ylg=;
 b=NBTdlXFDnWOq7eqPetjnxRi11Oaho/vqdZt6w4nbud1aNB+fMMpczlrzViW3Zjnuq4YcxNEmKvYs7H8Hf5A9ADsyS9JkHQL3t0QrynzrDdcSiL1U3NWhEyhbRpP5NhTv3S98ZLI2xN5irvC+5gUlH+Pi3/T5KbobuMG9GgNjnLXCWhrcf7bI4P7zJbi8gVBrXd3XilIbPUmrpFyrEVg5mfUEQcrumBAcnL4k86c7G5hzdY1DXOxMQY+7UgYiEsFpW+M40bJwHFSZ/bvee7c144lvsp4ypnjLNYowsLdhNi2F7gSjjeNzSdOe57bP+Y1vYZ3IrrIEJiCUOjbWhJCF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ymg3RJdFMEPLesflvH/YPl+iYciIavSr9hugJH47ylg=;
 b=gbgsFoCLaWjTreEjLSnKtJGTnq03TOhDzJbYUdqyUQf/O6VLjH06YhgGc6VyF6EkFy3WFLKH78VPISvR9MSu8AB98OOjbPhDKPizjarVA8sqWc9FPw0tOeExyefj6PbN7AoLzMVXmy9EiXstygWlPwRHsUX38J+Nxlq9KJmo8pPTDiTEhJGKITrm5/kbM1xbyp4TRS/lPGaxacxMysxBAt5fykt3qf3rqyZtuaEypDHDsOUmjH8FD891gEPLWU1JjypWM2Z6rujC7DYLAwS0qrbEGdzegy3QdJ0gdH80VkyvsehJuSQUe7s1+Ov2GLDSiyTEMZlmh+YdOoG+lTYDbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11751.eurprd04.prod.outlook.com (2603:10a6:150:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 16:45:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 16:45:17 +0000
Date: Tue, 2 Jun 2026 12:45:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 13/17] i3c: mipi-i3c-hci: Add DMA-mode recovery for
 internal controller errors
Message-ID: <ah8IlqtAbB_vy37N@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-14-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-14-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: e48dfc18-893f-4d39-3a1d-08dec0c65396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|11063799006|56012099006|18002099003|22082099003|4143699003|5023799004|38350700014;
X-Microsoft-Antispam-Message-Info: xSwGv3GjbnHDvMZ39NbHyPeIhkqpmx1o0G2c3UAnc6txiss+MkD48I7fiJZSVCWqx7H7eIJT8cvb/CIUMIYddMRWOwidCWl2j4m/sJOOUuA5A/BoXpZEbRgJRu6eRAFqOOeTXb72SNJip22E0B7D3cp3+SsmCDNMho4+OC9MVvS2TTOrwwnZQ53wq5e8AIkiI17TTH27CnrxVf4al6mJ3wtf4LP7l2/Kk5MhJMF7xb3SzDGFvuzvbDiox9A2v4pd8hLGLuLdhLzwVW7p7VHNSOs0HnFEj4iV53ep7eYvzW4YSGFMSiNHzb+h2I1cXwtfdUL8joU7UEWDX8uHHaxNC97r77Cz0BJisJ94BnNixknxLsd5uuLIJD6RSeM6UiAXyuvCiSAFbC691s2583s9gbbFHb0JWZrIn+96mmjGQUQfjSyJfwwRuoeC8K1n949uwYrSRKEojWtvWmLjhr0mK0CYQADVfAXOvJ03n8wG6w66czy2tTTXgMBJEfgITOYlIOqh82Rx2A/EPePMwgZjvXRVDNF5op/MBuRcxnmrrXTLXecYSeUmoGIlS/EffQjXjBW6pAZX89B+OePVFBlSmxwiH0Ayi1u8RTatpU8BFXuIEHL4340teEH0GUNiINudgINngsE43vzsvSJZz+RzXdeSccSH46a29eEwEKh+0xMMM1DgU4JIwGyblXeGBRvs9kFGBJWTDguGsxz7rY7EzhpPm536ZT6QWWve0tTh98Lj5QcGpnL6cqAEAf3WsAai
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003)(5023799004)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1PPKP8Z7LmSbshPpSOAFvH1C8kAP/qnuLCeHj9AdujeQ83XD5yo4IDFQK5B?=
 =?us-ascii?Q?7v6vrQRXCQlRGneuyTuLFQnN1m2+aG20KKWjSQSWs7Fy9/Rl/yHQ24byWB0n?=
 =?us-ascii?Q?8/p/aUppTQfPTr9MhQbe0xvNao6y/UTZehZ1VUCUzBTXThfO7yBDsbq0cPpp?=
 =?us-ascii?Q?mEoFBc+OjuL9AEBOLFCTTDCxxmXrNvfLRG76f9yCuwBNtQPYd2SMSQHOEt/A?=
 =?us-ascii?Q?4AhBV3KHBjstHAnSewzdyln2L4sl+4KZEHZpEcjmdsD5ytfVYQPw3IY7esfj?=
 =?us-ascii?Q?qmLId/DDbGhvEqhfagHBwkcKxR7GebUqSwU5G2ohCKJChF64uOKig6u5mVx3?=
 =?us-ascii?Q?NwOKxPR86UpOm9rA+EiulOZgBjUOFn9Y0wI2b85rYNs0SInX2BfW34DaG8ba?=
 =?us-ascii?Q?yKbfJkkPEur2yHt2GXdvGH8C8ZAWsDWfvxCJ1cFIMKsOspTQUSsWM9S5dIs0?=
 =?us-ascii?Q?O+E62HYb+3+B57x/bzIFvR0BvN2YM/DLU6VNUmw3NhQ8tlAEe877MFT+WuHW?=
 =?us-ascii?Q?ZJRz6i9s8/yZ9GWgkoXsdsWP+FU8K/kzkln6ovrAHNq+V13/oeCrkjuE+Y2O?=
 =?us-ascii?Q?tL4llTK4hq5ytCwv7Sk2YTVC40lS2z2BFFDrUVPEjv1xG0ZCJGGNg4HWC6kQ?=
 =?us-ascii?Q?c7vVXlZ7x0a2EZSCGtoqV+7sGbgv/HaF7QY3bWyopuSvA2RqhVZHCFKwX9Hn?=
 =?us-ascii?Q?a+31w6sBjNW7i4FL7riosRCR05d48AYicYxporsbctDeTiOYMjpERi5cWGEL?=
 =?us-ascii?Q?mNRFosgeyY4WYDpC2UeP7UrNd6+Wwo0pBqtoecvqLqIZBMYT/3kjVI6J+tsg?=
 =?us-ascii?Q?qZ45OCyZVBQZE+k48JwVIRpuPodyWEKETAIS+IrZ8freuBjjRzO/aAYvuGJh?=
 =?us-ascii?Q?IlthP7oK+jHQqZfus5jxtncZFhVSrnLkTO7OwC9ruXS6mMI+V9pfxAfTzy6X?=
 =?us-ascii?Q?3hu9g0SXNE9GzAQbCUjD5Tk7XHcMI4g2Z/cpgaBnkAlL5fkhcRcjL3z1jTiG?=
 =?us-ascii?Q?EzvA3xWWMxn/95xG8uEv05gxndl8LvcwVlssnCElaUl++OH7n64ft09d4O/O?=
 =?us-ascii?Q?3w8VSvw4EuqAJU1NJfeLAqJIxWi+5/PxoFlTlTnxb9wbtnKEqUg6OmpCbVYB?=
 =?us-ascii?Q?EvFen3qUzIwqgCcksX7l59KPetCmHwpXS1IGfJwYqx+KM3L6lJl9n6FrGo2X?=
 =?us-ascii?Q?1wN0zDnRFa6sd+vGd+Hhr4+xaMfAv6VJpcFGFiIPLXY1YBMs7/m/5pg35m0e?=
 =?us-ascii?Q?qYJQcsKlg22DPr3eFjriF5SWQ7eyFsIxhiUQ4d25fhrCoYDhPEvqkloy6UhD?=
 =?us-ascii?Q?eYvLZGolmI06TTDfiQEf2pksZpXSfmZs0oLNL8HOytQynjPOzU9xI+OQWsiJ?=
 =?us-ascii?Q?QS6QN9Pd83j+wIFKmo8smGTPKJyAgHzr0qmDD5HCEsOry0wZxP/joBFEpjy5?=
 =?us-ascii?Q?0OT5TDXKMNVXnjoC9AGf2MRnt10F+G1ziXEr89wXn+l1vJpJB0W6LoDZO/3X?=
 =?us-ascii?Q?uPMLO2pAroDvMATHATy2Ex7q/i4+cDvbKIwKttDZBoXN7qV/78BIEeSFNouI?=
 =?us-ascii?Q?yfMoLr4RjgT8cVAXdgaeUcbZdBQX6kfIG1qdYHAYZBVrbF8b0gFosn0yXHqm?=
 =?us-ascii?Q?evrNWKgrN0X40FEcLbCOMK9Zl6lIFDXOZRzB0JFBNx3sRNmGwXfjKgqXlgLk?=
 =?us-ascii?Q?5NrGcVA0myacQD6fe9q0F5VtBtzexnlb/15ZkjwV8/RMWpCm8hVH31iT+OxP?=
 =?us-ascii?Q?Nj4iO6a3eQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48dfc18-893f-4d39-3a1d-08dec0c65396
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:45:17.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFSXe2gXmwXYhOnm/Brkc/BGVtzIjrjbkAvfpz+Iu6XJMalCkO4H5ADI+cP/jVAPNfHm4WEvBXMiorU1RQw+CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_094523_399013_3E6012F3 
X-CRM114-Status: GOOD (  36.25  )
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

On Fri, May 15, 2026 at 07:26:17PM +0300, Adrian Hunter wrote:
> Handle internal I3C HCI errors when operating in DMA mode by adding a
> simple recovery mechanism.
>
> On detection of an internal controller error, mark recovery as needed and
> attempt to restore operation by performing a software reset followed by
> state restore.  To keep recovery straightforward on this unlikely error
> path, all currently queued transfers are terminated and completed with an
> error.
>
> This allows the controller to resume operation after internal failures
> rather than remaining permanently stuck.
>
> Note, internal errors indicated by INTR_HC_INTERNAL_ERR, cause the
> controller to stop.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V4:
>
> 	None
>
> Changes in V3:
>
> 	When erroring out transfers, ensure the final transfer of a
> 	transfer list is processed last
>
> Changes in V2:
>
> 	Rename completing_xfer to final_xfer
> 	Add hci_dma_xfer_done() before checking for an already complete
> 	transfer
> 	Improve commit message
>
>
>  drivers/i3c/master/mipi-i3c-hci/cmd.h  |  6 ++
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 93 +++++++++++++++++++++++---
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  4 files changed, 92 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> index b1bf87daa651..7bada7b4b2de 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> @@ -65,4 +65,10 @@ struct hci_cmd_ops {
>  extern const struct hci_cmd_ops mipi_i3c_hci_cmd_v1;
>  extern const struct hci_cmd_ops mipi_i3c_hci_cmd_v2;
>
> +static inline void hci_cmd_set_resp_err(u32 *response, int resp_err)
> +{
> +	*response &= ~RESP_ERR_FIELD;
> +	*response |= FIELD_PREP(RESP_ERR_FIELD, resp_err);
> +}
> +
>  #endif
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 12a0122fb709..69dcf5dad3a5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -668,6 +668,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	if (val & INTR_HC_INTERNAL_ERR) {
>  		dev_err(&hci->master.dev, "Host Controller Internal Error\n");
>  		val &= ~INTR_HC_INTERNAL_ERR;
> +		hci->recovery_needed = true;
>  	}
>
>  	if (val)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index f9023cb3c5a2..f39a6ce2aad5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/errno.h>
> @@ -258,6 +259,10 @@ static void hci_dma_init_rh(struct i3c_hci *hci, struct hci_rh_data *rh, int i)
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
>
> +	/*
> +	 * Do not clear the entries of rh->src_xfers because the recovery uses
> +	 * them.  In other cases they should be NULL anyway.
> +	 */
>  	rh->done_ptr = 0;
>  	rh->ibi_chunk_ptr = 0;
>  	rh->xfer_space = rh->xfer_entries;
> @@ -362,7 +367,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
>  					      &rh->resp_dma, GFP_KERNEL);
>  		rh->src_xfers =
> -			kmalloc_objs(*rh->src_xfers, rh->xfer_entries);
> +			kzalloc_objs(*rh->src_xfers, rh->xfer_entries);
>  		ret = -ENOMEM;
>  		if (!rh->xfer || !rh->resp || !rh->src_xfers)
>  			goto err_out;
> @@ -572,13 +577,15 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			hci_dma_unmap_xfer(hci, xfer, 1);
>  			rh->src_xfers[done_ptr] = NULL;
>  			xfer->ring_entry = -1;
> -			xfer->response = resp;
>  			if (tid != xfer->cmd_tid) {
>  				dev_err(&hci->master.dev,
>  					"response tid=%d when expecting %d\n",
>  					tid, xfer->cmd_tid);
> -				/* TODO: do something about it? */
> +				hci->recovery_needed = true;
> +				if (!RESP_STATUS(resp))
> +					hci_cmd_set_resp_err(&resp, RESP_ERR_HC_TERMINATED);
>  			}
> +			xfer->response = resp;
>  			if (xfer == xfer->final_xfer || RESP_STATUS(resp))
>  				complete(xfer->final_xfer->completion);
>  			if (RESP_STATUS(resp))
> @@ -625,6 +632,60 @@ static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
>  	}
>  }
>
> +static void hci_dma_error_out_rh(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	/*
> +	 * The entries of rh->src_xfers are not cleared by
> +	 * i3c_hci_reset_and_restore(), so can be used here.  Do 2 passes so
> +	 * that the final_xfer of an xfer list is always processed last.
> +	 */
> +	for (int pass = 0; pass < 2; pass++)
> +		for (int i = 0; i < rh->xfer_entries; i++) {
> +			struct hci_xfer *xfer = rh->src_xfers[i];
> +
> +			if (!xfer || (!pass && xfer == xfer->final_xfer))
> +				continue;
> +			hci_dma_unmap_xfer(hci, xfer, 1);
> +			rh->src_xfers[i] = NULL;
> +			xfer->ring_entry = -1;
> +			hci_cmd_set_resp_err(&xfer->response, RESP_ERR_HC_TERMINATED);
> +			if (xfer == xfer->final_xfer)
> +				complete(xfer->final_xfer->completion);
> +		}
> +}
> +
> +static void hci_dma_error_out_all(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +
> +	for (int i = 0; i < rings->total; i++)
> +		hci_dma_error_out_rh(hci, &rings->headers[i]);
> +}
> +
> +static void hci_dma_recovery(struct i3c_hci *hci)
> +{
> +	int ret;
> +
> +	dev_err(&hci->master.dev, "Attempting to recover from internal errors\n");
> +
> +	for (int i = 0; i < 3; i++) {
> +		ret = i3c_hci_reset_and_restore(hci);
> +		if (!ret)
> +			break;
> +		dev_err(&hci->master.dev, "Reset and restore failed, error %d\n", ret);
> +		/* Just in case the controller is busy, give it some time */
> +		msleep(1000);
> +	}
> +
> +	spin_lock_irq(&hci->lock);
> +	hci_dma_error_out_all(hci);
> +	hci_dma_unblock_enqueue(hci);
> +	hci->recovery_needed = false;
> +	spin_unlock_irq(&hci->lock);
> +
> +	dev_err(&hci->master.dev, "Recovery %s\n", ret ? "failed!" : "done");
> +}
> +
>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  				 struct hci_xfer *xfer_list, int n)
>  {
> @@ -640,6 +701,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	ring_status = rh_reg_read(RING_STATUS);
>  	if (ring_status & RING_STATUS_RUNNING) {
> +		/*
> +		 * The transfer may have already completed, especially
> +		 * if recovery has just run.  Do nothing in that case.
> +		 */
> +		hci_dma_xfer_done(hci, rh);
> +		if (xfer_list->final_xfer->ring_entry < 0 &&
> +		    !hci->recovery_needed && !hci->enqueue_blocked &&
> +		    ring_status == (RING_STATUS_ENABLED | RING_STATUS_RUNNING)) {
> +			spin_unlock_irq(&hci->lock);
> +			return false;
> +		}
>  		hci->enqueue_blocked = true;
>  		spin_unlock_irq(&hci->lock);
>  		/* stop the ring */
> @@ -647,12 +719,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		spin_lock_irq(&hci->lock);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
> -			/*
> -			 * We're deep in it if ever this condition is ever met.
> -			 * Hardware might still be writing to memory, etc.
> -			 */
> -			dev_crit(&hci->master.dev, "unable to abort the ring\n");
> -			WARN_ON(1);
> +			dev_err(&hci->master.dev, "Unable to abort the DMA ring\n");
> +			hci->recovery_needed = true;
>  		}
>  	}
>
> @@ -662,6 +730,13 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	hci_dma_xfer_done(hci, rh);
>
> +	if (hci->recovery_needed) {
> +		hci->enqueue_blocked = true;
> +		spin_unlock_irq(&hci->lock);
> +		hci_dma_recovery(hci);
> +		return true;
> +	}
> +
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		int idx = xfer->ring_entry;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index a3151c26827e..4bf2c66c97b4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -55,6 +55,7 @@ struct i3c_hci {
>  	atomic_t next_cmd_tid;
>  	bool irq_inactive;
>  	bool enqueue_blocked;
> +	bool recovery_needed;
>  	wait_queue_head_t enqueue_wait_queue;
>  	u32 caps;
>  	unsigned int quirks;
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
