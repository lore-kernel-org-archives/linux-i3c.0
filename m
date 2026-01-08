Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB9BD1D46B
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0L7DcFYNZWIjP/61G87XBYaRUpg66TwJv4kfIuQV0g=; b=H0T4NjidDPIfLk
	BmQM/vGdRprBx+f/GpSCXWZ4TpgK0PlyCnIasOmpszuc7R3YMkYd+Mj/UzK++Mxam1pf4/w8LH9xY
	8k4KBZVtnwO0Tm963/RRTAKmxRA5aB5/xhGSGJ/OfSs9ys4wsGcXPif+oWfYjH0d/fU6Ed4TkFTkJ
	lzPVWAik5ZoHMgMvvi3LFC2stay3YAbpd1dz71+zbQPJJadoBqnLi/VLDMr+o6zvP1VdwYh9uIVoL
	ShaR8ExpjcvkXQSt1uzsacw8yY7obQRqix1Q1L4x7RKlmbdm6KCU3xi8YN4Dui++LShOgkS3nI09E
	CCzK84Ma2JnCYxXj3L9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrYH-0000000HRfo-12uH;
	Thu, 08 Jan 2026 15:03:53 +0000
Received: from mail-swedencentralazon11013050.outbound.protection.outlook.com ([52.101.83.50] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrYE-0000000HReu-2cmx
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 15:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIJcezLSIMPlx0kcDow1bGmC0nqcGhjFtNs/cUc3lty7ew2/xOQm27AFTuCdnsv22paLXaT33rXSrGaH1XcHEHQUAxOAAU0GSSYFwnZIGjw22LlRo/ShrCF2H4XgN37LEsmKrFXl8NNLdCIZo1m9UQBQa1ddDS58DUrGG7WTo2rYL1W2/Tlcw7JVMUA5JQzVR0W7DVAfEuIqkCprO1kgakqEnsyYlEGFcSBiLX3wYuDm1qR3typl474w81zAcuWOlijjn8qsyh2nLLLpIr53ON4/abFXZ5r2pesOhfdwYdjcuS7euy0yzACCgaVBZV7XMxuyej4iNIE0Ak3cWPAJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpVYCIZvn0RoylSx1hzff2O50/IcrMTxYwWkJC0cg5Y=;
 b=EkRJQO+J3UxtbB2DY6Zqza0LKu22bPYjlEgfSGF3IubsIeABrMuetxSzWga2tnX1AvQLKzFDFU8x8M86iyrSttcypn54ZBbWXimSB2Qv+Fh7IsmNpd8Yt19dYjEJbwJo6+JIFSugwOXXeWSVF8A5w7uJCQSYOuemNhGqDwEWMHKJPq1S7GKCUXHIzaHQBmzyiJg/LRnbf7VO6h7Z96aGtqHawItFBiHxzGwWls/dsDcIEAcW+5rqTMuWgDwwnzuZLoyyBn9CZfwtM03f0m1/5BqXVRA1r+Qcuo+d5MpxndYXl3Nmj8/3eLS4vsuRkbisak0WJn3bMHkhpIDegM56ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpVYCIZvn0RoylSx1hzff2O50/IcrMTxYwWkJC0cg5Y=;
 b=LxxeYAlUXen6NhkS7yFJ8+XU9UCLJW4hvxhoboN/beB57NigZqTLame/HaPzYTmR8J+oE7wKGm+beZFH50fyQ6HeEkW3dEt6xIVnw2vS92tPvjg/XUdVCBQwx/m2P1j1wvNUCMIlawhZmG2ZssVVERXXnbm1r3iJHylth7FXOf2a1gUWeSD/D35g2Q8BoFphfmmWeMTyVfGNoUW+VUNURDJQpsQ/smG3Ikn345y9KKsv6zOmyitVJ81Xj7365cRGuBvIUzn0LpRhopZMEZ0jGzMLAoE715ABGGAL1fB382QwpZu7Ot0QXoufInys655mp4r8/yMl9w9fvEDdECmYRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB11936.eurprd04.prod.outlook.com (2603:10a6:150:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 15:03:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:03:34 +0000
Date: Thu, 8 Jan 2026 10:03:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 15/20] i3c: mipi-i3c-hci: Factor out IO mode setting
 into helper
Message-ID: <aV/HP3cxh+hGLigt@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-16-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-16-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB11936:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b413d7-299f-448c-5bbe-08de4ec7180d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6whGXDvcW7nsT1GcX5XlWAOQQnI+0Wfo8opZzibqXYsRcnPzxLxLvNKAbLDz?=
 =?us-ascii?Q?mJ10QOsZjz5528WqAvLAdlkOnB0bS5mEJcjuMpcdG1VzGbIqqPCbRpWNyYRk?=
 =?us-ascii?Q?R4cXFFXecGuQg5s/kAbnzL6qo20F9/TGIF8yJwHz1IO5e5cFajrsuLQzjFxr?=
 =?us-ascii?Q?HdzL57tUzXbBNnVblSPotOOlbgXRRvyN4duc/8c0kpup47jPoZPR1xPouZil?=
 =?us-ascii?Q?4cnSqoFFjzY5sN46kOqBqKSW7sOfkQPdoTCRRiazWKo/u5pPMfG3vxEU2mrY?=
 =?us-ascii?Q?rU9tuZt2bdWo4xSkxmqg2Ojz+8UusyPCQhHCD4cGlSb+kVlz48zh+Y22XXkU?=
 =?us-ascii?Q?VDx2eg89O/eXrZimgHNMVj7PvfZ7U7UskbZ1lg+7kRsUFIio2nfiOxrGMGuO?=
 =?us-ascii?Q?hlw44MCrSw8ZaXBX5MStNQTnHUqT9/CoF/JMgtgtzA5sxHTHgBb2DQDQb8Lu?=
 =?us-ascii?Q?tnjJi9FnJZLri3V5Aa8gJItaeLb6QgG410lxzeu2yB1Iu6MOu7dMF4OB8bgH?=
 =?us-ascii?Q?10XUhcK9TRaBIu29KS05RCLgCD9GRF4UQ4EdOpoQ6FqUuWm1G7h/n1cuv0Ha?=
 =?us-ascii?Q?7jPgMuOOYE9MGgTPVXdsnFspeVqKOu2CN6DvAc7tpq4XwlffifO6FR6Ww2/h?=
 =?us-ascii?Q?r79X8uhj7a2CkgQ0RkEJ59qXaYdsiruur0fRUVOZnMION22wxvRMYHgBRc3H?=
 =?us-ascii?Q?kzm3lT53LLj5NQ2w5TEIroPzqRTDxlwgK1KGzb1KZI51orcJ2RBbW63lYwKU?=
 =?us-ascii?Q?FBAreRatgunVZX16vJm4ou/dTHz2drJtmzHT+U4d6KcjHTeBYzCGpMJw+Xup?=
 =?us-ascii?Q?RJZoDHiFSp9Hz30mr2TQnd3pd+3o8ygpehIj8mKDgtnf/xBax5XYeH7RslfT?=
 =?us-ascii?Q?DSxTXxquMP1bCb7SDoyNWO56eYMcTtBlxtnEoewOhxr1AbhCIf3HNI7oBiqr?=
 =?us-ascii?Q?OJDM+LsHRIvJJR7Y/1WWZVdDW2txWIi8w1KJEgHSc9JM8L8OAUDmFRdoirq5?=
 =?us-ascii?Q?6ic82VO4GHEfhry3uEF/8NNos1SF603pPOPYbt4No7p0h386kEQPOY6wp31b?=
 =?us-ascii?Q?JOS2quAIfRxHrqmQ6YajnfXN2bFBfjKEtl7j3K875HyK/RwNgpxJfDKIu3Bo?=
 =?us-ascii?Q?4uhTdr+jZK23DFpD688lF3BlBCqFKomSnFaRtOIx89HR+kaKdMOHbSGoghsl?=
 =?us-ascii?Q?e5ivu1MLsSycs8HfqjHaqrQAZ+4XC84AXB97KvEj9Zy3XI8DCT6x3Rn8fQbP?=
 =?us-ascii?Q?lV0nLgoVl88j3S21WPh0vIacGDKEhpsjnhV39JjWd8bEtA6uCitqlFBGzkie?=
 =?us-ascii?Q?ZzdT9MWJBNcE+r9wM0SYcK01rcs42siJXMxBhH7hpnO1cwOSMwlb7WVt4iMU?=
 =?us-ascii?Q?HRVbSCY5Cv9ZqceOyIQbnsEgnK5eHzwcIWwKRGNAxyBgtAsohDePx5k6AcQZ?=
 =?us-ascii?Q?NdpcS9OF7ujY/XcrHLPAmiC2KHyCdpnKadN8TKobXAkjzTv4PtLuOfdbjROZ?=
 =?us-ascii?Q?z8EA6cGMR7QjY5um1nDi2o/lckSo0RhbLHnt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ojqPzcu9grpudA5OJuHn+iXdDWx6wS/V9n32xSA8fd8fVaQv4199dXpgn/ba?=
 =?us-ascii?Q?DrMPoDNdA/vGRnjNjNBzkX/E0y59jp/N8ODt9zfwGJ6TeFeoz6IhyI+/nLQZ?=
 =?us-ascii?Q?QUon4sLem2eAccWQJ4kaQ1L4C+9ZXNuj99wdiZpgIqDT+dEHQwfvBNx0Yg/K?=
 =?us-ascii?Q?O64Kyv6JhO0lkOWgaavm5nfJKTptH6Wu9kcvav1cOMewbKE+ICuq0a1YRTxn?=
 =?us-ascii?Q?mA60omHmQANAF7jtItn7qjt59CSHoV98eZkFNjM8JqYDJmZAAns72w84c3ay?=
 =?us-ascii?Q?1/7w4LTI1cmf75WlkHY9FCTyOnB36MGu1/I6ibiGGz8/pbiJ68nRO/GZzRc8?=
 =?us-ascii?Q?ta32URmiDyvAqUjBMpCU9r4k19a4kQB8+DMxCVbBzOI+lC+9hpNFkKrYsQQP?=
 =?us-ascii?Q?8ixujYGpKz9OYce7SxIu62NiQdTJEbn0+a2PoEhXUKhBJJBnpwm9j5uRHkGE?=
 =?us-ascii?Q?GzzT2iqp6dre/wlk+HGouJZD4xwhflcUTWXFvrqM9zgYRwjR5a1u+BBYAC3H?=
 =?us-ascii?Q?XCtXPABuXFDK4B8xERHX3/56b2SHq+f/OaJLPu/mowtM31GzJfDqp3Qs+kBN?=
 =?us-ascii?Q?mHQ2r2lua0Eli869nfMSXGKpsJ8w+KIb3W7KX455nWwi7J5dpFLS8eox2Tww?=
 =?us-ascii?Q?U3pyaiR136a0rOfhLomooed2fXzLVX95gw0MkHfsWkibN2OR+gScw/z0X94M?=
 =?us-ascii?Q?vWPHbcYnGMDHGjhhFESAV/WQ1VKMUIv6S3Y8D6CFfz3/Yyi4CnERVLW59fYJ?=
 =?us-ascii?Q?anqRR91kRGZ+6V1r7bDeUSXnYrIgnIgiQ9LwIpQVy7OY0j4yylIYaW3k5+Xp?=
 =?us-ascii?Q?BeepLzhrQ7XDAGPUPY/y4XH2OuxzicB5woRubIrC5lRY7HYtQmYWMxhwvT5k?=
 =?us-ascii?Q?FXmDwsnnWJPNKnpTHjCbS0OuaTZg561mJWlbGXNlaBPxg0nqCeDQtRZORWmG?=
 =?us-ascii?Q?9/VQ2te0+Fdf6icavyHxASaEp0GssMkINIKYn7tQFsDwi1P1qYvb7XH8+bsv?=
 =?us-ascii?Q?EjVgVhnzjnsQzx2hbGwF2+FtEalrfcxTZ9VYOtnS0k9joB8oSKEAW3uwKSyF?=
 =?us-ascii?Q?JPYnatt98Eabp839s2sKlrizkQ1QTtdYgB6rrja4MHsRMMLFnx30clMPlxqo?=
 =?us-ascii?Q?hQatUO9vlCkSH/0RxRCeOJHNEQ0O+S1VeQDqqwoh8yvW3POzNoCgYdLG/+GS?=
 =?us-ascii?Q?uuTTlc2A6SeDUuW+etcUiUA/8qAv0yKD0S8eK7WVC5yPDXSpd657PrJlMkQ5?=
 =?us-ascii?Q?eV0t2j7WZEiVF31KrrUqyr3FrterTzc1eapM8KnyYXti78+/cDAHw9x4HgGt?=
 =?us-ascii?Q?MKvgqyUotqZakqMSFgJpnFOZ4e2aCmU04R3kulR6UAbph2NH+s1ZYFLPYBQg?=
 =?us-ascii?Q?qCjx9ljseKubS+J8d5DSLdOiCakeR8wtfeAnFAPkm95xhk0MW4xCum994jqk?=
 =?us-ascii?Q?/5iL7kA8FATlFdHCzEkv/aoA8LJUmdnGrB1QzhqxNvo6wYM+o2qHyVT1r9oO?=
 =?us-ascii?Q?WILyIRwDb+tETP7mBDkaHPyDto01GlXZeEvLjq3IZIkRljTrij1I+VHR3xNf?=
 =?us-ascii?Q?LXjUOtr9rf+/Pvh5ZxoMxMS6I3ScHhXwSa7m2LkMhw/UV1BxG3K4/HwpmXwS?=
 =?us-ascii?Q?DYsAeg44Tzfkt4qpQPfrcMDfei6ZeYFJRJ6811/RAWziDNNTLTZ/t1gJaJtp?=
 =?us-ascii?Q?l6rNHiFBwO+4Z3PTJGaLE9bwDEUfQ5U2kdpo/HdqAPMfm7E9h9CDs/RnbzWu?=
 =?us-ascii?Q?+zdwQSZmiQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b413d7-299f-448c-5bbe-08de4ec7180d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:03:34.3972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTD3g+gMR6fkcXWjQnHhOf8SKnvZZTLF513EyljumZP2vo+2P4To9o6e7sK0g9maXs/l1MJdc1ZYAlwAnt2urw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_070350_691268_60EBD5C1 
X-CRM114-Status: GOOD (  22.24  )
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

On Thu, Jan 08, 2026 at 10:05:53AM +0200, Adrian Hunter wrote:
> Prepare for future reuse.  Move the IO mode setting logic from
> i3c_hci_init() into a dedicated helper function, i3c_hci_set_io_mode().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 45 ++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 3b0609cb7da7..569c8584045a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -613,9 +613,35 @@ static int i3c_hci_software_reset(struct i3c_hci *hci)
>  	return 0;
>  }
>
> +static inline bool is_version_1_1_or_newer(struct i3c_hci *hci)
> +{
> +	return hci->version_major > 1 || (hci->version_major == 1 && hci->version_minor > 0);
> +}
> +
> +static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
> +{
> +	bool pio_mode;
> +
> +	if (dma)
> +		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
> +	else
> +		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
> +
> +	if (!is_version_1_1_or_newer(hci))
> +		return 0;
> +
> +	pio_mode = reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE;
> +	if ((dma && pio_mode) || (!dma && !pio_mode)) {
> +		dev_err(&hci->master.dev, "%s mode is stuck\n", pio_mode ? "PIO" : "DMA");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
> -	bool size_in_dwords, mode_selector;
> +	bool size_in_dwords;
>  	u32 regval, offset;
>  	int ret;
>
> @@ -732,20 +758,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  		return -EINVAL;
>  	}
>
> -	mode_selector = hci->version_major > 1 ||
> -				(hci->version_major == 1 && hci->version_minor > 0);
> -
>  	/* Quirk for HCI_QUIRK_PIO_MODE on AMD platforms */
>  	if (hci->quirks & HCI_QUIRK_PIO_MODE)
>  		hci->RHS_regs = NULL;
>
>  	/* Try activating DMA operations first */
>  	if (hci->RHS_regs) {
> -		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
> -		if (mode_selector && (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
> -			dev_err(&hci->master.dev, "PIO mode is stuck\n");
> -			ret = -EIO;
> -		} else {
> +		ret = i3c_hci_set_io_mode(hci, true);
> +		if (!ret) {
>  			hci->io = &mipi_i3c_hci_dma;
>  			dev_dbg(&hci->master.dev, "Using DMA\n");
>  		}
> @@ -753,11 +773,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
>
>  	/* If no DMA, try PIO */
>  	if (!hci->io && hci->PIO_regs) {
> -		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
> -		if (mode_selector && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
> -			dev_err(&hci->master.dev, "DMA mode is stuck\n");
> -			ret = -EIO;
> -		} else {
> +		ret = i3c_hci_set_io_mode(hci, false);
> +		if (!ret) {
>  			hci->io = &mipi_i3c_hci_pio;
>  			dev_dbg(&hci->master.dev, "Using PIO\n");
>  		}
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
