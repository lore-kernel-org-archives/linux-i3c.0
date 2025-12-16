Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4B1D609D3
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QihBFzRBW69NVKFCYVSkfk2sYRVZenXoyUjNFWCsAGs=; b=0Mv0pbdeGXG6HD
	2B829bJZJ8LGxP7lk1UgkUuDyhcxJXaOsGropCwPrqqZ2/DGY9ICEcMuJc3Rl3HrtTf1O+krT20mN
	UXk0DFq9OxQRuz1f2c6XIkPxBDYcsQJFCUo2kS8L9lqoV6Ba8T/tZmKt+C40IFFt+hwtMRCersinr
	iK0d8jJyrjghTMM1qu8YtHiGkB5wpgS/UTNDq9n7ODAadCj5VIXZ5BAYeE2h4zk2EW+Lnch3D9G3M
	aiPaxqSXPQ6oxHXhZr3NLB5BRAikX79x8GthQ8wI9WHEh2vQmXaQqvo96ItsGhF7k6K3BMhUrLwWD
	lJP6cmPg7/gWL9M+zUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYfD-00000005bEV-3d4Q;
	Tue, 16 Dec 2025 17:16:43 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYfB-00000005bDs-2HI2
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 17:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd/kAGoN1JJNVpMlcpZuGJiz31B34MCVnAzxi5IwadJtm0BWpEgg37K7tO200vOeFvzBXgo9DI0i43TUWAz39vAB9ukU9LQjMteOyup/QDw7ekfuH46RmqDhIzEzfUJKZSm5La0R+eGr80qv1cWteZ7bKcJKIkDjVDLFcl9tf3wQIoK9Y7lZBcwV63rhR9+lsbLCzyYvIMUkYfohetlGwpksQcTRJ8IWUEMB5Sdq4yq4OiUXb/Pk6SndBIdq56TbTf1cUlwz7de1FxKhsbE4MvEl9m0TF6ZdHYiyZ9GjVSSje0NnPKZ05xwaUnKLVhHiKsIdbeiHaYz19FRLRHuROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd8LwsXXHVMYdvohay2F6Y3m3qzucX0A7V/jLodN4B0=;
 b=i9H0trUEZBoZI2EvfMevftGy9omBAdUBLsGYXWtp96l7XxxFg+CPVeqO+DPRGLYPBwtzkM3PM7VeXh+6Jr7PFTes9lKDcyfn2zztTGWHANsoiD9OYuAu03IBqQWPCt7B2nRBM9l3bRoIBBBYFGZZ7lv9ga+cYtyMpXqYul4MdyYeKjVbb5BKL5VdfJ9MciGh6h+9UkIhdFKjZ5UrYV9AMLfZYLI9+yBjqhFsdgPQAd83WAoRBn03+9z6+3lfq/QXNGTh72F9lIBQdGztIeoKM9OUlQMaIK0T36IW8xk7BljJjY0//68mJQqOFTpzGe2tJw7csSFyWB8H0jtuWr2+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd8LwsXXHVMYdvohay2F6Y3m3qzucX0A7V/jLodN4B0=;
 b=fe9gLvjL/2eIMElp2nqh8xF8LR36NeY15oe6ZWiB5oeuGdPTMYKiMNhCqCKLVRvxBAXa9oy5hI0mC+ASY5H5uFEXbcZ37tAUgp3BU6sLlNc6vTE1SJKxjbE/DC+5zjvB0k6Ofy5LgL7UQeYcCkfiF1TFFI6TOmgFQM0NAnYn3OqpQtGyDFdajx4+XJ+vOdPK+5TXffrewz1gS1zXQ3U99+d/FJpiXoMIOn8z9FDhNAVZGUm7FQgTsNM2aVQpxmqEJRLdv47NNxZSXXAgtwKEwu9t/dT6l/fPVfIki3lmH0Kl/J6psUzruon9Ux2b7+H8g0V8upDBepz9Dw0yEe7RVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAWPR04MB9988.eurprd04.prod.outlook.com (2603:10a6:102:38b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 17:16:35 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:16:34 +0000
Date: Tue, 16 Dec 2025 12:16:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 10/11] i3c: mipi-i3c-hci-pci: Add support for
 Multi-Bus Instances
Message-ID: <aUGT7Y0bFq+LByDR@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251216165642.164583-11-adrian.hunter@intel.com>
X-ClientProxiedBy: PH3PEPF000040AD.namprd05.prod.outlook.com
 (2603:10b6:518:1::58) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAWPR04MB9988:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e0b1ea-15bc-4033-b83b-08de3cc6dd4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZfFNR74yPO6AQ8EKQ+SDXWsZhS8pXF1kRDhZfenTeG7tMNo5KZuDso+Z02B?=
 =?us-ascii?Q?0WHu/nPSzczpVqpv95cJifRmMfIuSCCT4eoTfLPhf4oFIOXgxv5SP1uEpulB?=
 =?us-ascii?Q?0Z1l3trfpU0TFAp+5+T3nuDtgnH+q/yo7NFUettTgvHRnPro8E91oiizuO3R?=
 =?us-ascii?Q?Lwis62A0RfU47GHiykia3WyHOrH4iQlJRpiG1SJS3QTbqXZ11XWbEImJbjJS?=
 =?us-ascii?Q?UrsFckiQQS2DyivHOACPZDVkns6lwJhapUQiCxB8WiJyo6XEcip/BM39NQ5n?=
 =?us-ascii?Q?QjH6NbOG+D+b4vHcEmqKnns3GBkG44Uy5zr88W2Iu6J4Jfq9ro5+lchpO65q?=
 =?us-ascii?Q?5rNXgmzheq0xB1uYjQDdjdgQ0UY5tr8e4OzDdz9BgJn0GXcBc4CnLYHvzZld?=
 =?us-ascii?Q?kDmcCZ21dgPz1WN4+uOaJ2h2QFyXITiSqQGVgxI0uADhN/JZDVFeYVr/cJo/?=
 =?us-ascii?Q?M1qOjFnEgxST8yz9O7mDLobZznB3dbUuqRGvBPEBKQ0xgo52biAoxblnMo+P?=
 =?us-ascii?Q?e2UUKq0HZnxQ1SEMkMuq6wrCawFYjEdEM0pQ3JNhTvM2QLuyGPeEju8mUxAx?=
 =?us-ascii?Q?MEabgOaelpL/pG9vhpcpsLoJUZ+rc26/YnCNpiH8/JPTnzdHQeCrxTScAXBH?=
 =?us-ascii?Q?dSl91eSLI4XBsLqEYVHFhks/Lp8wGWu+RBeNNxufpNHm149765HQYYpgYO1o?=
 =?us-ascii?Q?fnxAcyA4ADJUjL2JJJL7+VQvrboUYC0amKB9BMF15rj2BIL+i5+jlhnQoVDe?=
 =?us-ascii?Q?n4dQPc1LaQcIhdjAf7jX8jntZLMO+G8cwDJnPtX/N0l3PWQkS3ROHfzywXCR?=
 =?us-ascii?Q?Ygr8nIeMUbUaOtPS7XSL5Xz7URKrPzjImzKXbbc21BgzLVbja96IxrZtWOFv?=
 =?us-ascii?Q?nxtU4qmYyIg7UR/ynFXpvJsDGrWOA6WPBxfI6QmmgrWkxJOLdcsUiRg+wgbV?=
 =?us-ascii?Q?+p7nuV73GXGtRphb9wNAxRgsIfRPGaUcO7jjgtmgOzFIL6DV6a2E0hf0PAZa?=
 =?us-ascii?Q?4YqQEk4RIzu6CWx2pOWeCPg41vRQ78Oa5m6bntt5hpeWzcr5TSJ/X9jy35bv?=
 =?us-ascii?Q?YXRGZepas6v1ziNA/SbllE8PxIjfTfzjF4DI4D4/k/Rt3vU2FDEFx/tDYWsa?=
 =?us-ascii?Q?uxzevXxrqMlEz3Cn27BDJAnZyV2orPvFiQUqLwXhRRHkUUQfP3GBqTqrXI3J?=
 =?us-ascii?Q?HbK877yWK49EY15fEdVmgkIL+1UmrSxDAMAWTNfnnYQg6rCDE3SNPrOrS+te?=
 =?us-ascii?Q?ZbL6Ix09uTHrX6O/0SKm5Odg+bpo/mZOoJTrrAoeLQXap9oQl6iGk6VYqLTX?=
 =?us-ascii?Q?5DGbU9vXmIcPPYtwgjdyFuy5tuCF2Mk9gn920CEg725K1nVb18LPlPyieg0g?=
 =?us-ascii?Q?9nHekqGw1BAeN74r89VmD8QtJEIw3oYfrV2850JcxJy82JW0L7PhbApwI1Fr?=
 =?us-ascii?Q?TmB5imH91iuh/Zn3R2hDU7CWPqy3bowLA6HWAcXs+UHAp4UAqwlBME/Oqfom?=
 =?us-ascii?Q?CqY4Y9NKZQdwcHnhxF3KpZMrZyzb41pCXg0z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zYbPlToOLBuzTy449xjZ+VLru+PPu8x+K/510lPb43LsnlwdzsvkJ5CK4TDT?=
 =?us-ascii?Q?sl4Ck48nvBqlaGlAvkCSC4gcsYNLcSzL2hmtO0EaEdWnNisWAkvut/ST25jm?=
 =?us-ascii?Q?BmNUtgUBkbYrojsW/HWlWP9dTaYv60WYnjhw0PamRAUPOg6YQJ210tt79Ipt?=
 =?us-ascii?Q?38Cihy8+gR6Z6FL5r8UEL4Y4albIwJyg0mcPo23JiYxjefS1/5KMciXHc0WK?=
 =?us-ascii?Q?qL5iqMVeUgGykEt4meIzQabuJPCC7oQNuIyVnx/+L5ixQcV8XnWJqSg2gzyk?=
 =?us-ascii?Q?f5lg9+Vbgw/nds3JVGOlBMVrcE7RdHYxZqv33ufCO/AOTLsfGmiMblAMvPqQ?=
 =?us-ascii?Q?nXaX9V3rpyO2Hw7XfEsPFBPJYlGCTHmtXLer6lER2hnFAVrT0Fw9Mjk3rJwl?=
 =?us-ascii?Q?dYjLUSYVc78lHhliyc74obtvPfkd2xKnD0iLjM/0Dx7z8Er9ox6yldQ9lgdn?=
 =?us-ascii?Q?1W4w47KUMCm8K1PwMO13e73CvOiBSMUSIFp6UASs8lQnvbiq+TR3jIadbQ7t?=
 =?us-ascii?Q?f8vlheY60KZJJ6vMLLapyPoz6M1moBqGHnEEmrMsn4h514/llUOI198H8PC9?=
 =?us-ascii?Q?igrrLzR9KvnPTxNZYTNZcjZSO+BqfOnQaTvLSYVqEZ4x59a9QfU6yHMAW0L3?=
 =?us-ascii?Q?5PuZ6tGlh8Yj4WTYWM7ayB8chHjmRAt1fkyA3UlE8sV9Iwnr/i9mS+FnNkYo?=
 =?us-ascii?Q?jeaz16ldUieaf+38p3D7rf9AZGrWBBdhP3VK5Z3lO63qLASZvGrAUB0LVOyW?=
 =?us-ascii?Q?+/Jtje5W0MjapNNvPvLJwOyIIjvp9fMRB0qj3/nBcL6E/ZDoTJ4TvLjolq6r?=
 =?us-ascii?Q?E8BDcIYIxa2R0kuXHzOqOoDl6Fj/KAJA3op7vcdaR38lfh5IXsUUpUZ7S0R6?=
 =?us-ascii?Q?ORveDsFUc2Eu5tr+HF6VBwNz0qq7mFyBnA11Ay3W/YRZYrKXvLuS1rqoQdH9?=
 =?us-ascii?Q?R4sGXuLHRz3UVM1rStphrLQGBF7uq7TwTFmMYEHI85D8zO3qKjPuXVM9qLtF?=
 =?us-ascii?Q?295OrlW6e65E+drq5fZH5VI1FVtYgXGcb+u3HRTUBGjo8jC/fVELOm3swxTH?=
 =?us-ascii?Q?5EV4pShF1TN//R8gxaDpI2Dj8keHbABDTVQJVsjipFDpp5l6B3BnMaD6B7j1?=
 =?us-ascii?Q?w1J3w0aO+Tyh+XIAeZ48DxX0tKIh3yTBIOEUEbQExf1RR03gzPimMq8BRm8Q?=
 =?us-ascii?Q?1J/FQNUOoCDiieUjG3o86zLY3qPfjCokoa6Z+CW3WUIyOPxM4p3ueMjSnu7I?=
 =?us-ascii?Q?6of3VsveLpgNzhai7WTK/pojauFC7RDaHH/V2q3Nm6nby0jMaNfb0NEIClmV?=
 =?us-ascii?Q?/oo0O4hY14BboXuo8ksfLSSwcpkhCNCuakOPBCHc7wvIrNLSseww4/uWZBHO?=
 =?us-ascii?Q?TcWy3nUDJIO7IDnwFeu8RcNm9LIyBVo0+Ac360eN+N/D7LzrnR7QreuoZYIO?=
 =?us-ascii?Q?kYU/2zeYiSwy/M6nBTCO3PkV3APY/+AT60UTd8uRg9aHZ+OIWRYVSJHlyGer?=
 =?us-ascii?Q?WTBnaIxnGDzcYCM/PjMh1gjkFz6E8D5pw4OFkuprU3k5KQVuT2yXn7/U+FKX?=
 =?us-ascii?Q?uOljBrAp+DGDNGxD2ynQT2OGJLKzUtmojwAcFqVt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e0b1ea-15bc-4033-b83b-08de3cc6dd4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:16:34.8433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCUEY8QwzgOB5zmBbinIlIzbrrGTIBPH0YIUCzlLyM8l5NSY4cQCsDfQR56CsBwGvmogFQNi6IIU1kMCNMbiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9988
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_091641_584514_6E7B6C92 
X-CRM114-Status: GOOD (  28.12  )
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

On Tue, Dec 16, 2025 at 06:56:41PM +0200, Adrian Hunter wrote:
> Add support for MIPI I3C Host Controllers with the Multi-Bus Instance
> capability.  These controllers can host multiple I3C buses (up to 15)
> within a single hardware function (e.g., PCIe B/D/F), providing one
> indepedent HCI register set and corresponding I3C bus controller logic
> per bus.
>
> Create an MFD cell for each instance and use platform_data to pass the
> starting address of the instance's register set.
>
> The MIPI I3C HCI specification defines an Extended Capability that holds
> the offset of each instance register set.  Parsing this information is
> relatively complex, so include the offsets in driver data for now.
>
> Driver data for additional instances beyond instance 0 will be added in a
> subsequent patch.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V3:
>
> 	Make hci a parameter of mipi_i3c_hci_pci_alloc()
> 	Adjust for doing away with dynamic devid allocation
> 	Enhance commit message
>
> Changes in V2:
> 	Conversion to MFD split into separate patch
> 	Simplify ID allocation / free
> 	Correct use of __free()
> 	Also define instance 0 in driver_data
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 36 +++++++++++++------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 7ef17255c312..782f46989423 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -19,6 +19,12 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
>
> +/*
> + * There can up to 15 instances, but implementations have at most 2 at this
> + * time.
> + */
> +#define INST_MAX 2
> +
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	void __iomem *base;
> @@ -30,7 +36,9 @@ struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
>  	const char *name;
> -	int id;
> +	int id[INST_MAX];
> +	u32 instance_offset[INST_MAX];
> +	int instance_count;
>  };
>
>  #define INTEL_PRIV_OFFSET		0x2b0
> @@ -177,14 +185,18 @@ static const struct mipi_i3c_hci_pci_info intel_1_info = {
>  	.init = intel_i3c_init,
>  	.exit = intel_i3c_exit,
>  	.name = "intel-lpss-i3c",
> -	.id = 0,
> +	.id = {0},
> +	.instance_offset = {0},
> +	.instance_count = 1,
>  };
>
>  static const struct mipi_i3c_hci_pci_info intel_2_info = {
>  	.init = intel_i3c_init,
>  	.exit = intel_i3c_exit,
>  	.name = "intel-lpss-i3c",
> -	.id = 2,
> +	.id = {2},
> +	.instance_offset = {0},
> +	.instance_count = 1,
>  };
>
>  struct mipi_i3c_hci_pci_cell_data {
> @@ -192,34 +204,38 @@ struct mipi_i3c_hci_pci_cell_data {
>  	struct resource res;
>  };
>
> -static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
>  					struct mipi_i3c_hci_pci_cell_data *data,
>  					struct mfd_cell *cell)
>  {
> -	data->pdata.base_regs = hci->base;
> +	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
>
>  	data->res = DEFINE_RES_IRQ(0);
>
>  	cell->name = hci->info->name;
> -	cell->id = hci->info->id;
> +	cell->id = hci->info->id[idx];
>  	cell->platform_data = &data->pdata;
>  	cell->pdata_size = sizeof(data->pdata);
>  	cell->num_resources = 1;
>  	cell->resources = &data->res;
>  }
>
> +#define mipi_i3c_hci_pci_alloc(h, x) kcalloc((h)->info->instance_count, sizeof(*(x)), GFP_KERNEL)
> +
>  static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
>  {
> -	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
> -	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(hci, data);
> +	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(hci, cells);
>  	int irq = pci_irq_vector(hci->pci, 0);
> +	int nr = hci->info->instance_count;
>
>  	if (!cells || !data)
>  		return -ENOMEM;
>
> -	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
> +	for (int i = 0; i < nr; i++)
> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
>
> -	return mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
> +	return mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
>  }
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
