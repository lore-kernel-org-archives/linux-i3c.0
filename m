Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE9CD98C7
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+NHMPjZpFK9dgcNZp67eReu/BkwxSlT4620KP4Fz9E=; b=VkLXr5ttx2r+oC
	AHkvNVJiCS4p7bpVPBRRsfWrZejg1eLc8nMJ/U9sHdHj+ovzpxHuycFk+6PycBxYXdCvtxmcUg58i
	pHsiovAPWNiFDkWhc6Mvj1qSOwxU3l+rZUEc+GmBeMiTPQChUGTIKUasxDdbJN54Yz3v4VLiqf5zN
	5YPXi8nZXdo5MnX/hDhFfCGbdVdgbyuJDTeZEVJXWQFvCQPRUo0WkHQinWxz0KEO1nepRovHHLMpu
	BPfHKpTHU4hqQCP+VuIYWoPtnmO7V0VbTuC337/y1/2T470ngxt0AdA+/oAHimDcK9sDbmOaHrExo
	8zJqGejM8NSPeEVR6eDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi14-00000009jtW-34Xq;
	Thu, 11 Jun 2026 16:12:26 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi11-00000009jss-33Ja
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 16:12:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxEvwCbYvC7jONX5NGxHcvZaTSSsDINVpUmlNqDKyVgOXMvnvLY/oyc6XOAggYj+UoE6i470F9p1ytfWQch812sS/60/L5xsrn58mfI5oLit0WWHGYe6OLfaAgXJPW/GVHX/syx7NbYk5qhbqA/m9+ss27HloKOPMKYVgR0H+3c6CanvBx238jWMXUJl+d6NLnNz6XRCIUDwawia+nkyBP8ZHM4m0RTCnbLsz8CkXVLMXR1uZ7uokLtJB7Ry7/M+DrwYefww6Ieze5NU5lcMhPn7LMwin08SZT5pqHLxnLlMWupKMqB2d4HuJ5rdsC8CuVeWmptFMMjm6swu8x3tMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo4iXhFpsNoU831bH1TCdq/hdiqfdvIxj10cMGys1Yw=;
 b=KheREzoS2bdntLC74ITqLA0ECkASEsDMXzqkk1o9Gmb2Q188eF3hlbSHiPJqHONp7+2gCVnSKxj5yOiHdyb8E5K5ZUGOnV1EqdfGUQ+CWNI3/FW3jhmHOrVcpyCPMncMmvb+ZxlFGHYE/2p0ByLjJdoPTPBHCtvA30cY4KIuNpMirmwCjOoCR+RybkeLgzBpZZ8tL4Yn693ymdb5bk+qBclVth4Vp0fgEQ0buGU+hgffX2Mcw4XsPvXgKwtcegm+RVDTk/i6q0GIKVuAVYQR9OKXZx29Jw5by80S2yc7uz5T2K/h2Op0BmMZOQ5YiPgMX2ZcoCgNeRyZWHlsB1ruaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo4iXhFpsNoU831bH1TCdq/hdiqfdvIxj10cMGys1Yw=;
 b=MmS9S4O7DF1K4AId1zP3bxCR9+bX0rc/X3SQyeH7l79BhhiZBSgtkFBVi3twHsko+ZFZ+ljA+u9ccQqCbncqgZPcMgHW3uT6yO9x9/f1f/VRJbzBdgiquKFaI8ZO0J0OJAOHxb3TKUXPdSGDuNY7hugiPW5W9sPqf0yEOFlWc4DHsYscOASMs+Q9L0y1BxNZ3hvfMYeB6KvDgD1468/5Rc8K7IYEDJikU6ygC4Lj9zSEaY5lFEZr7wLYXKQeM5HXitBLPT12JvKzh+ohbJXBpWvjIlfV7PRibKmtijbr1IbUhRix8tQTL15LV+lffDa33cqqW0J4hcAHUNZWSUcxmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:12:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 16:12:18 +0000
Date: Thu, 11 Jun 2026 12:12:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 7/7] i3c: master: Reconcile dynamic addresses after DAA
Message-ID: <aireW1qbEI6GthrD@lizhi-Precision-Tower-5810>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
 <20260610072852.36934-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260610072852.36934-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0068.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11949:EE_
X-MS-Office365-Filtering-Correlation-Id: 938631b2-2c81-4c98-7dee-08dec7d43573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: BG+zLnsz7aue3kKc1H9nQV3tQhFRWteO7kvZwOm0WdOUwgHLp4Uo9XBK+2ID57sznFDqikdDXRti73Ee9b5le4FVZjgU9v9zNyAvwbqYpSqj3Vb9r8PHiyXpchassABHxUp8FYh0kg8c8RfUU3lKNqMO8KPhnxwSj791GL2lL+15aI1z2ErQJjqNUZMt/6uA9oi7hX23iAMaE7IOyisJjm2pph5sz0XuCSTIUX6dxG63xYysxpYjHjY7EBEyr90vERJWfucE+okT03vdzH8yGGiZRRhZu1xlnLPR+r+/HLCGRQiH153/Dj+f2ZRmzLESeaOrl/sE9GLVkty7/0d0pUndDvH0rVCwVSbl/hlxHLs6YGyTrXMhHQ81x86PCBQ94KZ22uvLqbkuexAuoREYUHX5WP/wExtMoViOh8SOGYcnwhpQCwwEvtPCkPeTknGHk0ZfPBQU5BPGoDO10egEHTgJK29E/fyuPlYZUIHjWCpc4teL4CA9/hhormC7RaGjD+KsTmziXpInBRNday/+ze6CIlWyZAHxR7Xg0GNImOBS0BuPBJRa+x/XsnlC814LqXm3a+nFROaiE1tDIYtaAA7e2CFCfojqNGmzb9VZcKJIMgOQwxa+uAF78BoXNwKPN6qQzpkyPOu86QrWS8O8DyUcfrzkpedTHV/J79vuAh50gm8q1Kv/uRdZA+5635BC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Y4I7n5sSh9k+qaPWtvUW+DMhRHyeFKB5lZuK3VqojGVl2yFNsDN05NTdzjq?=
 =?us-ascii?Q?7yTLQ5sF7RSWHOUngo+wlnbtU3SfknB8na6MzPXQnTaqajApqx2m9RCb3ulC?=
 =?us-ascii?Q?sIxKKeYRdwF3OAwoCyfWuh7xz4/x5AGLa7kX9jXECHUaB4MnR7/sFv8MvSjS?=
 =?us-ascii?Q?y9MfvbAL66mPrh9d9+A8MNlWCPih4f33q+9szz5XZ8Rn6i7v/J0Ia2mfiGMW?=
 =?us-ascii?Q?Ky5c3WO4sidNTkxPfL0GIN6L9/bHDTF0oU1W2pD/mM6sdlkhXE+IGAYwByo8?=
 =?us-ascii?Q?f0l65sqpDY7Ua3NRB/qLch1KFou48Xjik+hlwjZWW/k/cbxUcw4/wLtf4CfM?=
 =?us-ascii?Q?4WhC1oaHdw0TCrZAWS/gZ2YgS5AnFfbiEigldoUZIUvNM8F5KYo7H/p0cSs5?=
 =?us-ascii?Q?+C0WkUhUflKV9I0cB2ZN9QdKrW879U+YeE/2PagV5zTa5isqd531zWSCVKpf?=
 =?us-ascii?Q?XLj/MfgeZpbVBRgjsnNUPJavcIY8JYe/c3o5mIsI7fw2KuzGnuvPfEeoJU0S?=
 =?us-ascii?Q?b6GY+FRl949Gvz4gK3mgELAy5hSByTwxfIr7YUSXgjslESGn1gJR/HG8ZQU1?=
 =?us-ascii?Q?VOh1bbZGfnTby0dr/7TDDGbjtYtXhn6kBxd5byhJltNcCaERyZW+7fnggBlR?=
 =?us-ascii?Q?4FShyCG3xjkDVsPL1P1Hr3gNAo6afZ3t5FZ3lUwuR+YbxgTVyZBcs34a7HaQ?=
 =?us-ascii?Q?GmHjDZXp/7kG2hdB09FxG89OqH+FWEfDRJu6y2cvNgkyxBabTZh9mpnpzjtv?=
 =?us-ascii?Q?fxBAwjkCUN22bXw1c1JCzsYEzEHpwIBESRHkjxJAgMIZXB3XB4GxHXeDZlNZ?=
 =?us-ascii?Q?2Bbcj3iGuy7eA2zc+67jjneXs9Kk4ppz0mKbzJHDqhR1C3CkL8wqaPytVwqy?=
 =?us-ascii?Q?Eu3wlkoeUEFgCpK3v7I2Lzw+le+I9j6+ZxxMjZhv6mu49RFITkZqqjsE62lU?=
 =?us-ascii?Q?406ZJkn4klR+xcP1tnH1uTYlN8h0EzoO5qTYxKBzoVKiwVilb+Nw03seOuvb?=
 =?us-ascii?Q?+SI4kjPaMVBVUZUjLyIq6SOnya4m8z0wlxobM9RpP9twjCAlcCmJVMdr3njo?=
 =?us-ascii?Q?cDwiD2NSy5shjT6HCuOUTFKIq21mlSOEiurBh3IOzw4mq4ZbjCTPNrBjCJEY?=
 =?us-ascii?Q?KxEXNw1yqK2ZJOlpFlfWFrHd+/TrwNA+4+SADQxeyv4flzoXNxEaQec6UIoZ?=
 =?us-ascii?Q?szpVjLpSY66swWmqBZ3StkNyHd7fHqdpMwN2VMgEi47LEb/4L/j9LZE6sCt3?=
 =?us-ascii?Q?t+AD16clm6CyPPTp7+zTYfkCtuYEKr4+oWyEioiD/v1qY/7JTBD3bFUEaDtN?=
 =?us-ascii?Q?iE/aAaxOvnd2yH94gOCXym6N8jlz8xumIH9oKShFaSg2+HEKEg8yJzT7Zpkk?=
 =?us-ascii?Q?p5j6Y2HdDh9/3q5P8MQetSBgLmxfL0M0EduV5S2hMKJ0OeiMKjKjRcXjA35O?=
 =?us-ascii?Q?9TVUcs3BPti/A/Y0ZtRAIA+j//4N22dqq/DZOpgmTaEPgYobJPMYW8RESPCm?=
 =?us-ascii?Q?A7Ud7vlODHzLEwdZjyW3GQJXGMCoMb70MyQY10amcI3xxyq5m6jMZ+UjMukT?=
 =?us-ascii?Q?65HrU/vvh+VeD2okOpEJer/vs1sFurmulWLekuhyEaQMBtqrf5RVPrJBH9Z2?=
 =?us-ascii?Q?W9Dff7uEFSSMjnkrJWxwdqsbKJgDYU9OdnpzuVJhZABbhDEtQe+ZBraG+jzT?=
 =?us-ascii?Q?0sXAkWGtqoM1v77kFhZTKC0Whpkir+T8XwvxUAzjoSQnQ+LTZKQlClHaA+aL?=
 =?us-ascii?Q?ZJvT1W2OwcgNlqbY3yLJjFynbf9cN22qIiy0eGw/YYuJWztc4l2K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938631b2-2c81-4c98-7dee-08dec7d43573
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:12:17.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEDeeTlTlYZ7nCDH3t1QzNR7KZS1d4aZuYhnuTFOoecmihvej0i0j2hcLNBRCYejCXs0jPNqg4j+8TjxEzwuutDGoeE81TCYmHfFaSvwULogB54P2VA6Ce+e/Bn/7dNN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_091223_927222_F5021D10 
X-CRM114-Status: GOOD (  40.88  )
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

On Wed, Jun 10, 2026 at 10:28:52AM +0300, Adrian Hunter wrote:
> After Dynamic Address Assignment (DAA), there may be cases where
> devices have been assigned dynamic addresses on the bus, but are not
> successfully registered in the device model.  This can happen, for
> example, if errors occur during device addition, leaving the bus state
> and software state inconsistent.
>
> Introduce a reconciliation step to resolve such inconsistencies.
>
> Scan all address slots marked as I3C devices by the bus, and compare
> them against the set of devices currently registered.  For any dynamic
> address that is marked occupied but has no corresponding i3c_dev_desc,
> probe for device presence using a GETSTATUS CCC.
>
> Retry the probe (with exponential backoff delay) to handle transient NACK
> conditions.  If a device responds, register it via
> i3c_master_add_i3c_dev_locked().  Otherwise, free the address
> slot so it may be reused in future DAA operations.
>
> Note, i3c_master_add_i3c_dev_locked() may fail (again), in which case the
> dynamic address remains marked as occupied.  A future DAA will try again.
>
> This also handles a corner case where a device is assigned a dynamic
> address but not successfully added, and subsequently loses that address
> (e.g. due to power management).  If DAA is run again, the device may
> receive a new dynamic address while the old one remains marked as
> occupied.  Repeated occurrences of this scenario could eventually
> exhaust the dynamic address space.  The reconciliation step ensures that
> stale addresses are detected and freed, preventing address leakage.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Add comment about the source of I3C_DEV_PROBE_* macro values.
> 	Also account for static_addr in i3c_master_reconcile_dyn_addrs()
>
> Changes in V2:
>
> 	Add bitmap.h include for bitmap_zero() etc.
> 	Re-base due to changes in previous patches.
>
>
>  drivers/i3c/master.c | 119 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 117 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5021d25b718a..367e0d6d4a64 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -6,7 +6,9 @@
>   */
>
>  #include <linux/atomic.h>
> +#include <linux/bitmap.h>
>  #include <linux/bug.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -1613,6 +1615,57 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>  	return 0;
>  }
>
> +static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
> +				       u8 addr, u16 *status)
> +{
> +	struct i3c_ccc_getstatus *getstatus;
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	getstatus = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*getstatus));
> +	if (!getstatus)
> +		return -ENOMEM;
> +
> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETSTATUS, &dest, 1);
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (dest.payload.len != sizeof(*getstatus)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	if (status)
> +		*status = be16_to_cpu(getstatus->status);
> +out:
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}
> +
> +/* Values are chosen to give the device plenty of opportunities to respond */
> +#define I3C_DEV_PROBE_INITIAL_DELAY_US	20
> +#define I3C_DEV_PROBE_DELAY_FACTOR	2
> +#define I3C_DEV_PROBE_CNT		5
> +
> +static bool i3c_master_i3c_dev_present(struct i3c_master_controller *master, unsigned int addr)
> +{
> +	int delay = I3C_DEV_PROBE_INITIAL_DELAY_US;
> +
> +	for (int i = 0; i < I3C_DEV_PROBE_CNT; i++) {
> +		if (i) {
> +			fsleep(delay);
> +			delay *= I3C_DEV_PROBE_DELAY_FACTOR;
> +		}
> +		if (!i3c_master_getstatus_locked(master, addr, NULL))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void i3c_master_put_i3c_addrs(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> @@ -2256,22 +2309,25 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  }
>
>  /**
> - * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> + * __i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
>   * @master: master used to send frames on the bus
>   * @addr: I3C slave dynamic address assigned to the device
> + * @probe: probe to see if the device is really present at @addr
>   *
>   * This function instantiates an I3C device object and adds it to the I3C device
>   * list. All device information is retrieved using standard CCC commands.
>   *
>   * This function must be called with the bus lock held in write mode.
>   */
> -void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr)
> +static void __i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> +					    u8 addr, bool probe)
>  {
>  	struct i3c_device_info info = { .dyn_addr = addr };
>  	struct i3c_dev_desc *newdev, *olddev;
>  	u8 old_dyn_addr = addr, expected_dyn_addr;
>  	struct i3c_ibi_setup ibireq = { };
>  	bool enable_ibi = false;
> +	bool no_dev = false;
>  	int ret;
>
>  	newdev = i3c_master_alloc_i3c_dev(master, &info);
> @@ -2284,6 +2340,18 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
>  	if (ret)
>  		goto err_free_dev;
>
> +	/*
> +	 * When a dynamic address is first assigned, there is no need to check
> +	 * whether it is still assigned, however, if adding the device fails,
> +	 * it will be attempted again later, at which point the address may
> +	 * have been lost (e.g. due to power management), so for that case,
> +	 * probe to see if the device is still present at the assigned address.
> +	 */
> +	if (probe && !i3c_master_i3c_dev_present(master, addr)) {
> +		no_dev = true;
> +		goto err_detach_dev;
> +	}
> +
>  	ret = i3c_master_retrieve_dev_info(newdev);
>  	if (ret)
>  		goto err_detach_dev;
> @@ -2401,6 +2469,8 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
>  	i3c_master_free_i3c_dev(newdev);
>
>  err_prevent_addr_reuse:
> +	if (no_dev)
> +		return;
>  	/*
>  	 * Although the device has not been added, the address has been
>  	 * assigned. Prevent the address from being used again.
> @@ -2410,8 +2480,48 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
>
>  	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
>  }
> +
> +/**
> + * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> + * @master: master used to send frames on the bus
> + * @addr: I3C slave dynamic address assigned to the device
> + *
> + * This function instantiates an I3C device object and adds it to the
> + * I3C device list. All device information is automatically retrieved using
> + * standard CCC commands.
> + *
> + * This function must be called with the bus lock held in write mode.
> + */
> +void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr)
> +{
> +	__i3c_master_add_i3c_dev_locked(master, addr, false);
> +}
>  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>
> +static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
> +{
> +	DECLARE_BITMAP(dev_dyn_addrs, I2C_MAX_ADDR + 1);
> +	enum i3c_addr_slot_status status;
> +	struct i3c_dev_desc *desc;
> +
> +	/* Mark all devices' dynamic and static addresses in the bitmap */
> +	bitmap_zero(dev_dyn_addrs, I2C_MAX_ADDR + 1);
> +	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> +		if (desc->info.static_addr)
> +			__set_bit(desc->info.static_addr, dev_dyn_addrs);
> +		__set_bit(desc->info.dyn_addr, dev_dyn_addrs);
> +	}
> +	/* Reconcile the bitmap with the bus address slot status */
> +	for (unsigned int addr = 0; addr <= I2C_MAX_ADDR; addr++) {
> +		status = i3c_bus_get_addr_slot_status(&master->bus, addr);
> +		if (status != I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
> +			continue;
> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
> +		/* Try to add the device, but probe to see if it is really present */
> +		__i3c_master_add_i3c_dev_locked(master, addr, true);
> +	}
> +}
> +
>  /**
>   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
>   * @master: controller
> @@ -2445,6 +2555,11 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  		if (rstdaa)
>  			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>  		ret = master->ops->do_daa(master);
> +		/*
> +		 * Handle cases where a dynamic address was assigned but the
> +		 * device was not successfully added.
> +		 */
> +		i3c_master_reconcile_dyn_addrs(master);
>  	}
>
>  	i3c_bus_maintenance_unlock(&master->bus);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
