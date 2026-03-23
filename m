Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E68F483D7
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKh+DBI948Y/9AjI+niLQh2Nb1wNxFHVZiPmOv6zfHo=; b=LNMSyzteMtY6/Z
	MHw1a40gJzOYeF58G8BQCo2TpIH2Sqlbn4Zz4lZpLjWSOLR6QMDc0ztWZoTN2A4Rc0cNo18qSs0De
	CQZA4ZnjYdRwCV7TVVw7xHp7hXXk8oxo9maf081xzxxbG+I6stauRvRGOhU3HXkx9zJt9AF5fVQ2X
	qimK7A6tI4/cygNLaFXu2gMVKA0l9zbQdv0kKE7ahIu4cj3k/AGE/zCM649yxlb2dEF4/wBh9jBkN
	vFV2wsUUjSCJLIt/LRL81l6goo5ldBoAI+yi+48Yat9qILjf+HWUxKsVMgXvtM97IvE1bWG4ocIev
	hDe4/doJT1+5V5dmWvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kOf-0000000HNct-3veN;
	Mon, 23 Mar 2026 18:53:05 +0000
Received: from mail-francesouthazon11011054.outbound.protection.outlook.com ([40.107.130.54] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kOc-0000000HNc7-2gHK
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 18:53:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qT96kv4zJVpVoZ8vVEqhZNg8LW1pY6oABoayKFtLtzRCfXw02o1V/ZmVGW4F5tDTQ18ZYFiZShoeEH5Q0nx22mY8OVH0EzNzuTWJKx6b+enDHyPNA6/YmdFp3oGbYUMMCbHw3Y3GGxTgihzpYECPIXFKqD1bbBZN+Vw7WuVXDinuNHME9AkcL1U6hlv4Lx6T4fd1zvlsfUpZBhKxvji7oVokg8wGj9rBVzgkHs/Zyu5x626Qi645JzJZt2smjw/D6Hj4waMLNLM2lILrkb6ulgoKX1T6adxM1uo8CFXU+TXil1IQnwFGdnNCArBWLWLWOT4DkuhCT0SbCAIzUW833w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0FLq2q7D0/1iqRx3Hrete9Rt0xsSwqnwYUnJVXu75w=;
 b=aMfYAMb749rb/+vDpl3dExzvCVPbBspFzofZH4DWGoq+p2i39nP5gCo3hPmKTY72ewsokw7VqzetlwufS1AQftLRpn9ahYpW4wIZnzgKmuM3lWLkg9zqqVKLV3dtTKYN2Ol9EGzx+EviLKPgN+zOM0gNZvsp8S3oy6lCq984iR4qY9dy1UZ58g6U9XsJNe/QIqdTRekclALMmCOy9lWPO39oYK3OyRTTTU7AYJ6MZRlCG7r64Cot7xx0cZs7fKEAGnX+YfoOLtd9/ho2jxsmJ5cRpSx2tT0GpjeLyqFUWnK9El6tzK2IZIXvH79ZR9tZWRxo4Ka16hc+qXnSBbhmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0FLq2q7D0/1iqRx3Hrete9Rt0xsSwqnwYUnJVXu75w=;
 b=Lr4IivockKDSLjnAuEZnIHsDgAQHphC2M7loP6CSuB/VnT0XA+zEZXKh0xaOjtr4WG21HqUoPdtZHoWDTNfl6eI8pcf8L13QE/W9+2JkaVJoC770CjsfsgGfc2tMKfv63/3V5Hzq2jTcJuXxd/sxpRT0G6ReaAQCSKKS6eG6caf2hC43AL+0Ckmxo2j6HYzPdeeNgulEIJqMTMOvB0qzPBRMqGrPYstmrONwdio1nfZu7OpeeG97BExelY7xuI1nzgv30Ci2h6zrCeb+VIgwnGBTSHYtYL7z/nh9IYk804rYAbxJlt/nCUyFqcrOgfZg0bF7BvNgmJnEAhSEQ/qzgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 18:52:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 18:52:43 +0000
Date: Mon, 23 Mar 2026 14:52:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: dw-i3c: Balance PM runtime usage count on
 probe failure
Message-ID: <acGL_H0jV-P_Xb8s@lizhi-Precision-Tower-5810>
References: <20260321-dw-i3c-1-v1-1-821623aac7bb@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260321-dw-i3c-1-v1-1-821623aac7bb@gmail.com>
X-ClientProxiedBy: SA9PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:20::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4b2e08-c573-483b-6bfb-08de890d5db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: UyRV+Jubv6HxlEDswNd7+LRFEyTuZx6xDfeEECt6a44LG3bmCVu9vDcTyoWGHAW9DHZQzfjDnIO5NLrb7HMiV7SuMbZaTWYuHXTpf8xh0AaRQIhXrSexfzBZr0L0Sp4GBtrq46OSvlT6TdGKwAhk8nrdGBiGhhBuZ6gKto/YruvkaggXR/pg3G9YYiSNg+cn7cm/5gipo+0sZh4jjgpTR+ftqEMT/m3f4cc+0vjAEFXT+uZLLbECxHLnT4edFysxHRm2Mb0+DV55HjYU6gZ94ee3IbT+h8y4sViaVi8SBrQfY/CnspmcPhjyUFE2LMa/YgmG97v5pabzvD8Sq6S+NEloeJdwbWVW7BiRR9OvORyx4IDbtRnzln/GeNb+O8vDI5m0UFbtHqsbCxJfbvPMoUGx5ug0EpE/dW1tTBpFxz/tiu8Ax6L9gAOlf+WqL8+LSaicTqSCGqVa5tr2iCYERDsIXCCTDTl8DKobIGNLuwOlUT9j93ci8TFs3IiD8erEHRXUIQPc6cgCt8sTxkqYl5UiLdqPImv9zJG7q2vwL3tc1IM+LvxZrtfpl6nDNwjGlhqf+RzVSABHD3k2HiIX3qDQvcdw+mMLAF/xnt7Lb0ktdsWfCGPj2ZPhcHjX4TczdHMDdr5bfwO3YXCsiIYWhLnzh0wTnhBfI+XvahZuipeBz/gIC9BoOFTwwQ5H3XqqLimHGZ0mwS7cnp0P5cmoqi04J10Wax6pMZQGVlUSfAsC7oXH3HfjdyyZ22frXg20CDr15kmFJL+7ZViRpPpasw06ixUagUQa5fk3M9ArQxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2cTOr6m+VE3cMF3OERTLLJCblAWsZrMNod4ZP+RGItWey3zC7EFnAy/ZaSI?=
 =?us-ascii?Q?DJ9VkE/h24nASyy6Bk4FplfwPw75OTQEIjWHSQFrAuYldSij7onY4YvMxTOV?=
 =?us-ascii?Q?BzP9dZ0GnoeTcVsFg8Q71vzTCMFJs++LaLhbpKqw6YPl2QVhYtFSGX+DOEpf?=
 =?us-ascii?Q?39E3rx/PPYP++Ujt5tjBqLUD5wtXCKTF/6XUF5cMjLzKaFzNwJxl0IL9+aSG?=
 =?us-ascii?Q?BTUGsDpfMTBSUV3R2TDX6WBt5qcvWEEL9aO3+MQQ9mQI6BRjNAG/7QHhh+Cl?=
 =?us-ascii?Q?jaVpyGEAt6p6j2Aa9B8Yq2CHgm0+fTZ4F+yEh7cJW4WR8h4G3F2BuBVoO6/r?=
 =?us-ascii?Q?QkH9+8URWe0LTimzyfD74S39X5fxQD2Re/LI5AJLvAb9VAUfZ4GqGvoUx9t0?=
 =?us-ascii?Q?D0XtLXIvhy8+Zw8eXOJII2s0HtMlPaCVph783u2lajXMxa+Z5ohWFJa1wDv2?=
 =?us-ascii?Q?v2xfSC2T+1MGwuaADd0tvGcKKg8vEtnAoKsnSYcM+l2bxWWnNmQFZKXh/T+0?=
 =?us-ascii?Q?5k4jm5q0Px1ukjHtOE7w9wrhK8wN+ecNLFMhBAVW03crCbuEa750A2fipwQo?=
 =?us-ascii?Q?VNfHCM7eho1Gbx0oNMuLy9iS0x9LzR0A71eu83aCS/Ab7Ja8Q0X7iRuP7bqT?=
 =?us-ascii?Q?TJHi31LJ18GTOye8cXuj6Tp6w1jD9U0WFr0nbrDnWXkDauYpUvUTWi/1fFAt?=
 =?us-ascii?Q?u3zmHHEQjrePwOiIgFnvu6gPwuySSypE0wLcTGu/qtsFKFYZSaICzem/foOQ?=
 =?us-ascii?Q?z1SggHyrvlPqAhs6HDcbAatKt/oqnkO5FfnLKgfIgi6vNQb5bh44MMxKX5G5?=
 =?us-ascii?Q?UvJrkt9rufowrcIYpkQFklgRBV/9tNER3EEiriwO2EDi40FWbunNwZBSjP1A?=
 =?us-ascii?Q?4qH59B5avrKf/0xLP4nQOkSnvI552CKLIl5jN9HrKMqb3jt/J5lbOFtG6jx8?=
 =?us-ascii?Q?h8vpS70CNREF5DZow1PznKhOeuYjskXvXGz50v1W8HWEgIjVF0nzxqslkQhy?=
 =?us-ascii?Q?CrEXCMEwwOwaATI3fTdb8CnikglfJXO0dvzIaByw+NxKhKrYaCbU0mamL1kf?=
 =?us-ascii?Q?BMNmnX7WvchG2qbMLUjYQmt8giYzF8FFRTIM59YyG7fBHDVowVPJf4vZWBJN?=
 =?us-ascii?Q?6oOd/VzugPlIJbNb0pRdYwd/vVObAPO9+/bceQ5brJ2t9Y21RWr+UmidCHQ0?=
 =?us-ascii?Q?M8MAeXKPEHVCkuFBmW1BlNauLLQRpd3/8CDWr448ELpuAxNN0+XnGF7AKLEr?=
 =?us-ascii?Q?i9fJbEGROGIs5Cimrp1UrJBI8eS7ZbLjyxBRWG6JNom9AGLHB8gw1ZlhHM/1?=
 =?us-ascii?Q?341hCBsHAegNqNJGPHmEQ0blyS4+uUCm25WZmUM/LlMY3x7WWmUsGjNV7LVT?=
 =?us-ascii?Q?XZ2fPxGBD6OdWeLt78Wv3b26EuvJ4Q7jQgQz2l/Xbs7VbyNAKvxHGdA6ijT9?=
 =?us-ascii?Q?nTcD4V2lWr8HevZCydBXxiT1dkrFX/aRVUcV9MUFeRPfeW6itCSVLuXRcqzi?=
 =?us-ascii?Q?8d+n2wq0r1EZofUiz9LHnxKhSRmjpbHqxrRaRZTzMMQHPlWcpCHpX0X4D64b?=
 =?us-ascii?Q?IW6tuM1nFNo1kS5NwsLTseKnSsyOU2m2OxJicIGOw0nG7olqnGGyg2Q06yNT?=
 =?us-ascii?Q?X5qjSqqlL3p8NBfnB8LwzWhGvaOWZYou652H6NWsxgu1qwdNTOAbzNH2PItP?=
 =?us-ascii?Q?0aZjnA/+yiKw+L3Jfm6jYnWESHm5oJwL/AnY+mR22R25QentDOv35ooCIAAl?=
 =?us-ascii?Q?lahpdxhL0g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4b2e08-c573-483b-6bfb-08de890d5db0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 18:52:43.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF5FtbyOjr6E/zDZapBBl2WfvjGnU4P5zuvyeRHpgE5qpiXe/5iXO6Q5sLuDt9XZpEzJE4gJRSHPOSPQOcp0YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_115303_022913_F555085C 
X-CRM114-Status: GOOD (  15.74  )
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

On Sat, Mar 21, 2026 at 05:04:43PM +0800, Felix Gu wrote:
> When DW_I3C_DISABLE_RUNTIME_PM_QUIRK is set, the probe function calls
> pm_runtime_get_noresume() to prevent runtime suspend. However, if
> i3c_master_register() fails, the error path does not balance this
> call, leaving the usage count incremented.
>
> Add pm_runtime_put_noidle() in the error cleanup path to properly
> balance the usage count.
>
> Fixes: fba0e56ee752 ("i3c: dw: Disable runtime PM on Agilex5 to avoid bus hang on IBI")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6bdb32397fb..9c8de64c203b 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1669,6 +1669,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	return 0;
>
>  err_disable_pm:
> +	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
> +		pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>
> ---
> base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
> change-id: 20260321-dw-i3c-1-92224b35d7e4
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
