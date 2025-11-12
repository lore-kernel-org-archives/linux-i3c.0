Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DBFCCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7rzwgSnXVBzOU1zrbyHgl2s28edFOZl8D7vtm5vtfA=; b=WfVeziGSVwCR5F
	tTl3/4CcVD3Mr1Yy3Xd/hypC3650Q6xiLOVCSocvqQ6kx/zmGVVPAk56yq7HQE0RHuvwCK8wbrxkb
	I02BZtovEesCFqlA+JY9Y+LHbIA+HeTWO+c8W0KFZQPyveUJtwA//wYRj9NxG7+hoONfbMJ7I7XFp
	hhHHemT1eLV8u+Xl46KXP/VRUCWIbW2fC1xac2Z5rSU/1rBqLHl+zgSzr0AH9b1IWuIqdshB7+RWE
	cvuGBsSfNE4C0WEj1d3CzNneT4Uw5ZJ0uGOWXj5AbhMIMCHsY52LvKryJd8HkzbIOGTgDl2T+vOWT
	kQMNhN6HXjNMNwsVqqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD8L-000000097tS-0daV;
	Wed, 12 Nov 2025 15:51:45 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD8I-000000097rr-3ozY
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 15:51:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd7JXlPKXLe2ekCvXB/kqKzSAlIqXTuvX+3vbRIB+Lx3JOh2egvV/N4rEVTeOO6ndbULElHXgldhS3ESgM5q69sN2Crr3j622pvY8PdALIsG8uCEf6BVZKXX/iBuCewfMgYDpGLMdHqwID2F1wEO506eI1xDWTGFV7mWkgfRIivkac9JtrE5uIUzqbPBqmdG3VhEeEeVy1wodXi45EgOPfEGaS2bCA9bZZSHdSXbonUwTCBaT4mfHXsDSKIy4fMHUC1cYEhRHco9ahXUe3i+rnNCIiBBOYiYjPeLILu7/yNT3I348JFpRzSQ3pJ3gguvDrbGF+UL7UKavR5w2VX6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR8pK1QaWs6nTIFlB0nn5Y8KNTOePq+dMqU2rqVfQNk=;
 b=fRju5vCiQ38dj7gfoyIuKr+y18LX1N685/Gc2diX0vuD0yzLNTmkpXXF93ET14m7A/AsOFF5BS9xtzwILqaPfDouj2RvE5K+UbgbA/gBNTLRu7jJtoyR5XIhMKuYc27UngDM6IrCKLsleFg7LLfDB5mODpjx42nXtFIEoQ8DvDRvQl8gUE/aa3Ruyj+UnXABoPoMYDshmRbljRdc24cILwr78Arx2fUKmew3w9Q9thCC4j9XL7E62ZZxiP4CUzC9ClNmJifVIh4xstBgA26JE5CD0VNqudhj72SV9NW5gn06mf73aFP8rzEkhpc6Twx1CGWxkkfODPizEhfB3SIzxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR8pK1QaWs6nTIFlB0nn5Y8KNTOePq+dMqU2rqVfQNk=;
 b=d7WExRNGDB53Yz0Ica/puJxGDwU2RI/pIgXaJuRggrUNMyDW8Cf6jT2Z8eYwjgRj0C8Rfqra9qwid+aIa5xtG1+mHU2TiYdWY8dOP4y1Vjc4XyixSpVtwrTpj99WjTih5BPWVvWJOx+uqcxfx7OduDl2KlymO/OQ92AC77Y9hAsKBmKgrFHS3ozyFYW0aoO20j+JnRumUC2Tv5J7SFyG6hqLnkNrv7D3xX75etxg3DTXW7Esxnb+ERybSJfoiuuphjY4gmDo73Ez4mcLoGOdj429cmZYSSzACCR3cSbO1aP3Z7f/RE3LS1usaBZ4FcsdqVFgB58jsNh5m4PQuaL/Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:51:38 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:51:38 +0000
Date: Wed, 12 Nov 2025 10:51:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 01/13] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for
 Intel controllers
Message-ID: <aRStBHMKZVKyAUhX@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P221CA0047.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: 898170dd-fd2d-4ded-79f1-08de22035da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FyB3b/IwaxlKp9LZWrXfCmG3adi7X9Y/G05fUX6io+j+osFo8bzP+NEM1hPv?=
 =?us-ascii?Q?DNFOy0pYoXwEmHsgfThLvCJNbHbr2p2lYBwCWgbL/w4s4seQ8j11omOKdxnb?=
 =?us-ascii?Q?KZSwwXLwOoUOj9O7nxfvi9X0ozGLhcngaGrxSV/rxdS5wJP46/3TJO1n+7C8?=
 =?us-ascii?Q?QJdmIs/BXetvtAF2U344opzz7OyokbJQDzecAZ9HbI0EJbxagjg+p5XBN6jg?=
 =?us-ascii?Q?E8xG0mBn9WvcgPsVAmKv057732MNYSYZliOc0v7ss61zbxoDQvcksYR/oVpV?=
 =?us-ascii?Q?sPvBnZZRQdSuwvUrcl/WmIyPVeVIaQ6XKO7k1QGDIS8lAa9Bq97bK8ntl6O6?=
 =?us-ascii?Q?xkK4Z6pfTp72BO+mscot/+GsXUMNAxT0CUFZGYU8WiVQ7B1K3i92igDAQivw?=
 =?us-ascii?Q?oL4UJGQQWeAx9IHoc6wY/s9B2t44s4HmPSWN0qc5xhMmF1zaXlLendkAxtwU?=
 =?us-ascii?Q?oHa1/1OdR2n41J9G7tRTJEfng+4NZi3C+iJmWDJDBfw800qhGz1GySKL6Gy3?=
 =?us-ascii?Q?KI0uVEw6yA9WUIBgKIVnfggpui8FqgTsy4Hw24paFh8qEqU3PIX7xhpIbcpx?=
 =?us-ascii?Q?z96j3csaeXt69ZZQEJs0BEW78lk2QEn7zI1CCkaEuqGdiyUUkiFu5pcZGi1Z?=
 =?us-ascii?Q?gjROn8Ud1lOFSQkx+bdy0rIUM1AM/M54xnD2+qaVAWNGBa84z6eJ/olsXfq/?=
 =?us-ascii?Q?Qv4unCCfwt4KUPR52cMS4bJjR6G4P9JsSUQYerI/mmcpKXWv3oRY1Ell7dtG?=
 =?us-ascii?Q?ORs7bCVLhgZ65cCsiyffc33n4+MW/+5STKgdZDlx3Z+YNiuuJNL7uWwwLNLM?=
 =?us-ascii?Q?hyGF+GrJPZNNiDjHImWwWVHDD25xABh43UBj5jv1VsOLgpHjHHMsQewaNXeP?=
 =?us-ascii?Q?B2qRr0f8dgZnKHHzRRfeMOj4t31tQzdd8Vxw55HuJgYbm36dkx44npi9QX5s?=
 =?us-ascii?Q?D0TS5HmZYlFVRJKxu5hKI2JvY9UUA0UJZNsOqKaZYo8z3xLoVHPt9Ed0ga/m?=
 =?us-ascii?Q?oX/XArH0BnM/LibE/ahNenU+HlDX6+rbQLUJZNoO7+NlUzYlnRGvQRWbulPH?=
 =?us-ascii?Q?p7PmIM23ASbVvM8Zp/q2sjeR0SBWb6BH6nrRhtMwR1CF1uAEcXAqTcEyZ/AH?=
 =?us-ascii?Q?SVdv0hk0NMFxmB7Wn7oY4N8UKFE/Wgc9cNeCy7hRe5lMtxiljoCt/4r0CzZS?=
 =?us-ascii?Q?2iFvrZ1RP633mKBgeJ8sd09Ip0EQ6zLT2lHxYlbgoPF4/HlBru/gPZIXKOLY?=
 =?us-ascii?Q?u1hwaWAs+G6O/1GrbQ8j82BrlijBnYW3u0Lv+NOBsP0Uj7HBV9YkDhgtJzKn?=
 =?us-ascii?Q?qcHBpJXS+1oXLq/3I3f2l2Ijdv3TkV9cIx36Y5YbQALI991O3xHmXOftr2Qz?=
 =?us-ascii?Q?0FItzZwTJm6Zmc9aF2yLZklKgorr2ZlMCyMVFBZlPCHQPqH7OjGdTsfDqvgZ?=
 =?us-ascii?Q?GIkkc837OiZZHhnfVxOVbEJchfUSvzJ2x4lVwDdlabBCq/S2r6/oVxeFZfKG?=
 =?us-ascii?Q?YO8DBCREzmcBtZwy6KON4gycJNu+hqw4n+d0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rv6n0nczg2a/ekb3fSYX7F2pfrnJMYep3WewUvMVITx+Mnfge9etJf2p8eMk?=
 =?us-ascii?Q?J2+Xv4IwEZfvklGVWhCEj6U2flEaMcN8LR5wgTcdGvrWhdoY8JEW+6GJcA6c?=
 =?us-ascii?Q?0UneeJcSU7s1pLF0f1dmN1jycj5OGVqjmdo+i4KW4c0/1FLYkkxCllY5lUzp?=
 =?us-ascii?Q?afa9KvnCD4gp4fY3m7UxiqQZ+B1OXFxd8auDz2AbF82Liq0gwozbgVvH29oh?=
 =?us-ascii?Q?jSTVG0+2SObC3yCPTkV2CvTtPl58sLOAvS40PwAe1m3alVUT2CNqzm/+l+Gp?=
 =?us-ascii?Q?ijPFxEXRob99VGjfUs4k5UKQBlfPBjpmXM3VrweN6hC0XWWdw6ELTBoZhz3X?=
 =?us-ascii?Q?lh2tjNNAbavFDONJUaUMEOwPrKkiHateySOvZ227pprbnT9/V/QEJZcYzPq7?=
 =?us-ascii?Q?DNv0COb7faJ6TAlbm38JKjiyfDLeTP9fZC9zrobaDZjXCIIR3Kga1u6oBM08?=
 =?us-ascii?Q?pqBQtr1E4U1XZTf7CAHaDDzCy5XR3eBQWtFnMPteqNNqaOa82EY/CnByBQVe?=
 =?us-ascii?Q?MleIxaqLiHnfS972HwrnpicxPpKSeniBgMlYiusgdmHEMnuU7NHFg2phMI+o?=
 =?us-ascii?Q?J6NEJy07Mt09Gb2CJe3kYjHuWhkG2FrZLPGJwWjrB+7MDHo4Jzua1n9EMpxO?=
 =?us-ascii?Q?U7HA5/YwFCcMlpzIn+5JiibaZBpb4p9a75SU5NT+shWHowMyBfCaXqAY0JSG?=
 =?us-ascii?Q?yZ6cGZIYN56vjDfGYruEz22JLiFs0wBEnHWXKDXvX9zTQRkQ/4rHqWZwtrZF?=
 =?us-ascii?Q?vZEe7PyTqnUEnkK5wjOfGO5JiyDjDFASuickcnznMmjW53c3JCREgnr9HFXU?=
 =?us-ascii?Q?p4bPcpxgDJnQpAzulstWrtt1IaUv81wkgYluUgSmys7ulxRw8QR3o2OUvRe2?=
 =?us-ascii?Q?CfDTUnFmyOSuDXr1tw/iIqwmjAsj5r5ZzeVBg4EMfXROIyymJfTAkK8IrRzt?=
 =?us-ascii?Q?RuiOWXKnyarsZ3VUdNLt8pv6h/hU6SwfQlbE9RvFVyLkgUGwjJSBg0CnM+Nt?=
 =?us-ascii?Q?k+71SUKEDS20C+yArYZ6ttFr47SmQU8zfctKkVMTWTCb0ZxWD/LaLAiK46tE?=
 =?us-ascii?Q?DJop0DCEuSy5ol3gLuW4mV+OVNgrfnauXq17WvedJrkMvC+MjADU/gLxaClq?=
 =?us-ascii?Q?qNTB23MfNeMsq0pFixvu5bovi5LJJZ0Ls8EQkXeO9OF32ZH1Sg98E/uoqWWC?=
 =?us-ascii?Q?UxCxGEVxBtFSfiJqWisr96j1AOau78XUzBO3U4aAh3HT90H3UwyMuVrZ7M3i?=
 =?us-ascii?Q?X50n4nTqj7+5VYW4zumMQV5VEHvvjGB6JMp7FHW+GpxTFCbci8GzDKYHU5gu?=
 =?us-ascii?Q?Us/lPXe98f5Ki2/rSm4QD0glEWkcTcYX6q4mBfCPbbj/ZFkJzN83amoePARE?=
 =?us-ascii?Q?qfN2ukm2wwboJUjBIkHVtAn+c8RBZ2B4JpLmtdkM81DGcnZ+pZkoEEdTjuKW?=
 =?us-ascii?Q?LS/jqv0+w+R6ND3BsHDf6OyxELkyke4HCHOPwgygOCERLo2BwvVlFPEr3Vxs?=
 =?us-ascii?Q?F6dvf8rpvcPCDhL3i7ux3H0tiFzdJIgrITj5Ry/v2uJ/gHrRlLci4/ZyEAsT?=
 =?us-ascii?Q?RZOUI672r29H9EVnsV3DC8/m9BrA/aQgi3HWlV+c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898170dd-fd2d-4ded-79f1-08de22035da0
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:51:38.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOvSk9eI5H8zxrikoxKx0jtL9IQLEaP6yCcLkQ6lZSXvyqp/6Sux0QFr+uCVTB5xWnXQi0MsZybgG7z5wApNiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_075142_957431_7587BB0A 
X-CRM114-Status: GOOD (  18.83  )
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

On Wed, Nov 12, 2025 at 12:03:27PM +0200, Adrian Hunter wrote:
> All Intel controllers support 64-bit DMA.  Set the DMA mask accordingly.
>
> This is needed only if there is no IOMMU configured, which is not
> recommended, but possible.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index dd4484eff2f0..850fcec4cacf 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -29,6 +29,7 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  {
>  	unsigned long timeout;
>  	void __iomem *priv;
> +	int ret;
>
>  	priv = devm_ioremap(&pci->dev,
>  			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
> @@ -36,6 +37,10 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  	if (!priv)
>  		return -ENOMEM;
>
> +	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
>

Needn't check return value dma_set_mask_and_coherent(), it is always true
if mask >= 32

See Documentation/core-api/dma-api-howto.rst

commit f7ae20f2fc4e6a5e32f43c4fa2acab3281a61c81
Author: Frank Li <Frank.Li@nxp.com>
Date:   Mon Apr 1 13:41:59 2024 -0400

    docs: dma: correct dma_set_mask() sample code


Frank
>  	/* Assert reset, wait for completion and release reset */
>  	writel(0, priv + INTEL_PRIV_RESETS);
>  	timeout = jiffies + msecs_to_jiffies(10);
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
