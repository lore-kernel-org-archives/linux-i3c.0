Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EA4CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJ5IUvH7yF05ff1qPh/uD78cDmkfc7XyNHCIP8Q60IQ=; b=nqC83RwHAIv22A
	MlUGG0RDbnxiJnjC3/4mAWG7y32q9yBb2vgHWJ7aSDTgihljIjSKV1QGOdYOzhmSvuBtfLF2hibaw
	i1EFEuGGZJ8346odkkEo5YLLe1VbLUOuKTTAUG2PVv7wzcA0SmJcU5KldkErzyfzxii5vITcuhHkD
	lo4U2MQPNtQ+tJJh3XlUrz1HDnQXvlPBMXUABJosCSxS6M4Cue1DVCiKpGzAuuQRZQYi8AslMJCQN
	7x6D8RGONxHJQyOp47toZV9r6cgynnBwlWsbONqSFW1q6yYvL4pBMre/XqfBgKVcEWe287+z9JNMS
	0GVmfr8i//dfRgf5SjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1HG-0000000GKtt-21A8;
	Mon, 17 Nov 2025 15:36:26 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1HD-0000000GKsG-0qoB
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcSxMVc5dtZVRyGirHouRW8EBiea370JdyxpDbfYzmVx/EwZeiJnYcTeoseBWQ7zgfCU3W39ovNjKrJLshNT4L5zpJJCIUJjF7MmNB7yXu3PqU/cOYdDq+q3YfLYUvc7HSI9u8RfDrDBq9ZaNYKFneFO82GJHoGbqsQrxMdzCpQGlzZ3ZBq3m78j/uQRTgQyhDCSGRr7q/QPXEtI5yMqmfdxdiC7v1gHDlV3dTrR9dBMcQlEkkQyiWDkS8NHZe8QPB94g9kcOl1bwyUwuTL/E6UXNelaxzxXOKS1D5SN/6YIKYyXv7tX7YM9BCRMwkH6ZdqaKYJjpzR2SSbjVZDmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JoJIXSNgartt3pcl5sKSYiVGwcMcHO92PZvdRkY1Dc=;
 b=PQ0GY72QWXTctEvtik9ZHZwycvH9KXbmgFs2SJoffaQdCognRRcEPsM/9RfgK6vHHo3rMVNUJ8Ib5SJHsO5LMu+QTmyrXrSSyvmX/jdAwoiETMKTVkkdj0lNKKCMjUeUrqb5dvlaELixAaX3twRYi/c+Vv/xE4oNSyQMLykFJQ5lSWAJ+9njtbqA3L1FoRh93ukc8qC6PN5Zj5HrBxCBSHCqf3D8aDAjj/FeMLC+RxtXjCuwCQ2V5c3imSUNMQiOr/h1of706ObwDmiLIJgai8xxwdun6hgMj3kmsBEmBDgZifyViqqKiEPSeKmsiCXqjGoLDYlJJWRmT3zlMepX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JoJIXSNgartt3pcl5sKSYiVGwcMcHO92PZvdRkY1Dc=;
 b=XtGUgC3B/KbERYk1wt70EfZDK3o6Rek6jQNqWY6RrgpFNh5Be3CNx2NWsU3qWm6676FfM+2qrwG762PtogcvPfcfEDhVL6VHpPNoPw84KvBu8b9wGyXzaB3bVXw+3gaiGOjQs7Gn+EHmvEiZrGEptfAlbFmZxe8VkLAJQksid6hpFuLyFSewq8KbnHfBMCGZGuQvP5WmsQO/p3LSwEPJ3pO6APPz0LWOE2OAzMBcJYsQKoyvtb/BJ7/oOgeaAw03P/AAEJVp5FeWKncCHelwSwiS+kNicDsyEKEzj9m8lhCNXWBaj1/ujO+HYptWPG6jb/nhIlfKk296wRUwQy46jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB11448.eurprd04.prod.outlook.com (2603:10a6:150:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:36:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:36:18 +0000
Date: Mon, 17 Nov 2025 10:36:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 09/12] i3c: mipi-i3c-hci-pci: Change callback parameter
Message-ID: <aRtA7dg7D/2ao+KA@lizhi-Precision-Tower-5810>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
 <20251117131609.65988-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251117131609.65988-10-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB11448:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d345204-c0d1-4ac5-5eb5-08de25ef0d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hTTSp2nkstcYtPCCxzWjg1GIIPuh/+2WGNif5YAcbh2xNY19MMr42f4M4srX?=
 =?us-ascii?Q?E3jHBfQ0QMemOIPrDCdtqrohacTDzBh5nBbtqKtpw385Qyg6gpbJckSDx01X?=
 =?us-ascii?Q?sv2XbtfBruAB6AC85KoCbUMo9IcI9k5QsMseeUIaGkixMYb0Q3Xfo8BJ69x5?=
 =?us-ascii?Q?EE7A6HGl9rXjZ/uY5MtDG3pmSN4Qv7DfYcJae+23q4tCt9czkrFQ4ArQ9FhZ?=
 =?us-ascii?Q?vNPV445rwKLSQzhdwiG0eP9UxaS62rSPp9P4Bcz3B7BZtuf9ll9Lq7jbG24S?=
 =?us-ascii?Q?It7UJgFNGbaFSZ+m1oPRi+oD+Z0ZLWTkjIgaccqol9jeRXmU23Et+zrZz1wU?=
 =?us-ascii?Q?+Q3ZQCNXAKSOzNSkLBD+H/V0oYeDjIbYQz6n5iI23axvgioCWBcDIC0koBPT?=
 =?us-ascii?Q?hLt3ImZZPS9ZDuzlky2gXs9g1uZ5gvo6Y3LF980P+2x4/db+NAq8YFh3thpQ?=
 =?us-ascii?Q?YaPhN/to/qo5JnEmTDuMVQsIcxasQICOgmkmDlVidjZGoYvwssvDnQNdEreV?=
 =?us-ascii?Q?/VuQ3YplORmeyoeAEEvvQ0Pjl/zNNcutTJ8mGz4DNllsiiOhInH561aWQ34R?=
 =?us-ascii?Q?NkGA9xxYF6OsEVG6GKijNAVaOVYBWOrm6VXCbZeAmWcgKzNHcQB//5FrSk5x?=
 =?us-ascii?Q?hAzlVWV7Y4bq5HfHxt4rkxbztzMx6EtfbImLsolYEo+rUxsXadOAXMUUvfjG?=
 =?us-ascii?Q?ODtA4HiLNdAcc+ZvL1C+REwKWWW3DZ0JJWu7y7F/yns6G5pBgDjG2Fpt9Irt?=
 =?us-ascii?Q?G5H5ziCUSJ/gckFp3qJ9seoUr2K115KJrNmZoSnXrICzE3W4EkobB/1ZTVwL?=
 =?us-ascii?Q?kXzhIYa3idXXtEVxceFMH4+r58ov/CLK5i65NWGWXKPzriFAOkZz3OwgRYHm?=
 =?us-ascii?Q?8bzYgCBtuWfzZgU5IsOO3eEtLZ901cQB0U2SYsiW9gvY30v+ogNyoL/6ycCb?=
 =?us-ascii?Q?dqx92SzQSSsPTGRtRDmnpkY5mtbCsD0bRD2PBn7qMXqsuRbhZF/IZCU7lCYT?=
 =?us-ascii?Q?SwfShvV6JGztiXYYwMd6PNDkwdmE8z5UzzjZLtAKG8wW4e50M4wdPztyIXKU?=
 =?us-ascii?Q?F6Dx4qqxY/e4/EoAWa4nlx8zZAFE8tw59TnNireFAsbTndSXN3HABk5Ime49?=
 =?us-ascii?Q?0OxdTyzYT4l3CuAGcPHgjSrqKBG7g7/0v7lZaKbaqU9f5GaDRTyMirVZZC7d?=
 =?us-ascii?Q?ITp7AQBe40eQdCk0OSqUXY2y5WQQl85Np0q+zA49ZftWlCR3m4m0gDHbL98e?=
 =?us-ascii?Q?wN0/Uu4klRZ3vljBoQCyLaODbcDMt2f7Zmuv2Cr5uel3/wbHYeqgfpn+iA6y?=
 =?us-ascii?Q?2uDJSAVPFDbI2jdVLVsmqp20Yu9zKxTba0qBsCbPXNeVYl2eVj0R+i5KbE/O?=
 =?us-ascii?Q?KPiTJlInztJDgPH9dvD4DG1TLkXms9d6SPgVurG6OQPwtTZZB7n80jr+1xy/?=
 =?us-ascii?Q?00iuiaBauhZigGGw3C1F2n1z7Mwuky5rQqImDuPyRHp+Ief8t5qDlDOoCz8G?=
 =?us-ascii?Q?fFTaQFLK6wSAfTOJ9gAgbvsqG1xqYDMJDA9n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5GFMqji3k1nwpg4t3e+z9Jsg5c5EnofUSnWYqG1YtKczt8j2GViVgkNYcvzq?=
 =?us-ascii?Q?Fs8WaoAZDRV9DAUhSinczqYHzmxyEzjAZsx4TffjBFhRmcnNSmGNkJXOfcL8?=
 =?us-ascii?Q?8D8L71/TGP8Cgnb9VTkUQQ0yomGdgU0CjEyaAqSMLrJzh7XprWeYYv0iLUO+?=
 =?us-ascii?Q?CbFeltP6obeqFWPboH/dKFGnzbU35S6g2ZTnHFyZ7eYP++3ZtaodTGdJHd8B?=
 =?us-ascii?Q?Vmz95Q8vFCZtLJuVoQ3+Vka9s1um8b8Ck+vfnAWHX0iPQKSR/4ZSD6+7W2vA?=
 =?us-ascii?Q?6vceCapXXeVs+Ut2bNU4pQS7M1Gk/udY30BKh5BIDjEvLr+/ixkfxHaeGaRx?=
 =?us-ascii?Q?yUTPblqJiB58H7hdkL6KZ7NJVjcpaRYNCdzQhxRr+mYqK8vqTCX37OeaBOl6?=
 =?us-ascii?Q?8F8zF2h3bQ7Haf5kXWu3rbc9yEqvizu+65NCqFcz3cFOxjyQTbgWLsPauIt7?=
 =?us-ascii?Q?pengnDfZCsvFxqVgwVM2MslpJKjXcxEf5+oyxa7n4tmnk7fQbXDuEoeOMh+A?=
 =?us-ascii?Q?01sZYMU3lxirtSNICmw9w5VVnIHusKvN7fGeB0daa4CHqToFfzQDywHRxKNp?=
 =?us-ascii?Q?Jp/od91qxybmKxwDbNq35Q05tPWgGKetnUFmdsEiABfWkX9Cmk01MOFoCcLX?=
 =?us-ascii?Q?9kg0eTChxt/wBLPYCDVUBch0RPfiPihEYs3ZPNzo3Vt3s5/9m8uayEbaS661?=
 =?us-ascii?Q?z0Htfq2en4AMqx5GRoZmkRkd+lsezMGnfsVugaoWVy8GIEK+wG0Y8MoxZxXS?=
 =?us-ascii?Q?lwNfPKpsYjxHY+lD5a3hAIGyNxcgMAyTbxg9A932bkC/H5iGrRaU3S44Auzz?=
 =?us-ascii?Q?WDw/V4lEP5juu90gQDs9aR3YdNskmtPDHcphr1xRTHq1YELv8ew0ZqQOULeF?=
 =?us-ascii?Q?sqs5Dvxcl7jplDYSwMw5F2Jnb3y5k9AZDiANjLh9h/0X1voXjCqgP9g3mCd9?=
 =?us-ascii?Q?4kMfFt7cehomujVH2hw9gKJTmkBu+GaZCxEMggoTlVTvlH54JaYjLB3TzS3k?=
 =?us-ascii?Q?R2QUC+wNhjp/huy0qytGlV/xZGtDVTbxUcRNXaSlYyRc8GO0LMGnVAK6tFH/?=
 =?us-ascii?Q?HlLhVyRSMGpYNNJea2GbAO5th0ZKe0zNEtlq0zK1P26D9v9Lkjizwp59dMQ+?=
 =?us-ascii?Q?GDmKMfLdsCPYBae1oGRU/YN7SJiS+KFuiXrXF7LBGo4PSht27lAsarFblCxM?=
 =?us-ascii?Q?xqkeUYCiclmurrfbliRLrfcPwdeQO5xJYJxPHMyvue9NyTBxB3eqRLgzhDY6?=
 =?us-ascii?Q?fiFb7QMPU+UB+19JL/ay/IstcTO8L8HqfP1gx6fpVJyxPEVGBoW8+tfNFKJN?=
 =?us-ascii?Q?g2lS9iQpKphY47G8G5zRE9x0PMvSqaVCdRsvugkSXehA0sSelKTU4KAFuXuc?=
 =?us-ascii?Q?BTbRo3VvevE/SOoTwo+YeFZSgf8fMrG0P73TMctC6OConUfl8W5RxFzIsTZR?=
 =?us-ascii?Q?T+baPR+kdrFKuiy+7OPmhQrlmVN1pPkJLiNLZOMbX7h/0Qsxq6gGEMHXXaHV?=
 =?us-ascii?Q?FIw05zP1e+tnG95pII76sLFUDiXpdj/i3BB+ZbCyDsgfmzvb7B+QFHSyMb1X?=
 =?us-ascii?Q?BLMBYNc24mKdt/VNiB6EOJvUiL1PqaaoNNTDQgIc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d345204-c0d1-4ac5-5eb5-08de25ef0d5e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:36:18.6844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUtznwBSfJa6BaMB/egEmZ1UoI2/Aqez5Pu0H0/Z3VX174AtCnrq3hejQfJDTF57Is2PLJ9l3u0xmx8QQfpwEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073623_250247_BD695ACC 
X-CRM114-Status: GOOD (  19.34  )
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

On Mon, Nov 17, 2025 at 03:16:05PM +0200, Adrian Hunter wrote:
> Prepare to add more callbacks in mipi_i3c_hci_pci_info.  Change ->init()
> callback parameter from PCI device pointer to mipi_i3c_hci_pci_info device
> pointer.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Improve commit message.
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
