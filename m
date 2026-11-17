Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E96606A31C
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Nov 2026 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n7SXNs+G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=t/nfmAIl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BvKOdT02jYkwF6LF8Fp+Bei6A0/Y98KO1ZAIFM0l0r4=; b=n7SXNs+GmPftcNNJ417v5BYtt3
	9YqP76oKiLFSjYXUZTTyQL+zJputaSZkhkQV7JtdG5gqXQ5JVDIP9RfixpdmqwZK/rakmj10cwVgW
	gqZ8nGZkEoyWtCxijcwN03MTVjhLrE64dw4WRRoAkwiIlmXA5VT39R6b8ZZlpTJmE3SsEyGT9xpGN
	4XvKMfXwu94dp7Ap1Yds3MDNYl4XzYXrCmogf/LI12LmV2NQLxtS2og/hjntAiStqCRkXYafM+5Bm
	o6r3ywVuszsDwvPGSR9kpu+UB8KYuoe5n7edvK/1Hz6lFHme0tMMvXlVjCK7gqsYnn7Z456w187Iq
	SlGCmz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEZ-00000006eCV-0UNR;
	Tue, 17 Nov 2026 17:44:43 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEK-00000006dpt-0me4
	for linux-i3c@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cn0Y7N2mlYEdaT1JByT9IfKIGpYYKjVfikAk18McCByS89yUX1+uvNb576Xb+vr8ZUHyyCDuFpj8ABvotw2vzKodq5EhtW81Oqta7nzejtvhhJy8rUsjlH1yLSmT3v4NYtfDYhX1bfUWg7xb6mu2fLtsfTH2BWbullALxrDV2CKP2nSdDVAkWzNfraOq/hQWyKBy2cjvZpKQzmiMI5gmC81sZxomg317Xc9Fra+9yMwFvwRO8Yc7KIhsMffUcKaT+o1GboG1hwunety6B+xFRxAoE2whaI4uz3eydCr4vOhgSoxDTNpCUH8xziqVwtwCM4PBsfkEqFOdQ4TkA7441g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AtJhck7/C05Q+SoNAz1Mb+txfs77QSNEXNg9ERa3Qw=;
 b=bqtXF1tyH+fHDqwQR5qtSKImNhxOXb1aj7nf+keLjD74AkcyFWhPKAG0IfUcllGr6OcbuuWnZ/Tv3ZHlZNwhGDcavDCVvgOZY34jjRaD4Pcq5dG/F5cztF1UFh3UGRF0AuW4vR1ZXFbd0Kk5whvLu+xHx1UFk0elhBb95kGHP3U7Q4ml6vLkqlDYYzELT8MucK4AQvGXvgO66tNjAtjGIyCXGOQ3Wn77ps9UIDL6vZWZGvXgx8w3fOYmA5h70gVWsVtyaCKbhm3ZRzyFz+5CpclAMzjxHvq4UPPpj++ouu3okKySntSI2Y9c5f/i0aqczP1DBix67CxgZ3RL+U6M5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AtJhck7/C05Q+SoNAz1Mb+txfs77QSNEXNg9ERa3Qw=;
 b=t/nfmAIlYIuP3HXtkxP4nY9cPcsHLntWfOWwAYyDdTWdojSUqGjDebMmGW8phSQVxugFU6M3Wy2p8dhXh4Nv4ZgbahMjRigEIM0WRdMz1KpV+MAeZV9cMoUiUMcySKthMepoIh4HT08cPldEyGB90jVMmcizoZUDGLmODNupn0L+xdi6mKLYWLGTTW7VojB0f6ISoG3mkLSn9qiPLgEmXh8HApDbOcD+cxPah9ky2Bc/DLahVesU5LVO0Vl8vMRTI/ajZqzFjC/DcsQIEr7pYMjtXLMt/lcWmDy9U31Z/Gx2IeNk9RSTqE29YxPBCUpudFhPiCtKnQQMq1Ntx9Zw7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI7PR04MB844841.eurprd04.prod.outlook.com (2603:10a6:290:10b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:44:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:44:24 +0000
Date: Tue, 17 Nov 2026 12:44:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhang Yuwei <zhangyuwei20@huawei.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	chenjun102@huawei.com
Subject: Re: [PATCH] i3c: master: Skip IDR cleanup if bus ID allocation fails
Message-ID: <avyScPjAFgr_DjHE@lizhi-Precision-Tower-5810>
References: <20261116035317.132490-1-zhangyuwei20@huawei.com>
Content-Disposition: inline
In-Reply-To: <20261116035317.132490-1-zhangyuwei20@huawei.com>
X-ClientProxiedBy: PH2PEPF00003849.namprd17.prod.outlook.com
 (2603:10b6:518:1::66) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI7PR04MB844841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b14177e-c638-4b6f-7736-08df44d26b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|261102123227099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9yJFCJx0+a9VPMCAFZDGKDm/09EfzBF2YZepT6G7+LB5OmG7l7rH0eRU/CIctGyhoT3qmqNpe6CIGHkZwo6Nis1p37uxfF4Qz3dsvZFhoZuwiriNn1mTv/xWPwb+MgMu6mzRIIC3va0hjCFsiYToejf3UtVxFpsv5dugTOvUAYEdCG/0hhIwVKunwbBIE7aKpPWTMapr3Lj4KVYwSb6/IRHw2eYg3uY4rfE9F8+6JA0SSdZkZTpEAvi/hqZBuEk7g6ZfZEUUaQiWVgCEZcJRHgLtTqmMwFcrA98PqyAcmnZRizc49KZE1zOylLs+FysHIUs5N57WV3E8wD0xi98BPebCJEuZ7OIaxDJeLmjFKtH1CLigOEDylOHPEBJ1gb/BO4Jwr0g9WUk7jaCXICQLNkE50CpHPUZ0Kn03/MojY3nzkT4M/K+LFERRbFiNVpuVXtiyJjLTCpsKv65Wk7HSFtF1+/nkxrztY1On4hf6pQnTGQiy2mJryg7vP1BaJECPQa4oqDU+pemR+qScysGUiTuKTOJfyns3jwP3nSVvV+rNnKioggPOWrnnRR6gCmATF1mgWvib7zAqlUaBBG6nR5vhgRA0XkLU57HJ30AxQeAzqkljae3ptRUQ39b5oHkVoiMDajcHn0CX+QIq9/B3s+pjJoBwAau0RPjb4SOhVAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(261102123227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sySf83hJZbzTJcTS3IOFD8T8JES3n6ZXATWxdHZxa20Cr2V8ixK8aKr5uFI0?=
 =?us-ascii?Q?s/BRRkGWoLEk6aC8gdkqhkTiAhZ8Uxo/rO71DKEGnLYODPImAZ8+lSfys95V?=
 =?us-ascii?Q?HWVqXLItdEDsvxZSqy2Z9njeuncDbOP0V+OHn5w4pBUn3U1GRTZcFRJYUZ4f?=
 =?us-ascii?Q?but2TPWkiHo9ZAxjj1XqjPLiFZZM9DNPOkXXzxlALQIBHIWM1S8DhK2R+sMr?=
 =?us-ascii?Q?xEF1SKhKzX3K1mp1eOLXaVSXdqGXspxJDuVEo9pPiRCmrYSTnD12gdC+gHjd?=
 =?us-ascii?Q?Z4blmi/zJF//GF9sYrtFr0Ks0kGzlj7nXR0SycSyhBG8VeP7ISIVEG1l8IFe?=
 =?us-ascii?Q?I2p+KC5i4WFxrKdmSoIEzayunraU/u13XB+0dabfsL4xKEmOJ+aftkwsizA6?=
 =?us-ascii?Q?P7txeOFyXl6Y/RM4+g6WJcixzIkIarjpbHuy70gnTMwAQMZeXppy1akbGxzx?=
 =?us-ascii?Q?PSctQdjWBsoS+2MBkwcyOk9a4OVpf9za2t23QnK2gv7VwKOcRaczMB5iVcnL?=
 =?us-ascii?Q?N+stvEDNF4qlv1HodAI/D73x6hNBp4S64t+PRNx6+TzeebDehor2UMGel/UN?=
 =?us-ascii?Q?VZjLxJcvaJw1okK/9Th2lt0QDTUHZD6PQv4UNZru7dPhoJLHR+eQNid/6iMc?=
 =?us-ascii?Q?Rf66P5o9dJf2Ti6F68mXsX8dNMq6etFZqMLLxQd9eJvpv6MG3qrqoFCVDb0c?=
 =?us-ascii?Q?vugI27uXg8fcLra3Yc0R4wQQfKJDAZDDRwQvea3QXSHOMLitoRPlBoiNZ9Dj?=
 =?us-ascii?Q?Q0Tw6GfyFDXxgJxpG2bukmua8yS6wNjapVVIKehvgmIKR9JvHS/7phjGSMU0?=
 =?us-ascii?Q?Ae1G5iKMD+/7S9MFn+ICsTjw6wWvYq3Wxpyew7Vi6kkaA4MGRNIco5YKgqkq?=
 =?us-ascii?Q?ICtW/9aLN2ISrpiTzL0WBXZGXJAVcn16lfAw1vGxMXmONMDsYHMqLLy8rApy?=
 =?us-ascii?Q?BUMcGxPjCAIZ+pvmODEIVLARznZIl9AJ26dVcxwussufDbtjyrc6pP145kBv?=
 =?us-ascii?Q?I+uOQo2C0gO9kyQjAI0iVmMV7XoaMy5pP3ZGpjeKvE695DzAC7CSLSurBxbO?=
 =?us-ascii?Q?QRzq3Ibyr/5XhQc0PVewI7UoLpnI5thPjsBVzN5QPFlOd7KPWkpobz7CRvTi?=
 =?us-ascii?Q?GcRCmje6Ol69OqLVleI1biy/ZVJgXxLuVc+Qhp9KGWnRamdl1vjQO3i+VEha?=
 =?us-ascii?Q?hqQ1+kpHTDuIkaCofKZ8oi2zInfnp2oGEXmxP+466s0hO89ERs4ZzF2vW3ez?=
 =?us-ascii?Q?sH8M4TUVgv+6Nw0L4yITJKLZGry9UT5Yq/nHmeDaxnrrwqS8xWEK87MYVT6c?=
 =?us-ascii?Q?BAjYQ6m+AcbHA12gXGro3nB1M9msDTRcr/FQM/HH0DYMlbRduAfk9bdwQ6hN?=
 =?us-ascii?Q?ckKaDP8/p0NJ629rgxEFMip9lNvJ4pBv6x/u7xogmBIGwfH88RO+i2RPc7Mo?=
 =?us-ascii?Q?QVhSxSKIMOShYLJyYS+pDEXp0Ov0q9IEWWHojz41hTofWQc0ILPfnf03NS6o?=
 =?us-ascii?Q?f+afw3It9q7xuRDpXwlPq3QYDofqTKtVyg8xaHfARRT47VZUh6SO0D9Wg9LQ?=
 =?us-ascii?Q?q580nfAizFeIdGTlVl0an3hKZcfqaNXV273zGUMBf0WqO7sp38zM1Rs4ZIDT?=
 =?us-ascii?Q?ykLZ2EczG/rccNQtJOn8oNDRDxgMnrVu5sNrSUvl6Bq5UU5v+U/EMbpDkbLd?=
 =?us-ascii?Q?Z4zJhRabihTMH7Wh4Tzmwz7XuYMeIZfMJPEtFC0LTbKfeDEJRpSWQCzT0mbY?=
 =?us-ascii?Q?t8mcGiZs7Wq+DHb7VkTihsdQP2QSoDS8kJmVhF/PGtdcvwhWefz0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b14177e-c638-4b6f-7736-08df44d26b3a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:44:24.3743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0DsTMKKpMmOUaqTaVDrtihVuC3x6AVFYfA8DSJ1IHhClrh+adR3sn5813BABQoxag7CGPWBvtD1p33O8w06yICQY7ykfu09JfHiJUEtOet3jG96xGGpgQILwPY8scpk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB844841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094428_295737_476F5FFB 
X-CRM114-Status: GOOD (  18.36  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 11:53:17AM +0800, Zhang Yuwei wrote:
> Since commit 9d4f219807d5 ("i3c: fix refcount inconsistency in
> i3c_master_register"), an i3c_bus_init() failure is handled by dropping
> the initialized device reference. This invokes i3c_masterdev_release(),
> which unconditionally calls i3c_bus_cleanup().
>
> However, i3c_bus_init() only assigns the bus ID after idr_alloc()
> succeeds. If the allocation fails, a zero-initialized controller retains
> a bus ID of zero, and i3c_bus_cleanup() removes ID zero from the IDR.
> If another bus owns that ID, its mapping is incorrectly removed, allowing
> the ID to be reused while that bus is still registered.
>
> Initialize the bus ID to -1 before attempting allocation and skip IDR
> cleanup when the ID is negative. Keep the put_device() error path so that
> the device reference and firmware node reference are released normally.
>
> Fixes: 9d4f219807d5 ("i3c: fix refcount inconsistency in i3c_master_register")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhang Yuwei <zhangyuwei20@huawei.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9928c5dffb5b..39363c097682 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -523,6 +523,9 @@ static void i3c_bus_init_addrslots(struct i3c_bus *bus)
>
>  static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
>  {
> +	if (i3cbus->id < 0)
> +		return;
> +
>  	mutex_lock(&i3c_core_lock);
>  	idr_remove(&i3c_bus_idr, i3cbus->id);
>  	mutex_unlock(&i3c_core_lock);
> @@ -532,6 +535,7 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
>  {
>  	int ret, start, end, id = -1;
>
> +	i3cbus->id = -1;
>  	init_rwsem(&i3cbus->lock);
>  	INIT_LIST_HEAD(&i3cbus->devs.i2c);
>  	INIT_LIST_HEAD(&i3cbus->devs.i3c);
> --
> 2.22.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
