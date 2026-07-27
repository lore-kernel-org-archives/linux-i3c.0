Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FEDC53219
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jul 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8HFLeBHuetMxiEgG35eVMkCvZWf8frL7FeoUZ5fVHU=; b=jaRgAdO8Okn1cJ
	V57dsWZQq11fATAgZ74y72bUDM8Dzi4cgSav4uLmif6rKY/gt1IZirovcn7wx2aZ/UuSBpR6ezMvN
	QI2E2VDaUQo2y2F4k6Nhmv31SjPlNGHqVCKpB1Aif/xoyir6uOPNrFCCK8A0oWKke1tAyBBm3Pf5x
	i2m45undwP/UPYFTnKZqYruGcpA6T2g/zvYVId7p095ray76cOMod6gqMyGaEEMvbsfiLLJWf8qUH
	ElTLdCnrYWKRroNbg4FtSYdhoKZCzrCr3INv4V5rCN+nSK+F6gQTdAtoJEJO4zSwCXRLyYW17UFRS
	b+mipZ7X0GG+KyoIaTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGgG-00000002EXx-0WEy;
	Mon, 27 Jul 2026 08:27:24 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGgD-00000002EXO-1QA0
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jul 2026 08:27:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGKO/VEnmvS3Ulu38MzgfmmdC6Wg1bFDwB3ICwFs3lKX9XeIbhrp598sS4BUWK4OpQ3wFnKfLveL+lZHF6PqrmF5kpdl44CJ2gWLwuSR3WNnR74EipWiaqiERjSzpuuIoPBd86YgMHTIBx27QlC1KrGfWqnF4VVJbOBgtuaHlh88buk6RBIQVljM3TOSjxH0JYkJbqzmzs/+LFnpM96IpoqUfkEDsmqGW231SAeMXI7kKo0jk8mavfiQiwGiVGwY79jKAEdHdNp7ETqpKfaPNeZ0du5+bxuRFZIhCu0XIKB30RIxbzJCdEqmkwUIZynnsWRtIDZPhrulPA9WPXbWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEUL6RMkO5Ob4+HE54L8S5nfpH2cYTERr0wxB3G7Eco=;
 b=MRq6irCZ6BNe0Zwep4P/WzuFpp5/8oeMhUOlbUpJWUpL+bvB0Q46KLvc+jnj29WzShK73U9PPygWlz42v9uELulM6Pw4FKUHLWwLGTuBi442PwU+V5P8f8tzUCQCnoiVq9GBD2dFdxp7LwQE6hlB+QJSkJTDcwb+jb5FT1OjAqo4uaUzWEbdVVDDXn2kyX4MQ/8ZXsOXBGoFvAe4gCRIkWBKw8GSQlV/GWifh96mCYmZFzxfDrZlxSBVal6lYWlwCqoQkMjUbPQVMNf8qyzkWlaAUvVtXmiROMTac0bJPjJkdiKKrsBmoDfn6usUWheTq4IJqz/DUSOU5OnmXIKBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEUL6RMkO5Ob4+HE54L8S5nfpH2cYTERr0wxB3G7Eco=;
 b=GRqporGdiV3DWBQ6O+KmC6hkN1ZVeyfHbMD00FrLadX9lXDP2tfYBR0vwEtvkju3J00It9xWAX2/1awohluf5VruP9EhP6YKmY6kdi/SFOrZUMxq6/KcTxNnYebXBV4Hv1w7EVRtQbeEZZ5HpjelD8I6QO6akGNipwUyPUcZ9OyHbAfqgZjNlbNU2gw8n2Ikd3Ahkgq60UOVV/aag6iCXb7G86AU+lhxXBuUlg9HZ7Impj9zwn2A5jYmKNI+Mr8XcpdHdhMZVtbgLHVikfYPW0q6d0OJeYXsv4jaIMh8htiCHAlm6S34Rani93kv9nOaWEwoUeIGDJQ97xvX9RUUkQ==
Received: from SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::24)
 by BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 08:27:13 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::c) by SA9P223CA0019.outlook.office365.com
 (2603:10b6:806:26::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 08:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 08:27:12 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 01:26:59 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 01:26:58 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 01:26:53 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <adrian.hunter@intel.com>
CC: <Frank.Li@nxp.com>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<robh@kernel.org>, <thierry.reding@kernel.org>
Subject: Re: [PATCH v6 02/12] i3c: master: Use unified device property interface
Date: Mon, 27 Jul 2026 08:26:52 +0000
Message-ID: <20260727082652.93876-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <97465893-3650-4f37-98b7-1db76fc6fd03@intel.com>
References: <97465893-3650-4f37-98b7-1db76fc6fd03@intel.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: ef116135-7537-40c2-aee1-08deebb8dbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: atm8meFF8zNEjhxyQ0fttt7JWAesZwBCGU5KYWL//+dfucnLP9inHvV5p4kZ4aDvr89vlBg9fzIwCEkc4lEiWjiQXfZeR9yZPmxfvWkI7OGCopTGZe0vsiOREi9a3z+NmJmxxx+ZI8KsJKzQs7XkpkJ+3CYZP3TIIBz3S/DfUMrlLOukh+Eb5NM4q+gWLwqlm6aW4u0+VQxpc6zUBSZFEC6Wtop6k/93CK1upFAtsiyEP/E/5GaGPzuFBJEVlTvCKIcgL+jmb6nRwboai28ds0Y6xdENgcoraqoYYVHusYW/sjVMEhP7Hea1PpLD9KktC7u5k9l6BOamEXMLIcTnYg5nmGLTCWOOZyz2iPVRxH+PM6UW18AFVc5XNlQXoDjrtNVQrwg8vN6ZMAtZPF8wtd5UphhOlUHBwT80HGQVBd/1DqnEc5OqMwYIgbcfZgz6GyPSyDdolt162IVpM4ZYZs68YqW3ZlIvBHZYmod7mVI2cfZWF1TeDW94LjfPRFtby75hznEVmy8+G7tMUtvRvWh4zMVhQSZsHnlueh+yBsLdY9e3lKsy0qLhI5EY2m5RN0Zp4iZOthcF3F/FcGVMtZUkvGY4AFdJg0JEClLwPvg6xKWaU1Xbgf3UqLaJniyaM4L9b0znY7VuHUlxLaE9xQSomYnHH0nhlroVWk2vnFkH2PxrmOwzR6Nt8m4Uu7eYctp6wXMd6BlHf5uH4NI2RQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WG1Qlm5MD9fTEFv9arBlGRqIlVhrVSw1KMccV8xkL7/G+8RUmYF+JlO5q4dVqorz+3gZZe9CQ5pzVikp4zkODT3GLJYe9eQef1ujCrIlSI6N9BB/A+XQ53UphHbzH9YxBM9dyBVc4IhYSGH5Xcjjm1xvw/joCmAEdf4RG+IWmwJd7F8JIXVyyK7C1WtAL09RM5PbVvCCJaS/1aqvfzhrXuvjxPziD9mIdQ72rUIkis2IY6ZNdsynei1hanBFEUObNjIMjjPLA/B7AVNJ5WV7EuutAKTyvRT2XpZqyYaTvPdm2idDBIjwNgunZ9C9R/g14vPp9gx0hZUdHorEn23xvB7OJm5OXR5xFQl57ld/Qg6FHBKdcLoYXdNjUeYJGwZx8jXCx9w7m8B3tWuxo7LevhcXpk6U0JaRi4lHNFjvAaOxnFsuuhooKaRTMMUUKQTC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:27:12.4281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef116135-7537-40c2-aee1-08deebb8dbe6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_012721_379599_053871ED 
X-CRM114-Status: GOOD (  17.42  )
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

Hi Adrian,

On Wed, 22 Jul 2026 13:38:43 +0300 Adrian Hunter wrote:
> On 21/07/2026 07:07, Akhil R wrote:
>> Replace all OF-specific functions with unified device property functions
>> as a prerequisite to support both ACPI and device tree.
>> 
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>>  drivers/i3c/master.c       | 77 +++++++++++++++++++++-----------------
>>  include/linux/i3c/master.h |  5 ++-
>>  2 files changed, 46 insertions(+), 36 deletions(-)
>> 
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index f1be38a640ca..4b3d9628bc39 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -13,10 +13,12 @@
>>  #include <linux/dma-mapping.h>
>>  #include <linux/err.h>
>>  #include <linux/export.h>
>> +#include <linux/i2c.h>
>>  #include <linux/kernel.h>
>>  #include <linux/list.h>
>>  #include <linux/of.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/property.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/workqueue.h>
>> @@ -491,7 +493,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
>>  	mutex_unlock(&i3c_core_lock);
>>  }
>>  
>> -static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>> +static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
>>  {
>>  	int ret, start, end, id = -1;
>>  
>> @@ -501,8 +503,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>>  	i3c_bus_init_addrslots(i3cbus);
>>  	i3cbus->mode = I3C_BUS_MODE_PURE;
>>  
>> -	if (np)
>> -		id = of_alias_get_id(np, "i3c");
>> +	if (fwnode && is_of_node(fwnode))
>> +		id = of_alias_get_id(to_of_node(fwnode), "i3c");
>>  
>>  	mutex_lock(&i3c_core_lock);
>>  	if (id >= 0) {
>> @@ -837,7 +839,7 @@ static void i3c_masterdev_release(struct device *dev)
>>  	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
>>  	i3c_bus_cleanup(bus);
>>  
>> -	of_node_put(dev->of_node);
>> +	fwnode_handle_put(dev->fwnode);
>>  }
>>  
>>  static const struct device_type i3c_masterdev_type = {
>> @@ -1044,7 +1046,7 @@ static void i3c_device_release(struct device *dev)
>>  
>>  	WARN_ON(i3cdev->desc);
>>  
>> -	of_node_put(i3cdev->dev.of_node);
>> +	fwnode_handle_put(dev->fwnode);
>>  	kfree(i3cdev);
>>  }
>>  
>> @@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>>  			     desc->info.pid);
>>  
>>  		if (desc->boardinfo)
>> -			desc->dev->dev.of_node = desc->boardinfo->of_node;
>> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>
> i3c_device_release() "puts" the node so there should be a "get" here.
> Should probably fix that before switching to device properties.
>
> Also seems like the of_node_get() for boardinfo for both i3c and i2c
> has no balancing put.  Again, it would be good to get that sorted out
> before switching to device properties.

Thanks for the review.

I understand the issue of unbalanced get/put, but given the size and
spread of this series, mixing it up with fixes may make it difficult
to review and may dilute its intent. This patch is a 1:1 of_node ->
fwnode conversion and keeps the exact same get/put balance, so it
should not regress anything.

If you agree, the fixes and pre-existing issues can be taken up
separately.

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
