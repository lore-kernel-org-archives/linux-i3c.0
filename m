Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE4AFEFB6A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlsglXEeu44twPoz8rTgWRXukh3Nm0CeOTcLJJdb+/A=; b=1Q8acs0Kro0Pl+
	PWezyphfoeD6jtVId9QZpZTBVIqh8GHubIvu1j2rKe5eUOez7usc8bJlmU9GmoMFqp5XOnzFV9VCF
	SogkOe2xL1JkS332KTCadFMKaFhigiQi8CTe1Zw+GCxfinM5eNWruG7bBBtzhKHkLvLF0spYt48M/
	AKt18sk+W+2R8j8quswXR94kit0+b5tIqxjYV5veiiTUJpkl6BciDizj5PPcZGUx/aywtkfK+5fUX
	gDYiZnxb+nzOPBHs+Ty8ErLPMZlzZFZX6a38eUxnfbBKnf0zh0tOYp5Cffq2Uc6W6hcCWNXWgv09F
	E2tPeLNqp8A8gZ1Ea3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0GS-00000008hoD-3SS7;
	Fri, 27 Feb 2026 16:00:28 +0000
Received: from mail-northeuropeazon11010015.outbound.protection.outlook.com ([52.101.84.15] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0GH-00000008hen-0tum
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:00:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIATnIWPqyHRJjETTB3Lv4cuc6xiSV19SmEnJK/wW9H8OpoozjyK+MZKsxtQ4kWvGc2khFlRF1jx65DSsDbo2XZT2XRNe0FxbKnm/diplbj88MrLMoFUTTln1RQfnpYJMfKzlMJSv3U+2DCWrrIdIJR+G7x/AWSKaNBLQ2Cm2JClQm1SNpT32Ui9cAxjbX71jtRnf/p037+nOOXjkE5hu0XaibyYdArIECaG3oyh9c2UNBAiT9I23bp3gsYNB/+UUgmogfxiJjhN4DVjshdc2FQadxsQEiphHfv15t13EaH/hf3HcTNKBFWefiBFpOFf9W6f1EzYCPY3YlnyG0XF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktlAe51wL1wgG36YaA9vbwlyzclQppVQFpxInUsZaY8=;
 b=oE/Xqk+Lw/MSiHZC+5qwn+9jNhJ7Aqalo8sZxVqnQTlEaxxYpFIbGEnhb3OytAwdZauX+Y/G/du/B3TgT0hRHyVFXSEGKiw4H22ByCg4tubEwWpNhGC17D7Ae1STaycbYriyatypJ6SBeNotokpL3ygNDsvU8W0Gf4Sj9fe33ACiSCSePTxXo0Hq0IcDOKjA3ZcvL5FmDKK1B8HPdrlFARA5X1EskpBubeMNHuQMs6oRvGw3YmDl8upe0paGkjPugmt83NMaNVlDKT5nXqTad7vZxQ55/sMST+DJgPKWp6S1uqfMNRH3aFIDfdAMt8BmD+xsRN3VPJ0hw2rbwLuhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktlAe51wL1wgG36YaA9vbwlyzclQppVQFpxInUsZaY8=;
 b=i7AjFO427NOt6MPFF/2Zx5O0ViWKZyZI5ccyQTJcL3sbpb/aseULJeZOQD9aVr9DntEeB6M8iPOOC/CCxgxqpnHkaDlN3F8cj+ipa+AGB0PWmXj0e0BE+IAoPmoYlTf0cbL8SBhGMLmdkv63bF7MH1Ot4DNRKPKjJD2LlvqYlOEvPYtN7kwUwVswaYKFNUyjWj4jbgopzCeOp2LRDTyrhinDD3Ts+Z7BmqpT4umjiH3ylNnz2wMpziutsClLTsl4LGpStsw42+F9DP5cXsYv3LbMnZc3eBJJ2VOTsZ4zpFzWseL7RMqA/yRSjK0xt5pi4g9fZ6MND0BcBzin3FHQuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 16:00:12 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:00:12 +0000
Date: Fri, 27 Feb 2026 11:00:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 01/12] i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME
 for timeout errors
Message-ID: <aaG_hpSSdy8G-1kT@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:510:23c::21) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AM7PR04MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d43d2b-e4a7-4afc-a62f-08de76194a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: mEArowFtUAGhnDYmrlHpo5bl/CRrde0Ydh31R1NIhjWBw4VkuLRkIThYm4idSKZdPr+3s5vIS20le6aNn5NTLT7W9FuOHO6PYh6jjQEBOhw+4hV9wQnCPPVuekTa8RRsjcmvY+7CdFeNnR8Fpje5PWDVBSa03Fr7p8Pxh4pZ+ltqpb6evXNS2T4Cl5Oy63odxOGT58dgZC/NryX/w+h97l1s+e3TAzKCR3GW96L8iqdiW8qQF9rUCyGkaP/p9VxH3IRC950O3EfOWza9nnc6/czlM5CQrJWmWzU9dIWT53eZxEZCvuCNCz61aMBCnz8XvLcJkhC2zmmACYP+8BfcglATXV+3Ze4sIIzqq10kKwEMnZZmQdM5+7WKwkiLha1A3A6hoGduaoh+EFdqLMCIql/iauRSUJAI7EmoBW+ISyWI9EBlTMhv9oP+Ay4BH7e6mIAhK8vXk7Lf7lZsPdwyqAM8qwu8uaQ0iVVQv8JiTsy5aMdAjTYecNNHR9v4phomPajjNf8ECZ3gcBy0OZXmg5nv8kWqrYSBFql38yQbBcUhPCBZ73QFJ1PNX8dHYLThFaArdBdzIaYls5JmVDK9vQjD4d+BXtJCox5ziTDFYZztLEZS4iglD15aV1cti3uzFHWv1p5vtTj0jL8LrbmjV1ta8NKsvaviSoS2MOFSUmVtbbNZBlc+3vfnfZAyix8R//vJnPQFm4oVhn9aieKEZBNzkpzVnbmuNa2ozkPVn48nQSsQ0i9PyCmFsIqZfpEGQTkZtdwHhopiocmcrgEIa/IhnKIDEWhUYztjK2D5fgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pO4870dl4O7Npgfx6UhyFUwb7vhIvDiOkxeCLlp9AyRXvBNPgBPY+SDl0bS8?=
 =?us-ascii?Q?rnCVjb10K1NlL4DhRPSboOLpbEv7sJpPIthAgNF1GQ5/6An/opR2wzPnIlqZ?=
 =?us-ascii?Q?kCck4GyZomYvoaAEtORPPtltXS4PFFpI9fMBSwlR+Sx/aqR0ZmhTaVlY5Y5f?=
 =?us-ascii?Q?6ifZv75JyyFf+/0C4xX5iXI95IXmmBH6Y6gXA8ptn3VK4Iuc/YTJSXReKfpz?=
 =?us-ascii?Q?rXzJfVDaxg/NB/r7kmw3kPDF0uNUzroM1x0J9pDQUnwI5+kbSyum/sbYVINj?=
 =?us-ascii?Q?mK5pqNo1Iwkcq/UgzPB7N6lrXKam9YHCTNbXlYtyNJL+Lj3Vi/NFP87LQErE?=
 =?us-ascii?Q?bAuIW8nDZgr7QUFe5BhVj7e2wQOlo6hThNhQFJobBHgYqqqJfMuKlqg84ZIo?=
 =?us-ascii?Q?m2nGz4u5Vasoosfuw4u3C4CgN5WAxJnR+DeiskCgzE4JxIxQ5zdp1GyEa+XY?=
 =?us-ascii?Q?h6P/HJsWit1v+V/zybz1XjFnzqTgW2JPdRXy0s6/aHMHjkgdjZbuYudH4Ei0?=
 =?us-ascii?Q?33As0MSxXG9J3753cDMhbHZA/rs4kyMtxxuPe+jpiXztZ7e/Ut4o8tL7eRwZ?=
 =?us-ascii?Q?V84dQ2g5jTrIh09PlYN7Vruvhn4zm1T3Q/l8r+LL0KZGkUlkMqJ0FF426bpv?=
 =?us-ascii?Q?dhbUa1atenI3rnkalUpTYhRmJmTqqMff+SwKCdPTibrnb9nJqI5oPWPkzJSp?=
 =?us-ascii?Q?/ExI7PwmAdMJYhnAbpl4+ZnoijG7fvkiHP4u0NhJ46xmbtaJyu3NlROgyW9Z?=
 =?us-ascii?Q?44ch98xVFB4WftC3hHA8Xll5jTOW2gF7/YmLT/R7gSTZurSKIRncocYp8/11?=
 =?us-ascii?Q?Ba6xmoBV3uNhc7DiTVIoerrfxyUEnhhMIMmv8sdCKms8gj96TitWbWloZOE3?=
 =?us-ascii?Q?97C71NykwZHn7lIuzQJJwjdielyqLc5xXTss9FPlxellCNq51EbQ7Y7D8BPi?=
 =?us-ascii?Q?uUYpM6blLWjsY82F6CtQ5sCcxVmktcLwb4XMijvoTe1sp3BWtcQvr+bSsimC?=
 =?us-ascii?Q?urke3hzJM+NWQEMpIIma4tSIgm0qTiscQOEAj2IuJlk0JbpaomawmfLYpahR?=
 =?us-ascii?Q?oaWRtKWHP6aQY70BlsMqY3nI86MSFBnqBQOK08J+sMG5eAgXJJ7OiDbsVu0a?=
 =?us-ascii?Q?BOcCby+qAgzc5MR8DHJGoDvxuIXIQhN8dghaTnSRYyZ6hfGHvXd0EvKpyh3c?=
 =?us-ascii?Q?BvK/jNbtgVGQMA2pmoLOO/werAUhNpXb8k/alludqXnXCFHVDuBmIn/DPiui?=
 =?us-ascii?Q?jUfOntvg55LVDpgYChjSPz88CnoLuq4pHGIFnPhBDCYGOyYkFJyyhHt1qRk/?=
 =?us-ascii?Q?oQGjeHQHzFt2V9ahDDVGZBDrlQRLzbS+TNpPhTw18yml/sq6zHPFr8O4WuU+?=
 =?us-ascii?Q?Y79fVk8+oF55Jloofff/T6HF8PNIzskgaaBTBwYYec2CIFHrAIz6iKD1wmBv?=
 =?us-ascii?Q?0KN+835OTR/jexG2p+Cqq4dZ19FqVIzRZ3jXRXU0+p+FAYLuiJeZocFhwWWG?=
 =?us-ascii?Q?TaJLiD9feDN0CgO3tf8oaydK0p1YwxkBtWbUjMv7TocDhZiR6DyuImkiaO8z?=
 =?us-ascii?Q?4GJxV0Gi4KIDunsiBHmu10ccSJIkg/tCA9VMLRQaUiYf/VHKXxk9FHfYlfvG?=
 =?us-ascii?Q?wHbxb19eEfnYo7Op9nHltpCSBnwWZZlAcW2QOTNb/xMAB7dQOJqegMyqQqpq?=
 =?us-ascii?Q?M5TA0jEdLVAGHkXT/KJjuQXQ+uNeWe7WB3HAvBLvZujzreIVm8wBoNFSWqwh?=
 =?us-ascii?Q?mudNxn3DQA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d43d2b-e4a7-4afc-a62f-08de76194a08
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:00:12.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BltbqkGF/MglNAU/z8BAYfYfJXZSuxg0dYX8aFq1DDPhf3JWT/D0Zgs8ReimIdfPpIfED0y6Y2GW3V+rI567SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_080017_263654_A3336CF1 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, Feb 27, 2026 at 04:11:38PM +0200, Adrian Hunter wrote:
> The MIPI I3C HCI driver currently returns -ETIME for various timeout
> conditions, while other I3C master drivers consistently use -ETIMEDOUT
> for the same class of errors.  Align the HCI driver with the rest of the
> subsystem by replacing all uses of -ETIME with -ETIMEDOUT.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c   | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index fe260461e7e6..831a261f6c56 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -334,7 +334,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
>  		hci->io->queue_xfer(hci, xfer, 1);
>  		if (!wait_for_completion_timeout(&done, HZ) &&
>  		    hci->io->dequeue_xfer(hci, xfer, 1)) {
> -			ret = -ETIME;
> +			ret = -ETIMEDOUT;
>  			break;
>  		}
>  		if ((RESP_STATUS(xfer->response) == RESP_ERR_ADDR_HEADER ||
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> index 3729e6419581..054beee36da5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> @@ -275,7 +275,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
>  		hci->io->queue_xfer(hci, xfer, 2);
>  		if (!wait_for_completion_timeout(&done, HZ) &&
>  		    hci->io->dequeue_xfer(hci, xfer, 2)) {
> -			ret = -ETIME;
> +			ret = -ETIMEDOUT;
>  			break;
>  		}
>  		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 5879bba78164..dbe93df0c70e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -261,7 +261,7 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
>  		goto out;
>  	if (!wait_for_completion_timeout(&done, HZ) &&
>  	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> -		ret = -ETIME;
> +		ret = -ETIMEDOUT;
>  		goto out;
>  	}
>  	for (i = prefixed; i < nxfers; i++) {
> @@ -340,7 +340,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  		goto out;
>  	if (!wait_for_completion_timeout(&done, HZ) &&
>  	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> -		ret = -ETIME;
> +		ret = -ETIMEDOUT;
>  		goto out;
>  	}
>  	for (i = 0; i < nxfers; i++) {
> @@ -388,7 +388,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  		goto out;
>  	if (!wait_for_completion_timeout(&done, m->i2c.timeout) &&
>  	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> -		ret = -ETIME;
> +		ret = -ETIMEDOUT;
>  		goto out;
>  	}
>  	for (i = 0; i < nxfers; i++) {
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
