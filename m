Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB92ACEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kcws7Ae1Jgz26befrAy/Y08sazTx0hwdsUFyrTsi4Wc=; b=Y1z+pBfFIDzbuf
	gepGb4MsXd0OJKk1OI1jIzXGq6ONT8BB/J0z/DWjteqLRPpczoHUFLIyMM3u2ru60nN3n6XUSnbZG
	Yqd3jJEIuAC5NFI8LbpoStP7447gtVjOZaKIrHTFwKo4Ec96m8dmEnOxYkhzhb7Bpd9jQir1G6cwx
	tpyPigeNS+9mPQiZ/4CU/CBRTh0t6iQ1hE7+RXDF3d2AA+rAMdyqT0beR2Swgeu36rzCQhUdYwuIs
	FdLc+T3jarWHuZUqVuTmcOmk4yEnEYY30hq75sOY2mNPTdptH9qDq7x31K7+phwn37YArrvWWQgp1
	YCRmdxiddPhdVs4nEOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1PZ-0000000GLe1-2uyD;
	Mon, 17 Nov 2025 15:45:01 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1PX-0000000GLdC-3Ckb
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u85GHAlc+IyftV17JC9+uMC5LUw0zNcForBSGuIn2oEbtEZ7XWyiUcGVTqSHB9i8JrUlnrTeQ+0EG+Zj58sMzXOp7bCv0FeL5P70/KcrM8XQljw3hVn6oIf/j/QNz9ycTecPEr3L1HdOZzcHOsfAOtqOWp+elaaG6QC5tEwhjogydvw0jkmmd8EipF81btA3G8/GSSzdY4AL4Doe8ECB5gTSVJ84QxsZxYnV55uLDr0zrC27+BWoRCFKLYZRsUWNxPuk1ULgMDhNHLT6lnhadVcg2XJ5H8pfty3pT4EQO0/8l8F0jUg+AYprdPB6Up5WC/RzadK14GrypMq2ps9OPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6Hj3nebRamOXlI0IKktRdsq8cmBpjCUHH9YT3H2f3k=;
 b=VxD/+h7qALv5XsIsMWyqopEJY6H21yrQ7HTm14nIybmkPNC+pJkci7gkgcm83IXLbixOoUaxUK6qExJ18HaRdBAOW8Sbkbv2qQ8Diwx7R/QpbClWdk+7uWcXgQXWiuMIFduq9SgUfZMhOR44/pKt4kcyaSSAOjpCyAH/dkSrr7tC7tA/hqUO8OFWDaoBEb5aFwF6hyJE/gba7KuAwaFHT5JMQoJFmAddV67wfygMrrnrVhm6B9CHfv3MW03iRP0ea9uL39P7qO23Z8ZyMD6CECOVFbpOmrYllmjG5LC6vrlRUNBJ3WQfQ4qQ7EDG40fbdExuLO++4Nu2D8/IbCVV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Hj3nebRamOXlI0IKktRdsq8cmBpjCUHH9YT3H2f3k=;
 b=YDLsoZiXJL8bS2Eu6a+qKCCqnhBxVgQq9cqTLmLlSKL+iKr6jUiq7AzRk9rZmjgNtm5Pl4nLNfdUpgs1NCpjMTqzRaVZ3rJ2xAJvgbxZWfphp6ofF3aCLtXW5uAS6E0qF8bChlttVvbmjKqoNQx6Y2Dm9oH57XXzJq9hQHdF9nTYLQXQnLSQQInyxKO3GABD0E991qOj4mcLH/M3lxMpK2hfc4N38COfy9Q0U/obsFo5peywoWHbKhdUVfqS4FE6OyGL9vVpJYVb2B9sxQUIrwzuuM3yGPwoa0Wj9a6NiIo9xuHqR07MunB9IG1CoPRuAp1nDVSsl+X1Y7KcI3L35A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB7604.eurprd04.prod.outlook.com (2603:10a6:20b:287::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:44:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:44:52 +0000
Date: Mon, 17 Nov 2025 10:44:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 11/12] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aRtC75g1ai77X/19@lizhi-Precision-Tower-5810>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
 <20251117131609.65988-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251117131609.65988-12-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR15CA0017.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::7) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d3278c-9720-411f-112f-08de25f03fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?isQ0OQ2dqgoLWPdoxdgVI1kPM2XZSkTuiJgKrQopol05115+bmQyfmi6o2Hs?=
 =?us-ascii?Q?LIE2L45ragungUVVvcPm7RWrw9DkOi2GvqyY8kib2yUQoQo+uVizETv9Zpme?=
 =?us-ascii?Q?U3VmjRTZUkRGz39KCG8WxsEy9x8vHpPH18e96Z9UKzQUfoyGMyEdoBoH4tY1?=
 =?us-ascii?Q?0eiIgQlTXzNL1augKKLNW/ASRv+mlY6J9nYmgtda7SAsE+5UD64OGVwSS7t0?=
 =?us-ascii?Q?XEGXMpSJAxxjIDTqztGRBJ9JwBElKTqBh4DqqCfIgPyal7dPnIFde6wJsc8a?=
 =?us-ascii?Q?KzUB4FI1qxOMi2jXBLkyWaAdfgbsTBMHt+Wsb4lykcha+4m6elB4OoHczeir?=
 =?us-ascii?Q?jTeq/JF0do4L6wnoQij5YzBq4hm3/jZpG5i5PrlJk1FVrYGdguN3+J8JYiBu?=
 =?us-ascii?Q?/RhY052If7a8/tfdwABd07Bg9sDN5v8oSPqhbcEHYAGEucgbHNiKlcGxX6Ek?=
 =?us-ascii?Q?MW/9Ga6Zv/xmdp3aiSv8byJ9SOg9UEpsGBqYI8eGx3FUyXoTj5cM6jtAUOPk?=
 =?us-ascii?Q?Z3yWzvx6ski1wG2PYmqKhrbEc5jfxUoIvbyWNlTb6BIV4O7Fo2ua1m044NuA?=
 =?us-ascii?Q?bI/FFAkGNr7qmDRyqY4kGszUBxRtUkud4dNXaL9mk0EbPoNARnw7Y9Ipv6xZ?=
 =?us-ascii?Q?m7R3Io9mG48E/+aPxfAQ/1m5qGe334tPi6cu6o9YpxjTdZAdM+OtIsjs5TBf?=
 =?us-ascii?Q?KZJ4Lfij3+33EpUoORg48SOb73PbcU+F+nWZvErFoG7y5sn7sLHjLGSMypaL?=
 =?us-ascii?Q?nyo9iKWL8m4HojdefWjePoZ7E/xLyG0IYZECYjbqYUzsAupFvOyDkUKQHPTh?=
 =?us-ascii?Q?0QgzCw/q1edQICZdvp+g5sr0mB2QqRIgX78r9PymL1AYMDhKWo/G5ORMDhOK?=
 =?us-ascii?Q?upoTOiJIP4sALMYsbSYFbIPe7ZiG44LRbvrOCPqf65aDmUruaawuWyKp97h4?=
 =?us-ascii?Q?23CxjIYtiRA52GZ/g9EuKsa3qeZxFHI5yPC/faP5SUQrCH606ed6VovNqcl+?=
 =?us-ascii?Q?A4OZw+t8uIpDqiuGxZF0KOsYAyeuOmozM7b9DyFaHNohB9kpeGqkWTE5vvUR?=
 =?us-ascii?Q?3mW6TFe++VtsuMtOfArG0Vv/X+UqZzlNL3OFoAEM3cYDjcZncofbGSjDvmsD?=
 =?us-ascii?Q?J+PFNrS8310HQknYtpEIs3eTbCOd1eXqwP/C169FsYZw3Ujrw1rGEj0hwhzD?=
 =?us-ascii?Q?vlej5kKsc1Oek7va8ChgzizeL25zGUWrYwuzyM56ZxM1kzlFFIyTnbZoafQe?=
 =?us-ascii?Q?QZgtlHC/IZBxeWlQcnx0kkl/KHuWcWoWICZDQk5Xpiyq1BpmTR3oGgzpACV+?=
 =?us-ascii?Q?prZ/1NmhIVlrmb/m9cKIv6vKEduSvUAOniZTqXIXQ03qSsUc+RjiRURIPMnA?=
 =?us-ascii?Q?fGOLV6wlZmX/vccr2Wfyd6l7BRQgG2+XbQD0KG6jlB/xkUdbdJiN0uNQu7vk?=
 =?us-ascii?Q?kj5VmJORemUCPXZRDwfHfzrKxcLKdszUbMwx2hxwVkLqfS2z7+OHF//5CBum?=
 =?us-ascii?Q?WSymUI5dPA3qvu4gOBzKnGejnECwg0ClY2Uo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2vipz/fGsedzicSltStSK1sfJmfSbhHUJ26D6p8eoY68ZNaBup4l+r7DgD6?=
 =?us-ascii?Q?7llEhVqz7kGJlk6pkYDBL6HkngADkNGYbTEQeATjjPgFUdYt1X81metA5CJt?=
 =?us-ascii?Q?hlaDu9n/JXrH3grHxGMmgVc18OnkkdylYaNSFYo7biC5YUE+1rKQaIQ4j4dC?=
 =?us-ascii?Q?g08ctYFwdnVn+75LSac28XR4wvEmNuLTkfJha6ItvMFPzmc2orN8RyNM9y6h?=
 =?us-ascii?Q?Dv3jrviWjw3ZGZ34QcLw8cLBOX206MTTwox2CFJTpWXkvu0FAflbjQ0yijT2?=
 =?us-ascii?Q?pngiOW+c5zWN6exBVNFFLXQ+bOP+oENE79a0WSSkjI60tk02Cv3slQNlmU3W?=
 =?us-ascii?Q?7rvV7FnT8gJXYWALLzvKQNh2t2k7TBuB/7SYfr2AXgpX3BqZ1zljMwcJGoxO?=
 =?us-ascii?Q?UHmYcZSqSTwWcZFMFIcRVqkN9OQnSHVz4Irv56vDghpvqLayBsf//YBQz7LP?=
 =?us-ascii?Q?Csh8YNoX8kJ3GfvYUNq7CLvpuqxIFUTY6vUXXSo2FkG/kVRrx2T7PU2o51pk?=
 =?us-ascii?Q?9iRTJ5xR98Pp+XMRMD8nutRbTgI3VbXZp/nRYXKOSfLzldUeOC1UeJHjCRNe?=
 =?us-ascii?Q?05ZP8wuH8wZpP2oTgwAi/QSjXEaP3HEtqt9u6O13XFHS4hVK6l8p8yTdarzx?=
 =?us-ascii?Q?eDivnzCjls2sUB8fhYjeyuv2aXRpCSqIuYawrGECGbOe/VsvEsNVpg8BWOL2?=
 =?us-ascii?Q?W7jx59ofrS+MmhqknTrT0863DAhzShBPyEGh2qbkXzUpx2JLwqXc21sjMddy?=
 =?us-ascii?Q?N/K6bSIvsUPw4L6pCFnwV9PMA/lewRACpQtqA1gkUu64vdjKIZqWSXAKVVdX?=
 =?us-ascii?Q?/p/osQe7c9WBIKZokLsFjzfK/JVeX0quAxNjwTNSnVjxt+86PoC3JNUiVJTN?=
 =?us-ascii?Q?fmZTMSgq9LbpHXCxpcKjgAOilAOnAAKyOXQOLruBAYOO3LL9b8hAxexn5o5O?=
 =?us-ascii?Q?kUBqXBujw5qajuwyAdxVT3Bvm9X9rnKU8ssfI4Vf5ofk6ZVkvFLFoW6uQp9N?=
 =?us-ascii?Q?93Rx1NfHzVVcBj4OxP/JwsGehpAzdOFlYmFYijCyNHuK/0PQCJtVbhNZjkOU?=
 =?us-ascii?Q?M7Tv3sDOMRK2CzfA+yWOi72le8nG2WOBAODwmWQQ+aokVuRzofRCL+HHsMZP?=
 =?us-ascii?Q?OQ+M9cFo6dg4vMN/JRpRTGIAIcU5DDzJgXQn2/BiHkrt8hxng1iNfJXFTuc9?=
 =?us-ascii?Q?RfHvstBpcWF3dKTE7q/rV1YCGImi5UQB3hOwS1kG6wLTSTwzTlyPo2fmyz31?=
 =?us-ascii?Q?esIv2/iBwEGS2wZgSyPVJQQav6Gqps+nkYlKOCPpsrcrGX1etruLQ/DObopO?=
 =?us-ascii?Q?o190wdgRirKeZ7CJ93J3EEYbYI1tq6NShJdXmE3d0rxdnlZbwA8sAw9msiEB?=
 =?us-ascii?Q?i+Q+BuOuOIlBPIyjMq3hwY2IeBIo2UsKbxH54rHPsgbXujMx3dT3QtCV8rdE?=
 =?us-ascii?Q?Uo4p7wG01dEXqgLhG6db7cFM74otit+CY6dMK2uYizi5F/uS+tps6piVVx0u?=
 =?us-ascii?Q?R0OHlpvqX3woxbDQ7+9YZFlXxTfW6LPwaiW99IjTsaMpjl2unnQ9ogIUGIkH?=
 =?us-ascii?Q?3WpQbtjPL7nFzciONzCH/ff0kyNcHJ1h5nHdSJO5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d3278c-9720-411f-112f-08de25f03fd4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:44:52.8786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGRcDrnIJl8HuzdVb1ce1XV+joUO+/YwBaRPmkl/BLeBUDp/ZXgXlcDrCTskGwAqoOQr5kJketrUtRqBI/Ld4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_074459_804398_71EB26E0 
X-CRM114-Status: GOOD (  17.86  )
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

On Mon, Nov 17, 2025 at 03:16:07PM +0200, Adrian Hunter wrote:
> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>
> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> Also expose LTR register values via debugfs.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
...
> +
> +static struct dentry *intel_actualize_debugfs_root(bool add)
> +{
> +	static struct dentry *debugfs_root;
> +	static DEFINE_MUTEX(lock);
> +	static int ref_cnt;
> +
> +	guard(mutex)(&lock);
> +
> +	ref_cnt += add ? 1 : -1;
> +
> +	if (ref_cnt) {
> +		if (IS_ERR_OR_NULL(debugfs_root))
> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);

You may omit pervious my review comments.

I suggest create common i3c debugfs root at common master.c.

like drivers/dma/dmaengine.c:static void __init dmaengine_debugfs_init(void)

so you use similar API

drivers/dma/dmaengine.h:dmaengine_get_debugfs_root(struct dma_device *dma_dev)

to get root at your intel_add_debugfs().

Frank

> +	} else {
> +		debugfs_remove(debugfs_root);
> +		debugfs_root = NULL;
> +	}
> +
> +	return debugfs_root;
> +}
> +
> +static void intel_add_debugfs(struct mipi_i3c_hci_pci *hci)
> +{
> +	struct dentry *debugfs_root = intel_actualize_debugfs_root(true);
> +	struct dentry *dir = debugfs_create_dir(dev_name(&hci->pci->dev), debugfs_root);
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
> +	intel_actualize_debugfs_root(false);
> +}
> +
>  static void intel_reset(void __iomem *priv)
>  {
>  	u32 reg;
> @@ -55,20 +175,34 @@ static void __iomem *intel_priv(struct pci_dev *pci)
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
