Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A7BCEE33A
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYpKPfUcdL84rt8tDYfgl5Eh/o5hMJQ1q/1aN1YLISw=; b=G/I7kmW0VPF7vo
	nYEQd/HzNQZ0j1uFqBLKrML5QaotWBc0buV+vXcyYHcxp8l1gsOkngrXPHykJcmao8jkJ5nB3bjcV
	r+/gVcCf81we1O5g0X3HA1qvteDb4tyGiyzcDJ838BTNofgjJFB3uDg5+fdKi3ZG7zJuLNNf9VW1X
	uJpoerDAV+Et/iPT2zieWkXdek9A866llrJKy3L5JhAvbMD0wwtkfpEUGwiDi94j00xg697LrNZyO
	pL3MOPVIHwcN9qnXPCUtbGTYUcGvVZr0tl+R6u9YUMzGpkNKO/53DSKKF2/1oAoJ5RHoLqnIvLFtz
	Uk9sESW6y9AGL73KxkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOtJ-00000000mZS-2Yha;
	Tue, 18 Nov 2025 16:49:17 +0000
Received: from mail-francesouthazon11011021.outbound.protection.outlook.com ([40.107.130.21] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOtH-00000000mYz-15pC
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpF7tkPNMTamAPhM7/NHhxT2XS43hWntwN+Y/MeEehvfIKm1QgSwoGQKAjkDUP+T7yqPdEqFeRODUX2qpjJe0ig8u9FAMgrXPGDUKOu6+YUPcuuOhL0Tb84V0sY+WGMf49M9t3AXpIbUPqpZrFEW70T9nUum6m97+1FDie38tPY1k1D+9OWDXYvVLfp9Z01/3Kqi1npcyUa1lCRPRat0wNqddfadPX5S2k6PblI3kTlH7sbuVvJgiBq5JuEuHXQlloWnNIMv6XXniSvabnXWNsEQvLK/bpPwQXjbMfYN1WXUXwolwA+k6C4Ek3Pfgxed1S1iUtNJpl7mNcOawqY70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9SoS+rTyS4yC1IevgMC2xELCzIrm2atDMfq5/APZEQ=;
 b=Fq+ifE5wsCridVW5cVl3z35+gtq6l94IA7gNDZDWTV3G78vIR77U2jBrOaNpp6yESN6Bqa7fCmf1bryze2hhYC6ZlsexPog6P9ufHZxHd+PnszKnzXpZ1+wKd5Cjt/94nTarOes9wInaaKb1qNmSx4vn2RqkQ8QonXC3Y2xodNDb1yPAon24QNwTk54tgMZwCqzeYfjKqGNJtZoXtATafCZDYbxdiGKJYXT09SlHlT7qy9TVSUOYBsHLNE2U29wAMVsH+4FTCiy9djEQIhRZajaEemfBBLC8DzReEposeZzVar0iGruV0/HOSMVCT6DTpOHdo0Dwi1vDr9CXkZUDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9SoS+rTyS4yC1IevgMC2xELCzIrm2atDMfq5/APZEQ=;
 b=KLXMkYHNE0sXpl0dJDzThsiSCKU3Vg5lbu2HEp8ov4sjHIw4L8RGLU0WNxixA/Gx4/T4utMud2Avo3nXIe/vn/WqmBBuDDEY3ezdvcbaiElqcl4puD0ANW4hrBMaBahY5t6miv3Bs0VdlORYJB67MBxS8P1bivhsPCug+IWj1WisgTX9xxe46P32QLb/qIr8DINwm+vQx2pgTBM5zG2/74E7SMj4sX+HYaz2Z/2DB12LilTnmnO0aiIC6xSENV/5pjLrbXGKPia96nTqnfhfWrRBUQo7kOmnmCRuIdetuXO49yaM/WaM5CB36ft+X7oHjFuZhvwN0CL1efaUctQFdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AMBPR04MB11811.eurprd04.prod.outlook.com (2603:10a6:20b:6f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 16:49:11 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 16:49:10 +0000
Date: Tue, 18 Nov 2025 11:49:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V4 11/12] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aRyjgZiKjO11y8sH@lizhi-Precision-Tower-5810>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
 <20251118164453.55532-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251118164453.55532-12-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AMBPR04MB11811:EE_
X-MS-Office365-Filtering-Correlation-Id: 352a1329-f00e-4083-8cb0-08de26c265df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pyGqsgjmcNZjhWKEmIKZKd+IUAbKsyD/DdT+okajly+8axjGOiw6ne0n9cza?=
 =?us-ascii?Q?InYCoodG+dVjTTDlq+UoqkexZJsPXIkall7CcREF52tOw86XjqJXkiDpDIKA?=
 =?us-ascii?Q?fqVl1B7w69Uex7xvjsgffREPlZC+iyl7IZpY6f4tr5oyO8Ikfe7Ton43CBw1?=
 =?us-ascii?Q?TCuQ+dqIIfcewsYGVsSj/tb0symfGxIFiVqav7VRs4ccr8zL8TyKHdRwGFDx?=
 =?us-ascii?Q?vk/1e5FPZHxbIjd9135U/C88/yQ+2wYMqCl/R/mIAArAihgwo+jTcnOHJTcr?=
 =?us-ascii?Q?AhYQemEqhqxFt9TVhP+ZpugMY3YTSejt8fy2fSvTAR6JPg1RKnGvV58DJXuc?=
 =?us-ascii?Q?eCh0thLyUalmCsHMqNabECmR1/ZdIa6kzEs/Ml4jjx5hfPlr+Fmc2YIO9sRp?=
 =?us-ascii?Q?oLri2bWa5xhln5koaNMDBMuwdW7sDvRv3sYKNHoV/FpUdbJluzmpCUQPLCMX?=
 =?us-ascii?Q?zgeqZ9oGaXobo5Ha2YHzWoI3WOKJO9fDujX/WeDVBUM7srMsdz7zWtDqxLWX?=
 =?us-ascii?Q?+lfdDR8cJ0tot2gSFUUl/s4Hyn2J61Dedwu/RwP7GQmKgiTOjmpIFAJhqEFD?=
 =?us-ascii?Q?U4v4ZXoA4nQyUlJZ3g+BcEnPXuqSIcPtGXh0CPJrn7uSR6pkvxQK3+W7EPYd?=
 =?us-ascii?Q?X5yZSQVTL5SMs2X9CEt1uGM2GT8X5k3GoU8R/XyBTkOKPXUSH6S3IKhV73zB?=
 =?us-ascii?Q?BaY3sUphdOGlVdheKp3g6M8tUyS9kwY/YO/y2tfmoFnhk38QX9qE9ivjWkJG?=
 =?us-ascii?Q?8nL0mkb4IWYuqNzR7y6zW9O0YtL4Yb854gHEzbRw6DEVIp750oH/FI7VRa9P?=
 =?us-ascii?Q?5ueGmE//ClDS7Zqy12RIFDUuX6eiEUid4xexnvRwLf6scT3DeRNYqWis8j7f?=
 =?us-ascii?Q?+wOVC39DJplDpY4R1y3+7VXs/EiBxyMk3xvy7tzJ1Jwkk1OhJ1TC/iZ94jzm?=
 =?us-ascii?Q?lk1I/kao2pit8DMuh/dRYXquAlX8O/ewgRLt4yD+OOjWSv4AhyRJvpjaKyxF?=
 =?us-ascii?Q?9yYsGRQweELZinrBp5e7sqd/hBnJfkq1IUBrH2f2UotN6OacEWXmvcXfUe7n?=
 =?us-ascii?Q?y04kJCkO0UJNVRv6rgsWrE4+jSD4D8fqIJ9vetBAGaZ7iuK4Kg6Q/UYLJHIX?=
 =?us-ascii?Q?Klz2Yi1/Y9nBeLoESs2gFK0vsBYG3Yd98zNNtopEzCKePHaz9Oq4QiwijoK2?=
 =?us-ascii?Q?mqab0uC2/i+eUUL2UDlyRX92YT1RSuqfdD0W19Aet97TLIGPPSaW9inC2tm9?=
 =?us-ascii?Q?9FQeZv1PPbrqQIC0z8qITxABIxga4bHoG/DGa1Ks81EtGt4GbALLOWfNKn9f?=
 =?us-ascii?Q?wil60SogQbjB4xQ8+EZqh/UcBDvIwSJ8QkVcCP6xEfhft7EQFhMnQozAohPf?=
 =?us-ascii?Q?nS8sKYJygxevzId/npzheZNkQivlETa1TNnePOlFLyTdtmqBz+YLb76jYpeY?=
 =?us-ascii?Q?3dbTuiWUW0ohWP5IrIg1eC9QoCQDM80eG22beLMKwDJ9IbCWEnUfCml0hvGa?=
 =?us-ascii?Q?pLU9Ws4EBqHZK53T0Nst9AsedGh3bwgrUHtb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dDeP/aQAOgxV3mnvcHCRIxl2+bNham2TKQqyzvwtORkcQwbqsFlMStJYgYYE?=
 =?us-ascii?Q?t+lRIDgxK2GsJXY5wOXocYZYZiXAwd+ZVhlBiA0EpsgH0sEKCGsT/GZsm8kx?=
 =?us-ascii?Q?NM8u/fLzabfsGaO9G4OkwmgXyv078svmZrwIQxD9NCJAfcvUSzA7iAx+xn6f?=
 =?us-ascii?Q?N/CiMNJ2RjxDvF7e9/4nwEziXCBEKkyX34tM6dZPP/isw/H6s2X5Q7BLeMab?=
 =?us-ascii?Q?dh4cd97ecFR1Ba+aOuTN7zh1VZXyfRZ+S0S3zzET0O1d6TVn+btAypFQbvRf?=
 =?us-ascii?Q?wwrAJlSMyHsWshIEeJIHZ/KXManzk+zyyClwf4u/Rf6JkhLfRoOpC5e+YvjG?=
 =?us-ascii?Q?bR73m6E37s2WGYyvDue16J/20ezyAV49OqKOVAKYBDenYzPkMMJpwQGPCkg3?=
 =?us-ascii?Q?hZUd+psl4dGDJaPRM5D1X12nmokLYwlEDV174tXcXWeEtMy98LVX/sN1c7aQ?=
 =?us-ascii?Q?xZoYD1Tkq8XfqTT628P2ekZeIklFrszkeZIIu+xmwe5QoDY9uLrKTOSMtDIF?=
 =?us-ascii?Q?Qm5aB6J3v8HovlosOjdkKHoy0QIjn8zrVsjEftNRYbJ5gJANiefz4OUVhPfm?=
 =?us-ascii?Q?25aUTbBONiDvkqcH0y72u1EEu7xjSSbulqdcjTpkLBQJbKdsIIl/3OZOT443?=
 =?us-ascii?Q?9fFPBQO3TnDRj3Y4LsfrBdS4kyDQ1sa+dZzwfH5Hm8vZEIp1Cj7QAhdDtKCm?=
 =?us-ascii?Q?R9nScZER8eqmSsFBlY5xaZvDUYaVnC24Xigw6JkToYNUdHdKTiaupmbhJqQL?=
 =?us-ascii?Q?8LjkIcW5xzigz2fe5Aoeoc1XXO9rEsrNcgVihyLQu/jPlqy/cQTeQ5KHIg2w?=
 =?us-ascii?Q?Q12oGj6Lpp19hHgwkbqjVYACK1UTzWrhIJri3BVaT0V8cs6S3PbUVtl5mW9g?=
 =?us-ascii?Q?dzvVobyvWpmiGXHtLf09Zq88RM0MuRxWIDtyNcqlMPSVYA6U6bytnOd9v13W?=
 =?us-ascii?Q?LJNSoFeAlwG3uQXIjZA4unZ1VAiWAE17PA4wiCMvD60Ivx++041L5iu7Dw46?=
 =?us-ascii?Q?jpu9HUgtmiCG0vOvjL+hNSTCZIoXi7KV10xkj5D4mH+MzgKC9fIeO/OLPvMh?=
 =?us-ascii?Q?oSQaH9X+D1uIOO0+h5Rkad4l65EFVUCEaJhV4wg9tANWRhDQHigNIM+1K/s5?=
 =?us-ascii?Q?+X34OSaCcSWLVvpDN1ZaPiVg3GErkpFWsNZRGyqLJ0zODvEdA8ITou5Vga9f?=
 =?us-ascii?Q?RgcMnl/3c5+lxGldNS2zrLm2AveaOwvCLMoinKz+yVWIAdg8G5PoA4U7jKqa?=
 =?us-ascii?Q?u0TSAOuD8nhWfY6ONX2IKUUBPLPRByV+Nya6Dd/O3bjNPdZnYXxrfRwPSC8O?=
 =?us-ascii?Q?PyqWRBv5fJb2usRT4Dx9KkvxUwFwFCt5dmxxMX95vA54/ndmrFah0z1u9MT9?=
 =?us-ascii?Q?6JkR+nbWoYUtc4ZtR1fwe9z31+cFfXeA3xUWfD/I3cm6hdnwJJ+ZEEoj0TBx?=
 =?us-ascii?Q?PkdT4MOpd/QQ0Dj5zH8J8fXZX3vcpBQRqAZGJS+yxr7FTTP/EVp7swqYCFLV?=
 =?us-ascii?Q?bZ+7/X9vAT958ReAnuFZj+5h2JKrjjf0MG92y4p5AzAfaubaz2yxw7Z/z5sg?=
 =?us-ascii?Q?DERr329duPW4Crk1BdunHd8woE4XtpaAoA4oFSDV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352a1329-f00e-4083-8cb0-08de26c265df
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:49:10.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnt0Fk8L4pkc2/rbbj+Qm/hDF58UXnsI2AH3v3CtqMSq8u03nWnFHkELGu79jOz9fzjdXDI5oTPAdj9kWC4cTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084915_330569_FBE755E6 
X-CRM114-Status: GOOD (  29.26  )
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

On Tue, Nov 18, 2025 at 06:44:52PM +0200, Adrian Hunter wrote:
> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>
> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> Also expose LTR register values via debugfs.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V4:
>
> 	Drop intel_actualize_debugfs_root() that created 'intel-i3c'
> 	debugfs directory.
>
> Changes in V3:
>
> 	Squash previous patch into this one
>
> Changes in V2:
>
> 	Make use of FIELD_PREP()
> 	Improve handling of values that exceed the maximum
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 113 +++++++++++++++++-
>  1 file changed, 112 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index b962d3c2d510..7d7b769e7b5b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -7,17 +7,21 @@
>   * Author: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>   */
>  #include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>
>  #include <linux/idr.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_qos.h>
>
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	struct platform_device *pdev;
>  	const struct mipi_i3c_hci_pci_info *info;
> +	void *private;
>  };
>
>  struct mipi_i3c_hci_pci_info {
> @@ -34,6 +38,99 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>  #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
>
> +#define INTEL_ACTIVELTR			0x0c
> +#define INTEL_IDLELTR			0x10
> +
> +#define INTEL_LTR_REQ			BIT(15)
> +#define INTEL_LTR_SCALE_MASK		GENMASK(11, 10)
> +#define INTEL_LTR_SCALE_1US		FIELD_PREP(INTEL_LTR_SCALE_MASK, 2)
> +#define INTEL_LTR_SCALE_32US		FIELD_PREP(INTEL_LTR_SCALE_MASK, 3)
> +#define INTEL_LTR_VALUE_MASK		GENMASK(9, 0)
> +
> +struct intel_host {
> +	void __iomem	*priv;
> +	u32		active_ltr;
> +	u32		idle_ltr;
> +	struct dentry	*debugfs_root;
> +};
> +
> +static void intel_cache_ltr(struct intel_host *host)
> +{
> +	host->active_ltr = readl(host->priv + INTEL_ACTIVELTR);
> +	host->idle_ltr = readl(host->priv + INTEL_IDLELTR);
> +}
> +
> +static void intel_ltr_set(struct device *dev, s32 val)
> +{
> +	struct mipi_i3c_hci_pci *hci = dev_get_drvdata(dev);
> +	struct intel_host *host = hci->private;
> +	u32 ltr;
> +
> +	/*
> +	 * Program latency tolerance (LTR) accordingly what has been asked
> +	 * by the PM QoS layer or disable it in case we were passed
> +	 * negative value or PM_QOS_LATENCY_ANY.
> +	 */
> +	ltr = readl(host->priv + INTEL_ACTIVELTR);
> +
> +	if (val == PM_QOS_LATENCY_ANY || val < 0) {
> +		ltr &= ~INTEL_LTR_REQ;
> +	} else {
> +		ltr |= INTEL_LTR_REQ;
> +		ltr &= ~INTEL_LTR_SCALE_MASK;
> +		ltr &= ~INTEL_LTR_VALUE_MASK;
> +
> +		if (val > INTEL_LTR_VALUE_MASK) {
> +			val >>= 5;
> +			if (val > INTEL_LTR_VALUE_MASK)
> +				val = INTEL_LTR_VALUE_MASK;
> +			ltr |= INTEL_LTR_SCALE_32US | val;
> +		} else {
> +			ltr |= INTEL_LTR_SCALE_1US | val;
> +		}
> +	}
> +
> +	if (ltr == host->active_ltr)
> +		return;
> +
> +	writel(ltr, host->priv + INTEL_ACTIVELTR);
> +	writel(ltr, host->priv + INTEL_IDLELTR);
> +
> +	/* Cache the values into intel_host structure */
> +	intel_cache_ltr(host);
> +}
> +
> +static void intel_ltr_expose(struct device *dev)
> +{
> +	dev->power.set_latency_tolerance = intel_ltr_set;
> +	dev_pm_qos_expose_latency_tolerance(dev);
> +}
> +
> +static void intel_ltr_hide(struct device *dev)
> +{
> +	dev_pm_qos_hide_latency_tolerance(dev);
> +	dev->power.set_latency_tolerance = NULL;
> +}
> +
> +static void intel_add_debugfs(struct mipi_i3c_hci_pci *hci)
> +{
> +	struct dentry *dir = debugfs_create_dir(dev_name(&hci->pci->dev), NULL);
> +	struct intel_host *host = hci->private;
> +
> +	intel_cache_ltr(host);
> +
> +	host->debugfs_root = dir;
> +	debugfs_create_x32("active_ltr", 0444, dir, &host->active_ltr);
> +	debugfs_create_x32("idle_ltr", 0444, dir, &host->idle_ltr);
> +}
> +
> +static void intel_remove_debugfs(struct mipi_i3c_hci_pci *hci)
> +{
> +	struct intel_host *host = hci->private;
> +
> +	debugfs_remove_recursive(host->debugfs_root);
> +}
> +
>  static void intel_reset(void __iomem *priv)
>  {
>  	u32 reg;
> @@ -55,20 +152,34 @@ static void __iomem *intel_priv(struct pci_dev *pci)
>
>  static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>  {
> +	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
>  	void __iomem *priv = intel_priv(hci->pci);
>
> -	if (!priv)
> +	if (!host || !priv)
>  		return -ENOMEM;
>
>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
>
> +	hci->private = host;
> +	host->priv = priv;
> +
>  	intel_reset(priv);
>
> +	intel_ltr_expose(&hci->pci->dev);
> +	intel_add_debugfs(hci);
> +
>  	return 0;
>  }
>
> +static void intel_exit(struct mipi_i3c_hci_pci *hci)
> +{
> +	intel_remove_debugfs(hci);
> +	intel_ltr_hide(&hci->pci->dev);
> +}
> +
>  static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.init = intel_i3c_init,
> +	.exit = intel_exit,
>  };
>
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
