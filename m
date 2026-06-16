Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB1CCD98E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82DlJAZJ7tXixYMm4ckmPCWEb/VY53KDR7Jj64xqz9w=; b=jt+gaAGAiGy4pH
	kmJfjgFzIUQdNyUyzAIPkJOAEclj4DtXT5HSk104BM+qgFesWyXMqTBT+FxEXlaK2brnmIklYCggF
	h0bOfIKL267Rj0USsLcUZq51gbZycBw7W/CMC/Ytp4UD7xQ6S6ofSlXnUQO7au32WEs1Ht13UD/jA
	+GyRPMhwzUesQXUCBtslw9LhO936Xko0LwtikDdIpbm0Ow9GUbFhb5qrlbtArafvEgiC/HuaUXLIG
	TK49Y3L732kWxkEf3K4/TnbE05x1Xy0QT8UDjDqHaokfd6R/L15cEGx0JB1qre85VVQ3YLfyDTrxq
	0kfcKIMx1N7Y7GYZmKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX5h-0000000G8CC-2VXd;
	Tue, 16 Jun 2026 16:56:45 +0000
Received: from mail-westeuropeazon11013050.outbound.protection.outlook.com ([52.101.72.50] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX5f-0000000G8Bl-0UDJ
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 16:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyHf1CqFRblHOn2DxxY1ILRm3q4RNONpF/CZdRR+U+mUVPtq9eHbv/TM6EbFesnl3vhjPvwVc2fc/qD3DSN6yOslGC1pMNpfSBbFEO3vUuUSXYfGyDVsKKrrDj/VLJ3yYcTDsy94jyPhnB36j0W2KCZZExiFFPctvbiPAq7ERpQYAZMl3RJ+/2LBMHKTp9vs/KcpIdUSUn7Ix7Sp+0kC0d/dn9h1dbV4snynnARY8GzQ+TpLdkaZIQom/t6mG301CvArl8vpYdnPWny3qKSNcUqHOJiNyOrSrKPMXetnK+fw7+haTid2mM4oM9QZrP2v4k750Yblcb+AgxgO+tpd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=429RN5906mUu+VpSLB3Kl6KsZoQsvtR7QEO1WHTEsAA=;
 b=CCPuCi5hLhXlk/CnjIl4QBx430pQ/2i4bpItBHRcy86xWyHN59jvFMMB8oLPl4v0nX5GjijGIZicKTLys+ozHxFTaTZXLmkivpzxee0NqDgvy/pSock4nLyqmmCFvM97dKqqopEI1i8Zt3HqR+aNROroIzQhXbmxa9LA6f1ceUvvsblF9y0uKsQjmfYHI1wkMIW9UY4uSMVZUaWIUGW0DvG7JYUSPVciR/mPnJOSqxEUEvj9BqqHeGWK/5qlBSLGoks/pQhABim5WhIxdlY8scy/Y++XW+T5A3LTDnSJ7yS4cVO+fiCfpAYt8Ruxjvp2gQx5HChvN9XNJntRtOTdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=429RN5906mUu+VpSLB3Kl6KsZoQsvtR7QEO1WHTEsAA=;
 b=PlVJUUK4UkreKiMsBYIhghjWrZ6kWr7uhry7W2qDNKgjArkMoU4aVwLegf9xEsClAkHOfi2YBLIRzZ8n7kC7UxLhmlDP6YW/frruj85sila9Zq0AybRhllSx85FYslvUMFueWqMAEojs63BS0oFzCIoqjJMMTDGs2tTRoA4h0l9aKX+LOypQunMyZXYq/zeoMxDYqwDkxD7S1OEt5V8vfWf8zjC+cvkeULpJJk+dzJhIltONICdNXGZSd1PlwKQdk8Fdpokgnt27n8miC6WmOZwoiLrEDkG1XHijB9pomwp2y5GaIUmHKR9fH6Fa8k9SWWn6T2Z03HqEXUMV/MXFQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10789.eurprd04.prod.outlook.com (2603:10a6:10:588::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:56:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:56:38 +0000
Date: Tue, 16 Jun 2026 12:56:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i3c: master: Add missing runtime PM get in
 dev_nack_retry_count_store()
Message-ID: <ajGAQL4yzFkD-E1c@lizhi-Precision-Tower-5810>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
 <20260616113752.196140-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260616113752.196140-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SN6PR16CA0040.namprd16.prod.outlook.com
 (2603:10b6:805:ca::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: db60466f-e029-4dac-72a7-08decbc83b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: z0NztPgdK9EpaeiAggOf89d0MLpr8jq8m2aVZ9hAkE5hT7ZUBsdXkX/lVvgcToePQ8GecolAVkesSMaIll+7cMTEW5tymrdpd0LXegSj/1hPdc6PzEy8CSAvAgieKEMVRnZ7mq/8mabOc/X81XWgd1G6qRpmQFa4R3jVEBxu2y4k90THFrOEGvNosmcxsRiZbCT8x4jHU13Wzw+p0Q8qAJ0VTxSTaFZo/+Jo2/7fsA3lbZZaxv/TM4P6HE1aAmdTWe1nPjFXlCy3n8qe78v87RIJlzubrlIA/E/Le7QqrCHUtDWjZNKo6IV6HA+viCICp9ym/czShmvAvjfgRO7P5Vf5+TnZV8RYmc9uAsIvhlcuKMwjp03RPOkZ58QDEgpopWDXCxhVnP1hhiO3kioarReWK7zBd9tY15AvurpZuJ5D6CMvvzDQ8fPqGoWnTbO862BKLY3n2/GgPUI9KmFqq47FkmReRXGgyIXkvlrkQuWrFLayshDN3rm1zU1U3hn/rz3lohGrwJA7amDsQw561SD0oQgPCFkRKep8PLyGNoU6V6s1Fr7WzIIB18ruWt5XXMqaHk6Z7MO36ckhtW0mEdZQrhZxkX2JQ0RzjR77e4Dw/5IZi2MotLVbxOQEetsCfKYeXAfHZYF/i1mSWBjLlqjUFcBMIDNUCg/Eh6aqKduUhWQxylim2KgZGHZTC7LZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c5UGhSGVQkYMBN2pSop14eDWrfuV4ecjKLKRBMwPX9BkaVoi2roguivqNBa0?=
 =?us-ascii?Q?qAqur/K4aoVxCIbsiNATyYbZCSP2QfjieE4HuffxwalcqpzMQP9664tYdkqV?=
 =?us-ascii?Q?SMo9aZCFL0xXYcF3ENH4xw3fX9qqNKtUfLMoLHRS2RTbrcG9svfLLOWkF2Nz?=
 =?us-ascii?Q?fXrwfNpMIuNWAW4S9hPXtefP5ZfQGTPdN1jzMFndyW+66iyqowBDfaSn8LCA?=
 =?us-ascii?Q?qrQ5hSvSLHn8Jds6WUMsyrt5UH2iSzZNtQ/H9bZd7iGK5zXHaVmxnbvYx15R?=
 =?us-ascii?Q?83k7JrzuY+miEzhRdz8ox89o1GJTYRRx0r3KI/puVPYWWCRwIIx2PXMa8/MC?=
 =?us-ascii?Q?5ESCXJf2//2sCcMiyRN4TN2YFIXuMzEEFfdRwYOQo2tci0T64J6SWa6m2Dx4?=
 =?us-ascii?Q?KHtc5iLY2RkKqAo8cG5IeMUdEd1QNNElts8SIJLc685mQFEYpn6A1N00IUgL?=
 =?us-ascii?Q?ctw5rTazmCYg3UjwN0qWvchxTXJUyxivyBnYRdxdg2sS1EFHutKmT+p6dqZn?=
 =?us-ascii?Q?CRUDURFWl/uq0/BL3CCUGaf3ZzCDp3gspknpBHIpM8oa2bAVih7cPoezTa/k?=
 =?us-ascii?Q?KeTPQhWT5TTGPVprt0+Z0j0jqWN1F1VKNRvorogrdboXPMss7POJrNF0Onnl?=
 =?us-ascii?Q?/obgETHbG2WvZ1sHetAkWMuTOF0fmDSV7mlrUm/igmUnSGjPbUPoaQGRVljq?=
 =?us-ascii?Q?TiVbRUpOLUZc76zMXOqu1ekC1ev2/IkdQVpBSngHp/pbjuaUjBwezkBQBw51?=
 =?us-ascii?Q?QaCQS1HkrjpGm1VKTDPCNTzAgdTVctmx+12/UW01I3fFqPxJ9urbaAncjynd?=
 =?us-ascii?Q?5sXUuygaBU5H0H02ugQw0DoEWf2zqQpJawQXkjx9DFMLDCF6GgyVgIyyJIAr?=
 =?us-ascii?Q?d7Zr4GTQ0F79+pN3AplH+yDBXUkUyrTxA+oJ1zZJwr7xXYU8OjFyJ+x3zG1+?=
 =?us-ascii?Q?okw6AL2JM/DpnNKqvn6nVbExcHkydXMg2wxZWVmAR6Q8WA5B/Sbj27lktZx4?=
 =?us-ascii?Q?V+xTYa4LC0U5uqJvLjGz9mlRXoUWBJ3+B3/6RZwmLrtq57Rc1NzOh+kuxFBZ?=
 =?us-ascii?Q?2VwuyTxMuUFBh75Lg2RHdUx0fghM0x6bC4lrKSHOzgF/rNXbY239OKxo0AX1?=
 =?us-ascii?Q?ALmcsLhpJVenxvPbAXrMKFT3c56W1Z+Jf+NjzdsWXbA0CxrfGknif42wnfgF?=
 =?us-ascii?Q?tpJ5/ZtWcsZFFGFGNnWijIQgzlYDGvTWBDpFDU7ahmIaqhN2PB5qouszublW?=
 =?us-ascii?Q?5IxPdwCS8p839SJOyVzTtXCb44txVyOuBfkSpipn7zKb+F4VFjwJyUzKao0g?=
 =?us-ascii?Q?5lwAbH0OI+AXMMPHoMXvPTzS+VReVH5bMqAWjNhl4kk7MDWzLqDcyqolqYmi?=
 =?us-ascii?Q?CDygDYhDckIEyTi6fNVrBnec2znU2zVqyWLNKf6sr/WY6npsWFy4pT5IQBp2?=
 =?us-ascii?Q?iOBakez4Q1OmY+R/cxlNSHOMg99pzYtAYDbqxJKXOHwQIxwfHW18eMe48WXJ?=
 =?us-ascii?Q?obnWVGC9InAifUPx7i+hQ4STe7wZjOHgK+ZehbKYR9iHMnU9Zbif6OG85UqV?=
 =?us-ascii?Q?S4aqAL5qCMbJamcng6mEqHfnzCjdG07K74DzOMGE3skCe/RiKxTGviLK5x3i?=
 =?us-ascii?Q?LtXHxtBVB4ysfuY1pV2F7ko5x9L7oiR4Oy6KQpphaCfyrW4c2mTMBoXX5sm2?=
 =?us-ascii?Q?RvDFejOljPdnhsTdXxXMkuWipsy0Qu3x5ISO9LnTxufhfsuwubbDwwvs6cvE?=
 =?us-ascii?Q?UUVbbbTwDptpkzg+JdAeRYFfxvVJ00tntfrkoV8WipDHnAEcxWqL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db60466f-e029-4dac-72a7-08decbc83b3d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:56:38.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlfTfjSOsxqH69jmuuVz95xlBuRPAYYFqkVr0wo/7KslJLgaZa95LCaE5VO7vn6vRu5Vd5m7ygxLMU0F1mPGyoVQL3ft2j5YjlBs7vTOHpJbKlulI8sYv6c78dapaIPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095643_186695_628A8F69 
X-CRM114-Status: GOOD (  15.49  )
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

On Tue, Jun 16, 2026 at 02:37:51PM +0300, Adrian Hunter wrote:
> Ensure the device is runtime resumed while updating the retry
> configuration to avoid accessing the controller while suspended.
>
> Call i3c_master_rpm_get() before accessing the controller in
> dev_nack_retry_count_store() and release it with
> i3c_master_rpm_put() afterwards.
>
> Fixes: 990c149c61ee4 ("i3c: master: Introduce optional Runtime PM support")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 66cf5d3bd987..903ac01ab413 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -767,12 +767,18 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
>  	if (ret)
>  		return ret;
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_maintenance_lock(i3cbus);
>  	ret = master->ops->set_dev_nack_retry(master, val);
>  	if (!ret)
>  		master->dev_nack_retry_count = val;
>  	i3c_bus_maintenance_unlock(i3cbus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return ret ?: count;
>  }
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
