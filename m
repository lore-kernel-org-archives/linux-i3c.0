Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2400D12673
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTSwpwdVmXXO8rUyfDEkHAqb1UVHcJAnPM0MZrpPZ1U=; b=BUnySWujp9C/Gu
	zIrZFLgILY4vfA7+VoG70aWd5F7zotq28swZqmkPOY6waen0QTKvfM2oa8Xw0RM6VZYN70tYmQMj9
	9tOlS06KZqplQTwWo8CR0zwjy306DF+YhdSDCOR2HDISHx4MtMP/5HdA+AIM9HqLElq68Km4KTgGV
	VNshqIdaZr2QtoHIHqtJxwCyG1x9yFCJ3QCoUwFxqAFKmQfi1xJXBtezWuGpYn+Tdphv6opEsqhEK
	kf/69p2ZHLwHZ9F8C06Dib4Nu695WIKRfdOasZgModa7WejSC/0xRACcsZOmqV3Z/1iQQfPA/wD+w
	EkDkNQRm8bl6sYxTqnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXfn-00000005pu0-2Avu;
	Tue, 02 Dec 2025 21:12:35 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXfl-00000005ptW-26VU
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 21:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCBNaBgr63wQ3GXFueZvKpnYZRheNsh7hgnralA0R8ZDjABvxBwzlTQIYwLxiJ0cAHMwO2xgOGUtoWJrmIMyducpn4iEqfUPT5CfurpjsDCu1FJtGsAagIDSLVtuQG1tAXb8F1DwSPMfmn4y5wOUGnQRfHr21DYF1sdQnFTa8JqSoNCFM4BQORBrtW7kgDcx9eRoKpSr7IelygOV3k/j8yFeDCCLHFukhVOEvnXbDk5bVlO84ikhjbV8P6WW2GDtxWV8sxCu4ne7zTzFn3zgeVilOzyByHPn89Y7Qg3yXD0cIrNXcVdmuX0Y6WBJ8MWLdAg9pNXwJnGGuV/U6jH3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2XRif7FehXTw5nliEkK6nnp8WOa6zFC88JkyIpsX5s=;
 b=gwWhXGPu2flwtN/43/GLzmEVuixuyVg+9gwjV5TIO5bgB2nvWLizmJdFdZ6vKhyIdamcVr/A/Ub1qN3JVHp2lx/QGCG6HqJHzwVros63LjkFVtDHJyIaNwQzi4gcRbZwIL5/M5HsZVliFY1PKtA5e6toL4tn3y2I3FIMapCjXQSrzWHHj/0kCUKrBN8xrZ4nr92ur8IoBU/41qXQZ2BQcNO4o4XOS2DkOkD7fWR/a4AWDWsFnEXL4B2DZXt4B/wnh0Ht+Ua7Ni3JkjqOwNmdgjSrfBfZ4/Cxk/bKOknaYzFyCXcpNZLmyM7QRV+J/SFuN7VmKlkWOx7hDTqku/zJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2XRif7FehXTw5nliEkK6nnp8WOa6zFC88JkyIpsX5s=;
 b=WTKQsbbW1ftpfHhDY72OSDnYpe+aO+THM86/+utyuNJmDkFuf7Y/YOmusc3vI499D43jzMSUyMmFqaKz374s2fmixB2MS64MAxa5uVhBabD4FD8kobo3FVr77bEcklRvJnkRpMO83AybOzr4t59w7kIj02CiBDDyFlWF58aL4/6ZoixPbF4/QMiCDBiCjBCaOe1sk7vZDqhN0AThORPUukrmW5lgFXYGoAqlhMerMfGxf6Ku2PB3SdVBsI6jrDvXatsSsIuZEvj1A/opRiGva4PObHF8vSSmoc4Ss+CjrmbJajB2XjH/JeK78kjbsk+8p8r2RSeQZgtwIxsxxQ5dKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:12:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:12:26 +0000
Date: Tue, 2 Dec 2025 16:12:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] i3c: add sysfs attribute for device NACK retry
Message-ID: <aS9WNRyfRg9IUpna@lizhi-Precision-Tower-5810>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
 <c9b283039b066455e688f5d59d0a46b5d286657b.1764663888.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <c9b283039b066455e688f5d59d0a46b5d286657b.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SA9P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 340c0051-8854-4bb7-b05d-08de31e77eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cryKs6EzcyT8vXRAEUnNtbNNFloUUc2lucEltxqZXL0T+8XdWI8Vd/PjmlmJ?=
 =?us-ascii?Q?XqBjrLyu9xr1NeGxLQdP0Cm51eqVo1blhurGsZDrp7zGS8nw1jDgZMMil7O3?=
 =?us-ascii?Q?pBL2H9w8ToTisKnedzHzzYRuWw9tByArrni76fd090KIWBfNwsUKFJNOt91/?=
 =?us-ascii?Q?Oee+cR3UHhNekMG0vK6/tV2NRc3FV5EinnWmTmYzdF1uxZRKvL2/cvgAdbAc?=
 =?us-ascii?Q?PZ90LNiGAjoyACVzxrpUYj2+ADzH+17ds7VxjMEdV9I3hGiyHzDFE1CHThmQ?=
 =?us-ascii?Q?w2USuuGPzcadV0OSDnZ+YI4FFrNHLYfNAf4/hFZjZRp9kNmtY8qcvsCXQ3x/?=
 =?us-ascii?Q?+RQD6u0s+bStOQPYcrxGPUlsoGGUexRufM37w2eHv0F4d5qSD18RKgbTlZs8?=
 =?us-ascii?Q?3g7li5AU18+OjuHAjiyu74DBP47VCRc0C8jPJqj4/fhJX/FPQVcrF2pkQcny?=
 =?us-ascii?Q?eHDpuGhDTcPX271LsHJuMEp48jmqyOcuTeJxQWdX352PXTbpCOCQuy3HCXC2?=
 =?us-ascii?Q?C6B/hp4AtMed663nMGmZoy1eRF7Jl1ZewlbJRQFKrDPC1AQBARJxl3nWn4ZF?=
 =?us-ascii?Q?P8qJgAjbWMx3rfXlHh/8ZtPAF/UQTZO18aaMBJOnbajdTo3/tudvAd42iLZ5?=
 =?us-ascii?Q?aKPha0vBHEbgKvjJIYwKa11opkIraO1Og8tdg8SOQUGdJNcqmTF5rHAF/Lka?=
 =?us-ascii?Q?TjRD4ZaAAK7oKnd6YYlKK/VUknfCtlLc4ixVk0VVve7IbLk361RkJ7MzMYE4?=
 =?us-ascii?Q?ypiRh85GtHWyK4hD1XCuPiCa1ijAjLLE9GGHwkjB1BR4OVauRkTqA3pMWn/1?=
 =?us-ascii?Q?9Ph6eS2sFnXEQ0zkeRLaurr0Vij28YabDfotlrN7b11BMmZLUapE7AH4IVKi?=
 =?us-ascii?Q?mDDLhP5Mg7cE0Kr5Mc5zoChOEmFM5VFKyXFxdgiGCBlDc43O7p6fcW8tKg2U?=
 =?us-ascii?Q?EYGx4/ouEIRplnvXlaqLYwdMSsKKiJUqlQ7cUqFFnkStYSpy1n4GXS/4hqFF?=
 =?us-ascii?Q?6Jc0qD6dpC/ZTHfYcq0ndtKhvbNnRAGpp6AkzdBX4hgjxuufuRkc0w/ML+8U?=
 =?us-ascii?Q?A8uojSSDtOxcnkopKUc2joD96syvUlWrXqm5q7g2rIWhtMMhjGmvjC+LqZAj?=
 =?us-ascii?Q?j2YiA8FVSRzIV13RweX9q4bGV+hvxLDoGUDliTicrARQjU7q9qy5rS3I5dN2?=
 =?us-ascii?Q?x08xzhBR0aPdt7t0h1vObFFtY9dNxuXud3rGDT2qA2V4oQ+p3QhErmJ4A80c?=
 =?us-ascii?Q?OAcHcp+4BeU/fO0hZKPR+BefwYdf3iJiqlioLpPgeweSb3mJ4trfHh4I9cui?=
 =?us-ascii?Q?1sHLEfSb+LJNAFGewHGIhgGr7kXTeXp5hpHkVdXkrzPrgVA6/NudlZ7bLj27?=
 =?us-ascii?Q?B7wQ92I0Bo2bKLzXczhAMAibnKWCAFhiCSsM8CDCgHkBOElcevUyYqW7FKT/?=
 =?us-ascii?Q?mPscangp6zIC+xIPJAKYSAqiDM8YWr5e8ljOSsZMZ7C9aPhyW4XItt9rIeMf?=
 =?us-ascii?Q?C1Y8Z+vA/b0pjnI76AnUyAfmlLT+Hrrp4Sa/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nJ+0zmeo0cMLQZI0Z+Js4b2venPNHFx3SpdlZYaz/J0gAoWd1NHmLn/7AFbf?=
 =?us-ascii?Q?j7odZeePoDfvSYKjMWhVUv3AIMzIyEKNymoEdOuQz/61nlVURGwsC3lKckcg?=
 =?us-ascii?Q?wu5c2KnYEn7TeRipHmNSgfH/bTLFUFgAO3nDdqTp6GJ4x5d+nVEbXOC158J0?=
 =?us-ascii?Q?KmzZjioSE4jJD01zO9hMtK826cSMZrF064y/Pq451nTQIP6xNtBxJtTkjm7/?=
 =?us-ascii?Q?yJJdQmGn9MBJKHJ4V7KjTjLQDYTcUO91iB5EQgQD0EkgRH+am4p7hDEMOppc?=
 =?us-ascii?Q?Fq9270VPqeFv0pn6o0fUmu8IihtuGy0GLLGh6klszlQQgkVwGD23nDRZkbDy?=
 =?us-ascii?Q?YJfQmVCvKF1tWqqR5cD17SzVARFLEWVSVQHB/GmOni/UExLDiJdzwRqwyfXc?=
 =?us-ascii?Q?ipFv0B13FnyKX/D5Yl+d1R4NRIdVw2q9zAXKCKfWVrfgOuwH+xO0pn7wRpby?=
 =?us-ascii?Q?oHeHtoYDFek66K0kcv8gs69sSSFPAWLSiJcMMeIW8zQCm/Q+L1r0nElBqzjA?=
 =?us-ascii?Q?yZPbMohUXNI0dndWBeC6+q6RPgPITYUbrxZrVnikYsZB36lMQvIoOfSUYX58?=
 =?us-ascii?Q?pPJZRHFxVCPDfhS06AGYBOKCiphiecEE7X/w028BS9DiL+2aM5bhfZL6SI8C?=
 =?us-ascii?Q?WuLuuv8ErIW33rdq5szMbgPIlUEozMF1b/fIs/FY0t6sUJGYOZlhFjbX5EJv?=
 =?us-ascii?Q?Jjl5OMy2fy78S+x29xjfgdH6NJMEb1nghnEYckKsus9BNQjTJhNAZMmD5wka?=
 =?us-ascii?Q?2mYvIOgMPw8g9TKuR9RzF8Du+JPszOZGXex7T/dj3e8tjKLS5JDuOjGOje/g?=
 =?us-ascii?Q?Dr24l3g0DkTMvNkfrWTyGVkM3eOvnqfZxY9/OURQxxqBH76osoKPXPlESwXi?=
 =?us-ascii?Q?NQNq+D+8bYigdFl6J2mKfZWvbBUHiGgnynkClF+HnGHhoxlDZZXxbczX9yFo?=
 =?us-ascii?Q?JhwFObUsP4WaD0d528BJLhf+RXN0LG2eP7YP7z0Bf71QnM1ci3VT7zLN0gC5?=
 =?us-ascii?Q?kQsd6BQy1PxXUyxYUsk8vIBSsq8VIjGMdmKAuTqgnNmFphjWSVKFirg7Nt7f?=
 =?us-ascii?Q?kMhiZYz6tp54Y6P7mt2LSK7ly2YKdcUu5SqLNK4OxluKPQKsgLocRP+vE6rv?=
 =?us-ascii?Q?EM5rFPmXCNjfhc2zfXlsdY2IwavsGNrJorvlTWn7GHn+JBmkz30DfTA6dnBD?=
 =?us-ascii?Q?p8vo3xY3Bw6qtw0YqAZOQRgsTqE8D0IESG1SjJroz6zeuxjEd0cHxIrxeesb?=
 =?us-ascii?Q?FgXzaYiHZDsSI7NIffwvaA/s8Fpq4Y2DgG+au3oKBipM/oKn7d7cI9etGJdB?=
 =?us-ascii?Q?2KvvwX+gu0cUporPXpsoMLX/RzOwwkBoAjadNAg9LvCQi+4+sN2CKOAYhl3N?=
 =?us-ascii?Q?jOOZRCIotwfXO6x+etB6BXaVygIhEagUp0DJ5cNc5u51envoLpgXh1IG0Zk0?=
 =?us-ascii?Q?guP8BeIicX7bKnFk8m9+qWljgdSX5gOeJ3vzjKJTk78M4TwMkBjXQCT9/jlv?=
 =?us-ascii?Q?ACiKn/r7WBgS2jaJw5449jfjM+b1CpTxk62PvxNR8t9XP4uHJS+VzCK541GB?=
 =?us-ascii?Q?s/AFD4wS5j2Ie5d8IOE+2SLRNVyNOR7IdfUsyBLA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340c0051-8854-4bb7-b05d-08de31e77eb3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:12:26.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKLkEm2JW+v0xyS45q0Moi+klqA7MN8waP4/FCbmLkxOk6tr8EY5gClz86ezeYv7fqTbuM/46B4u3NaKsHL7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_131233_549685_0E34B267 
X-CRM114-Status: GOOD (  20.90  )
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

On Tue, Dec 02, 2025 at 04:26:10PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Add a `dev_nack_retry` sysfs attribute to allow reading and updating the
> device NACK retry count. A new `dev_nack_retry` field and an optional
> `set_dev_nack_retry()` callback are added to i3c_master_controller.
> The attribute is created only when the callback is implemented.
>
> Updates are applied under the I3C bus maintenance lock to ensure safe
> hardware reconfiguration.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master.c       | 44 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h |  2 ++
>  2 files changed, 46 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d946db75df70..ab630c77b3c2 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -685,6 +685,44 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
>
>  static DEVICE_ATTR_RW(hotjoin);
>
> +static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +
> +	return sysfs_emit(buf, "%u\n", i3cbus->cur_master->common.master->dev_nack_retry);
> +}
> +
> +static ssize_t dev_nack_retry_store(struct device *dev, struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	struct i3c_master_controller *master;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	master = i3cbus->cur_master->common.master;

why not use dev_to_i3cmaster() ?

> +
> +	if (i3cbus->cur_master->common.master->ops->set_dev_nack_retry) {

This file exist only if set_dev_nack_retry is not NULL. So needn't check
again here

> +		master->dev_nack_retry = val;
> +
> +		i3c_bus_maintenance_lock(i3cbus);
> +		ret = master->ops->set_dev_nack_retry(master);
> +		i3c_bus_maintenance_unlock(i3cbus);
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dev_nack_retry);
> +
>  static struct attribute *i3c_masterdev_attrs[] = {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -2962,6 +3000,9 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	if (master->ops->set_dev_nack_retry)
> +		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	return 0;
>
>  err_del_dev:
> @@ -2987,6 +3028,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
>  {
>  	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
>
> +	if (master->ops->set_dev_nack_retry)
> +		device_remove_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	i3c_master_i2c_adapter_cleanup(master);
>  	i3c_master_unregister_i3c_devs(master);
>  	i3c_master_bus_cleanup(master);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c52a82dd79a6..ccbc9a14bd6e 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -491,6 +491,7 @@ struct i3c_master_controller_ops {
>  	int (*enable_hotjoin)(struct i3c_master_controller *master);
>  	int (*disable_hotjoin)(struct i3c_master_controller *master);
>  	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
> +	int (*set_dev_nack_retry)(struct i3c_master_controller *master);

Need update kernel doc.

Frank

>  };
>
>  /**
> @@ -534,6 +535,7 @@ struct i3c_master_controller {
>  	} boardinfo;
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
> +	unsigned int dev_nack_retry;
>  };
>
>  /**
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
