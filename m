Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92BCD3B98A
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qn20SJ/PPPy7bsh+P0is1QGYYTQCRBYG2X9YVy6KWo4=; b=eW94AGN1LHpKCB
	R36W5Tlzvq80Lf9pgWxaS9qoR96G58fQ92LEUuMWLcoNImcOkwQ99lMb58hnr//5wwuAeQP1ORpBI
	VuvQs1qJYFKcKWKztsVXmaHPthd1w+T4GYGV1BNWGMDOUZuoxeDNUTA3qUxxzI2I7BT5863udBogx
	H+9g/cH0KMIr9KX+K5W9Z5PF4zCFWlJY1IjuqeHtiyy3hvNtD6e93brBZ+XdRtkO5bTR4UCqB+ql4
	qCaRUpICzXWRf8ifgy+Pkg+3BFoNPxMzSmdVtwrK055whSa0id+73nLJAagHqFc+3nW2Rp0laof47
	TLPfldd3v1y803NUauJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1El-0000000EZxS-2Kfh;
	Tue, 09 Dec 2025 17:10:55 +0000
Received: from mail-northeuropeazon11011009.outbound.protection.outlook.com ([52.101.65.9] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1Ei-0000000EZwp-41nl
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 17:10:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SebdkckA5u9QxEN37C7yW7zkq3Fkztt3mh1/3WOecx3vaMMgGAIABYjf78P6pHA9291hR85cMs1+RP5V3l6wq/WsYIDMSBKp69DI4hq03AZ8zmwzL8PgIeO3e+YWfzAYpNPgCnPsUbMhQXvZLiPp7RgJMnvDPp0y4TXtFIcT/ckvADDRFYdzWgPMNEqO3Ibe/v+B6j4PHwzhNlcHBuDHzHQhvmMoeivmTCde9QQvlNajGVw76rXGIcrZYnDctzM5Sxdp9tWOAFCbkBRwXDbI9S2IY9tXZnstJoiH612D42VFxWCrZrqo5VF3NVEXI8OjTQDGnz1Ex7B/nQeWLrAYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtjCVS5IfIGbVX4SSRi+d6nIrpumJFGScfJFenUBGHA=;
 b=GdaLM/y95fQecvZohRliog52kHTBTGOEAnZ1mNFCDhOzMf5pa+7P9EhATIbIYnZRdffS9C9UFIwdSrklD9dt9BSKXidcMZjgWYUrPblqJV6wj5DC3HcuYLwReCob0fr2kmp/BROJRoN4JjjRjLYhlanVPhD0hnoE60/WS4yJy+vgnJjTkOmuzq5oBrUrYVdghWIKrlLLBygO+PrVNxYt3B7PI1bLneVrLups/odZ/v4Rg4L2Vh9fAgc+8uZwXAOEtnWwL0z/V8EqIvM7GeS5w4fu/50ObazE+Fpx8rklprbiVAvN8pPTk2IL7h2vuwzHoHjam5O/5oOKre+T7wvrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtjCVS5IfIGbVX4SSRi+d6nIrpumJFGScfJFenUBGHA=;
 b=ap+UEWpZVq2TTXPr59BS0cvxr1ySCWnxZ1a0YuzMzVTalXvYVa2YMJJaP+DKGM2k9DMyZocNXYvlmFAyT5XctI1jO9PJl2/rS6SXjBQC3KZS+60Orh3MpahdnbNFub+yjOQkKberMuelR1vGapkOTLhkkFb3OHLJM6KxN0gwHrKnphEOmsFpF5SLoDbD5UhbRBv/aiTV6ycvn8AMPeT/jMPNCIiyh+HOsvhSDA7Ijb8ubX7+565oS14lYbzoT3pWOwk+b4bBmLrZlL8ywUhhPSXB/zw7jM9+kTAyTP2uq1cnOnDWfD+kdqIRoXPfckKOcs5KB5ifs0omd68qIpDpTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8666.eurprd04.prod.outlook.com (2603:10a6:20b:43d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 17:10:48 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 17:10:48 +0000
Date: Tue, 9 Dec 2025 12:10:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 6/7] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus
 Instances
Message-ID: <aThYEy/L2Ou8tDeF@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251209115104.124156-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0126.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: 31be5b54-401a-4b76-7c18-08de3745e5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5vf7ZJNXpb/+eyskfTBJpcQg7ky+NSW/wrmGLACaG8P58iI6T3WPemhoVvRH?=
 =?us-ascii?Q?QIpdP6cp0/hc9k5hpRfp6Mz25uJi/lj5T26l+twKF7toZhWmqiqqKsdqeLGC?=
 =?us-ascii?Q?BdNi5ZggLF3mv5tk82pBUMDhG7SCqeNbWDl1EvMSHjoUtDSJaAnamLYYePIN?=
 =?us-ascii?Q?xcgR7pLnlYI2HHWWAfV6zAAJK48q3mUSbGpgqEkwJU7gaxNOb5WbH2yhn423?=
 =?us-ascii?Q?RLn27PJ20AYmEaD+3E0QbCsz5Wh/LdCvP1N0hNVhIztoLwN+34ziHVLQqWRC?=
 =?us-ascii?Q?eyJtDs4Um7VKcTgsUz+Zb2AH22mX4O6iHyTtbV4sgmi1DRp16MM/rdyFy4cJ?=
 =?us-ascii?Q?s7Pg7u7URII2oKQGqZyeJCRpACUEeeEEVxUk3SOvkgOQjOVjdGk3fkCSk5nV?=
 =?us-ascii?Q?9S4fSVezMjguEGt5BsZBctlePJN3Q9LXHDUXpS/U5/iiHyJLd1ZoKeeuTob/?=
 =?us-ascii?Q?dRtDNRRHl43a5DytuRGL5lmdozG5L99defBWbGyQWGrFN43JmS/BFX4A780Y?=
 =?us-ascii?Q?M7OEffEmgxKqgif5O/4Tqxt5yfUCmyvgztYmG079GfiqRnrjjz5diM6Uk+4l?=
 =?us-ascii?Q?Of51FNNahRwuZ+nxLRAru1qxGnOfjCekfhcv0L8Xc8b9U7alg3Pp3wQTefL+?=
 =?us-ascii?Q?5ue/0km85ACKF2lqQ5zGDlwQ1vVPIRIeQz2nyoSgTzEF5yKlVilV5h5nuWGX?=
 =?us-ascii?Q?O/VHU9s8Q6fblOXGpPyWNc4vb/s4SQvsLbTyEIRRVSAcgw/zLs44OLwO+u10?=
 =?us-ascii?Q?Tw/ZiqYejc6P5XRj95lp6wrW4E4gXSQbw7c2naGplarnz+Qn6JVzOlWqNoCG?=
 =?us-ascii?Q?2nzN0mtddkA8Sp+lRsM/bHMjHDgttsB6AiWCseS/Xy/0dB+IDQTEX0CWa+Iz?=
 =?us-ascii?Q?hW0lTJl0H2AuVDtXZ10k7j7KUZf4IB7bH5/lkmGH9NW3CZeJStFAGVzGKssw?=
 =?us-ascii?Q?HFM7GO5BOOdl+eBCwFcsTczTef4cyAOsMjYwWu+z3FTg2ObdaYHdBnR0bNCW?=
 =?us-ascii?Q?UkT8RbXPFwQRDwkcLKAnD3kJIEaGNzmeokExehs9nudiguAXyuDtT1hfBh+b?=
 =?us-ascii?Q?86qo2Kq6p4H0dwCT40j1PBjLlADfPPOe8i09X5886o8kwZDkECOS8rs3J0dW?=
 =?us-ascii?Q?SJWGuRPjmCRllmSOQY93mYcFeXkO4lM5rta6wnCZ1LbbrvTXGlX2msTFRMsO?=
 =?us-ascii?Q?NKPPT4yJ8MA5DQWT9MGLO3NkWxp34uWmDrkhxqnuivWn0BrYPUgEFOnLBvAu?=
 =?us-ascii?Q?/+v6rSpUu5LY0fCRErZ7KJ3ed/egPc3d0vyUWmWX7l0RIIUfnasHfwsWP0hI?=
 =?us-ascii?Q?ICDlhk449oNjPAOLcFKqhIZBqgp1JyGtH3aDiJkCQspxbuMeBrxeV5Dtq7pX?=
 =?us-ascii?Q?i2G1v8EFHUO1NR41F8q446pkwGmSH03iT8+DlqZYXeV0xSwUV5ExFempVT96?=
 =?us-ascii?Q?OnBDdBzaXzfZMHkRPTSuTU55Jis7tSw4jI6fKgf+8cKQbQmb/2lLOaamwM+Y?=
 =?us-ascii?Q?3sO7tEJI3XWRRUKT4sqInmpMfvIUg5/qwYjo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4c2U7zqNJsPz1qVzN8M6Qi6wcrC8MEt2ANcBN5La3hlGANSerAP9mzSs95/?=
 =?us-ascii?Q?iAEVRWIGr5dvQhr0hfqFjbZLd6mi1/QmyCerxGp9cC7PxdKvvGf9pJHndVvG?=
 =?us-ascii?Q?JI4BlzuC9U+ptqo5khNzfD900jMda57VQ0R+vBg6SyoHPCcFdUpcvoLW1enG?=
 =?us-ascii?Q?jpxaebLfA6kNEfnvhczLgzrTsQLyLdY3EfAhdvdzITcw2vKMg3v1AkAdTDXc?=
 =?us-ascii?Q?rwcaI+t3kp6eRmo72wJTVs3GMSKgWBooht8SwKSvOvqkeg98Wot+USTEoH/7?=
 =?us-ascii?Q?67cIGZ/G56V+fRwnDG4KgPuWHDKVUMNv93BoSTFIOf3mpPxNYYiiMw3+KB9D?=
 =?us-ascii?Q?d8DTDReoJvwmO48C3c9YARYZUaRjPUAqlzvxm2W8508tJ/sDcb+j4CoquKwN?=
 =?us-ascii?Q?0v+GTZ7rYp2tnnlSbsvZlOHniJpUZ5g0hr5x1fSTv8xtGm9apO2zk/jq6n8r?=
 =?us-ascii?Q?mpENSV7/syl1NiQOOnKEHfDPoJLXdzBHhklgAE6NMiNaGBqqHFHWqKgjrBkW?=
 =?us-ascii?Q?VczWYgY5Oa/WvqWyDwGdqL5Q2OYP9ZOL23PK30CVM1qyN8kiND+ON7S5xIS2?=
 =?us-ascii?Q?kQOMNZZjYPTgx+gmkqGOqTKQfUSmEHpqyGf2TEdsOiEmZ9XUxr2bxcox9mNK?=
 =?us-ascii?Q?Qp9MMc2Dr68xKRES1lyltJiNI5+v2k0kBwxbRSzH9qxzKtiLn4e1zm/yMq85?=
 =?us-ascii?Q?5KPvu5Jn6wzD65nT5dK5ludspIayO/wxIkn45PaPYEsdSFUkt1Am/dz1+zG7?=
 =?us-ascii?Q?lwegZxC+ejaSJuDEcc8/aJnaWZwozxwj8g51kVkQkt1vq38U45lf1tYg7J+b?=
 =?us-ascii?Q?h3+AxyPd8sxbSUlUJTIV+IkDKCqbpTTmjyamNU3jFfeW1pF51lDDWX1zjHil?=
 =?us-ascii?Q?vcgCg4cfsd71cYVOfMkGBXZsamihfcOfgYXW6aBUvnEQ8gZC+T3xMacXfcXW?=
 =?us-ascii?Q?KRoc+erIn5E6GVgW/OSGJ2uNqnSf6NGf6fJmCDcXtHQ+mqYZFK5sLDSjTGFO?=
 =?us-ascii?Q?aW8ZEM9Dq3brPNxVwYaugAW7Ee1BV9gQM+VyXcYBXur/HUj3m4n/RXT2u13y?=
 =?us-ascii?Q?elZ9zRXPw/v7NuQpRsWOe2kAgpk5WiIuWiHrDyJrXABigQroOB20bxuiANt4?=
 =?us-ascii?Q?4U3fj/kUncmPLy8Hj8ksiUazs5r4QpVgmm5/aWjVjJoU/5bQeAnHTiCC6tja?=
 =?us-ascii?Q?lhzk3JHFRnkOwC/8KQs2Ad0bOROh0WKmBludKlWBYrzAAUim9EuV/BMSoMbG?=
 =?us-ascii?Q?nww3sx2g1JrvD61kGbw1N1UwEsabutCBciRY7pjB0WVHh1YcXK8hobhLuqFC?=
 =?us-ascii?Q?onKcDMc/emm75vD+5tLAXdH1TDlhodb2DsLEHkDD+ImOc6IOUxUtJiXFalYA?=
 =?us-ascii?Q?V9Yzu3e2QRVAgNmF5bME1T+glF1Phv+6VQ7YaeZwpYD1enpBvpr/c9FTotD7?=
 =?us-ascii?Q?Q44zFRxXFL6SI8WfX8CmXggUiV6D/fqOlcstuQNwCWgqrI2Cf2sVBM0W3wj+?=
 =?us-ascii?Q?ZCm+Fgy7LFE8LXEwVsaWmUXQyj71WGEXh0xg6jopBZxYjExuwUiAxKt/IVYz?=
 =?us-ascii?Q?PfGGM3MfrNPXB7/rYlU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31be5b54-401a-4b76-7c18-08de3745e5de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:10:48.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+jG7bsQcNImliPzokq1rRT9J/HbWHE6B5R3u2X5mDJGMLaqQpasG6aGsC/GkzRDr/YQGB4iMs6AaFn+4lXwEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_091053_176587_8ED6E16D 
X-CRM114-Status: GOOD (  31.84  )
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

On Tue, Dec 09, 2025 at 01:51:03PM +0200, Adrian Hunter wrote:
> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
> multiple I3C Buses (up to 15), with one instance of the HCI Register Set
> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
> hardware function (e.g. PCIe B/D/F).
>
> Convert to a Multifunction driver and create an MFD cell for each instance.
> Create a separate platform device for each instance.  Use platform_data to
> pass the instance's register set start address.
>
> MIPI I3C specification defines an Extended Capability to hold the offset
> of each instance register set.  However parsing to find that information is
> relatively complicated compared with just including it in the driver data.
> Do that for now.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/Kconfig                    |   1 +
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 180 +++++++++++++-----
>  2 files changed, 131 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 82cf330778d5..2609f2b18e0a 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -69,6 +69,7 @@ config MIPI_I3C_HCI_PCI
>  	tristate "MIPI I3C Host Controller Interface PCI support"
>  	depends on MIPI_I3C_HCI
>  	depends on PCI
> +	select MFD_CORE
>  	help
>  	  Support for MIPI I3C Host Controller Interface compatible hardware
>  	  on the PCI bus.
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index ccaec5d3d248..145f9adadf75 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -12,27 +12,43 @@
>  #include <linux/idr.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/core.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
>
> +/*
> + * There can up to 15 instances, but implementations have at most 2 at this
> + * time.
> + */
> +#define INST_MAX 2
> +
> +struct mipi_i3c_hci_pci_instance {
> +	int dev_id;
> +	u32 offset;
> +};
> +
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
> -	struct platform_device *pdev;
> +	void __iomem *base;
>  	const struct mipi_i3c_hci_pci_info *info;
> +	struct mipi_i3c_hci_pci_instance instances[INST_MAX];
>  	void *private;
>  };
>
>  struct mipi_i3c_hci_pci_info {
> +	struct mipi_i3c_hci_platform_data pdata;
>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> +	u32 instance_offset[INST_MAX - 1]; /* Excludes instance at offset 0 */

what difference with mipi_i3c_hci_pci_instance: offset?

> +	int instance_count;
>  };
>
>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>
>  #define INTEL_PRIV_OFFSET		0x2b0
> -#define INTEL_PRIV_SIZE			0x28
>  #define INTEL_RESETS			0x04
>  #define INTEL_RESETS_RESET		BIT(0)
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
> @@ -143,19 +159,12 @@ static void intel_reset(void __iomem *priv)
>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>  }
>
> -static void __iomem *intel_priv(struct pci_dev *pci)
> -{
> -	resource_size_t base = pci_resource_start(pci, 0);
> -
> -	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
> -}
> -
>  static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>  {
>  	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
> -	void __iomem *priv = intel_priv(hci->pci);
> +	void __iomem *priv = hci->base + INTEL_PRIV_OFFSET;

Does need lock if mult instance to access this MMIO space? Especial enable
disable irq, which generally use read modify write pattern.

>
> -	if (!host || !priv)
> +	if (!host)
>  		return -ENOMEM;
>
>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
> @@ -187,12 +196,106 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>  static const struct mipi_i3c_hci_pci_info dflt_info = {
>  };
>
> +static void mipi_i3c_hci_pci_init_ids(struct mipi_i3c_hci_pci *hci)
> +{
> +	/* 0 is a valid id, so set unallocated ids to -1 */
> +	for (int i = 0; i < INST_MAX; i++)
> +		hci->instances[i].dev_id = -1;
> +}
> +
> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
> +{
> +	/* ida_free() ignores negative ids */
> +	for (int i = 0; i < INST_MAX; i++)
> +		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
> +
> +	mipi_i3c_hci_pci_init_ids(hci);
> +}
> +
> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
> +{
> +	int dev_id;
> +
> +	mipi_i3c_hci_pci_init_ids(hci);
> +
> +	for (int i = 0; i < nr; i++) {
> +		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> +		if (dev_id < 0)
> +			goto err_free_ids;
> +		hci->instances[i].dev_id = dev_id;
> +	}
> +
> +	return 0;
> +
> +err_free_ids:
> +	mipi_i3c_hci_pci_free_ids(hci);
> +	return -ENOMEM;
> +}

Feel like above logic have some complex, add nr in mipi_i3c_hci_pci.
INST_MAX can be 15.

mipi_i3c_hci_pci_free_ids(hci)
{
	for (int i = 0; i < hci->nr; i++)
		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
}

mipi_i3c_hci_pci_alloc_ids(hci, nr)
{
	for (int i = 0; i < nr; i++) {
		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
		if (dev_id) < 0)
			goto err_free_ids;

		hci->nr = i;
	}

	return 0;

err_free_ids:
	mipi_i3c_hci_pci_free_ids(hci)
	return --ENOMEM;
}

> +
> +struct mipi_i3c_hci_pci_cell_data {
> +	struct mipi_i3c_hci_platform_data pdata;
> +	struct resource res;
> +};
> +
> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
> +					struct mipi_i3c_hci_pci_cell_data *data,
> +					struct mfd_cell *cell)
> +{
> +	u32 offset = idx ? hci->info->instance_offset[idx - 1] : 0;

When idx is 1, copy from instance_offset[0] ?

when idx is 0, offset is 0, so hci->instances[0].offset = offset;
so hci->instances[0].offset is 0.

then hci->instances[1].offset will be 0?

> +
> +	hci->instances[idx].offset = offset;
> +
> +	data->pdata = hci->info->pdata;
> +	data->pdata.base_regs = hci->base + offset;
> +
> +	data->res = DEFINE_RES_IRQ(0);
> +
> +	cell->name = "mipi-i3c-hci";
> +	cell->id = hci->instances[idx].dev_id;
> +	cell->platform_data = &data->pdata;
> +	cell->pdata_size = sizeof(data->pdata);
> +	cell->num_resources = 1;
> +	cell->resources = &data->res;
> +}
> +
> +static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
> +{
> +	int instance_count = hci->info->instance_count + 1; /* Include instance at offset 0 */
> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree);

now prefer assign value when declear, see cleanup.h

	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) =
		kcalloc(instance_count, sizeof(*data), GFP_KERNEL);

> +	struct mfd_cell *cells __free(kfree);
> +	int irq;
> +	int ret;
> +
> +	cells = kcalloc(instance_count, sizeof(*cells), GFP_KERNEL);
> +	data = kcalloc(instance_count, sizeof(*data), GFP_KERNEL);
> +	if (!cells || !data)
> +		return -ENOMEM;
> +
> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, instance_count);
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < instance_count; i++)
> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
> +
> +	irq = pci_irq_vector(hci->pci, 0);
> +
> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, instance_count, NULL, irq, NULL);
> +	if (ret)
> +		goto err_free_ids;
> +
> +	return 0;
> +
> +err_free_ids:
> +	mipi_i3c_hci_pci_free_ids(hci);
> +	return ret;
> +}
> +
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
>  	struct mipi_i3c_hci_pci *hci;
> -	struct resource res[2];
> -	int dev_id, ret;
> +	int ret;
>
>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>  	if (!hci)
> @@ -204,68 +307,45 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret)
>  		return ret;
>
> -	pci_set_master(pci);
> -
> -	memset(&res, 0, sizeof(res));
> -
> -	res[0].flags = IORESOURCE_MEM;
> -	res[0].start = pci_resource_start(pci, 0);
> -	res[0].end = pci_resource_end(pci, 0);
> -
> -	res[1].flags = IORESOURCE_IRQ;
> -	res[1].start = pci->irq;
> -	res[1].end = pci->irq;
> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		return ret;
>
> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> -	if (dev_id < 0)
> -		return dev_id;
> +	pci_set_master(pci);
>
> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> -	if (!hci->pdev)
> -		return -ENOMEM;
> +	hci->base = pcim_iomap_region(pci, 0, pci_name(pci));
> +	if (IS_ERR(hci->base))
> +		return PTR_ERR(hci->base);
>
> -	hci->pdev->dev.parent = &pci->dev;
> -	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
>
> -	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
> +	ret = hci->info->init ? hci->info->init(hci) : 0;
>  	if (ret)
> -		goto err;
> +		return ret;
>
> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
> -	if (hci->info->init) {
> -		ret = hci->info->init(hci);
> -		if (ret)
> -			goto err;
> -	}
> +	pci_set_drvdata(pci, hci);
>
> -	ret = platform_device_add(hci->pdev);
> +	ret = mipi_i3c_hci_pci_add_instances(hci);
>  	if (ret)
>  		goto err_exit;
>
> -	pci_set_drvdata(pci, hci);
> -

Is it simple if

	for (int i = 0; i < nr; i++)
		platform_device_register_data(hci->pdev, data, ..., i);

Generally, mfd is used for difference kind devices. Do you know any exiting
code use for create multi instance?

Frank


>  	return 0;
>
>  err_exit:
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
> -err:
> -	platform_device_put(hci->pdev);
> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>  	return ret;
>  }
>
>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  {
>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> -	struct platform_device *pdev = hci->pdev;
> -	int dev_id = pdev->id;
>
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
>
> -	platform_device_unregister(pdev);
> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> +	mfd_remove_devices(&pci->dev);
> +	mipi_i3c_hci_pci_free_ids(hci);
>  }
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
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
