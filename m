Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259CBCEACC6
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 19:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weTjfgEznuhJ/Nfp9kPoD4/j3htkQ0HK868mR6O8MU8=; b=rgF0xg4QTZfOq7
	w3mCRIPITdA4UHPZH9MUp7gpQvk0lwFmPB4PpXvFajH5oxRX8LzWq0J5TQ7bQlA9DxSd+a/iaShu3
	SeapwRdIYo+XOdXhwiO+k+Hf+q/bfNgeuirKhKeX1wCPm1UuGYe7U3KSu7ppvnAFdDqRPujG8dnld
	SMl9R1z8JPMAhy8xaeM9xtLuJs8lWj/KuXwfoZTsYiGStEkFleR0QCuDvQDzQpEZo0I4quwhfeob7
	XX4BpxihuqKOLdxJ36Pw/gDHyk5x7ggNyT3cdxg8EQcmfPZEoSXhY4dUDgBqUgawhu1b2iC0MXhJ6
	0MDljeAyPHgnwLnJ9UhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJznR-0000000D2Q5-1ODp;
	Fri, 14 Nov 2025 19:49:25 +0000
Received: from mail-francesouthazon11011053.outbound.protection.outlook.com ([40.107.130.53] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJznP-0000000D2Pk-1wjL
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 19:49:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIZSCpcIYq1Kag7Vg6kc8StJxXk2jOqm9m6uQfa26j46yIQ2Q+wxDE4Lm6P6mhDV3wNmQsGunDmwTP4ZQPxuO+GEVN1m7Ys4dSntcq+zL97u2g3gDl6KQ6LQK7ZsPDFWYBnVgPvtu9uOt5rnbR7a3AWyGuASHx6ujnmyvdpHTsNr6D7K/+7j93YW/UVeiLYxKMrbvWgFW1DglvdILysEg2eegAnk5lYIrc1Hs3Z9f+fRFQFXZh3oXS8vnZSui9Be9JiqMxRjoxp1fgstsddtoe654kvpTIQqm11hz+9vF1Noe+T+tCfeH62DYvpN+XgF9FRJPtkECpDvrzpZzic6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTEVI1gc7dcNNeVQY4ahZWmRxSrlrY5sOyJtSfv1lRo=;
 b=B1jb9MQ7bDyxsoNCZiR9H/9ZAC9lfQOD0rkW9j1GqFEHwso5Kz3fK8AyyiAh2Z8MtoTidqYBWfSZb4lUzvjLdDho1BiXG+OlUGf/50xjXQhp6fPEmIPF3pD/HoMukEyBUmNTMUdKatIAvBacAWSQv1Zjcx/LbXJzJVixZ1deLm5+V27tcc4maPJ8wQ3TvxInCcW+r443/sfIjZsDUMfJIeSVODDZGzJjfi29TmdBwFPFG/8Y53VqmtrLc5IKWR9BrSwwIhoxPh20KfgLWRzouta/d6dr52ZeoK6SMQffvsi0ZaDkMutD8IClnNv2Mx3SIXx4bbjp7YEnHAuW/f1Xew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTEVI1gc7dcNNeVQY4ahZWmRxSrlrY5sOyJtSfv1lRo=;
 b=ThxpNRVH2aGy6mpI4DVxa+Rb9X7DEPmYr+xsv8JBOl1Wvip7x71TbDaTxteQFIIHzI6iYcVEqLS3KAkx27JkPCv5Y2ruoUMDIxFedmDaxdtI/cyJ3RwKPeOksyekanJdv0h0UI9nkJ/Q50PmxpDc2SkggJqTWYGRlKjkalDZCOIVipFfAg8BSMf537TZOlvjA+tirAv0XkzJUXWXuaB6lvYQEB2jv6CHkPL2Q2QmnPvmREv/gus/Mp34hJs0tjEEqoxmUojRxxB+ZRtJy5un214qVVK8NOm4+amwrsMGn82hruazEP7dlcVfSihHQ4iNy5wsRGqH+685fIT5PJi8EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 19:49:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:49:18 +0000
Date: Fri, 14 Nov 2025 14:49:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 09/13] i3c: mipi-i3c-hci-pci: Change callback parameter
Message-ID: <aReHuUrEYkq+3y+Y@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-10-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:510:324::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6761a473-052a-47ef-3224-08de23b6e632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKwGtkyfjXyuj4QQHujIyo+NBQZOf5myyLZU5OY9fp36UKKkyWrG1t6R1R77?=
 =?us-ascii?Q?V8iZUTdxX8UKC58HZGpqhSRL2hh5Ur/A2g4Ls+vHzuTJ1F+vQ29K37g1O9cK?=
 =?us-ascii?Q?FTptLph9sRAs3dhKZFuthJsXkN+2piPFbGRIaLQvytIlu0+vlczIu/vRMXtK?=
 =?us-ascii?Q?xxpNzorGB0o+VOhU+Muyv+LPA+9DphFfcOVwl1oPce3BVX5RrJme3wWJYOBQ?=
 =?us-ascii?Q?XdIc5c5V2nHWTW0oxy/QDxFq/6FETp2O9z/bXQEgESkADgpyhYDM4WnVGJYa?=
 =?us-ascii?Q?uBbNh6bGTtdaMYOhkX/Nl+pW+RkJVaP7Vj70tlQgFIu3ZLZIyqK9Nuh7DlUX?=
 =?us-ascii?Q?DKPnhv2B58RVwBfYV7Xc9w1GHCt9XVu62QRRW7cEKk1ZNe6pNgkWg/BhZpWl?=
 =?us-ascii?Q?OGRja1IFECKq3uDqkhGuez/0ieXZFzoimJKAG/5G/JTMVOiPBCfcDODgFY9g?=
 =?us-ascii?Q?w1wXBXT8kQ6VtbeGkfIWQMvCQdyMCIN0RsuNurDmXjUVGFk4EysuK14DsFZs?=
 =?us-ascii?Q?PE8EEJY22nK+9n6SMbr5Kmjgb7g3XMEaacwfUi8fUgp6IQ5oCLDm3B13ZXAY?=
 =?us-ascii?Q?xYwZQo07rVJRIY1xn8IsfedTm7dJDjBtaoS9TT2lRUP85mkV9y9MhaSluEKC?=
 =?us-ascii?Q?MkmXMwDNjGfx+S4V6VOMvLWuruc55NqKDpMjPEkYDWpJCOYP3vEkFdGHFGhk?=
 =?us-ascii?Q?ic9VQPsfnA5gziQowU6NoMjqpFQlzjWYCzdKmzCHoze5hl1oyYnam3WzMpkF?=
 =?us-ascii?Q?mrFPAhmurJtGNTZC9AfIr8Bp1XP8/Mb96kGfSf1mI8CDmYWBfUYzhurXbEFX?=
 =?us-ascii?Q?ksE1atv1p4tU3YnCialajAszHoHv/VYKcFXpaSecYmgmD/L6Gggrgie4j2k8?=
 =?us-ascii?Q?WISIE4HLe8GXlIGjTi3Jq92+YYheFtUmoybVMlp1fiNkbgaGrtSP+ydZFSl/?=
 =?us-ascii?Q?WKmzQpUl66WU3zKF7M7FWy2nYRUr0EoS7j3FvcXo/aGE4x/Xj00YR67zd/Z1?=
 =?us-ascii?Q?reTP88mzceDtP9wuLW77XBVe1Hb6gp/tG1KcCK2NBJxfktXgYd+qbmzxMUhT?=
 =?us-ascii?Q?ViALZkjomh7esTTYrYFZFrAgbLZOAAm7dRzVZUMYoZvW79z6C178jZ+BkxpS?=
 =?us-ascii?Q?ezdkB9T451fKgMdGKiI1G0/Jpc/o9MyYbF5D4xcKAiG9hFZgEiMPSwW8e9pC?=
 =?us-ascii?Q?5uiDA+EP+s2Zd3z7eMDA5TBqgdkk7uPL1IazClmKXt7MrJlWnSqt6SK98qSg?=
 =?us-ascii?Q?zogebOW5EMaOKq70XHDOBdUvMW2Kvt897cZXPu8AEoWhUW84rVkvIJ6vSwHJ?=
 =?us-ascii?Q?bsahr3gddoh1HqW8DzaMPF1/DMpEABskbLJfeLPt7hEEcypU4mCRdCwXyqBj?=
 =?us-ascii?Q?Z+rKaZUm/yx6QEtEuss0HJLaWDksSVTswxvOldBhdPrfyFOebzcP38ML49z6?=
 =?us-ascii?Q?WMgtINVJ72Q7aVuCgvm6WSk/819rOwrgbC90bNK/nbWml1UVp4j6X8WAio2q?=
 =?us-ascii?Q?tBhlyIOofqR1VyJQypFS4EVtUYaS4TMzGzFK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ASAHDLnBre+bp8qUUO2qJI2+W5xb9hYbv0cK2RsxVjfvQmHN6z7w4uWzBnn5?=
 =?us-ascii?Q?szludrKt/XXjIi7bBpNpMOiUttjASNcAbqM1fiIYFGLS8nCShoPFjH0Z56bT?=
 =?us-ascii?Q?kT41rpSxrAbj8rzro4LECZe492x18z+6HqrN3v4b2EpzYGSFA4MRgczmSj7S?=
 =?us-ascii?Q?ylAiPbMs8ErR/0HLpjhYUPtbG+6YQ2DqvoyD9HzijpaKPqrgNQabYjY5gYwQ?=
 =?us-ascii?Q?BWDOsmkda+5JeucFnh0z2WAzlg64giJrsb3Ix9I4MeArfCAZxNdY+kpPNkPO?=
 =?us-ascii?Q?VxsBgBTJhPq2Lp2b66b7INkgJWrJHoQlk8ufPabaCEU4lWDIwE7Q4SJzooYs?=
 =?us-ascii?Q?40ZWH+Wgtr9Z/ZLfIWVBn9vS1YfxEOOh0tnaIW6zxVi0xCIEByYVr3id27Bt?=
 =?us-ascii?Q?5g8eTsFCzjAYvwCNOsUtqSj6nv3JpTe4T1hU0XJG36mZC1ut7uA3NX61FyY/?=
 =?us-ascii?Q?CNjHE5z5e4IFevDVH1GGrlUNyVDKwS5Kb/sdrBa0v5rc2p1NdHejrLw5JdgL?=
 =?us-ascii?Q?fnD9DhDZ4z6Qcmqs9aisE/BTLR64O9gEwwYXHXhCPkSfoD+O4erRn8X3FQXG?=
 =?us-ascii?Q?nn/huI3bE9ErnAkv6ZfKwFWEH6YFngfCSg5/0r6B+nYpqSLNxxuJE7juHuEL?=
 =?us-ascii?Q?GpjhCok++erMZ76nRY7GFXdBUV1KcJhxitfQlciCcPtSCnvdaHl5bcbhHzWs?=
 =?us-ascii?Q?hV5okkK/1rf3Rp11lnEdhIUhW1n7WVEVwZfR1HHyO8uKpHpxqsczW4nXK8wn?=
 =?us-ascii?Q?H52dWWTzBrPEQ5EmrQSI2v6MsZ1ULK4uFO0xk3Qn41f/Pvv90PV3gsXezZyY?=
 =?us-ascii?Q?j53fKj8HKD9h4wU0gseTHjTXJPuXJG2nlbiapvXMjjo9M1D++uxLz8RtZ33q?=
 =?us-ascii?Q?bimjcX1JT0E6O1vmFcH6F6h3WABVgm2SUCcKy8S53ESmOIlsGKVuK8FfkTwJ?=
 =?us-ascii?Q?mQQ6k9MexQKgU70bQ++Z9GtktksrZagJ19WDhR9/xXQjzcg4QcOFThRqwyCu?=
 =?us-ascii?Q?6t0fyj69sGUTLr1ETLdQ3pTRCBAIhFGPP/QeJ3VagGtTgUxwUxiv/Vyzc8gM?=
 =?us-ascii?Q?Yo66/SegyaOaITE2HAmfOAEJheLShOSLF/QLS0La9rFjGfs1atsQV3l4Iaw1?=
 =?us-ascii?Q?3CFronc3IFZE/tvnVlbd0IfKA10ijichK9Y9W7sDbE3EdJn5M063BIdDSFHS?=
 =?us-ascii?Q?ZpM61Ijxz2lXjtgdVQ1HUiHQCDrdvGFv37UopFMBXcSbl9pCiQY81cE+WHe9?=
 =?us-ascii?Q?Sok4PtIkao1Gqj3zxOTFnQZ1CojIQ3tpk2vWo7vVN2pq/H/zEOFn+LuDEJ2+?=
 =?us-ascii?Q?EWpobYmWI0TH4dfdd51nApFLzvmtW0xFBw9w94jO1Sr4FBTbZpn5e4ZkA+d0?=
 =?us-ascii?Q?1f3Y5/ZBHibe0EAZfW3xvG483YHcBveb5qimJLzjWr+dsUKF2k496MkPn8lq?=
 =?us-ascii?Q?MEaKYrB4/OQIFjL7UwVNstKQ3EB3r3cnokIWZhOxW7GmFRydH0kH4KQdtUEl?=
 =?us-ascii?Q?vpSYd2asoDsGgGSS2jieP0Jg9sRxB6alHDJ+UCl4x2Qx6hRvFpJF0Tfd50wV?=
 =?us-ascii?Q?qGr8NdRH8ncSbUm8Y4m3DBwIz0uPatd5Twsj7zWi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6761a473-052a-47ef-3224-08de23b6e632
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:49:18.8065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWd4QlnEHiae1/uWLXBhmDus13lXKNlOAJKgXSt1twC9B80azCZEQDgEQpu/auxVMyN9IsnyejcrNKqcECpiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114923_529957_9CEFE38B 
X-CRM114-Status: GOOD (  20.78  )
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

On Fri, Nov 14, 2025 at 08:13:52PM +0200, Adrian Hunter wrote:
> Change ->init() callback parameter from a pointer to the PCI device to a
> pointer to the locally defined mipi_i3c_hci_pci_info device information.

from PCI device pointer to mipi_i3c_hci_pci_info device pointer.


> This is in preparation for consistency when adding more callbacks that will
> need struct mipi_i3c_hci_pci_info.

Prepare to add more callbacks in mipi_i3c_hci_pci_info.

>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	Re-based
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 8936e50eddf7..7bfb9fe337b6 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -15,11 +15,12 @@
>  #include <linux/platform_device.h>
>
>  struct mipi_i3c_hci_pci {
> +	struct pci_dev *pci;
>  	struct platform_device *pdev;
>  };
>
>  struct mipi_i3c_hci_pci_info {
> -	int (*init)(struct pci_dev *pci);
> +	int (*init)(struct mipi_i3c_hci_pci *hci);
>  };
>
>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> @@ -50,14 +51,14 @@ static void __iomem *intel_priv(struct pci_dev *pci)
>  	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
>  }
>
> -static int intel_i3c_init(struct pci_dev *pci)
> +static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>  {
> -	void __iomem *priv = intel_priv(pci);
> +	void __iomem *priv = intel_priv(hci->pci);
>
>  	if (!priv)
>  		return -ENOMEM;
>
> -	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
> +	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
>
>  	intel_reset(priv);
>
> @@ -80,6 +81,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (!hci)
>  		return -ENOMEM;
>
> +	hci->pci = pci;
> +
>  	ret = pcim_enable_device(pci);
>  	if (ret)
>  		return ret;
> @@ -113,7 +116,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>  	if (info && info->init) {
> -		ret = info->init(pci);
> +		ret = info->init(hci);
>  		if (ret)
>  			goto err;
>  	}
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
