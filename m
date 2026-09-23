Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A62C98302
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Sep 2026 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoSmS77s46EjDsB9TivBGvqf+wQAouEYPNeRabsd5eU=; b=fn2P0zUA9rq7nt
	fFaMpAcYpAe/tW79YQlPR8LaJzwNXeQyI9arMCJpcAFgXB7nBDuiwpmCSCcJr/RZI2+RgiBasyIje
	k6esujaGT6wwgxa7tphYUpT+wXAx2RPCsGMV8W0fdLcJEIatxpIQr48b+GRvTlcbL2CJI5HCg5brB
	baglSHywtobM50ulTB9C9CmVElPpJscpxZNZCeo9JQMnrgYbp9wH80mYtq3Mnq/xNv0HvE8qe5cQI
	ZkJD5Wx/3+cqBgy6FXG8Xad7Seg0pWVU2vFM1Qrxir6SntLPZr+3Z7outbMkJCH/TM7sBnSrsyKAt
	orU/+8Jk45y+qI55b5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q3V-00000008uOg-27yt;
	Wed, 23 Sep 2026 16:42:49 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q39-00000008uJz-2rPU
	for linux-i3c@lists.infradead.org;
	Wed, 23 Sep 2026 16:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iuz/25FFFNi157sPzofzJ0cJBUhQWBT3gj70xRqwiP7PNQaxCFn/fYbTCkRDtEUGeeUpZNKXaaj9LnacRyzq+Ca8f8tEEjnBR7DHbW5fnxntuuegHmuPlt9WovFQFoW6x8gW5de5AFU9u6RPo79Q2rfafYqRvY1k9KzLN3fdGtOCnkYny7Fq1PnrpdbwbfmNFSMV7iU+Q/94cuFct/p6m3RFY1YpRsVFwEyJT/BS29jrZNHqByTyCcN4exDGdblAMrk3Let4MgcewL2b19MbnnX/spMkEQmyKA587b91gWgaTDA/7yg1lMLkaoGq/I55M+c683/7Rojtc7Jf8aW+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oejb5g3w0UauPVXc6oXtRUgH1LbqQe6DbajlZMBoyvg=;
 b=H8xuo27OGm/yc1F9NX4QAEa0GvAILXhmeVfO6Q41lsG5sVllS1gNttVW+NLiN+eu6Lkl7kN6vIpO24R12vzDJokNCPTvB2oehlcgq7RudUVvtGmIAF2Jr56Tb8Bi45l5JS2fob4kSv7y40qqCg78ZQ/fKUuQi3DtMizxR93p82ZQT6ZbXWnxV5DlCUkAaLz8e5xAf5VkE0XVpj5H2ixEMAaMluRvLsSWtMFf5Hn9M5hX1wqqwToF4HoytCXTWjGU9EuccPoAKbLn15FGqAGB2zzXzfZ0Do1QKpcFcRqchtN7UkTfNt3pFnYFTXnEqcjh+hbE1Ys1UuwFSowzIblBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oejb5g3w0UauPVXc6oXtRUgH1LbqQe6DbajlZMBoyvg=;
 b=I4ErPXr3cZYkvevhNhtIHxChhAypqmEsxwjHkukJcOaAtDrevXP3zQ22lbsZydWI9VwMuUvxDIS5uZfenKuxVaO1VVwszb1QB1wE6b7McMJYID3OqytgRC3pjEAOB1FJ+tyqee4e4OyGn1X2d0q7+nrFPgeUsFLlyJZ5/q/DpJtFZtnEPJVWCQjwmygT71Nu5fEKS3uCQJrazb4pWbMlQ3JV9D5SC7/Gyt1bw+QslV098+mLGBlbMZ6FJpFKzzwjz8tYKIO1R6/HMbt3Q+9Hz1wsyix3TfY6j4kg319SnUZjil+391jmsxgANpIQlvXvuhwwvry8RLMtIofQ9mpjfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7506.eurprd04.prod.outlook.com (2603:10a6:20b:281::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 16:42:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 16:42:22 +0000
Date: Wed, 23 Sep 2026 12:42:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Song Li <songl@zju.edu.cn>
Subject: Re: [PATCH] i3c: master: adi: free the IRQ before unregistering the
 master
Message-ID: <arQBZ93iYSiaVueC@lizhi-Precision-Tower-5810>
References: <20260923085340.490776-1-fanwu01@zju.edu.cn>
Content-Disposition: inline
In-Reply-To: <20260923085340.490776-1-fanwu01@zju.edu.cn>
X-ClientProxiedBy: CY5PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:930:1c::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd32460-2ff8-40f4-6ffe-08df1991a3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: mUPxTx05AegQA/Or5xqeE+yN64A5MBrQflfDb0JWcHWC3feIz3xfpreOnVBHEP05kPXxLzlNijrJnHC9Mk05T/RzIi9gMgZ4FnhZAg1tobnG8PBT22QYMHyHgGzanUh2WLyZFddFGDooVnNZQ0CKAE1/xf44SMOmxRiCIUCSJPueNLPdF/Z9QRmtChsHpqrQkO0dxzVi9f8sz8knexIklvW4ncniB+cbOthSz2bCK0haY6e7up9h81AcklI6Kr52zEwYVMn5Oox2roDjklBQCqSyf72yH6Lynk177suOxs4DIWkK5CjirYgEe5uWDkWmygM/IoJpEtRPEU+6yfGF89FkMk2bwSKha7xAWib7SQz3MxFOehMVobzS5Dj1xp+fthPn6iQy89i7WkLKgZ8YpWmW7yifIa6+QVkptUMAiH6MpAJHQkK83/LQVe22Ze4CySxmaf8MqUcprDs+snVH4hZnAZSUzE5oee2sl0g9znxSE+yPmQAEKpZ3MPp0n3+UYd5dvoFuRWMVB7LPVSneyfQRdmi27yQonwscGhoeNauHp4EMNQOWGEy/huZjDjG3FwiOF61D7frXWu+JEVbZBKknl2NhdgXq5C6iyR6B9D6U4oG6l5hTjDGzlLqLyotcVj03Bd27IW9SoWwk7SN+Ho55q+1o4g7JFOC0ZjGKF5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YP+P3qt9gQNgKw81jUiUi7aTyJRsuE7oNiN0bYSp5zm9uuWp7vAnD5ve25ya?=
 =?us-ascii?Q?cxwu8vvQajpIEdLMrPjek2ZlZONVk6p7vKe4BmDn9X2gu/JycckOrJG5WeZU?=
 =?us-ascii?Q?EQye2FGfZp7v5ub2PFJ/RqF05xa43kKfDBKP1jqyn03PYPkQ4iGU0VuZqr83?=
 =?us-ascii?Q?RXacpg0fQQkk3OlrNxR9NLfaiT4/pQBw2+B5UEVP7gw8rRTS+ptXMGL3NGJJ?=
 =?us-ascii?Q?8JJMT5KdkU2mrCqeYjhGdcHlsvgyOhD3Q3DaAPQMtT+R3lSyk+WuG2cX7mU5?=
 =?us-ascii?Q?ujaQ/MN5rcK4TzREnufMp4f8HJUmIgTLqWdncxzEcpKkyTTQB4fZw0oaIiWk?=
 =?us-ascii?Q?GlxrbHIFA9WPG8LtuWlulFxXQ85D3ZBTDy/B7Q2NGqtEyEO98ojgtUw536+2?=
 =?us-ascii?Q?iVeAbQkzDbDn2mVMy+njgU9yKv3f2VYNfurPxFY5vkjfmZanxb0/F4FlNlJV?=
 =?us-ascii?Q?iSpvb4QMWu47sMce+z0pCnho8//3U8QJJqfwZZN+Y+JEsKbOx290bYbT6HT9?=
 =?us-ascii?Q?et91EW5oHBXFVi83rpPSAr3jyv9de0DQa3hPunRTiulGRmKxOIlynxXDA9Tn?=
 =?us-ascii?Q?70Wa/Bu9AGPW+oRwLJBxiQ7ADgeXU+ECl4VBVgfkBRPDkkpY5Tq6OLiDcqSJ?=
 =?us-ascii?Q?2UPgMCbBe9Apa24AUG/DVVWHGIM2LQTow1dgXm03I6dOvtK3CZ0UAPbNHRIw?=
 =?us-ascii?Q?dozBbUs7Th2qXRyZE6ilsT84XiPEaQs4YtQ6XxKlKu080Gfx/VUJDiBAFFPG?=
 =?us-ascii?Q?M1UZ0Hl0Nr8u7DA5HjJMIIZEqQ3BGuV8kfbfwrPca+ctX/R+ibTTXps5mQqy?=
 =?us-ascii?Q?/2IX839zy3FwCMINPWv7zSORQXuLVkH1LMhZpzuTKME7yxG4aaz7jm3oaNkS?=
 =?us-ascii?Q?z6jdD8HMawUJV9ABpWVjU2uXQNFof5KsYpZI78x4XKC2lwm+bDbub+p2Lwlx?=
 =?us-ascii?Q?zCZar+xUVqwupcF1HlNS4lHhgwxvu0gUDGTeEQIaZfjjnn1sxhGOygBFA8Hu?=
 =?us-ascii?Q?isk4+Cri5zGrulRsVd7FTlG7WzsCkq4BVeB4u+6TihZ2X83TkIS3daD6wGhU?=
 =?us-ascii?Q?dlmsJ6Pv4u24dLTBDMqV52dL0nBKTKk9xNBhXoOVDu68BQzcXvfzLa5PU7a7?=
 =?us-ascii?Q?miJUI/Eu/8vx8Y4W0IeduIE4pPS7Q7GuFgvDSb0/4JShap58571D7rGN6QWf?=
 =?us-ascii?Q?UhOJ+9oZE41eGKURpzxC3yH0XMxgCStgM+EWs3ZTWrY6RxicdKsGDT/nAkwT?=
 =?us-ascii?Q?8bLAwrnQefYqdtTJjC/CWZvnJaBpdV6Bw5/s67MkmCgYzgrwg2jOobzQxAxO?=
 =?us-ascii?Q?druHiocO0n/X4GUDwwUny8vltzoL+q+C3kpZRQ0erRpbBL3lsrMmszpZEYLI?=
 =?us-ascii?Q?4T+wj6tSYD0ymTFAv+P0EUKyiyQLcIvQVJG+QNafhbQm36WjiJbtJ6dB6YWR?=
 =?us-ascii?Q?qPUyVph1ZlETVcUcoRaisWuQFC1TKSd3PXrd4rNvafhq8UseX6aOEXiHGCnr?=
 =?us-ascii?Q?qJBeXbYwttlG1HK0FxA6FruApBr372R8O0+tnV5NsT0pyiyPisEmy0x1A/wm?=
 =?us-ascii?Q?3YIh6lYaZhN+m+Ddzv7edK0aUu6ICJuzauIWKKj/xyc0DbcGwYJRd9kYiLuS?=
 =?us-ascii?Q?mLBI90nYkMqGzxLM4Gcb6uvlx6Lo50g97ELYF06Sq8OgDcr0ViVbMPtLaBLB?=
 =?us-ascii?Q?igY+hnFhGqgqa2cnypV2/kB9IKsWboc7b0eMGFTe1rojV3RW1uizACE0ib9c?=
 =?us-ascii?Q?JZb1rQtlMBjMXN8yfaDur0hOg2BEFszNh+gF8KkdHNsulUn6nMhW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd32460-2ff8-40f4-6ffe-08df1991a3fe
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:42:22.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVKVcysOPUSmvKivShYY0H131m/plOaGSr3KESGs6OMUKr97YER8W6ZXLfKKQ4X9wr+wn5K+SzbNygdQRQ8nBZuBmyUIrE3288OxaNQBdLqXXoQp2ux7ueX30rSraGl5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094229_555383_E10F485E 
X-CRM114-Status: GOOD (  20.53  )
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

On Wed, Sep 23, 2026 at 08:53:40AM +0000, Fan Wu wrote:
> adi_i3c_master_irq() is requested with devm_request_irq(), so it stays
> registered when adi_i3c_master_remove() runs, and the writes masking the
> controller IRQ sources do not synchronize with a handler that is already
> running on another CPU. i3c_master_unregister() then frees the
> struct i3c_dev_desc objects that master->ibi.slots[] still point to, so
> the IBI path in adi_i3c_master_handle_ibi() can dereference freed memory.
>
> Fix this by storing the IRQ number in the private structure and calling
> devm_free_irq() after the IRQ sources are masked, so a running handler
> is finished before the master is torn down.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/adi-i3c-master.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 6380a38..9b0ee4e 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -115,6 +115,7 @@ struct adi_i3c_master {
>  		spinlock_t lock; /* Protect transfer */
>  	} xferqueue;
>  	void __iomem *regs;
> +	int irq;
>  	struct clk *clk;
>  	unsigned long i3c_scl_lim;
>  	struct {
> @@ -954,6 +955,7 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> +	master->irq = irq;
>
>  	version = readl(master->regs + ADI_AXI_REG_VERSION);
>  	if (ADI_AXI_PCORE_VER_MAJOR(version) != 1)
> @@ -999,6 +1001,8 @@ static void adi_i3c_master_remove(struct platform_device *pdev)
>  	writel(0x00, master->regs + REG_IRQ_MASK);
>  	writel(0x01, master->regs + REG_ENABLE);
>
> +	devm_free_irq(&pdev->dev, master->irq, master);
> +
>  	i3c_master_unregister(&master->base);
>  }
>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
