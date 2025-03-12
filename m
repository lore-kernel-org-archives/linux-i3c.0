Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B60BC28B28
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0omnfO2+nFJqmoHPIM3ZhfSjPDUcTKgn0X1B4QIXzek=; b=aClFpx2erRaEn4
	hf7Q3A+yG1sG2HlVmeLvPh74hsXTV1wZhE3uInEJlwCmzwcCnEEhEy5zkhL8ZABzTNgENk+iM3Czk
	mWjKzPoOBgwpBs52taSbhHlXS/BYhvBZMmJfJG0gcPMBAKVuPNFmGgtXoasbD/F8QSblFVbtol1P8
	+kOneSKd+BNwbezJmQ/jKdzqFQL0ydBbE40UFypC4tkc6RVXeQq0B1uszyvzclKvDQhtB7lK4fY42
	eOcYcmVHJ9o0xNpknpVcd13b0fO53GaenDJiDtubQYPIW9fzfDg4+gSbtN69ip1VPM/Z82kDgLRU9
	QGClRMx+PLDrzJKA/MdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOuu-000000091dA-0GZI;
	Wed, 12 Mar 2025 16:26:48 +0000
Received: from mail-am6eur05on2062a.outbound.protection.outlook.com ([2a01:111:f403:2612::62a] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOus-000000091cl-0NNX
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 16:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqdflSD9ibTDq0ilHoPGkbEee1OMIjFjtgZbj4FNHzVETDrvsU0OUCeVSkS0+CVZk+Qm1jtJr3tu188yOiV6N7DkCI2BKLBKJ78olxxuFP3ruYRP4aDFaFUYp75Gx7O63kx1qU/+E0otc+SpxrObEOkWvGXheLGs7L2oMU4YJAGanb9dXYdYB/99QaZry+RM2U8+r1BLDfBqZv1hBJDXvO6h6XuwtOrxtNUjvRSfHkGL6bPlLLIPt62sgNs2NSWTJKb1pdV16cxqMjnl13B7bOvzDafeJAbCeUb67MMxK1dWHSJl7TS2leJSi6DkgKZwSNGDCZ8DvsNxMCO6gUS8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+3H/FAbl3PxvVp5KTK68wCY0aplca7WiGwKaGzroHA=;
 b=lCd4FJlhM6gpMoyu3PM3sAxSgvBoMe57i1hEiCGgkHSEljRcxHPhnjvmS0iQDoUHdXkg71APq8WgUMvZ3eJ48FmcfvXOHJ9e4O6zYJ3+njNuhkplyGXW6QrcOlF/bN472yEQhdqKZWpA4sce5UEurAAigKHi7FjZ68QSIBvaxwNFpfGrQv/UgG2PMtFtcEGmK+i5Lz+3Pd6dXWrRm/HMBL/9Y8eRww3bFBEgaZ2gHE5x9i4fqkjQw+Dybj/Z0O1yzTj8SfTv5BPROOknMrXyI4wyJv7hE6/EbkuODulJHB5DD6jF308HYggA5a7fUfqBz4NesC3fR0qTKUXMHG2Wxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+3H/FAbl3PxvVp5KTK68wCY0aplca7WiGwKaGzroHA=;
 b=CLV7J1LV/rfB8X8v7hJyKkybkSkih1I25wJbD7jX0BFIavD0ZeErMLZNwc39QHxhEZzO1v2Rgh5WJQpD7D9qLAFxLqYfzK/Rt6o5CpwTpVrBBn0gLw5gPRDmcLuPK7K5IE1WTtN5G4OEq8H9zu5tgfMFCdRtN2aQgHg1rzst8rD8jmYw74nL8UA8mO7q1tB+kLAMN1uxwpmOfFV4JDASUcmDE0HvQXOtUwBauBKh34skVbkraXmimHq/YiCQ72LEACeyTsPGLCRAWfFACdDiRpz9aGJJojeAp3nf4/7hZx0OwXhwpT9+XYAEsMgVZCG+at+XXh7PjX9/Vo5IVgmjmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7297.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 16:26:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 16:26:41 +0000
Date: Wed, 12 Mar 2025 12:26:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/4] i3c: mipi-i3c-hci: Fix handling status of
 i3c_hci_irq_handler()
Message-ID: <Z9G1vTx5oeIA2uZF@lizhi-Precision-Tower-5810>
References: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
 <20250312111049.197855-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250312111049.197855-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SN7PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:806:126::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8d2fdf-c0df-427b-ee6f-08dd6182abbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kI9VIxwLQSmEvLsBEhdxbQOHOaMd86N/1sKw2sB7OZ3TjTCzv7M1uRcwy0Xl?=
 =?us-ascii?Q?g1Iz9BglbDHl9pVulqE7oKWXoQFLH1LndtppOgGmpCpPgbfNwr3tDf6MQMdU?=
 =?us-ascii?Q?DfyWiAALCW1CoV3vGzMixFRTyTPw1Dgp9V3jsSmTe478sNtzoRIXAVTFpWPX?=
 =?us-ascii?Q?MEi8II4w/6jETwnSOOtpY2vHu9pJq2rtI9j7gHdRVBksYGJ+oPqW5K5QLB11?=
 =?us-ascii?Q?HQxtVDMyfI/uyX1dGA8vyh21Oxf45kt6Z0kTWRfl4yl/pht+gVv0TDOxtEJh?=
 =?us-ascii?Q?bCUvioav5PeVelm8Mn3dx1c5GTa2xz3lt9CU2o4G66S1/izKfz/ofQPdh3nT?=
 =?us-ascii?Q?T65t5VZs7FsShUqss5e3d+zukaz37bfdDAcVCcVznrZFlR7Kko2W0mwU1X9D?=
 =?us-ascii?Q?W6j1ukuRaySnbWhNKdAE56S5epYzn0L6CZYjCo5IAjFA2UnP/wtScHI2r8hU?=
 =?us-ascii?Q?D5TUqS1PePQLFSzC4E9csDXpwSfzCS61yLB1AZTDZ7DsQPaKuX2qdLo4VcI0?=
 =?us-ascii?Q?ZZ+lAzv+yYGrAyiEQbKR/TvJM8P4ZLkB+sPE5UXeWqK5lpjLyd7MAzOOU8g3?=
 =?us-ascii?Q?Rf+2Fdg8Hcwg+pgq1CC2yczv/RZl42gVFFZ9Yn2pTpi3FFo+6QyS0AbnbIgw?=
 =?us-ascii?Q?7HILrlwUBzIkEpKPs9iBm49i5zKF551eSxIFB4vaKAeV+m8aUcYPdcpLL6bM?=
 =?us-ascii?Q?7OUubg8cytAiQzeoYQlZEBKkWeC0HTFsd45Lu5f9745TFB/8z7sELd0LKG7L?=
 =?us-ascii?Q?IVty+D8JcrGU+E8ymTiJmqo7l9k/sTh9Z/5XuKU48vDT/Y9popF7POMSbIL7?=
 =?us-ascii?Q?L3aXdKjXmBdRKpRHvDkDDe4seduUTMy1AsICOI/8bYzIlz1YAGqgP8cKmYeT?=
 =?us-ascii?Q?yDqfmc3seykrUJuTa33VxupoVRBaWy7I3E7jE7BMkTb6z1TILeP6vdceRn/S?=
 =?us-ascii?Q?cm7nOcZ7IdXkD8r1EERdhmCusQPeIxGpl3Eh7i7ytHc6Vnp+1oZEje1rRBzy?=
 =?us-ascii?Q?Nk4hm9GbNY4EX6+4U+nqHogg1juqKqzHALFZToMHSi44Ihato7gN8qji+NrH?=
 =?us-ascii?Q?Utg7x8W7qguL3OGdiZ/6Yr8R8mr1V0kUadSkVwIPEnOX9wYTt7ixMU4qqh/N?=
 =?us-ascii?Q?vFDf7yfEOWCkYqb9JWGmOONaYQaYdc3sqEU8lidl8oM+Z+HfZ/lcto4lFRHN?=
 =?us-ascii?Q?gOSNuFbg7MhnSTPVVdQlmY8erhCsfU/bkrkqwBWOohvkGqooc2bZ/oAxVNzj?=
 =?us-ascii?Q?TZevRpDM7kqY1oeZSZXx75ues0bJB2GSG7DhHEd9CYSxCRjHn+n8/2rCGtKc?=
 =?us-ascii?Q?U87N7tOHhYwY+3rlH0lTFwt5gozJcBR78JLMrEi8uq9Ybxv1y15KXvZMxKEx?=
 =?us-ascii?Q?WIejLRrPs6nDXheBJOKFM/VIRp0+GgotLAhTz2dtvzN0c4y3wL0NXuQAaJuC?=
 =?us-ascii?Q?vHuOu9PK3JEZvsOoQyi4IUB89OAL7/Tt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bl2L3JTwf2VDxZIRmsjAVTSQ+dJ9XQTDVc8ABMBl+u+KRfEM0Ehxctiv9n8s?=
 =?us-ascii?Q?UsPrU1cych2FTPTWJMmReiebzwj0/lqz+K9auFBmiGPMB9yFT9YExPCXd2IP?=
 =?us-ascii?Q?PM4xuIig4yNQ1re3Lv1ZB6Ty3tj0+q0Kq0hLgm5PwlgGu9tdao9XKMqqImRJ?=
 =?us-ascii?Q?JO+A9vx+lBEQh6FP8yvwdbDMOCi0cWzkdAQZPqSx1BCgVsTmRbc0dTj5v+Rh?=
 =?us-ascii?Q?4p4R7mGIM4ZHWDQDl4neIiiBy9wmFFLh+dlOcFDVXeTlTs2WStnhhWxH0KCY?=
 =?us-ascii?Q?HfHRpikKEJcRyVcC3hAqMpejgy1D2aVOY4MnltJCoqE9/ZnmKpB0XpAXZhHf?=
 =?us-ascii?Q?fs9koTwRGpoRmDMIUbhviET8drzsenvSz0mM3xRw8301jqHu064qL6sc17wf?=
 =?us-ascii?Q?Hm6AcdOvz6wd5tyDZ9yAP+CAagurYHVUYjYyk/CXA6nWbYkew+mMyO4O3WNo?=
 =?us-ascii?Q?GqrgT+7gJTlrjrarjtQPJbtSAO0J021Pa1qXo9ItW26yg/QxXSxkuc53sZqC?=
 =?us-ascii?Q?LXMJFFTUdfXihREh0596wDmxo8WuxkZ+C/rwTq/hn9r0Eoc5OpRGKCVR3Xk1?=
 =?us-ascii?Q?+NUYXr2nBM6jsqJHDtvysUseDFXebiJ8EJqvO4tzqijiAf5+oAF+0GzXAT7z?=
 =?us-ascii?Q?nIpsV4o0eqi7ZtCaAsx3X5HEr5M1kgpxtNPqn3eRuOQeC9Uwo/au6E4oxdZL?=
 =?us-ascii?Q?oYxEOiA6nKpK4LDYtmlhtyegr8Z4l79oTjttIUVy9O/w1/8Aen2aXKDJphAY?=
 =?us-ascii?Q?j6FLUXS1Qq7a5RBuWObHqNz2zmthOYqvBfPJS0/5vsPIT0ZXrGv+M5UKi9fx?=
 =?us-ascii?Q?02KbX2VWofmGSlWjCIJCzafuBZ2hJMHsu/iJg1EQBuuIJUtwexlgZf3fXvAL?=
 =?us-ascii?Q?g/+pQ2nzuEbq2Lxtj51rutg8tySeOzdUyYDqD15ZyRNCR+5HAxS+eZ/+cQ+9?=
 =?us-ascii?Q?atKvOm4vrzuIi0A8WJq4ZpOCvSvw3v1uZFKvyMdgcrpeA5cZhvkivf5vp38R?=
 =?us-ascii?Q?LkM8q1hFs1dday7EqKivHX3g646DWQoVzLjjfhuoEpSYLlFHIzuFbfMqs9ne?=
 =?us-ascii?Q?qYxwYk5AivaD0McOFsiPKUOBtp9JMwsqx4bZDJPmkREAxuU/2jPG4LVxt70F?=
 =?us-ascii?Q?xiFpnqc8PfU7uhMPOpRgibN5D39Efo0DHcPQmSPXLTxR+BAqZSDXA93NYawV?=
 =?us-ascii?Q?UBil1p5E8VdbHtc0lhDnSqj9lwvPBJqW5tTWRKrHwei2YCQtm+WnD2U7CHR5?=
 =?us-ascii?Q?ZnyIjJi8fRtkmn1iAD0sE9YUYtKyN9Z6YL0CdSmW/M7B8IvmvLDz2W3k9pRb?=
 =?us-ascii?Q?Lrn+GFUa1D8hLXTT3tHcMxqGOQKG0Xx8aigC9u9shfcQeca3EOsz8OnA3gCK?=
 =?us-ascii?Q?9vVJvZl6LoycQcCojZ/X8PIK8xmRB5X8sdCup3CY3Gjlz7J5BBxoz+RnpN7Y?=
 =?us-ascii?Q?ucKY31X3kARalbZg1NkOWysGXJcmXU5ejUQXtmuTz3NvP25CoLlkMPII0tzI?=
 =?us-ascii?Q?V3T6XpBkqc1qoDaLMUj5ZceAigG/M3u2sfQMfrgzEtSnyAJJf1wp+zZCzSmV?=
 =?us-ascii?Q?5ymYNcojQMOmQaNHWWo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8d2fdf-c0df-427b-ee6f-08dd6182abbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 16:26:41.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaL/wwLlwE0GBQcgp7knBZlM7BPIP/jnJopX+raSrjc0kYPrel3vTyi8bKxf0fVNV2GrSSQ+906gAWIdByxMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092646_132207_3DF5300B 
X-CRM114-Status: GOOD (  20.05  )
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

On Wed, Mar 12, 2025 at 01:10:47PM +0200, Jarkko Nikula wrote:
> Return IRQ_HANDLED from the i3c_hci_irq_handler() only if some
> INTR_STATUS bit was set or if DMA/PIO handler handled it.
>
> Currently it returns IRQ_HANDLED in case INTR_STATUS is zero and IO
> handler returns false. Which could be the case if interrupt comes from
> other device or is spurious.
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e139d7e4d252..e5593b6e897e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -594,6 +594,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>
>  	if (val) {
>  		reg_write(INTR_STATUS, val);

I suggest move 'reg_write(INTR_STATUS, val);' out of if block later.

Frank

> +		result = IRQ_HANDLED;
>  	}
>
>  	if (val & INTR_HC_RESET_CANCEL) {
> @@ -605,12 +606,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  		val &= ~INTR_HC_INTERNAL_ERR;
>  	}
>
> -	hci->io->irq_handler(hci);
> +	if (hci->io->irq_handler(hci))
> +		result = IRQ_HANDLED;
>
>  	if (val)
>  		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
> -	else
> -		result = IRQ_HANDLED;
>
>  	return result;
>  }
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
