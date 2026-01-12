Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C142C9EC99
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Jan 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7kiU4n2vuduSddPXGazGm6PUUKpRqusZ6Fj9ow4JsQ=; b=UWEuzCQJWELMLv
	53sIpkO9Gusop2Sc/TMUhOIZPsOXg+vB19/eY+fP/C3SjKWjQkPUTkM7MhILZFAnH3sEJiVvxT00g
	xYXE3BVsy7oVtD73CcMveyr+N2FD5JsZwgvLPHjS0NtRYti9GDMEpnkqAof+YN1r/QJuqgPO01f0P
	Let8AeSHGEEtJ4fT5kAOZWKSKG1Qf0PBKX8b1pY3rP/Tj+QxJAyU1hEdLXMXodL+7s3O4zlgK1OfS
	6Q94/5QLub3vGlDZZVPRKi+3TL6zjUM+7D9CdTfQp34/Jf+7QjkvRvb6ZfcpU0MvJbSDUiR1tSiEE
	/0f3c9AjxWB5PFmLhGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKLf-00000005giT-2uBi;
	Mon, 12 Jan 2026 16:00:55 +0000
Received: from mail-northeuropeazon11012060.outbound.protection.outlook.com ([52.101.66.60] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKLe-00000005gi8-0HXF
	for linux-i3c@lists.infradead.org;
	Mon, 12 Jan 2026 16:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2PGMqig5rdx0wUUK1QQU1DEvCrFJdkGKx15/RQf/MtCQk4GPWuCOLIQyh4VuzOKEk9Tu71qBsYu3Ivgm+SMyLKQguvn3pT2J/fEMNFhrjVJeOj0DraNe146grPPy47p91TAPO4WVa98ziaWo5HfGrp1XDnWW/pP28RuqLW23fj09XmElMbSHjK7kouhz9UqEl9j9q0jzJNCGlY92q3GMc0LJZMhz94X0D9hQivqaz3NK1KNQXgPFtQxDlCFdqClQna5HVGSLkrTwg2mN5kU/tx12qWmMCTvfbEPdX0/HgbpoFv0nyMlLlogNXAXsEH24VQcjsyI1zP2gsitWKwZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOTNIF9zp0iEwtlHbYFljsZX8lqSH7Aph4jT74821eg=;
 b=do6ypkwUm+F62RSRQGMLbAWvSuDhSrzv4RKsUwvJZR9l1g1CG13b48Jy1Ec4JPy4qK8ztKquzmv+GqPbGrYN3v+436WWYfs2VNy6HH+Zc3Tov339PYeZM4fHzoXg8m+fq01sgyoRFeM7zPtLCPkjxwtOZfXyXJh4UNhKYmDEl3J39zdP3XiKlAUz99rrI/fD7gOYFGooAjvQjv+F4vYT3R7PcYQFkseKgc4oTn2qXrnTqxlllje4J6RAjplDVELc49FRkgBzqMt/JXKPCX6qqV1CvA81OuaUm5a2zs8B64vnb2tiV6iRz/ek/l63TFcciAKM1aP4aL0y/ipoVsdx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOTNIF9zp0iEwtlHbYFljsZX8lqSH7Aph4jT74821eg=;
 b=g85X9gPgBXG48G3Y6NCiGrOykjv2z+2kvvFIwrlD1mbXmjTyADPC/ovNKjYOOMmXpFBRpDtwmsl1wjhTOgeaTrg2u03jyV/FSbE/rvVXt9hz5gjzomHX+w8T7Ii6LMjuzLz1JSh8MSDV1L3yIs7TVo2/935pIqMctd+04PcHFJocmdi0tSjeh2a66sIGkcQE1tT2jCUJ5eygpZMi3tRBl+BbJhJimxEG8v4sw8hQyGUqJsV4EjcC348Z2gfi9/QeqIXg6lfwxCAF4Y+8170bLqt+fJUXIQXlb2gcBfYwzSTPUAl8DYXpAihMQCE2bMTd32bHvzrf8qRLKyQ0xOUzkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB9010.eurprd04.prod.outlook.com (2603:10a6:20b:341::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 16:00:50 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 16:00:50 +0000
Date: Mon, 12 Jan 2026 11:00:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Move device name assignment after i3c_bus_init
Message-ID: <aWUarN0klWitn/wZ@lizhi-Precision-Tower-5810>
References: <20260112-upstream_i3c_fix-v1-1-cbbf2cb71809@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20260112-upstream_i3c_fix-v1-1-cbbf2cb71809@aspeedtech.com>
X-ClientProxiedBy: PH8PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:510:23c::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0589e4a7-1016-47ed-77e9-08de51f3c19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ME4J2/Rdc5tXElM2r+9QLoJUSTyKDQ768vBLAXIMZ9acdtdb8Pk+l1fVO9wZ?=
 =?us-ascii?Q?YFjPrsNMfsUOA8oHYBQYBFDBVi3cQSiMIUQkwmG3ie8MabPal7hWZVMjHLwT?=
 =?us-ascii?Q?J5yDfcDhHWDelbbF/q6pG9PfzZhqWPjd5SVXS0ADuxcaL1Tn5MRqfrdMFS0L?=
 =?us-ascii?Q?3eq8PFOsDd/sxtLaLX+ctfKz0Zjb/ONebtNbuBFytKvHRnAZ+mPqwd1sXvCa?=
 =?us-ascii?Q?qEFckFKhrySodG/Ye5H2wYq/XtaT6GFmZrz15TptF2XppNtyWCqZPZzy0H32?=
 =?us-ascii?Q?Q65YbPQ8gGkF9H21+xpOuKoNMZURTtP1RFM4ke3f4oWY43gGfIkGz5ldbLNL?=
 =?us-ascii?Q?NYKoMJ5KgLEAwSMWCiNtCPVC0I8XTcuOjSyZk3tRjBXPPLMqUjbxMIA4Y5Ob?=
 =?us-ascii?Q?9JRXA8rXbWwfVM7ySm1zDJHBzqR1HTFrxNFHALJFkvIB/zdfw2f+R0XF9Qr5?=
 =?us-ascii?Q?VGIPc1RRLA0nDx9rFK6n7c44pBv7mHIv0a+i6nmXV5UYVpbiM2e+P5F9i3H6?=
 =?us-ascii?Q?sN3S4G8yNMSs76AXkB5nl14d4wDslVy2lvatQkFeVzUH9olC1FSPjXedJ2/r?=
 =?us-ascii?Q?gFYYkHKkJOH9MeKvUaE/KU6mFB+xAYQlhS/HeXLdGahF1aLdN6r5ytCPrhYy?=
 =?us-ascii?Q?pvytgX7sQlTcd8LOyz/ak8wIrfefA8n3atRjvEjeVBkJdRwz0PeZKkfpvJKe?=
 =?us-ascii?Q?lKLvszY0Z8+YDXfA22qmUcYMOYSkKs1bG2CTaiI8AeBw0Pazn2SArRB3uU3J?=
 =?us-ascii?Q?45C1cpFeai6Rg/1H+zd05OjE8pWzNcF+vmrp5FQkdDD6c5m9ZE/ONWgmgCBQ?=
 =?us-ascii?Q?jmC1a2fLsBN5cjZu3kpiIzYLr+TJlb2VXIB28EKE2XW16mdRzlRTArPSRn5Z?=
 =?us-ascii?Q?/goL2FXogROvFtM61De9DS8yc/9JtxrtL3PGJyioiBtcJpAZEu23u47QQ7Ne?=
 =?us-ascii?Q?PCeTM8pH9oJ+wuIZnzpId5sVem4pOhkPRSvB7m6v3AfPxZHWnzUaY/9WKP0g?=
 =?us-ascii?Q?Rwi+L85fGpIjeKtz+Rst2CUGRAOVFdXUxXtVyyIsY40yGKKC/etY8q1JMSsG?=
 =?us-ascii?Q?ohuxeGlT0ia1GIjGJ0rlkKA98zffcM2zpnA7le241egEFe6hfEbD4manNhN4?=
 =?us-ascii?Q?HV0mlpqE8kLEIZKbh8L2EJG3vEQtQxcZlOLqJnNL2rR9dDOwaEWTrMvNWNTL?=
 =?us-ascii?Q?lH+Hff8FCaumLTTzqpXl5+B2CbFiLELiG49d6jDfkGx70PEjGRnGTZqfgP+s?=
 =?us-ascii?Q?lueS4RN3CAqIz0gR4DjMfIN3jWf8JQO+NvYlhgwp6s/FmyB0g/Dn/EYctygN?=
 =?us-ascii?Q?jNPboyqnF4EpCHvjpaArJ/ikDPvphe+QXKEI5+z/wU0OWat69NK/djuGIp/c?=
 =?us-ascii?Q?aTvgZy8HdhuA91SUVRlf3CrrZgyGXfXe2sB2eCcvCkzuVDdTbe20UED5R4Md?=
 =?us-ascii?Q?uCyw9ofo+vl0qnaEAvYBC1oY6RFezW1YnhrX0HMZqtsHSwg3HN5CcRTIKgai?=
 =?us-ascii?Q?KXYM4tQM4yRXAzfYGQgktSYdcRSp1fU2YC4L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJwlD6e8CkTB0unkLA4EuEABirIWkzsXL0pV9w+zWPaytF79NLpZrN14ok7Q?=
 =?us-ascii?Q?uum0mT6s2eI+7ZouwnTZT8C1bxpOjIERdcVGJ0WxXkynCoJ4E1LF8E7YiZT8?=
 =?us-ascii?Q?n+TOH5e8cadqrgFqwbZGSK6A49GC+nE9R71F3hLRduAM+h4T1Jl2kBYrCO8S?=
 =?us-ascii?Q?NoEAxHPlvDT9KHBxH1Iqxrn+VPXtKI2qDPPi6QhUa14PAF75w/LgfADZjLUC?=
 =?us-ascii?Q?wak0f+zlmZouWiOxWrKl35X23n/uZ+pYqf0wlio5i7rgVpGTWzTB0XXVxuS5?=
 =?us-ascii?Q?/j/Cv2IWrH8KaLz+pibJbLL6RThzdcQsAOYQT7VC6ofSv5qSJ0hMsS9aqK/a?=
 =?us-ascii?Q?o41brKWyuQi2DVXgERYycbNbTMS073ouPNoxyGpSdvaOpflPfu2yRQWh0yIF?=
 =?us-ascii?Q?l4lRsY2a0s5sQmjps1Hsu8AJyMoFW5oxETt7e8POpRarPjLPDmYiLnu50quR?=
 =?us-ascii?Q?O/MA4/7qR2hURuMyq/E8JP/+qYtIJT4w7U7oOm8PNzlb45WjXrZJHCYRswl+?=
 =?us-ascii?Q?1Xe2F1f4QDqkfD84sjA00g9PN4yywuC7auzJeWd5q8i1fdBFPbCBMf5T01sp?=
 =?us-ascii?Q?h2QBokziU7YbD9jASZM98ydCTfo5wozmj9zNHHtTxlc337oJh8SkxYyjgbdK?=
 =?us-ascii?Q?ngnof+flriwBE0MYSjQf4W3aLRuoivQznszVQXy9798sKvxIirtF0JL8Xx9N?=
 =?us-ascii?Q?ycjvcRFt0Bl1YC0uagmj0d6Azv4v/o6umaxH/j9MN4TJWtKPMM+RbiM+EgrJ?=
 =?us-ascii?Q?Kv2nslDH1woew1Hzq21L3AkZXW02AP7cIKuXk21QBYBVDgQpXSplgXJvFKSv?=
 =?us-ascii?Q?JTJNMSDVNCjxT9juh8n73Mo+ABXONTvqaRQrWe//C3mtEN/Qk8KDURo1x0iE?=
 =?us-ascii?Q?c9rE3y0Lw8HGiJDmAtR2F01mG/8u1WrU7eQhEDMjg97tSl2lZbD48uICiA33?=
 =?us-ascii?Q?691/GhKLbdhK4FOdyjIabQCCamZU8ZsrSJpi9Ttw7YHUvWitPL7VRivmmsww?=
 =?us-ascii?Q?uuTRVcNhmROLCkURaTF9JQKWMQa4SoZkarCMsjuf+9lx/IyMTFhWGrZfKMw3?=
 =?us-ascii?Q?dMd52N6z7HWqkChoE2IzrTzzmPyDqoOvnM6cWFlH/t9v2x0ysWizUdaHi0fU?=
 =?us-ascii?Q?6hNZT4DyEU2M9vf57ST6V0mwuCc9cMqTTL8+ZXSvM7nZx6eYuc47fNlC1526?=
 =?us-ascii?Q?JLb3Uhtj8UGPuV+nr1ES2d77zAX9SBOqRhaV3B+N6SIlB4vBt2HRdiWx7olY?=
 =?us-ascii?Q?S1JQ6kCQ8rBvvEk2jZZwk7WFzPe43tNeHHm14RgZRkZ3GdB+HdsZPN2W6RfV?=
 =?us-ascii?Q?JwBF3qjyKcpZGUFfxe434hVWBababoiZAIu4zN6fAgp/vBVXVm8sD4+Rgryk?=
 =?us-ascii?Q?GWQizMbq7XRe7iN+BGNbARL7QT3X4v3XNxCNtFVC25JRYGZ7THCQSiCO+5qZ?=
 =?us-ascii?Q?hPw6bORiUwoBD4qzPtlDmnDLsmc9Bgg6LT/fytNdUeHpPiYjsSAsOd1NtSGH?=
 =?us-ascii?Q?0ET0VWHS8SOFzIzWV57X5y7ypNZvw+ssWKNHfRQjB8BsIqHcJSMqwI9Q+3pp?=
 =?us-ascii?Q?et6kzzJ9jZih1PlKCjMQRVBxJaUZQUlWliU8npns8Eh+EtnJoemKaLd2PISW?=
 =?us-ascii?Q?nfunjtTZsKHvhuNd0+YeGtEObLMkEX1BmxNsaFtGfgZFscR9F2Kr6Y7OIiQQ?=
 =?us-ascii?Q?bwRIFAUuAPdpuH50kkckJ7smtHGogAVL+NAl9qO86EHdzAqRkxCpq6hWG9E5?=
 =?us-ascii?Q?/lQqOixv0A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0589e4a7-1016-47ed-77e9-08de51f3c19a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:00:50.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gY2iOnksgQvq6wxx1oHRDBQcix+WcaRZpvrGUtCa4p4YUhzn6Ig9S01M3bftLCgMDtyDSI0ZXiokiz2BjFaMOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_080054_121129_CE5A8A7D 
X-CRM114-Status: GOOD (  15.24  )
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

On Mon, Jan 12, 2026 at 02:07:22PM +0800, Billy Tsai wrote:
> Move device name initialization to occur after i3c_bus_init()
> so that i3cbus->id is guaranteed to be assigned before it is used.
>
> Fixes: 9d4f219807d5 ("i3c: fix refcount inconsistency in i3c_master_register")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f606c871648..1bc3c9068402 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2881,7 +2881,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>
>  	device_initialize(&master->dev);
> -	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
>
>  	master->dev.dma_mask = parent->dma_mask;
>  	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
> @@ -2891,6 +2890,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_put_dev;
>
> +	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> +
>  	ret = of_populate_i3c_bus(master);
>  	if (ret)
>  		goto err_put_dev;
>
> ---
> base-commit: 9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
> change-id: 20260112-upstream_i3c_fix-455a2cc442a5
>
> Best regards,
> --
> Billy Tsai <billy_tsai@aspeedtech.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
