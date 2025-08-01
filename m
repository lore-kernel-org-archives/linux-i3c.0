Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A40C87FCA
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Aug 2025 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CacFZLmp4baXFBFDYVS0PFjyJsYucVnQWKVssaaGoCE=; b=t3t6zUGSphF0CI
	OEW93xZ8LpMIE5rS+Lv0sgbfn2Zg6sZoUoxekwYALd8uOamemSrcBsY/GLAeBtKkazzwjF7Yqd5bB
	KTw9vJHerkCHxIURXG/vPGRTOvWnFmPgg/slfdScauSpEcpWTT2CWvPJfYWDx0b4AOEVgU9+aIz7V
	FQrrVWZX8JU64cvZGOftQ+Y0c3Zi/5mTFKgnhRJRsOy4/biaHeGxjbt0v639SsdF/2tqlm/aLluAt
	BJQ7Qb4aLMZJjM3FmzrwKEkBzwiFLTBWy9qCjMQkWx4KNjUPTgNnJA4U1MDmxJNRRht3PB6vRO4Gc
	gz4LrJVpMCtJcWDk1y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsE2-00000006PBt-0gEC;
	Fri, 01 Aug 2025 16:03:18 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsDz-00000006PBT-28y0
	for linux-i3c@lists.infradead.org;
	Fri, 01 Aug 2025 16:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zS/Wi5Mbis+TAG78d//IstD1mCkKFwmAYbPE3GV30AKYjJbcq7UwqGQoDyrwlfW6AP64UUA8LVn12Afd1bmoSh91g2iL1nY/b9mvFCzrkEt7vIoiirRNh1yJImJr7YrJbaxFTorhojDKgCZVfveYV9DASd+68OIyQtF0inbsx+JGhpY25u23u/1x4F9UlWIB/k9twCpW5bqpKl7zowe8pSnGV1rprSpeaviDjod6oJwK4En2s6yGGMBueQ7YQZlRFosyadIgVwROhzsf+nnNcilygwTAv8ZvS1o+iEEZ4QCEzFgeIKiBCxWRE6pvYFIKRa97bYRg2kVCylz189otEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQGxWNzR9bNtPN2urww+Rg2I2PxPmtIyFcClGVMoFS8=;
 b=cJMm8P4uN/MjWe6mXB091XeLiiBD3AsHHHBrwfzd7pNLI1hzCe5JR9/1dosLCxbzcw3C4bxOrkhahfJ8ePCgIrFiR0NHQIdaGAUqsOMthwVfpH3wn8Pl5mAKAVqvLIpHQMZ3WeJxlMCEbb+F195+xpJ0+W0OY6GAyDm/kzn/yv6/3HLtMNJ7Mr1cR4JmYDXH3T91n7by9XhbG+MUUoXwTIIT2Odnk4eEgtvoj1d/tM8BlSvbn6m+adRJEaUEahXrgLWaj6qc8BGkFd5vQhGpJUFpBlxqPvA4D95e7+kK+bRlEK8eQe+CGij8VdkGbBfuqwZ1UAbpWW1TOUTAAR+V9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQGxWNzR9bNtPN2urww+Rg2I2PxPmtIyFcClGVMoFS8=;
 b=M4JzLZlfrRbEqN4zX/wdXfi+3xyl7kRO47/Ckyuhu5AmVJDW92Peji5+loicY7hk3JI5+FMab+WZ7bkpFZiCw46rS3ZZFRAsCQE6VagOAkEP+v8zS/UiSyGfs0W3tAVtWIbgzqL1/Wu/plUPckZq7MZr5oIyQWW2RrZuHiag9Ec71ptbqeROXPlBQyq3pNaLZfwVcVYGN3eluQGFj3LLaMjE2aHtQ3ocg7Jx/0q+w4a8e1IPcZtwwmEy2qRrJtOsl7lnDjJ3nBbo/91Qyafxnw3YW3QMBpR1v6sPN7iFqti9Oa29gTTpsTu90HSHu2cMHCGbt3vW9seEoAtU6v7TEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11433.eurprd04.prod.outlook.com (2603:10a6:10:5d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 16:03:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 16:03:06 +0000
Date: Fri, 1 Aug 2025 12:03:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: Re: [PATCH 3/4] i3c: mipi-i3c-hci: Use physical device pointer with
 DMA API
Message-ID: <aIzlNOxl3R6LMczU@lizhi-Precision-Tower-5810>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
 <20250731141420.422525-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250731141420.422525-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d8e3db-65a6-4ef5-1daa-08ddd114e742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pPwXQAFN1TR2QOnLQN4bz4wzvSC8fgEJSeg9TUwMWDDl/DGbey6XZYSk/2x3?=
 =?us-ascii?Q?4txqmgPkIhH2iC+PE00ZEHhpzD4zNcyBuBe120Q0WimvwkrpM3jEhkwb/Wu0?=
 =?us-ascii?Q?6o0yCRFbG8L/1OtmNfHv6dPFkIOTqlM/bwlonV7CWaF374iTRIsTJRGcB2ZO?=
 =?us-ascii?Q?fFdHJN0D/aEalBf7BF7spkpS8mrvF1ojoq9vkJbXGUofrh3gkNl7Kf8+j5II?=
 =?us-ascii?Q?SOm/zcz4pnjxhrneXDZbK8/EIlqbZEzlG9RWmzY5ZaK52WGixG5sqRiox2S2?=
 =?us-ascii?Q?Ejf5hqBialDpc3HiVCQgaYpJtr4tGEUvWhmX/nIDvBWP3UyA+Wy1p+8Z/epE?=
 =?us-ascii?Q?cApWcQt7Tuq2vAyjZKq5nUsAJodiurAVWK8FHGPf/4SVXeeKAOCAXCf2caZD?=
 =?us-ascii?Q?VOBrArS5RdEwOdKytnlDRcqF1LJVfeX56rlvGuCnsmhhJUDioh78MZn/NXbk?=
 =?us-ascii?Q?9aUYwRQhpdWpKOKJBvIswoMHgHaynEYjWFsY+u0noL62F/rDRFlza9mQA3fD?=
 =?us-ascii?Q?LVxd2loM5wnfuWOdoCH4r7jyLEjXwksT8GDaBw7Ea89TQUKCd3Ehg9mqV3GD?=
 =?us-ascii?Q?aRfGodRpZwHzvJGqQGu1sf2LneeWHhgf2VrCDAK0gvW63KYhv3xjam6bxVnR?=
 =?us-ascii?Q?z31H/HNbpx/SftGUqXEl66QNalIcgR6zVG00kd/kqEGRAgL5wQBY0Ua09TcI?=
 =?us-ascii?Q?gdPQeCv5OT5Rco3EY51x64c9Mont5thLBQXvU57bVRZeBFzilGS1pEijL8rF?=
 =?us-ascii?Q?5COjqrjd0wWkjmSAOmTfjUvJ+5PUOuEaeyaespY8uZhkRPDZiNg+RKuCaQJj?=
 =?us-ascii?Q?yX2Aq+f/0Q25AknVQNUs4D/LYIZtEu+rXrmxC/lqn7OZ1a532X+qWyOSN2OW?=
 =?us-ascii?Q?25SCR1KMgluQmRN8VnI8aEfwx+xuBgjoAsc3qblbBoe3/RYP452+i/kPtUvr?=
 =?us-ascii?Q?dTHi3PuugIzl/GO2sVimZfGOLsfBkoZxUmPLz9jPZgV+0M2lVyzAzLchDcJF?=
 =?us-ascii?Q?z443nsorrTuSGqxFyH1HFF1vki8lmCmi4FogiRveuVIduPZsH3FjnWbsgUFm?=
 =?us-ascii?Q?NUJ4J3j+AAkQH+yZyGwK6TycCl9gIVrrJc0BZwkf5dO82w4M5m9Afw4Rf53z?=
 =?us-ascii?Q?u/LGDP49Gf8oRaAq9gcAMblH9jDZwXfXG1Mcu8tbt9R/SPpGa8CXk4Kl9tPK?=
 =?us-ascii?Q?A2XgL4KPdohkqFNsHk3/GetkkKb3v63Nwiio9scH98uUJZpeQBeCqmo1UjHW?=
 =?us-ascii?Q?Whq2/YZa0PO/9vA1kuUPc0by1m+g8AHV4l4jvvbn2KdYtc5yrUAOPUGmRDAs?=
 =?us-ascii?Q?b0gCgU2dgkh9SEAKMWNlj341Sc5NX7zHCEfzyIq9q+e7QETwFLJrvyyixvQa?=
 =?us-ascii?Q?2kP+NuW/cl+VOOO9Ijvb3hfTahD+VLGYkURaCk0zfTFSErkDyAa1bcC4nLHU?=
 =?us-ascii?Q?A7A5Im6dq35M9WplqKocdJWRPhndu67V1RXvsz9vi0emQ911NDTMVEW6352B?=
 =?us-ascii?Q?bg+jwswRncdtSlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSc6vGumcKQ1WjUDq2/SC5tkMMrqvowhVAZIrFSxbovTy7u4itI2E6mPVqB/?=
 =?us-ascii?Q?kt1W0xHq9Vhr0QuM9o5K52CWOAstXmwSp36yDQ3zfLaUlkiujCGQeejX1Kyx?=
 =?us-ascii?Q?WZv19yTYgY/Vi50S9msmDA1Hwa4cxpckw742tHsRS1fNwknl19EQ/W62J6mp?=
 =?us-ascii?Q?XyZ+D9FNgM01YQdqZo2pBwQKOriCkQFkVlXuRkiU0xnxvER2ae01bmB49ZyW?=
 =?us-ascii?Q?EbW4nh7wqb2HBEnyB7HaCnFZb9nYJMJ95hBjuX5o9wKFtFpbicBh+qbIDGh4?=
 =?us-ascii?Q?7oX62OGamHySv2IDTQre9tVjh/vQ5hkdn9xNbyYl7hIMpoxhkX3DVfKvXevn?=
 =?us-ascii?Q?iPrgkkLVlC9wHy4owD7G6ZEJ/DoaCxKfQYAGyKCvS79E5aZVBVllr6rpfhOA?=
 =?us-ascii?Q?/KilKQov2fcSWzGs7O7QdDvjCaqz19FJfeg6WEzfD4sen0y+F6uZOwqjDJUJ?=
 =?us-ascii?Q?9m0WJ20H/pvEp9UqL2iMQ0pYgd8FOZW4KOn168kgBqWIu2xdqmy3Ba2CrIKV?=
 =?us-ascii?Q?eeHQ9V8LVnbA4hOAo7TzUujvW7jHWSnYu2ZewgPK1RMtqyz19b3TxjYmlme+?=
 =?us-ascii?Q?3pDaY/HRgSkn3BoF8kNa/S7rKtl8ihhNTo4KDy7JjDspnjdCoIWKlWUZlNko?=
 =?us-ascii?Q?iUx10RsyspgrGsI0lNgtofMng7vbygfgGPTRXQnEnXGK4VBdYCq7kJMnoM8A?=
 =?us-ascii?Q?FVjXxIunOWdJCFECXPQRz+3sVzbTx5Qj1p5z7OYTBiZc0i8BE8YYyIEHJx+l?=
 =?us-ascii?Q?aiALwqInUKhPneBq97r2Fny1OAdOJtWcgTiWNVEdGSsRQau1Ns4ijj0HrXMc?=
 =?us-ascii?Q?9XodxWo8n1TqOW8dXWEfjj4WU67w4TY7EAzyUnKkZCu2TqUIqZr8r01SHzgG?=
 =?us-ascii?Q?uXKqxHBuYCQ9ku3/mXnGS0YnTWN86qyHfifX9bqPj6S7KRWMqMZcfDpELNWX?=
 =?us-ascii?Q?eY+lWMGEzdd93Uga1rRsCQXsqSAAn2zcA1Pnt+NGgHiqgGYEvAq7FlbiMHYE?=
 =?us-ascii?Q?E91c2mDrFA0DbLAgSy+Zt9WwD/6WNmMO9SLIK/V7ZG3gxDM6HgJ0JN5egkNx?=
 =?us-ascii?Q?irPqVrw/IT2kJTQYpzp0CwH//agt6oANCcX/zBh71K8GydSqi+E78X82qg7n?=
 =?us-ascii?Q?NKQOa7uTf5XTC5m5MA5PVcaDOryTdHvBkEnaS1lHhfhMjLdytykbNEr3O5IR?=
 =?us-ascii?Q?CK0l2ugi35dIYDgVJ0+zb9O+qwlUBjxsvjbftdc4uDR1REkMUbl+Lbn9mfXO?=
 =?us-ascii?Q?+Yr1PdY9rbS9vSKO7izKXGaW3EiyBkTi1L7DlIbHYnOPdAxdRVXGvX/VRGvP?=
 =?us-ascii?Q?CSl8JJAlbV8zlmErVqKYQcFQC7VjFDq3Jj+ydgbR6qJOQFBD3b6GPnML7nqm?=
 =?us-ascii?Q?DJJMNVbLYofP2fz/v3mHMzO20ZIIV0ViIbDuZsT5guPYABxsQ7mvxajzc0uv?=
 =?us-ascii?Q?AdlVoiY5AD/p149Ca2YdMFfEEbjgsIquhYfllpAsmI9ejSYUYWO/ydMjZjMz?=
 =?us-ascii?Q?qgxg//QHW6L4yq0hsy/rUaf4NaZp1a0Txg/9zuueLLmVq8/19NkbF5h6penn?=
 =?us-ascii?Q?/TXodJDyF8NRXz64ZyejIAr9uPUjzrvMiHD9Z63n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d8e3db-65a6-4ef5-1daa-08ddd114e742
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 16:03:06.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0qQanvxAiWZtMmgr9wdrgvXsJwPBwhZF6KcDDDs/xI7RDY+L+fXmS8WV0/0PUXtH0Sdd3pNHBme4POW5WImQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_090315_717177_7ACCAB7B 
X-CRM114-Status: GOOD (  31.16  )
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

On Thu, Jul 31, 2025 at 05:14:19PM +0300, Jarkko Nikula wrote:
> DMA transfer faults on Intel hardware when the IOMMU is enabled and
> driver initialization will fail when attempting to do the first transfer:
>
> 	DMAR: DRHD: handling fault status reg 2
> 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry is clear
>  	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
> 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
>
> Reason for this is that the IOMMU setup is done for the physical devices
> only and not for the virtual I3C Controller device object.
>
> Therefore use the pointer to a physical device object with the DMA API.
>
> Due to a data corruption observation when the device DMA is IOMMU
> mapped, a properly sized receive bounce buffer is required if transfer
> length is not a multiple of DWORDs.
>
> Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 49 +++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 669d026646b4..af1c9c97fb3d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -14,6 +14,7 @@
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
>  #include <linux/io.h>
> +#include <linux/pci.h>
>
>  #include "hci.h"
>  #include "cmd.h"
> @@ -138,6 +139,7 @@ struct hci_rh_data {
>  };
>
>  struct hci_rings_data {
> +	struct device *sysdev;
>  	unsigned int total;
>  	struct hci_rh_data headers[] __counted_by(total);
>  };
> @@ -165,20 +167,20 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>  		rh_reg_write(IBI_SETUP, 0);
>
>  		if (rh->xfer)
> -			dma_free_coherent(&hci->master.dev,
> +			dma_free_coherent(rings->sysdev,
>  					  rh->xfer_struct_sz * rh->xfer_entries,
>  					  rh->xfer, rh->xfer_dma);
>  		if (rh->resp)
> -			dma_free_coherent(&hci->master.dev,
> +			dma_free_coherent(rings->sysdev,
>  					  rh->resp_struct_sz * rh->xfer_entries,
>  					  rh->resp, rh->resp_dma);
>  		kfree(rh->src_xfers);
>  		if (rh->ibi_status)
> -			dma_free_coherent(&hci->master.dev,
> +			dma_free_coherent(rings->sysdev,
>  					  rh->ibi_status_sz * rh->ibi_status_entries,
>  					  rh->ibi_status, rh->ibi_status_dma);
>  		if (rh->ibi_data_dma)
> -			dma_unmap_single(&hci->master.dev, rh->ibi_data_dma,
> +			dma_unmap_single(rings->sysdev, rh->ibi_data_dma,
>  					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
>  					 DMA_FROM_DEVICE);
>  		kfree(rh->ibi_data);
> @@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
>  	struct hci_rh_data *rh;
> +	struct device *sysdev;
>  	u32 regval;
>  	unsigned int i, nr_rings, xfers_sz, resps_sz;
>  	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>  	int ret;
>
> +	/*
> +	 * Set pointer to a physical device that does DMA and has IOMMU setup
> +	 * done for it in case of enabled IOMMU and use it with the DMA API.
> +	 * Here such device is either
> +	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
> +	 * grandparent (PCI enumeration).
> +	 */
> +	sysdev = hci->master.dev.parent;
> +	if (sysdev->parent && dev_is_pci(sysdev->parent))
> +		sysdev = sysdev->parent;
> +

I am not clear about how i3c master controller device create in your
platform. If use DT, i3c master controller should direct refer to a iommu

i3c-master@123456 {
	...
	iommu = <&smmu id>;
}

Is it children device of a PCIe devices?

Frank

>  	regval = rhs_reg_read(CONTROL);
>  	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
>  	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
> @@ -213,6 +227,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		return -ENOMEM;
>  	hci->io_data = rings;
>  	rings->total = nr_rings;
> +	rings->sysdev = sysdev;
>
>  	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
>  	rhs_reg_write(CONTROL, regval);
> @@ -239,9 +254,9 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
>  		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
>
> -		rh->xfer = dma_alloc_coherent(&hci->master.dev, xfers_sz,
> +		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
>  					      &rh->xfer_dma, GFP_KERNEL);
> -		rh->resp = dma_alloc_coherent(&hci->master.dev, resps_sz,
> +		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
>  					      &rh->resp_dma, GFP_KERNEL);
>  		rh->src_xfers =
>  			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
> @@ -295,16 +310,16 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
>
>  		rh->ibi_status =
> -			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
> +			dma_alloc_coherent(rings->sysdev, ibi_status_ring_sz,
>  					   &rh->ibi_status_dma, GFP_KERNEL);
>  		rh->ibi_data = kmalloc(ibi_data_ring_sz, GFP_KERNEL);
>  		ret = -ENOMEM;
>  		if (!rh->ibi_status || !rh->ibi_data)
>  			goto err_out;
>  		rh->ibi_data_dma =
> -			dma_map_single(&hci->master.dev, rh->ibi_data,
> +			dma_map_single(rings->sysdev, rh->ibi_data,
>  				       ibi_data_ring_sz, DMA_FROM_DEVICE);
> -		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_dma)) {
> +		if (dma_mapping_error(rings->sysdev, rh->ibi_data_dma)) {
>  			rh->ibi_data_dma = 0;
>  			ret = -ENOMEM;
>  			goto err_out;
> @@ -342,6 +357,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  			       struct hci_xfer *xfer_list, unsigned int n)
>  {
> +	struct hci_rings_data *rings = hci->io_data;
>  	struct hci_xfer *xfer;
>  	unsigned int i;
>
> @@ -349,7 +365,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  		xfer = xfer_list + i;
>  		if (!xfer->data)
>  			continue;
> -		i3c_master_dma_unmap_single(&hci->master.dev, xfer->dma);
> +		i3c_master_dma_unmap_single(rings->sysdev, xfer->dma);
>  	}
>  }
>
> @@ -372,6 +388,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
>  		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
>  							  DMA_TO_DEVICE;
> +		bool need_bounce;
>
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
> @@ -390,10 +407,13 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> +			need_bounce = device_iommu_mapped(rings->sysdev) &&
> +				      xfer->rnw &&
> +				      xfer->data_len != ALIGN(xfer->data_len, 4);
> +			xfer->dma = i3c_master_dma_map_single(rings->sysdev,
>  							      xfer->data,
>  							      xfer->data_len,
> -							      false,
> +							      need_bounce,
>  							      dir);
>  			if (!xfer->dma) {
>  				hci_dma_unmap_xfer(hci, xfer_list, i);
> @@ -581,6 +601,7 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
>
>  static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
> +	struct hci_rings_data *rings = hci->io_data;
>  	struct i3c_dev_desc *dev;
>  	struct i3c_hci_dev_data *dev_data;
>  	struct hci_dma_dev_ibi_data *dev_ibi;
> @@ -691,7 +712,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			* rh->ibi_chunk_sz;
>  	if (first_part > ibi_size)
>  		first_part = ibi_size;
> -	dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
> +	dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
>  				first_part, DMA_FROM_DEVICE);
>  	memcpy(slot->data, ring_ibi_data, first_part);
>
> @@ -700,7 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		/* we wrap back to the start and copy remaining data */
>  		ring_ibi_data = rh->ibi_data;
>  		ring_ibi_data_dma = rh->ibi_data_dma;
> -		dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
> +		dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
>  					ibi_size - first_part, DMA_FROM_DEVICE);
>  		memcpy(slot->data + first_part, ring_ibi_data,
>  		       ibi_size - first_part);
> --
> 2.47.2
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
