Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB79D41D64
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpdPiGDoxVXn/XoKW3Xcvy8StygSFYEZp2kYAUhoku0=; b=EAKAk5V+pyRZ+f
	zmAQ+ytW4kUXvflNi2HWlep1O7K5RaROl+8hVtNJDsOCBfDiskBNh7Xu5xVo4wn68w1wkfDeMiZ+s
	zKp82hc3elFzxtxwRz9OFz0plfk16KvFk9UZx7Nr/Q41JEbq4c1NhZp09MiIc1TQzpPIr+tI2Yb5+
	7/pPJtJ3zfy1NLfoGdnm8DqcVNdUsp/Jfuddu5EZ8GKPzYErAS1VKo+PejbawJ5CecvyFYcmPgOxr
	TzLE0/i6EZWMVv8+tWW/wZDB88rV7sN9q4QDtfttk/MThQ9MZKIiVHYw7r57kzs/YuzNQAvnk8GLT
	SYArO/1JAjpB3Iaw+JTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj6N-0000000Go4M-3mED;
	Thu, 11 Dec 2025 16:01:11 +0000
Received: from mail-northeuropeazon11012004.outbound.protection.outlook.com ([52.101.66.4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj6G-0000000Go3h-3YT2
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 16:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4q/FwsP9X0rKIObqGo+767TSK73Y6XSRvjyYvxxzZoifMqMjctKuImeykG+afarxOA6inCz9W9uFeY+elGOhKQYQb8SVR2/6IAYtpbv9Aikur79S7JiM5epUY6o24DdBwBemgp7ts7hlI8eBcuhMJo5mEaHTVE5icSIoNib2CB/cE9CdtMXr7q/Tkp9wQMg9JlJMIoq/QIQpBxEhnETM4FgxKcu43CLVzmjPYQE0maueDjqK5zcnSze2v9AWruV/vfxEKUuFRHq/8STNoy0Kf7XCdK7u/ZLOEsSh6Mmw84A7Rg+BjyhpIY9XqX1RDWNwI/iCe5PBizGU53gYh+uxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MYAjAHlm5C/5JKhpmmxQW/0nsVVu7KoUaO4xJBt4O0=;
 b=jGXz9OZe4Zi/HAbDNChFbrkr9rhKd7bWPfHD/Ov3kMQFLqTjFPjAY5WBSgcX8tHtdnJZRdqVN2Pc9rSpLFnR/dZOYvueGubcLx8otPXid79+3J2ltayGBYvBx/QW2j9SpHm3oZFefKg83IjytmbRjiK26X++6sjeD6jos9iNvSEkVY0k0OSQxycHtADh+iacLoEPM7TeikArg7XQLLcEUdSlrlGlrDPqEitOR4idqPdqOGGMHY3BgZuodMEeOuVM1Nh4kirSu9foIzfp1LZlKPUdzSDuJzRtTw4gWXjB5s7L3/t1KubZPj52KbgLY0aXkU8rUinsnPjJBVffestvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MYAjAHlm5C/5JKhpmmxQW/0nsVVu7KoUaO4xJBt4O0=;
 b=hyyjtGxg0Bz9xWZ+3me063q19T4m/TWeWOpSoqJoZBNi9kMZ5Xz/HMi+3NgUijWKnuFmdwqBOzxN4rkR8I6epsn/59oyTFLZTJGgmOCcsaMRrtPUrwKCfyx6RT5vswqwzV/rVfD+02g62yNsIGm1qEJ27+i0yoO41w48wtHDiDS6yVUyRUSpmp1CnYCGSwoYB7ExogK9OSV656rCG3oA3wuFr53tNV2xpESfIQzzEWSELnQD/eapee5F4R6Q/9n7E3/W1EWL1rk6aEKOpOjK0IRpkN/mhZao2aqb58A2vV102Q94PV8TLIrtJQLqZ6RUtNi/HTDxrfsXpeO8PoghHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10302.eurprd04.prod.outlook.com (2603:10a6:150:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 16:00:58 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:00:58 +0000
Date: Thu, 11 Dec 2025 11:00:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 07/10] i3c: mipi-i3c-hci-pci: Use parent MMIO mapping
Message-ID: <aTrqtJpZif4+segg@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251211134809.75872-8-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:510:4::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10302:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d203f7-bf27-4a7b-b380-08de38ce793e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4wTfoB6n67WH5dD70XeSh3DsuubqVxY04B0rxNe0oF7BbNS9Ku030wxN2wYp?=
 =?us-ascii?Q?qX/+LwskF4WIG3cUbzM+fiyO7McsqG3YXBO/iC8iKXSxbpIQYh5xYNq3t/fz?=
 =?us-ascii?Q?ZXI+kmG0Y8slT/BiKjs+O6RbZCRQxGLnsGFbpTpASiJ3Rev5r7FT3G8Dly7c?=
 =?us-ascii?Q?Jpvt4Hs/pdmgybn4+AyfF7+IFzmoYIlz+zIa4winSMxtSevBTjS1zJnQXTtG?=
 =?us-ascii?Q?627VDMa2mGkvA+nVxwyvTHsUmksTTe1NVh/w/pHwizu+PjO8TTYSwRs7ZZUy?=
 =?us-ascii?Q?vAWN/SU5pi+go9izHyYVhO+2SQMWSTnA85A8yH8ZuWFbQTjElG1ZgHBVVEEm?=
 =?us-ascii?Q?S8w2MN6YArIr+rUJUDyDd+FLDktzGxoopa2qF4oPkH10X3KLoh37+UA4RmBk?=
 =?us-ascii?Q?ddkEulnZUpnRxxUL8HrjHR0R812mXfJYCrAe4nzJaVeJdcPqh573BDRNTgZb?=
 =?us-ascii?Q?PO+TYoJA9I11knijfLgxfYOiglAlHXXhRFKJnReOKDB35C6Qd5dxbaPVGBNH?=
 =?us-ascii?Q?lSQnLsWcDvawiUdEDChPDybgdVZ9uNSxocUIYdWLhJN3I8DGFJYIpdYVlJlO?=
 =?us-ascii?Q?Ix9eIx+YvmPSs1M+335fTib12BkGw7crs3L/f85xRWGqipjmZW32wd8BmQ5J?=
 =?us-ascii?Q?NHwkPr+AKhBN6KP9Q2qdbPfdX2UeN9R0ca7durPUX+Pv2YA5LP2ZKtbaM0aa?=
 =?us-ascii?Q?zoHwSXOKoozLgd8RZDszoH0mY+PxiMHwICYviXz35IEaLFllj9t3MjKY/D7W?=
 =?us-ascii?Q?pmFd27XL68dHdnzyE3pPKqTgF+v/MMvcYI/3L5Bhq4zpzSLsP+e7x8TfCYeA?=
 =?us-ascii?Q?4I+bdOtI//VkNqdPHiY2Uonuki6V7lLiP0ZsGBCmKbm+v0MMtlKjKnqGtDS8?=
 =?us-ascii?Q?h1urbEQ4wWFgjISHT1ZVrQiCVFgblaVBx+SnjSMRajWnWzVvubWnRQS5TDRE?=
 =?us-ascii?Q?C1Ai8xBUSIT+Any1rLc/nmy5weyaW3tRYRa02w4eWp7R+bB5/UL44wD4z117?=
 =?us-ascii?Q?qbk4nhOedOc/KS+cjvF3wx22yRiJyXeG3cMdLY84qFxpxWKQQGMgjxwHlqLF?=
 =?us-ascii?Q?8oKwLWFCq+Mcc9Qi1JF6hcBi9bvGmQ5xj8RQc1H1VmVVN5sh4RwxYUYW2dGD?=
 =?us-ascii?Q?B53IB0ejGmM73w+nMFsqktF5Y6gdm3csep8IYEJjByvLEHbpr+kTvaGoL0kc?=
 =?us-ascii?Q?TmFuP+I19a4YPM/VukyhXXn64VhZJmHFBq4BP2lwjsJzrva7p9t53gfel81D?=
 =?us-ascii?Q?SOqYM9oMg4aE0n1Ms8l/MToKtaKIDTXqSlkAzfzM+66AKM376/Tfaj9T6jp+?=
 =?us-ascii?Q?E3Gp7g8lXZ7O3CRSAhXX2hMbK34T1mLGGG8YUjTiAJZRV/2iCpIzvZdJ+TFo?=
 =?us-ascii?Q?byhRW8k38hw/WKpqonVwBcPPi7ZXYqe9Ub+/FmH9GvcB2cq8SAz5NXkcLdpe?=
 =?us-ascii?Q?WBH0RNWplL6EFWvB8Z9wT8TEXOrcIKHVMFsbzmGV6lPKGZ2u7oUxkHmwfnc+?=
 =?us-ascii?Q?fr27szIKV1QamLt0jRhy3W7+1DZuT8VBsuRJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F9ovKS/nfgyeC30IQCJBCqGhlxBMdfTE1ciImosZJTWpvQvXCWbfAx0Birbu?=
 =?us-ascii?Q?cEChiKBH4PP43pugRe1rcVa7oiBnJZyoMb1U6c3ANAvd24oetXWfiwOZSKRe?=
 =?us-ascii?Q?UVNIBLb3r2WziyiuJHu4z9aJbAvq1lOd21cfutT4vWTRfICAuyTOknlbMtbX?=
 =?us-ascii?Q?6AxEBbavCQeW5TIqpCK0id0YJ22RwF+qkrvE+LRwbG8+gLsSif8tt8ArvpJ1?=
 =?us-ascii?Q?ElCLq22lq8s+m3UJ031tCUewOOAKjCGsMm8zySapwERIEx9fGWfhYAOQ+U1+?=
 =?us-ascii?Q?q7yOmlmg5Kyo7rHQ18Z/Iv3CUHwxLJCQkqFT8BxDMv2uHBX46ngT1PUOJbr0?=
 =?us-ascii?Q?aNNBzppOkPAIp+ygALQRiDvp+YciUYLjZ4bxcc4/Whs3j04MR9lverjrIvZQ?=
 =?us-ascii?Q?2QmOK2am0Zd/Uhry0XXWyxJE1jOPNjWE9fijMoVmvLNO3wighyukazLX64QE?=
 =?us-ascii?Q?+5sgVrXLkwYSXXdDI4TNWDygMll23z33FF0+wCL13G9uglrylR+yYmp1RlrH?=
 =?us-ascii?Q?saO7xUm9fnAI+tFRSDn42loLaPFUa95arbEPgMYhWS79FFtFEDqxCIl6WupD?=
 =?us-ascii?Q?aAMbNfmRsuV+JfdgOBA+7+7Xe7tBVhvyEF6cNYb40TnNaPixcfa/FIDIx7IK?=
 =?us-ascii?Q?D2xTVz5d3C9JYj+hwNEjklHpEf8pY/yYu6Q3vcCaV8bBnq5eiT5E3RSNz7Ct?=
 =?us-ascii?Q?kJHXZUEWsMJwsQKjR/sWOazeaG//6nlkWTt+R2QD8ToZiJ+QzltKUiXvmSBn?=
 =?us-ascii?Q?0dEc07SsyLl8JhAnt4YWxuBiseNL+G0CDmO+sx1YXPeeRVSOrazxAaz1WhNN?=
 =?us-ascii?Q?jZH6bI/HvnlFczPHJ2nVfDhkU5felnhKq1gCzMqVWokeXYN+7q/Q9DSI+bUS?=
 =?us-ascii?Q?urMFg7T3SGp5DM4ybqHkMIrbrcZYTyhFGA8tXnzJuUCGeqGM2shaNF7xNuJU?=
 =?us-ascii?Q?cSQqnqI5YIKcx+KcuRsXMCxvOxGn7KUEWjrsyHPRkNcFGnS+u3+Lsf7OVo+W?=
 =?us-ascii?Q?Gjx8SkxkXDM1oTYo89IZCTExxZSdQ/dIMHXW1mQdChRgjUQgZiJhq5tEC60o?=
 =?us-ascii?Q?TyL6ZC9+8yrBY8FBxvx8vqOk2+KuaKObRrrMESq58XqT5GJ3cF6Nh26imnz1?=
 =?us-ascii?Q?XWtdUW4qOBQ0Hd7GZ9+rVb+7gBrTOwn3qxe8o+CGDZ64t5AC6Y3UtgSk3z4M?=
 =?us-ascii?Q?S4i2yTxvh3MV96HGm9vbwAzjtBlLIrX16hDthydWdVQTctDjonDakfVJ+JAe?=
 =?us-ascii?Q?Y1FNjlOmvAJXCuSfMFNQ43ext3r262dHvVK2cduk4Z6qRYfuwNc2uI45B6pL?=
 =?us-ascii?Q?rYYymNBC2HfobRAivf24xZuKyAwnxm1b/dG9eXNvJhkheJSvZquq49gAjaqM?=
 =?us-ascii?Q?ScrZ/hiCK+lWvsi/vWQygo9HsjAYQuPO+ewXYLgfVc8c9ytQDciGRylyREcR?=
 =?us-ascii?Q?q+J6AC/MYaqpX21wA9lBq9qpWnyDCuszHdJl52Vx3JoId4pcg306IeIaoNCU?=
 =?us-ascii?Q?m5f5859hlpnbB149J9u0gBk8l7SxW0EL6qK9+1bPeEir7aHXUyJbkZftdKEQ?=
 =?us-ascii?Q?dzYH9I7R+paR4HHruak=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d203f7-bf27-4a7b-b380-08de38ce793e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:00:58.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFOcjdSm+zSLFNAwUmYvsWYtp3cAofYyE5BRsbd9wAaxi51+YrisaM+yPCHT72ALXxJ2C+BMpOVvUlsaursl9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_080104_890461_DA710CD6 
X-CRM114-Status: GOOD (  21.23  )
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

On Thu, Dec 11, 2025 at 03:48:06PM +0200, Adrian Hunter wrote:
> Prepare for Multi-Bus instance support.  Pass base_regs to child device.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

subjest: Pass base regs as platform data to i3c core device

Frank
>
>
> Changes in V2:
> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> 	Multi-Bus Instances"
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 39 ++++++++++---------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 0fd3587671e1..0180d99a37e4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -14,12 +14,14 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
>
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	struct platform_device *pdev;
> +	void __iomem *base;
>  	const struct mipi_i3c_hci_pci_info *info;
>  	void *private;
>  };
> @@ -32,7 +34,6 @@ struct mipi_i3c_hci_pci_info {
>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>
>  #define INTEL_PRIV_OFFSET		0x2b0
> -#define INTEL_PRIV_SIZE			0x28
>  #define INTEL_RESETS			0x04
>  #define INTEL_RESETS_RESET		BIT(0)
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
> @@ -143,19 +144,12 @@ static void intel_reset(void __iomem *priv)
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
>
> -	if (!host || !priv)
> +	if (!host)
>  		return -ENOMEM;
>
>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
> @@ -187,8 +181,9 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
> +	struct mipi_i3c_hci_platform_data pdata = {};
>  	struct mipi_i3c_hci_pci *hci;
> -	struct resource res[2];
> +	struct resource res;
>  	int dev_id, ret;
>
>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
> @@ -203,19 +198,19 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	pci_set_master(pci);
>
> +	hci->base = pcim_iomap_region(pci, 0, pci_name(pci));
> +	if (IS_ERR(hci->base))
> +		return PTR_ERR(hci->base);
> +
>  	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
>  	if (ret < 0)
>  		return ret;
>
>  	memset(&res, 0, sizeof(res));
>
> -	res[0].flags = IORESOURCE_MEM;
> -	res[0].start = pci_resource_start(pci, 0);
> -	res[0].end = pci_resource_end(pci, 0);
> -
> -	res[1].flags = IORESOURCE_IRQ;
> -	res[1].start = pci_irq_vector(hci->pci, 0);
> -	res[1].end = res[1].start;
> +	res.flags = IORESOURCE_IRQ;
> +	res.start = pci_irq_vector(hci->pci, 0);
> +	res.end = res.start;
>
>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>  	if (dev_id < 0)
> @@ -228,7 +223,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	hci->pdev->dev.parent = &pci->dev;
>  	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
>
> -	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
> +	ret = platform_device_add_resources(hci->pdev, &res, 1);
> +	if (ret)
> +		goto err;
> +
> +	pdata.base_regs = hci->base;
> +
> +	ret = platform_device_add_data(hci->pdev, &pdata, sizeof(pdata));
>  	if (ret)
>  		goto err;
>
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
