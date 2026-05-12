Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04678CD4F21
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kZTVicbqzgM+3ZVwPyVQwPgVcXlJDQzwKaLRoOTotc=; b=khX4t3H+4OamZ/8sr62n9Etxjc
	WohZAAKEmPWq+coxIyK6xOJeITrncj0aAES8UdmWzu2sx9/GpcKG2ygYA9tOCdZKrZeHQKU2Vz+4m
	Q0Dcq9ipH71ZyE2y9GUULKgJZ2rJ4FJOVKNyiXlHuN04ot/gEWfWu1CUOHf9ZoyXhJQOt6iFCLBFq
	6lmMn1XuTkuqYJVMKFpV1bQts/vro6jIATq0RPUeS5EQE6XF1YEF9tYnGz/SXbkvxzO1O2Pt22dkj
	S9/ZPowJzUmX7WbW/FKa9fMbmvVyc6K+G4pNnY8IOCxGLO7Z9TLi6xe/GySrBdMP8yuRo7xgMecIr
	k/HRFDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMt0a-00000000FtZ-1x64;
	Tue, 12 May 2026 19:43:12 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMt0X-00000000Fs4-2SBo
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 19:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci2OuLemlIaMcyrHKORFBd6nBKn1axQGSdPUCfAJkquiO8CrfjQ99uELtQsh4HBgDC+6Zb5TMUKAXFHvJX9mZDf07xLf4JLVsc1TeQUVNdWkT2lPbm34xeXddKWDEESum5cx5cd/7mLLepW6cs8UkkSEsr35eEKfZYl5bjasPRrLk5QgIs//Q3degxeKx3YfcxOfbfxmlaW6zLdRbJiFHmtfpWg66ovOnwywb+u8BLXNYAdZgWi69UKCxXH4wYj1ipmjq84QtwPiWZbmxQPIkXsJVE/aCXE1w9FlruJoEoi69i7HJFZp73nQd6oh57w8kFcVs6zzvJXaId5JbNV//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/dGWhRZKM9FkpcHhB27LvRDloPUtRV3hXQJhGlf3eo=;
 b=o28XV4T/BenxNsQ1Q89J1wRQUy02CbhrNTrrNHcy7+4HYPu303CJtQwf1yaNpnh8l+H1XIVYU4x5S+Dog8Yb22Ivz2oCDMmTCM8dnMS/rxl9JlJdHQeyJtMdDtRSLGafqWjO3P9vlDsMiupahzG3L9OB8utxZz1TGtfuHncWXxXavnNuRKmctK1//U9xAeyYXuutA3GIFg5lqKHuTGcjaQmOTSXARWPR19oJBq3JPTVqdHc8fYm1H/Ckv00OyEUx3sXJjdKpfEztl/IEDGDR55wUZ/A9YKla1Xn1tNo6SdcJBAptoXxfs0Kg2pj0r36+m2uP0f4AEXXwpuMxAo0SiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/dGWhRZKM9FkpcHhB27LvRDloPUtRV3hXQJhGlf3eo=;
 b=gZB7RSnG5peHZ3sPEQ08ckni1ItW2Oc1/BkcoCmwHtD2G5bxuRQLLRDSYkhpuTOCm4nhLwknNDTj7TmINlwc8bqVI5fG4EamB/m3YIIN3/z8cH72nJf5yJR0p0Bhqibc9QhJYWUtmOfqSvXZDIaTgtms9AHUOZVWEorGe9taTZQ5BXJVIOwxqPxPvO6rH8+o4J2ffJ/jtiVMKX6p/KUB9u+DDGhKNj6tgtlcSsLqq9/kVnOwebh72AXZZMa82CPh1N0sA/cSXdIxJj8VcZKnBrlCEIpOoUp30zr9nZNCTf8ytB2mSGATWjIGTRvlde/YeIcFTua/9jGaDJ2tQgdvAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by AS8P189MB2362.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 19:43:01 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%5]) with mapi id 15.21.0025.012; Tue, 12 May 2026
 19:43:01 +0000
Date: Tue, 12 May 2026 21:42:57 +0200 (CEST)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Frank Li <Frank.li@nxp.com>
cc: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com, 
    linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
In-Reply-To: <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810>
Message-ID: <e43cf38f-7878-b112-930a-0f9d3e34a842@est.tech>
References: <20260512121732.406009-1-adrian.hunter@intel.com> <20260512121732.406009-3-adrian.hunter@intel.com> <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0241.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::24) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|AS8P189MB2362:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a09ffa-d802-4140-23f9-08deb05ead30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4+4quNsPXCEsJ1G7QMBpG8ns+dsCN+umK3tLfUKopREKcpIa+0HUdGQaYE1jrN7njgzCPeQM/NA8uOjYmsil0pIzMvvHBUet45CiZ+pCelJWqNFNS/3zEBEo5QtmqSSICfRYhIH1mVpKGOlU6msE7zgy4WIoBVBQB2VZy2qmt1Og++K5B5Az2yR45qGJovz4wAWpoQCV5pgtrzcR0w84ScDSenfe6aViSsSQBEorJCc1D05AUoBt2y2anMPnIu1wsm0Ku2NZHGOKdmcsp6H97lIR+hNzmFzIbFXG+UPNxXx1inq4g5d7LRaWwTvNjQEmMgWUu6MmaLGl7+wBRCrA9A9wxuMIybUNAea9o7RlhC2prJ+w2jFQhnhxVnEay8omT17peSnnuCSxlUkszGsECuDPSLTrHctFNQKSlC/cW5M+FvGrHYSAhRQwxKujg1Pg9x7KB6TgUEuVg6yi1hbwr6L0qncFJpBnP0SybqLix3FWMgrZEVFF2eRmIkfknViWYU5nAZfB9jNGhI5E1OqtLsx4l/Hp8K7bpPXf70XR3sZQlVFdYIK43BEbE3dEfj+LHFR7FQTDOoM/fR1oU/yAaFzADtUF7K0GLkbZJ0ICwZiuGM4/Blw6kOIu/dhAbl/oc/wkHeAjbQteB9X0Fx4IJXYxVx8U8JC5L7CaTBPP4n/1yVXcWwO8zKRUjcD2Qptr0LfcbUOmywKynU056tK7lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6VGCRmkP6wZGh7mRZhCfg7C20bbRR7s3/MhU6tb6Bp0YcbRMhKVRfqyL8qD?=
 =?us-ascii?Q?ldom1+OS0CghwHLFYNPl3elbyw3XOmUQAfOi8U9Ph8udW5U+AXqdNsQpPaNo?=
 =?us-ascii?Q?dkl4IMtA06i2uMdaEhqknrqyiZmGYs2HjIJ8pn4agS5QTsUEVqdjnxAMD6+4?=
 =?us-ascii?Q?v/1l/QWQfee0irLQX10NjPnY23hZXOUY9iDaSTTW986TjQePozCEVeqx8Mgi?=
 =?us-ascii?Q?bcrpP6rKvcaTjP/yTo0ljfgNBADgLhKZ8CHGFVF4p4EhkbMx3fl11YX4IrB+?=
 =?us-ascii?Q?gOOv31/lAyP+DbPk5t30rpQ1tKHmyon+fclN/7U8gijdYXIXlb/5qlXVn9x/?=
 =?us-ascii?Q?bp3Iko/e3Oif+zX8yn+iJIdObpzU4HVdTSYQ9QmIK9QoLR1pwPcQxa74nI2U?=
 =?us-ascii?Q?NLKmkhUM4qsSzrpsqmNPQOWlOHPHWxV9i8Yc7dFuZ/LdHfMhFSgNMmDno+7z?=
 =?us-ascii?Q?fgDusNdDm95GkSVdVDb5oCQQdSIErlAWRTZN+ysbsh0nNmiNAsxHRaUOL1L6?=
 =?us-ascii?Q?fe/e8gHMh1ByxcKvk2VceYq8+lZk8BuVUTTNY6mkE5xHHZr6IGyBm12fuuPK?=
 =?us-ascii?Q?3UZjOx5hEPBX0thWJQoDoYE3obq1IAjF1+mb78js5BmoVYRqnwhx6icutkhk?=
 =?us-ascii?Q?rsABTANqQtgwHRztLR6NihdQO4ZhshCT+BilWqKKzqUwvt28WtIKp6wvgSpQ?=
 =?us-ascii?Q?ARU38pGESTTFCeYpV/pyalac760QXiYV75PwpyMhEuVXDPtcLpqnqgBhQx6P?=
 =?us-ascii?Q?KYtWW1wq9r+PDZizMJPJsC1J0wXFXf9TnTKWdnAd54fwqu97wFRGn6KFBruS?=
 =?us-ascii?Q?5cEt5qzsg9tc4vZoLDkKw/VZCRyYjgtqSgIrKjsX0Q0ho63i/FpthTSD5UgX?=
 =?us-ascii?Q?Ad18Hlf5LzM4cBHznOa0c6vw6T55ilUlkeeKallLEB1p35/1XZYsOrkck3UL?=
 =?us-ascii?Q?6rKSy/lcTKZoLMu23BnfiFalSBtEpV+82B9kiY+hszrRJ5PBzdm0LnTtR9/9?=
 =?us-ascii?Q?TplnqENtDrxJmZpcA7rR+Upcn9Sqd++t+eRbjyqWEg2DWtDsJPZK71vT+t5p?=
 =?us-ascii?Q?S8SQdMmt5klw2y4g/BwC1OM8UzWAxfBRu8GBr56Rm+tSHGc5wXDwPFWsh4Z8?=
 =?us-ascii?Q?aJlsfYNxsrTzOcmaSLPBZmtR4Yss2615EKRQgrTQ0WJrwcJgFdbuhgcilzdh?=
 =?us-ascii?Q?doSHHSWlhszN08QgtjrAkZZFBjKL5tyUGxUeNpQiIcxiToKWtFx6bAX4+7ar?=
 =?us-ascii?Q?xY4hfHxhlITej+QobTuOqKN9tZ9UDIfKn6rmOYD3eACQz6xngqSQmzpVRmD/?=
 =?us-ascii?Q?L/Cqo0jwlrwV1KIXVXpwpRNWC2leBBm8ZEts2bomPR2wOBAbw3AUdiO2x4e/?=
 =?us-ascii?Q?a5Wbt2bnxo0tXNEA+vyAvFc2hu8R2UxOo3dfarSdXpeTX9N4bmnR3F1wXbiw?=
 =?us-ascii?Q?MeU04IY4I46yXYs/sY2ICTJYYEHA5rQ9kDlk7PnPbUgw1D7RB3jct8SweYC3?=
 =?us-ascii?Q?hn0HsQPa3XYeUfk41qjxh5m3f7FEG42tlueBc3DLM+RX4yNAm6W9BH5FtSR5?=
 =?us-ascii?Q?fr4/ynndhvGDTMInCqu10aO6MDB8Y2A7WUxNBJuFwwu7LC3XdpIdylQEQxpy?=
 =?us-ascii?Q?PRO1dg08y2QTbtrtM7xIktCcv/XSKEEST7pn8gVauRgP3opTn21uU/N15wc4?=
 =?us-ascii?Q?c+ZjKz58LChCy56wbgFRj7FeSlZKBEMUBU8YMJn2gPIdlTd5tfx7kgBfobrJ?=
 =?us-ascii?Q?tic+6pU+Og=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a09ffa-d802-4140-23f9-08deb05ead30
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:43:01.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yBV2imPm1tVzXnKDNohYbVlqv6kMZXqShFYOY1NOdDN+G6zsUdYIASnitpcWpAy2LYha0m5v7Ploqvrb2Ej7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_124309_642372_BAB41D88 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On Tue, 12 May 2026, Frank Li wrote:

> On Tue, May 12, 2026 at 03:17:26PM +0300, Adrian Hunter wrote:
>> i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
>> disable_hotjoin() op and updates master->hotjoin under
>> i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
>> bus->lock (down_read()), so it does not exclude concurrent callers.
>>
>> The hotjoin sysfs attribute can be opened multiple times, and writes
>> through different opens are not serialized.  Two concurrent writers
>> to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
>> controller op and the master->hotjoin store from one call interleaving
>> with the other.  The hardware enable/disable state and the value reported
>> by hotjoin_show() can end up out of sync.
>>
>> Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
>> changes bus state and is conceptually a maintenance operation, so the
>> write-side acquisition of bus->lock is the appropriate lock and
>> serializes concurrent callers against each other and against other
>> maintenance operations.
>
> It should be bug fix, add fix tag here.

Agreed, Fixes: "i3c: master: Add sysfs option to rescan bus via entdaa"
Is this series headed for 7.1-rc3 ? if not, its probably wise to revert 
the sysfs addition from 7.1-rc

> Frank
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index ab11e2d79aab..38ffc8713167 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>  			return ret;
>>  	}
>>
>> -	i3c_bus_normaluse_lock(&master->bus);
>> +	i3c_bus_maintenance_lock(&master->bus);
>>
>>  	if (enable)
>>  		ret = master->ops->enable_hotjoin(master);
>> @@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>  	if (!ret)
>>  		master->hotjoin = enable;
>>
>> -	i3c_bus_normaluse_unlock(&master->bus);
>> +	i3c_bus_maintenance_unlock(&master->bus);
>>
>>  	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
>>  		i3c_master_rpm_put(master);
>> --
>> 2.51.0
>>
>
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
