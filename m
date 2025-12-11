Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66CED41D61
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1joG/Lvcyt3mW5PYJRoBpIX5acBvqzbE5Qz7xq1gh2Y=; b=Bm7jaC8fTp/6Pk
	rfn0GA8K4S7PvzXSzRTgikz3fakb7fxPRVeJB4DCsigc3gWeQQvmfn9yOvy2fNSz5FO6hF4knA7iU
	eQvyk3dV/97qpRqwUsnMXmxCX+OkhRTJeCyx7Urumd6Zc9ZuROs/Bm4XjpaqDn3GADiPup2JAVcnY
	oLEh5zcvDSl/fhr0JEnmExFuVZv6i5XgmbUvxxEREqHhyiI/2YeZh9o1PPl83lbbDpP2FfuoZkhqE
	Fl67XDCu5uo8QZDtDWVukzPNt9HEDrD1dIQ25AECLBCScyO/yneBcc5tfHXTWjrowA2lNnS8xiQoq
	epHrpQeORyKfxKDJ3JqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTimg-0000000GmoQ-2lNn;
	Thu, 11 Dec 2025 15:40:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTimd-0000000Gmnc-2f07
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 15:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXplpXnfELaShTMANA6I2vSSCmVNaGmX6UHgrcFv4OBciKasBc9KJsDGiJl/Ip7jEyibfyQasA5bxE6ukp3dYjGkMssNyfXifxCDFd4rk+4BUOU7eoloAtOVUVY9VUFL873uuiJgMQQwJNh2htEEAJkYwBy2HSdHiD3XyQ00SZkAEDGWLksLmK8Wn1uHN3zjf5xdS1PxAFioB0Dbr5Mx5aTN56VqpCYR9hYiuVigyr2GAwfDmlyyNANkn4ymq4bkj2vgXI3QaetxsaxIihjNTi2VeIgx+DE2kqIXOGHTluO5nINAIbdXUcM8Mm9reOrJQmNTFuseQgmyWHK4jH/K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxyG3mRpc4A1kIDSuCe8ScvAU3oS0p8pss4g2sq0vUY=;
 b=pl0zdU76ZD3nOZk+xtlqXOLMtowQ3ZR3oI5r+42LlHNt0vgQ3J7OEGYKP9mDrEeUf405RqTZnxZ8LQ7MlokYMIRbQgD7q3N7rDm/f4w8pwEOYIey/QovnOnAivH87SD/lD4ccQi9hJBjSFfIrWuU3lUe6H26rtX3wI/jRZ2dnZ5HQQfRggNXlA3in0Tv+5xTWyla84RL/yfV2lA0MCAy63l//PCRzt27azRDS5kI/wwQxHQGWnVFIbUjuU7rcnsE0QPK3Op5v7fcx8Y/pGmWtdRU9qmyj6prHS2BOvwMxEwqmGqMz1qojUtkEYfQjr5FOGqiK3NBtKe6Z+lFVG6S0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxyG3mRpc4A1kIDSuCe8ScvAU3oS0p8pss4g2sq0vUY=;
 b=kY+x00RJ5dNyigy/vhCuAIPKW8rMKndT+N/xrHzFQ/kzz+9C2yLxBrp/pqQr0EA+QizPLiBXTUJ/N2VcoB/I4jG0IeT5B9575uerWvoHMGqQgDtX2mNBwwkL83faHYboFOLw5gejt+w3I+QK0zkSuvIsHElrNaAx/j3mYmu0qzh8QguBORNttbjO/g/FOWq51THHx9ctUTta+P+jJZTZkUUgyX9plBnbIbmbHfRumGBP55NfCtZlbfxvewSU99iBH1OR5hNul2FifAgvdA7ThA/byy95CmiOTgA1o3ibgGS2W64OMozm8mLt6E7HKZx0/6/1X+W1vGbR6C85fPUTFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VE1PR04MB7407.eurprd04.prod.outlook.com (2603:10a6:800:1ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 15:40:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 15:40:42 +0000
Date: Thu, 11 Dec 2025 10:40:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
Message-ID: <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251211134809.75872-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VE1PR04MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: d58a1bce-fe46-4dc3-748a-08de38cba488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JMWfVMx0d24dobumPFeCc5DJ/qdz3fSc1Og5K6zcyx83RJabhlQlpHNiVmrs?=
 =?us-ascii?Q?9QpfzSzjH/eaqc61i0PF3sbYSMrhmsw+abRFF5ClckRaBvd06NOn+qz1B3jT?=
 =?us-ascii?Q?6dZDHRm5CFvIhqckXPH4/jArMskJ7qcfs2jyQY1mebglJYp6GRD8PY57GLJy?=
 =?us-ascii?Q?gbYM5UQ2xQawYcX+0zBAkaWfxToN7CWnwlEglrsQbfmXiconJOlNQp2HZ06K?=
 =?us-ascii?Q?lo7/ug3q4YCMxIxcCcJ9WoKgZ+tD3q2aTbELWM2gj8BIpCknJgjcFPveC41I?=
 =?us-ascii?Q?yfB2lA377XtN65E0KOdYa/6skCkjVw3ysqTzOoNKzuScxwAfvCXjkDyXldK/?=
 =?us-ascii?Q?QEckNAfh76HA4VVjz9JZKY8EL5B+/frvLq/dMmrHK3YCE5qANhENX6PzyVBT?=
 =?us-ascii?Q?72imrH6EObGXHdin5GYaMwiE+Mv5xSvSrYRTkYPkEYsnW3ArTZYw7lW9quch?=
 =?us-ascii?Q?zUiFGsGwmZkHV1IFgw0tT/x7e7LRSgBCBn3lyjOAfAJfIf8/3wiAHhpcGBHA?=
 =?us-ascii?Q?YhTmHQE9Vmu5UrFg5QwKb4m5Va9Ksyuo6kXv+hPPVd+7CwQ9WF80uc6tnPJe?=
 =?us-ascii?Q?DkCl5d0JXhugIBXjufqQYZEJmZYo4V3G0279AXn8VVHmj6VF1DnJ9Fq8SZAd?=
 =?us-ascii?Q?fzY9WLWtsjpnrWbvID8cNceWJ9sPKV/fhPW4M9EbXVbW8SrEPfSsP51u1/Nl?=
 =?us-ascii?Q?bYeUEtTCAR661GtsD+CzgGovQQbJQYfuCnj0o7Jsc5vuG9DWu0iSQRhIRZdz?=
 =?us-ascii?Q?/uCPzL8rgQS7Ot35x8ywiT/aoAuBHAp1Vyvom76HzQbRrlTlv5q82W5qrm04?=
 =?us-ascii?Q?+zQGgjaCd2kcFumh9ISI+kbr0ApSqIlJXESn87Wjf1DvCxJY8/RPd8ah2fr2?=
 =?us-ascii?Q?qpE97e7T4IAghosUEnET8ePc5mKsyog1JJdi1uIRc/3nDDi2Zq/WPGjdcSSR?=
 =?us-ascii?Q?5z77F4k2TnwOMx1bXeR+yhbD9m3R9H8qUdXqCofvOrekwME+QQo2++Dz1R94?=
 =?us-ascii?Q?7VXNq97CBFl1cO4OeO181UuTqTx05TT1oXqgEsFsPpsd3MezEIZU2UZTu8Lr?=
 =?us-ascii?Q?nseUYTWgbCJPolGj4vJdbqskWDsnH9aFdqK0t3J+citxzBuX9pmZKegDlKxP?=
 =?us-ascii?Q?LczbL5VV6aDWZ6ssgzArLwN2kgLlRDEcb/GgkYTDOHE0jcYa+BJTh8RmDEhJ?=
 =?us-ascii?Q?llHxbIILntWpdHrJjVoOaGWPEKZnDIZQsfDp+NYXOPLkvHzoO1hXtzZ2W9Q0?=
 =?us-ascii?Q?aN1KZMfP9fjKHtsOcNZeeDJ/cD9lGHA+2b/yaoyLtrdM5SWwU1xkbYvcU4VT?=
 =?us-ascii?Q?qCqp9npFewTrSA5dOPoa9kEYmcM6zTXiphGQB2Vq9aq2hzNOLK/9BU2QgAZ5?=
 =?us-ascii?Q?gQ+WF3/Be5L/nmhcodd7PIGkIB7wDN9eh6yMdkxWCZSkRNUq9o8u1Lgfnkor?=
 =?us-ascii?Q?e2mBMVDpYjne+uEwOUYpowjLXxqTQBvzdtOunJtEHHcHIpkY5ZDPDpIbttNU?=
 =?us-ascii?Q?35zatDnYvjxnvcxz13+YBcXzb7VjQu0Ermvm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5KqXt8xiqVwjHb5nvvqq17NvonDEy9dGCNz5bqzePFpnsE21V3MVn1w4sGt9?=
 =?us-ascii?Q?SQYFtCn8Fkkarljh+V8CQJKhbYBKDzIWUbcjVxIAnf1T8EGdiCjazMy7eV6V?=
 =?us-ascii?Q?e3Xh4fjUHmAUnk6qb9Vm1MXLg5plxTpdA9VPj/SFmxy09YdwVxfsnR6lA0Kb?=
 =?us-ascii?Q?ZIeHIvpFFGkv3hnkzyf57GvuuwrXGdCmy29+aicQ3m865K33mH22NYseHp45?=
 =?us-ascii?Q?L3LmMKy0EYEUIpNpfrDg8S7UwCVUifoLff6HmB+5VUGwjd1TZHPdNnX5aaQW?=
 =?us-ascii?Q?xdOpMlNdS5m8UUvqnCwnVFYp3s62VOOD1WJVHeynWUSN1XAbniKvXm5bZ9Gf?=
 =?us-ascii?Q?qc9PQkmAu5vXvgTeqcKgebNDIiZwn+bAdOBuc3lWIYBasWXBe2137W2P0Swo?=
 =?us-ascii?Q?Mzg5RHsbuUcSp5+JRXKf0Gc02fTFuQ1D7XoKwLjuT00GBOEnLL4PRZymvGe2?=
 =?us-ascii?Q?WyyvhjU/dS0oLpRG0rJSiLbENCduehLqrZyF8P5kudpWc+YaaW5TgZH+FEUX?=
 =?us-ascii?Q?CFBkEQiO2Qnc+86QKMoHda8hbDEhxP2aj7hvZzPpH9oWjIoKoi0OP2DFQIPV?=
 =?us-ascii?Q?eWvGpMVt95ZydKlU2krwxWn9Bs2r6R9luWaXkLLlRKK/b40WbyLcevJ1BKdn?=
 =?us-ascii?Q?OHiyd5Gts9eQfYVZJNnSSjmhoN9d8xa8x4JvlbYzdxwemVTZzhqQunOIz8I5?=
 =?us-ascii?Q?GATkjU+rhsJkVcpJqsS97OBI0v2UA74Mcl4RL/PIG+qoHk6OUAge1EDLKICX?=
 =?us-ascii?Q?vQCVnNIkbdPPA+5mffB0xuT9WUvHoEsn45qyClkQy/El2+PyRGoTKXZDlHoq?=
 =?us-ascii?Q?ESxjBnnV2rTYX88J+HjhIeQtYdFZSC+n5uihXW/pTqnKhGvMa0Gow4ZbjR5V?=
 =?us-ascii?Q?9XNGB8sZkmMQES8spkWyNes5sTJz3kW1cqFFzXnZvWNyWK54BZpKBDQVgutt?=
 =?us-ascii?Q?RAmoOOKoAHbyE7Oh9U1mymrcaKKbq1Vdhv2auQn15xvWfCtgvi4I8n+wPukU?=
 =?us-ascii?Q?Vxk/rSomJopwrORFA0o1JqW+Z04rBmUW1oN/J8lbaQ3w4rvjyqpoQY/v3vZF?=
 =?us-ascii?Q?492CUnJN2K8uTRr7pOA9kFKPO4HrJQxIDP0XIay/NQcO/mVQSjKlO6daQZj0?=
 =?us-ascii?Q?1VhphnOD754kKZZ/dEQNMat1wGoIFuyOq6KknDOAfUBtcHP32jkS++/1jxLX?=
 =?us-ascii?Q?emveiCx2FoJ6zI5ZRblWQx1PffrqlOQRC/w/Qw/ws+5vFmwlzdT6eQpgvAXC?=
 =?us-ascii?Q?ExBliyMM3Ksj86sI4oVJl4pC4PkrTaaDOp3RS/eErmwfEmaO76bvPgsTACMX?=
 =?us-ascii?Q?ZUjSzkPycObyE5grwm6+kTpPdf4/Fy/44tEDK5Ma/ipZuTYZJGKikt650ls8?=
 =?us-ascii?Q?qmnGGLtEU0pAy6oUUz5s8UVJbCZk4FRte0++ETFuPw1b8naIcsGWXh9pLa9x?=
 =?us-ascii?Q?dRrPnQzF6av/SfHE0jzzBVPu3iNeV9ydrCGdcJoNuwdgw6LuaXoRtiXWZm4Q?=
 =?us-ascii?Q?ytqGt84R0Xvgxhc/zje+q/1w4Or3WPb8xjCHqK+tf8AoBKQJ/9/tXTMCZBvW?=
 =?us-ascii?Q?fkunpCqDGfovQ4vFMsQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58a1bce-fe46-4dc3-748a-08de38cba488
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:40:42.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0M9ZoFgzJ/hpnS6/nnqmX6SSe/Yv5J04L7dWpqlGmB5IHMByfKaIr7y+E9ag3zSkxYxEwx/BcoidEDaEAo+CpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_074047_684291_81233996 
X-CRM114-Status: GOOD (  19.43  )
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

On Thu, Dec 11, 2025 at 03:48:05PM +0200, Adrian Hunter wrote:
> Use pci_alloc_irq_vectors() to support all IRQ types.  Do not call
> pci_free_irq_vectors() because it is unnecessary when the device is
> managed due to the use of pcim_enable_device().

pcim_enable_device() add action pcim_disable_device(), I have not see
pci_free_irq_vectors() in pcim_disable_device().

Can you tell me where call pci_free_irq_vectors?

And move these small patch ahead in serise.

Frank
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> 	Multi-Bus Instances"
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 8ade911e3835..0fd3587671e1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	pci_set_master(pci);
>
> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		return ret;
> +
>  	memset(&res, 0, sizeof(res));
>
>  	res[0].flags = IORESOURCE_MEM;
> @@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	res[0].end = pci_resource_end(pci, 0);
>
>  	res[1].flags = IORESOURCE_IRQ;
> -	res[1].start = pci->irq;
> -	res[1].end = pci->irq;
> +	res[1].start = pci_irq_vector(hci->pci, 0);
> +	res[1].end = res[1].start;
>
>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>  	if (dev_id < 0)
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
