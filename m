Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D116CD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxNRDc8dqIrI0LHvfoebuswk8VJC+Xa1bpqLnT7+3Us=; b=0d6CGV0UOGnncu
	4JOJHOEPdfFLTHmDpcliir1gUCdgtgtpzzmzprQmSgM0ZNxrWZg3MLMCZtSNobpmby3Ti2F7TCGAY
	34ZoC1Hlw8jxSF6Gre4hwMMsY9O1MTdwNU/gaOJfQJTHsEvpYRIXh7V6HXMHFnpQzTOMFy590hYfR
	dCy0hKkSvQKXlntHIkAcbCEGTwB6STj+wHb494yUPdPYC5vjmrWRH9NbM8SW+ENfj0JoqHhKuiZ+9
	Phr4n2prLDsYvyAFgbzEKEhs1BcFEG25FR0/GiZ6SGP08j+hekcHybXtg5yoS3FFpbTwDxEuf+6uR
	nx7WD0v5z4bpqFwMJAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrTt-000000002sP-3vMe;
	Tue, 12 May 2026 18:05:21 +0000
Received: from mail-northeuropeazon11012055.outbound.protection.outlook.com ([52.101.66.55] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrTr-000000002rJ-01uO
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 18:05:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxjCydtH1cZR/RiuP4XwwiEFx9ZMOCE7euQlwW8wzuMv+VZoo/fmrIzJeodpy6HiAipsdp8Q3uWaFsqaLs1ddAjdXw3gXdy6GCQ9t8u+IBhZLa2QSYApQTEtSTnckft1OEM20X2oEl3ko2VgurxzT64StrQTp8Knrce36O8hnpHfzKWnup8xyx4Uu258m1JZKnEtqhzuVQPVLyzaL527tqx6Y877/XCU183bX3DmvR5cSbkRG/5rS7Q2qcezco5HMHxCYdfZZVx1tlUcAMgmuP/+IrTxFA+0D2HDL/ZwRdCKOverjvkCtDNJ/OHqQCDRHlKZP+o80Ud2WPeEAcw+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkY8MuIKGbP2sb9/RChBigTkqgqd9CzLKdEORxyp96w=;
 b=aN+NuScCvZ+Vt0LapPeZqoYuPhDopHb85zT4rk3QZ/oBi7LkAJaxaeX55BGKeNzHMJTFq/XZxWYWKSTKTnOC4Dj9azO6ZEQMTmbLvVSTWZTh8xJueZx45VO8wOL7lG4YrRLuDfE0KfntS3rfl+vYvLEas2Jkkf7UwyOo7//fYT5CXvO/CncP+4bvK+jL2hUb5tZh6vM8sgpfIWRAyzazgPagnR989KWKrEzL1xo88Y7P0wT0uq2ZQWH4G6n/UbJzTjnx4ALLk2Ks+yVtpOWvbHqw5gq+9FnCQ7Fj8bxh79UdayH5juQZWW8ceeKcPGsv3aCWcASOWrD3VnTZMJxVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkY8MuIKGbP2sb9/RChBigTkqgqd9CzLKdEORxyp96w=;
 b=if+NR+ONfFtuLSXXxiMpWM2jKkdrcYrLcmnB9cbMiLnRiG81yNY5CJ2AKYYAReETj3Tp7VnxwuG7fhGyh1/341fGnmjyTU2rE4ZGBXwqzyrkFhhxsfAqLBYFgTSn5ZXPVLFibq19wLkZWIm50UrYpIUOTFVh3ZabrlsJtUlsSdQGkYnQAkhkudLacgBrRmY3mt2u3uaJy021QffUjJrvrNa7M5uZbyFt7Hwb/xzCt0WUj2MHSjViUW9u80vo7Wp15rX4cWIwCmNIDKC09wlsMcMmKmBPMoRovaYpNmboEbz5MYvEcVXD1cK0MfnBk0d7EIa8xUiUMfDWEIKuYOLoFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMDPR04MB11679.eurprd04.prod.outlook.com (2603:10a6:20b:716::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:05:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:05:14 +0000
Date: Tue, 12 May 2026 14:05:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 13/16] i3c: mipi-i3c-hci: Wait for NoOp commands to
 complete
Message-ID: <agNr1Hoz-Cs67o_6@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-14-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-14-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMDPR04MB11679:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c0f1fc-9c2c-4bda-5508-08deb0510437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014|11063799003|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 9lCPwwPRHNZSd1vGuUwhZIaWcvMZQt9sWNprFHP7GKBiRvMfqWgXguEr/ir0WGLvwHcq/Khub5krI5Yr1fnFLKPjDcl2adrvyNtv1IA3p7YoDJ43nHbO9x4WSnyDP7IcnMCLFZ21JHlErkC4tY7ibRiDn/t7e21bGKmUM6jmpCtuZFG+y+pdAoBRX3baUTxMP22KRac6nUgbA8QSf9kJOiKpPiY5s/Q5Al9RyDM2aKroeMxTrNHiPJPBGCVk7abAIriwVqE+UGikt8AAQyvEKm+jP2C8Z2HBYnyHCOzJksv6ApYdOe/km71MfsVoC/Iuv1SQtf0Mzl7tkvG9eU4M54kxqKhgKrRACvVRQ3cBsuNfewjqB3IxNSQxtL5BbA3VjSPhA4SEJG8rXSioG902776JnddlZfo/aTyumkY5pM1RD67DBHJBS2aD/O1IlgXK1/g9rj6cRf00DVZeY7SvU/bmF+aDBG8/6sFyB1onxJ0577/82LG6rfh5JWuZVhVWocdOStc/N+rmf9r+RGZvKLVCM72NlxSOYn8pFffWcQepGOQk91v1g5ikXkvpMrOfF3GYW5lLMtqQ4Coloy/gOX8cQq4vJulJjL3mDfxBg7hKQqfU2xWeMpleb8XBARKzjf1ouYiy+6/d6f4IDHtk4l9kixHtC78jo9W0ESxfIXkx4vRALd7J1gdxQc+gxomkSFQW2aQet4+g38Ln3MKPuc64vV1hPOjCbikNdGZqrUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014)(11063799003)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0g+v9Be82woC9OOQmAYU5o0Jg4Nr17+nwtUaTkCDG80PQT7pjz5Px7TOV92F?=
 =?us-ascii?Q?if1oXLfDyqj9wcdKbx7t9QWkOxkEwGvWNV8zq1ThCC0ccvBFYT7v2r6B+ufq?=
 =?us-ascii?Q?ekmyIVxCZ0gMea1Jr2l3e2PHPb30PRsm/qg0EKxce7uZ+iV2NoD7/cJHpsXg?=
 =?us-ascii?Q?T3/ilEpiaMNDjEee2oZSZGMZikULlbTzz9tVnMoG8GSG5Xj0YIXaX0w2RUui?=
 =?us-ascii?Q?xhMBx+vC6+4WkjufnfPtus7Vz8XnTy+EOjijKet4JqS5Fjcx+ap2TKOvnQe8?=
 =?us-ascii?Q?IcSQu4hsMFCLJqchZqH5f0FEhgXzbCnT/5g71bYVej+yz4T+ZhqiXEqD2PzD?=
 =?us-ascii?Q?r+byi8V36C3le+dGPxWam0YwqoVZy9XYCprdNr3Ss7XLDBSNxssKzS28Kt0t?=
 =?us-ascii?Q?ju3PiNZVurln4gcmj16b5/UnXbsK5tMg/x78MJoJwl5lmJdFdIHqvuGGgGKK?=
 =?us-ascii?Q?j2csEqT1O4P8xebyl3twMmaPYY1mrwPTzRWSxTaYoeIzwjhI8S4bV2djVA/2?=
 =?us-ascii?Q?vcD1BFDoJgatx92DwVJioxIurn9OFuC17bMADCRb/BKNHGZ42B/AZL7VLI7d?=
 =?us-ascii?Q?ZsJdnVrCly4N59mZHbv4t7IoLtVpk7FURxJUGBKyyN8j0Dl40iuoWX2RkU2N?=
 =?us-ascii?Q?lIlgLE6DohGxSL3rmUDnupggTAwNTUT26PwUs9w6bGuy45rehIFW6rKIb+s1?=
 =?us-ascii?Q?qwhI3y61HFjo9Ah0ruyYMIiheivYdnq1i3Sx6n+UaAYkmuepoIVEkCtWudIt?=
 =?us-ascii?Q?3yvUrnqbYcBGyq4jBPT9ZvpLWXeEpCR6qYVNy5MI9TzxBzongS9Zeohp0/nY?=
 =?us-ascii?Q?shCzPFfR1Gp8bW6OE+3VNmCwIyCYra3ckwgNPLTQA6dP75RcaPhK32FQsmmo?=
 =?us-ascii?Q?aBtl43/woGeEvqS2g4LTGqWPVqDe4r7brN+Qs6VpuIbjohvMo9JJJtJpULhV?=
 =?us-ascii?Q?CGKm3BMV9pP0YilLEeNuZ8WV3R1CV7NbTJVE/XXDjJTOpo+mfSvbs5ojnb44?=
 =?us-ascii?Q?v4pTPhnU19bAV2YVe8On5uB+HUAMfsM3Nr6nZYxcs0B8T7Qnh6Sge6FUjRWU?=
 =?us-ascii?Q?fyy/yOTanLqrCavGEnW7DN+gttFCev5ON3Ynqsz+HOx0Zj01rnZ4iq9csk5R?=
 =?us-ascii?Q?R0spnchmnyc0/EFEMucdIfGolTUNKVU6VnKKu+wawYUVikseC3PmCV23c8Gt?=
 =?us-ascii?Q?wsnQmjNk5PnvVhFVSL9eQpdelV3qOlMixuZ9tSZPdzSHZ44u21QS5Wp4w/wu?=
 =?us-ascii?Q?zodiOByf65rWBgBMTkp8OrhcaQKiV3FdULcznLpV457eI07Z4v0j/W9esZU/?=
 =?us-ascii?Q?/Txt1K5PPrPuIfSLr2YQjcYfsJxRQTd1YI6hlRA6LUuBdN2mKhGnG+8I1qHO?=
 =?us-ascii?Q?siE1ZRkwFS6WFoKJ3DNZVt4d3DSWtKxH1USvkaSzutXHbnaEU2X5f7T9fYzH?=
 =?us-ascii?Q?NnIQhjqGHW7x0HmHdPvgW0yUa0j1jMfPgQPTdnyV/4sKulNkI6bciFNCynHL?=
 =?us-ascii?Q?U/l2CpLwSHSfmX4UOHpF8nvml1J4NgRfRbfyKa/JndVtm4HyTpPKcWJ1/KLu?=
 =?us-ascii?Q?luJiMEpU8if+sxrjE/A3ykdgZxO6ss1LxywVFuogXMyUl0lZ3Z4nhVKZ2HXU?=
 =?us-ascii?Q?P7J2m6B19sa6t/Q8N66D3d7il/IUgbIVOx+/MtAp35uf8G8nBxOGd2CNXFOk?=
 =?us-ascii?Q?RcU0/OnfCQWiZkmpuhcxYiETiNEIQ7rLrcOumR7SwmBmDUIj/Zb9+xcEpv0t?=
 =?us-ascii?Q?d7y2H6J2fw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c0f1fc-9c2c-4bda-5508-08deb0510437
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:05:14.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBsErdSCt4RSXFIyaUs6/nyIFNelu49Y1l2YhykbZMbMan/+PhwT78gwdmVZPNagqyIY1TJ64nHv+Lmf7FMLfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_110519_062707_324D5AE1 
X-CRM114-Status: GOOD (  26.07  )
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

On Mon, May 04, 2026 at 02:33:49PM +0300, Adrian Hunter wrote:
> When a transfer list is only partially completed due to an error,
> hci_dma_dequeue_xfer() overwrites the remaining DMA ring entries with
> NoOp commands and restarts the ring to flush them out.
>
> While NoOp commands are expected to complete successfully, they may still
> fail to complete if the DMA ring is stuck.  Explicitly wait for the NoOp
> commands to finish, and trigger controller recovery if they do not
> complete or report an error.
>
> This ensures that partially completed transfer lists are reliably
> resolved and that a stuck ring is recovered promptly.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
>
> 	Rename completing_xfer to final_xfer
> 	Add missing reinit_completion()
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 39 ++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 376062c0fcbf..90fa621c9d56 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -696,11 +696,33 @@ static void hci_dma_recovery(struct i3c_hci *hci)
>  	dev_err(&hci->master.dev, "Recovery %s\n", ret ? "failed!" : "done");
>  }
>
> +static bool hci_dma_wait_for_noop(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n,
> +				  int noop_pos)
> +{
> +	struct completion *done = xfer_list->final_xfer->completion;
> +	bool timeout = !wait_for_completion_timeout(done, HZ);
> +	u32 error = timeout;
> +
> +	for (int i = noop_pos; i < n && !error; i++)
> +		error = RESP_STATUS(xfer_list[i].response);
> +
> +	if (!error)
> +		return true;
> +
> +	if (timeout)
> +		dev_err(&hci->master.dev, "NoOp timeout error\n");
> +	else
> +		dev_err(&hci->master.dev, "NoOp error %u\n", error);
> +
> +	return false;
> +}
> +
>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  				 struct hci_xfer *xfer_list, int n)
>  {
>  	struct hci_rings_data *rings = hci->io_data;
>  	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
> +	int noop_pos = -1;
>  	unsigned int i;
>  	bool did_unqueue = false;
>  	u32 ring_status;
> @@ -708,7 +730,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	guard(mutex)(&hci->control_mutex);
>
>  	spin_lock_irq(&hci->lock);
> -
> +restart:
>  	ring_status = rh_reg_read(RING_STATUS);
>  	if (ring_status & RING_STATUS_RUNNING) {
>  		/*
> @@ -765,11 +787,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  				*ring_data++ = 0;
>  			}
>
> -			/* disassociate this xfer struct */
> -			rh->src_xfers[idx] = NULL;
> -
> -			/* and unmap it */
> -			hci_dma_unmap_xfer(hci, xfer, 1);
> +			if (noop_pos < 0) {
> +				reinit_completion(xfer->final_xfer->completion);
> +				noop_pos = i;
> +			}
>
>  			did_unqueue = true;
>  		}
> @@ -801,6 +822,12 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	wait_for_completion_timeout(&rh->op_done, HZ);
>
> +	if (did_unqueue && !hci_dma_wait_for_noop(hci, xfer_list, n, noop_pos)) {
> +		spin_lock_irq(&hci->lock);
> +		hci->recovery_needed = true;
> +		goto restart;
> +	}
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
