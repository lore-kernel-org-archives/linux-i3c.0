Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A0CCD13CF
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAou90fUZNArCSkdFfkktJdrTcPQCBEOfmri47oigc8=; b=NbTCFxzi1bayCD
	P9wNDPzsFlMKTpVz9f162WODsYbLF7fhxpi+qmqeIn7ycV+a/v5q/Ml26amQymHNDEppWW3Qw9QOU
	tVk+JnvOzgAJXNatx3azEoRgTYBPhe6n81HWotUE+jjraLLKx7AIQCLhYtHgAcSBrICxN/qv6XhaD
	n9qnegw8OInL2AEULGbGiycFfo6zoEqqiZddCxieW7YferPWdwHvupRMjqF8sfQ3yn/sXVqdO19as
	OvyplMenVQYPvnvmOxUApGzwHfK9966K9pWE6F+gqce0ZYBAwhNCYqhE2RQv87QcQaUZ/FqyRlGAu
	NPgGfdhwsiPOomwPVKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDGd-000000098ub-1XcT;
	Wed, 12 Nov 2025 16:00:19 +0000
Received: from mail-westeuropeazon11013016.outbound.protection.outlook.com ([52.101.72.16] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDGR-000000098ks-2cvq
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 16:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pw+YzVr0eyTaKI37eH2D/GfddFtUMA/I31b1qkqqsAcFW6Qxy3RDrAvIj/NpJ66Cey0LHdFZQWEphzulRoUNlNdYVQbOyA0/fy3RqzwB9lEkaoQlSvtE916hbXgujhe62g2hsRSvF21utOMXHhibmIIWIcBNQ8BR+3Ts3fiFhVMOYcvKNkGjRudpAO8CqsnBUOaUSW0W4fhcVgp5nhpH4utcM7HzM/O0QbkwylIqEG1r/K6SgczPTKoVmMWClsCq72C1IINDgAKMXVLyg4EGgjHMSfPPwei3vOK3NNccBUMugnuovtGxGf94DyGFPBjdxTvuQIV/GQ8QGJHM4eT44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S8cxqTwBZvZDLgYSKYUjzl+eLFBc/12LWW0jccwSZU=;
 b=i9cXDOMDNjenABQ1h5oKWGGnzDYiFlQI4V/V5HSm7cclEasHhvwgfF4nnOLi/4Z038JCXhZP73OqYTF57Ec7hZIwesP8PcgFLGxW0POsW+MNPV/kzmtYTNpwvVIRogTjqu2gTaKYaTh2K9jCqmpBYBQa/mXjWTNU6lgumro7eMpwarpE1mN5m4tpvM8WBicvhEuuHXmED7hhNfCtYr86oixcAIT6Vr6KKeQmPztMMYoKKuZ5Tana1Muu0/2B1nt5vMnpVm6RD8ets8JVVtkU+C9oroktzVuw3CqEKMXxhJ3720CHf3XkEumEJsVlTHn4E0nMQ7DVkc3Z+4WCrpXKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S8cxqTwBZvZDLgYSKYUjzl+eLFBc/12LWW0jccwSZU=;
 b=CVursm7fUsnaQu3mOnurkL82vOB5m1FNxdhLepfb3WtzznZ3b6ZRwM8EzwK57U0HKz6NRttj6nOfkIGprvqjvw/3Ly2F0FITT9/ypWoYBDcBXMk4lcnaL3TkR/89JSjZDDKpnGflIR0Ca4CKiqzQ+sK/37a4BKS5AfYim4Yt23aeA58P3PCNNldIS/eR4ecGv7np1Dzf/O0Kem7zX2ujrgWsJTywqo//CZudNmqxSbiTKf9NylmbACW6N3OJR3FSIaGeI52nQyi8BmfqCJaDZGtkzJ4tyXpa2VaJjXxB2AuceVBQ3eqisqzsEpViZHPTtie6so5SLYpBh2jAJu6yxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 16:00:03 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:00:02 +0000
Date: Wed, 12 Nov 2025 10:59:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Message-ID: <aRSu/cH5/m1TtZil@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-5-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::28) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DB9PR04MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d5e177-aefb-42f5-d51b-08de22048a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BoBN8w+aH2WpOQe6yUnmuaE0RhUWPlZm3T71N0J5xDBaqcxNXmhtdh0ScmUO?=
 =?us-ascii?Q?iiecH16JLv7j9qQY+5LSGTWtao0DQIoUE8SrhhCSE5RS5+mXaq/Fmiuaffho?=
 =?us-ascii?Q?D4YuEdAc6qBI4teO6cD+MXJAZcjrmFNMAPw9CJBjIaMA1BGIdf3aiLP0BGyH?=
 =?us-ascii?Q?3wCKogMls0KXSvYhRYAceZHl5fgxksv1OP+twr8Ib9CvxcdezFw5hsd41xwW?=
 =?us-ascii?Q?VXCXJHL3NWp+ZwjdWgzzmwXhn80cmbsVgJEWF8JI7aEcNJjRJhm01Z5QT2+5?=
 =?us-ascii?Q?pSL8vfj5wHwXRDPXUaiBzVgxqFqk89LMht2GEepru64umlN6cLJ+le6ZG/F8?=
 =?us-ascii?Q?ACnRI8q8YpQ0J7D0Vlnfwalp0iCpNTNg1RZf6wy3Gju+mX3v1E0C6QJnLqKn?=
 =?us-ascii?Q?nq3opcl+jDzkCQnEIFPf67yk0hro6aN7CucYE6DiRnfaHS65t+DgyZXvpvGR?=
 =?us-ascii?Q?2PnT5mRDOnBLUpHOGaOM3sQyog/hcfBW5SoJdm72Rs+4pUNIXqN8xer4KOw8?=
 =?us-ascii?Q?lc/mioC0Xrs68F5O3FTgKEWcsKLSIoYcZfsCT/4ViZ1MRHDkU6ylJRlUbRiX?=
 =?us-ascii?Q?gtgiLnenx4d1Yof+cSkVAZ8hSb9JJTFYKqFXzibeBGBPR3ORKO/fVz6BzBgP?=
 =?us-ascii?Q?EFlszcP282KbOtrPSJAT434IlaiSSJAvAieoKKtt4grC5jypQlqoo3Ad6tu5?=
 =?us-ascii?Q?kRNF58pbDqbGKrA35jm4nDuXzlfSclHF4s0RlzDyaZ6EOz/FFGUCuFpszxCP?=
 =?us-ascii?Q?AkuKZarrzVvXzKqcP9e5yQrWH6/U6isF/zeVj4OmyhJAXnZ8y3ZVf1a5hlry?=
 =?us-ascii?Q?hhj1NDjcwzQ3nUZXpV35KkkhSdYZ21mTwSKS4Wua+MBNnn1ZARaduskpWvCv?=
 =?us-ascii?Q?JYD4dDaGPvARWvd6b7epmdadC4aMde/LcQsAH8enk/yb2wO83oHWgFuRWH63?=
 =?us-ascii?Q?wmEBtU3kQk2MqZf90RhzMsgf5n6+pPda19PsWMo39zq99BxvNgR2LCFTnGkK?=
 =?us-ascii?Q?MPF3K7wEoYre/C6g1rjYPtbmCcjgFIkBGec3erBiFqBmBxbt1JPFMreOhR4Q?=
 =?us-ascii?Q?Eg90mEuRwgykr09PIFj9JMv8iR7tHycXYUjvZBrrCtQdBxOcmHXAGg1GaxLx?=
 =?us-ascii?Q?v6NLnRlLE75JP7f2/HnQnxv8nZEZfszob3TqQV355+uYNbTIVLQinAh3Uisc?=
 =?us-ascii?Q?7PW9fkstsd2YwoCzauOxw0QAAXBlTALwtY3rf4eT5WvKrtFE5OXvmvxZcmPQ?=
 =?us-ascii?Q?d0IBAiRUveLr6H68DlDYnY3+z2jvbyNdd7REyFMWrh4Dc93sdk1YLu+SqCWq?=
 =?us-ascii?Q?YaZ9FiziOoE/Cvw4F7mpmxtU/LsPe08UuFMfLWNxdYPMtJ3TMkf56MMohM5M?=
 =?us-ascii?Q?1EEXF93a/c+N/xdtS93oXwkKOkku4W4HGDQtZqZj3vstQNgdzsVBXoKGu1TO?=
 =?us-ascii?Q?Kl84hj15teOi1d79U4aF6WIqznNIXKptxF6v7QW/PyrwwdEf805RymR5dvt+?=
 =?us-ascii?Q?UXL33eJA1O4EuVNzDJIUxB5Xr7KiyZNSsXC9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G+67+v+r5f7dbD6VPAnzoy2MEVT7OxTyowgE99CxNVPitrqedo/iehTTUDT4?=
 =?us-ascii?Q?PaqvdsuQbQgrjuqI1V7IVQXh9vNC2YglbA0MJefO0fxGzZfO6NX1KyunDdvm?=
 =?us-ascii?Q?O5AEVr4iQGh1gA5TBrI5su98Tyq4PyVinrlZORe3hX50Zvhcj2SWUBWAQqft?=
 =?us-ascii?Q?UcMwkCb29C10TFKr7PjwpP6xSQJRWGpVJObcnmWq6dBo57v3XrX0SjO1wsqO?=
 =?us-ascii?Q?NPurGQOsfpo1ELZs1WK0DATfn/d/Jo1Jed+lyFI5RhcdQ1WTNtY13a/LDmTG?=
 =?us-ascii?Q?Iiv0TroupaHGGQcXtp9BOkm/x68y64vc0HPHVgZm1y04QAyGbwXw2oZguDd1?=
 =?us-ascii?Q?3nAMytpqYXT6SHFbLWCYkqp8NnjcDFio1vNEfLWPUPHLo3Bz75GApj/XLt6i?=
 =?us-ascii?Q?XgeJa6VtWkFI4est2fCYweeUZqCVyY0XnCeSKioiQ9+a+bKNdRLwndtMzHP7?=
 =?us-ascii?Q?In9YyLShx1gnVQMzQY18MZA1KombWeXK65Tl64NU01gf5vT4oEx+QGlgqCRj?=
 =?us-ascii?Q?f+bmnt7S+62FJ3xUHrkkOZd+LchFwoMfJ5YD9/VMpYOUl0AET+CPA4+4AaqM?=
 =?us-ascii?Q?ZILJlQxEUOm8ZEs6drrZxEW8c8Y1ZsFKNC9QFSJVbVLMBrZzYlvipK93O/QC?=
 =?us-ascii?Q?YmQN3O/xicrw8xneNtTGd4xsvy5EzSdE/M5vmeQTIg8cvMVkbbZC06qBh9Sf?=
 =?us-ascii?Q?8UdEVQIQsyTukCfaiC0BUVAXOkMQJJy7C67FzMDG49wVjxWQ5MnWkQcauNob?=
 =?us-ascii?Q?DdqiF7qI9KJI2YZ1fsgcxDI0IyY1AyiESVKLnmtmaoOzpviRlS448lis13ZF?=
 =?us-ascii?Q?jRuSbX/mOA1dloWq9eqQIJlRb5Kim8Ge1jgwZzxoAzL0ptBtXLhNFFbETBYR?=
 =?us-ascii?Q?dxNgZXxnC4rggsL0x/zf8XN2w8GE6qtxh5h04RySo89RZnemJNzmuOD8k6QW?=
 =?us-ascii?Q?x8rA/98BbMQondP6m0f7hE2O3WvuVwcGGWobA2mYBBdLpRxYHhHtCSfpeZIt?=
 =?us-ascii?Q?bkBtxC4jQ7ODjVk0fqPObzWaihVM/8QYK/ojOKZpRSvZQqQVcIzbkI/Upt8U?=
 =?us-ascii?Q?jGAY5cCxdUXUS5V8vm1xMsEbFFID6Qkspf+S2Vmb8PXllh9ra0RKGGegzk7A?=
 =?us-ascii?Q?bWT0H5InToXDIZ5OADuzJ7QNQEgfIxTI219xcVz3DZNuUd5zFkDey36bEXNi?=
 =?us-ascii?Q?owDubDfYYGzw2jWQYmPFqmbP7UeafllHZya9uxH1/QIcVH20HaTVyO94jhe/?=
 =?us-ascii?Q?51Rhwza8kosRcn+vFzaAswIbqwQpEsxfHWVxuWsWWLbBCEcu7zIPWPenY3MK?=
 =?us-ascii?Q?3mpVZxa/OF7lh99suofaCNzyNlmCBAc8klpYbnqnZS5wGT5I7g1bIhya41Hf?=
 =?us-ascii?Q?NzNQ5Hty8cpyPz6MrEEzBACV04POKVDD1zRPyq4x/v+X7J5gdjObCj+Dva9a?=
 =?us-ascii?Q?pHP/O/p7GKy1yqtLEmZyVA96eVP8L7qoZZW7MZkvQ6VWDITB8Q/Ikqb5Y8E0?=
 =?us-ascii?Q?dmnTaeeSslvtLS1V0pHglVkAHzr9DDpAdqBTjTkFkK1VGhvoeCoBmsm0/N6y?=
 =?us-ascii?Q?Ad/wUyiWDKcS/bB6UNoW+5Bc+4ZhjmxlyaJ7v6F6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d5e177-aefb-42f5-d51b-08de22048a38
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:00:02.8618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlSO69VViF6Ac6m8z2DA5ZKG6XEzzckvExYv5yD9dXXcqw6afjc3VUNOznolxQKReM4qB1luwf/JtWeT0BKOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_080007_707997_2FB33F3B 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Nov 12, 2025 at 12:03:30PM +0200, Adrian Hunter wrote:
> Use readl_poll_timeout() instead of open-coding the polling loop.

nice
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index c74cc511a344..c15e0556a691 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/acpi.h>
>  #include <linux/idr.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS			0x04
>  #define INTEL_RESETS_RESET		BIT(0)
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
> +#define INTEL_RESETS_TIMEOUT_US		10000

10 * USEC_PER_MSEC

Frank
>
>  static int intel_init(struct pci_dev *pci)
>  {
> -	unsigned long timeout;
>  	void __iomem *priv;
> +	u32 reg;
>  	int ret;
>
>  	priv = devm_ioremap(&pci->dev,
> @@ -43,13 +45,9 @@ static int intel_init(struct pci_dev *pci)
>
>  	/* Assert reset, wait for completion and release reset */
>  	writel(0, priv + INTEL_RESETS);
> -	timeout = jiffies + msecs_to_jiffies(10);
> -	while (!(readl(priv + INTEL_RESETS) &
> -		 INTEL_RESETS_RESET_DONE)) {
> -		if (time_after(jiffies, timeout))
> -			break;
> -		cpu_relax();
> -	}
> +	readl_poll_timeout(priv + INTEL_RESETS, reg,
> +			   reg & INTEL_RESETS_RESET_DONE, 0,
> +			   INTEL_RESETS_TIMEOUT_US);
>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>
>  	return 0;
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
