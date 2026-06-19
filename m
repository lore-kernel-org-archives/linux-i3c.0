Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC49ACD4F26
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jun 2026 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRDCwEx5JeDeYpwnC4klB6FF3gtfa7QCreg7a+s2W0A=; b=rrfT21M1h18uCg
	w1A93Qn6BAU+CvOAHVMdy5OSHP3F5S1oD1FsNZDtsfs8WP4TxLnqA1LxYD9M/WxvEpp1mAFd2GvfP
	dwVPFwX6I93kt9Z9SEJV6HiGipQGZTesTCTv12qh4UV5H4Ap30VdedLoReQIMF2gcsDvYDsAr7c/B
	Z6Y1uOGYvB36M3r+lanxwj4S/68r+iJtqaInpXikAn16pcthu5rQN6VfXgNbmxVq+XssOVMUnWp0K
	8+Zj6FRBjdnrupDaSsW746+8bCE9RzSOD26RdU+Xd3hHGLpqqC3QcGqb5276hGaD/Uzwk4J4iB0+c
	2tILc/CG8jv7FV4VtlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waetr-00000002v4L-21SK;
	Fri, 19 Jun 2026 19:29:11 +0000
Received: from mail-northeuropeazon11012059.outbound.protection.outlook.com ([52.101.66.59] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waeto-00000002v3n-2ggk
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jun 2026 19:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXWoPOthfRyK4f6Vq3fbq8WwrPxcHIT3BdqtWCWl7vdvEJaeBPPRV3hBMPNGz4mcOyzubKNn3nWynJ6DX0vVToQ5Rcrg7H96+zyK0537s9RgiKEpoVfFpOuo3ILKQHPfUYBjEPchjHpqw8PnqRGhWrTGc18pCKe2YV2tJnJ9idGQmCQGbbQ3tNbK/G/KQgJ0NXbIFhNr2cAvs0B5UYdtibqZtbuvx3+KUSN/HNZb/EfMos2hsl+vSEPKnyBoty4BZHunzn7ThvUasKm0SwWla4kZzAI7DEumC81//LHlLQbKp6FILb74Fxgq+MDOHk45vcUDPHpI5/tSJga/uIVumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1VJ2fQZL3pbSY/0MDYCShVgi+k8iBrPAIJn/tt09IY=;
 b=bWgmIHGzGNB5660UzIrhFuCkbMXFp+As+RfyhSF7ac499gcchYYcUY3c90g9Ev+NyYwl0D7sB7YxamkVWSJ1oHt0Js+5lYAK5SUfzx6sKGmot5uKyjQ89zuIv3vQzltJ0u9Mfe+VDiaxT3k+/d82FxsRboN0c9VAiMEmFAKoxSm6s8Pp3ORvl+PFbCNQZGhY75qG3D8y2lnM8HqjWwgOgyhH3ELwPHdubOQ+ZpLUEjd/l3KeprtWKcYRGF1lpKX+Xy8n5+odwcIzFILsnPNts/WX9DO94dD6TxiD+qmblAre6Eh8i0oncmlFOhYt9hnTQiiID/JRyEjYDgYgNBGWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1VJ2fQZL3pbSY/0MDYCShVgi+k8iBrPAIJn/tt09IY=;
 b=pKz9xwLYLV+byPVtBTkDQjbs09vrxb0CpKYRO5nlC6wTNpUAXGXaVYX1oRLjkuuWFRM6qPmYX80U/aer+z9oh8z2RZpU+hr5zTPEkd/fzi83+0I+8J/+DET6D48ZBk9onjKD9Zcc2+PtQz4KnvaKcfH3+tVswvm1zQ6COvxGnTRyaoZKuOkUMJFQ13UQiRIzdIH+kfRXpW+ZDRb3dmZzaBA5LTi5uoN7Nj7QT2fGBb8ipEbagK75/Cs3O4l1qzNQ+ynJgIfvoMYxUKu5s0MSg4uTl6YTwnRXgI87M06Iz2BBpGd/pa1it6JU1DYNEXKAhwtj7rxHIfvMch/OFGyW4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10279.eurprd04.prod.outlook.com (2603:10a6:102:406::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 19:29:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:29:02 +0000
Date: Fri, 19 Jun 2026 15:28:54 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i3c: master: Validate GET CCC payload length and
 retry M0/M2 once
Message-ID: <ajWYdvSArgOU2I0L@lizhi-Precision-Tower-5810>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
 <cfe9e0f7ce49e268cd582a939206dc0b6c4e42e1.1781142158.git.tze.yee.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <cfe9e0f7ce49e268cd582a939206dc0b6c4e42e1.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH1PEPF00013315.namprd07.prod.outlook.com
 (2603:10b6:518:1::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10279:EE_
X-MS-Office365-Filtering-Correlation-Id: 50655ebb-85df-40a1-a962-08dece3904fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|23010399003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: n0dvTAZwvS/EG4spZe2b+YrvHpzc3gqGJU7CMJ2k7tbZRaGsL8CHqql4/AhEE8wRHZNTSlexwzulyGFSrz7G3ZgCS4erkfXnoe3qgxfZtDnrN+Dn8jQw6vM+bVVsYf6iqmYsROMpSyqHeJcboKmCPfdl1q7P/ifbwRDESf86PHrLIKSZvLickKVc2OQQuyKY1o4YIhfeYOcqWLmub61Sx5JvcE5Io+zUe91NDt3okQihqNrbESrDmlBsl5n/CkZvzovOxgiNMiHCIdRhMPF8d7V9+ORritxXVpgj0kOk/vfjyXiJjmTcwtD3e1l/2E3UTHinbcFAFECOXX128pjNrbKHrjVNaVP6esPKXxD97E0zwZ+UMzUR1Hw6hDB2FR+VtcbHmPHbK8ku+zdWYzHl9BNQRfdrnheH3tfKDw7h5sRRaQImFGCV8z7I60YRH5yY7NRhYRTYSuFtZbKidQLu6/E3FbCL6rB1mIVBovJ8Y1uZifapZr4Pq4AvH8Dg/oe/vjNv2GaJ+jNLPygEzUmvQ6dFnLTDSWaRbArViDZXbw3mhpvBGDdAEFNXxkPnM8Us+gGnpMS1ThSKihdNtGNN7H3nWCsfnT5YovYTKNQhYGF8+BJelcMvOq45NY5U27zyuVZQeMonmRSazt4YucAnXngwebpeBjziFctuCvblFtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(23010399003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HClbuwdD6uF+D48lL/g1NHsLl4+86A/Pw0dQ8lwgP30VH7a8GzsJvnOpY4YW?=
 =?us-ascii?Q?gDEnjNPfA7ns891fZYQ6DhTRCG4UYs5ksh8SP0cR6RIjBi/pR2QemdJCqXeN?=
 =?us-ascii?Q?lUAzigyJlM/EjJBkJ3g+vU9uTfeDZmb06sQlvocLyfnCkMKTJlDV01/XWboR?=
 =?us-ascii?Q?TCP8xiHOV6B3JZT+I/86sCaten6Xx/gx244x10TG9VgbzUgWtNlgOYuJHqmP?=
 =?us-ascii?Q?ye412nBClyWBBL0uN56g3EDr8iHm6tQhURVRdfxYo6WH12bei7t/X1sFFNrI?=
 =?us-ascii?Q?srHikT6pUUwVkjCTr2kJvwDx9W71Ms58zeyfFkgk+deDH0myk5ucXOm5ZXT5?=
 =?us-ascii?Q?pc2/qeg8eG8KRXn7/2NvzuV0v4dsqJivV9DbLVlYhbQ7UdIOxoqyIO4ZBmZs?=
 =?us-ascii?Q?uOBpflC+1rvej4SUnXSpL7ec8QGjZCB8XtwW7UYDnshr4O7fP+SHOg3WfE8a?=
 =?us-ascii?Q?84Sn0KFCH1jkcB10e4xGP/L/tpLObiFXaOvxfWFsojlYgsPe8Y4/E+KQaFXT?=
 =?us-ascii?Q?oZDvFAEuTkhQA/m9utLW4TdZjShJWZo39EV71tNoh+rKGmAShX1I01kMhmSh?=
 =?us-ascii?Q?puym+zKGVR0xDdsxQgHYf2apB7ER+u92yIKU8HF8/sAHHAwtUijPHZIjj9D1?=
 =?us-ascii?Q?sjmTJbvyXabu0gAaAHK2bh6b55Rwf5Leq1hxL9fTwHacdUU4lVGA5ZPik6Dk?=
 =?us-ascii?Q?v6AKpeyNDjFPI/gy1AmeVm9qx/Qr/1aszHhMvOcpOxAEk92iOvfoLifkZlRA?=
 =?us-ascii?Q?6UNo6cfW7ThAnEFS0w/t29h2uB81FkK2yiH0ayklIjdnsh8ju26205sUxMhV?=
 =?us-ascii?Q?QGtcDGs+t4C9t4QPWq6nFkWTc2yrMeCpi583yCrw9/XPwT9TV912P3BBkOl8?=
 =?us-ascii?Q?7A6dK+yJOXZUjUykcV8gbFFLwzLkim35+SYxOySLV4FzNRFHE3/hBZzUMZ/D?=
 =?us-ascii?Q?s6kZ1qgfe2PMXNcWObXQP3D8KmVBSw8fgaTI5ZURYGytFQX0tJiOPtIvHQmU?=
 =?us-ascii?Q?5W3XjZ+1KtXmEt/vcRYaX0vnaRhWFtgJcowdmhf8EUu6CCt8+5s4je20r1xG?=
 =?us-ascii?Q?+Sb1w8O/zTdvitNbD0GXgtNEXAPtiUa1KSSYdSJS0FDJ5fD+btZYxvidSCDW?=
 =?us-ascii?Q?tHbGt0T/lUv7ZdeVN+gU4Mena0VNDz/lEhx0moxiUypXNcup5W/7GKW85Qjc?=
 =?us-ascii?Q?ALQNtltEWunh5YJgVqga8CfcGDEyZWp4eTJ5nmmXp1ewEmzlULZMrb2xAHQ9?=
 =?us-ascii?Q?CEL6EnfgadK3Wd3+kiBrUazMpWDIaoy6Eh+Ne09X4LVpgF4pPxSZaunhebbG?=
 =?us-ascii?Q?NbOaUx0JVsXhBs8SzYgvlYEn4UTeVJ1U7vtDi0X1UAzHK+7vIA+dKhqejSmP?=
 =?us-ascii?Q?NGf4q4LgqJqBIhSXUFgxgIEdqZn7kBXskaqbwEhRWx0rxyX3bFc69hfSR+5p?=
 =?us-ascii?Q?SsmCWZEVCaBkduZGB7vIcQdjWAyYPtjbUN1wUrSPygoZrz97+FWOxzM/BwJZ?=
 =?us-ascii?Q?LRVa9wRv20DlNTPyO5RBxhodbHVZTIl4hjrPVadjucTe/Qcywh14whr+7uCe?=
 =?us-ascii?Q?WfSPyTHQOu94taxMNsniaiXvMIzOMfOoc8Iu3h98GAr960IlY75/mBct4cgE?=
 =?us-ascii?Q?P5+owqe48i1rcyCqy4KAHS1gEIVoO0qY9Tp37Ry7bQc4K1lUvARt2CXV55S9?=
 =?us-ascii?Q?ATNzSFWxp2kKEkqhZLr0mO3thDbD3PGd7JWo7TO3OAXQyQ0tLKDeFl/yjvfH?=
 =?us-ascii?Q?6eU707I7H9ZD3QlQPmXBiet0DZsD7LLQKeo8m85jvX+nCkz5m9Ey?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50655ebb-85df-40a1-a962-08dece3904fa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:29:02.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmFyFFYTsDyFGUGtOuaHd+NezF/qGWrUzPR2e0qbqzPmOqWn6u0Uv7J6mP3gOIGy82uAb1V7OQHO2MY5f8fRmUQRQ2KYR/VY3L936STmRKl62jiXKydpbxEiduYWzVOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_122908_704763_F8AE5E71 
X-CRM114-Status: GOOD (  29.79  )
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

On Wed, Jun 10, 2026 at 06:54:08PM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Validate GET CCC payload length after a successful transfer. Treat a
> short read as I3C_ERROR_M0 and return -EIO. GETMRL accepts exactly 2 or
> 3 bytes per the I3C spec defined formats. GETMXDS may return 2 bytes
> (format 1) or 5 bytes (format 2) per I3C spec.
>
> Retry GET CCCs once on retriable errors: I3C_ERROR_M0 (frame error) and
> I3C_ERROR_M2 (address-header NACK, e.g. IBI or Controller Role Request
> arbitration per I3C spec section 5.1.2.2.3). SET CCCs are not retried
> to avoid repeating side-effecting commands. Restore dests[].payload.len
> to the originally requested length before each attempt and again before
> returning an error, so callers that adjust the length on failure (e.g.
> i3c_master_getmxds_locked()) do not underflow a shortened value.
>
> Use a stack buffer for the common single-destination GET case and only
> kmalloc when ndests > 1.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
> Changes in v3:
> - Drop the change that moves RESPONSE_ERROR_ADDRESS_NACK to default case
>   in dw_i3c_master_end_xfer_locked(). Now dw_i3c_master_end_xfer_locked()
>   returns -EIO for RESPONSE_ERROR_ADDRESS_NACK.
> ---
>  drivers/i3c/master.c | 111 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 110 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5cd4e5da2233..c94d37cd8b3f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -26,6 +26,12 @@ static DEFINE_MUTEX(i3c_core_lock);
>  static int __i3c_first_dynamic_bus_num;
>  static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
>
> +#define I3C_CCC_GETMRL_LEN_SHORT	2
> +#define I3C_CCC_GETMRL_LEN_FULL		3
> +#define I3C_CCC_GETMXDS_LEN_SHORT	2
> +#define I3C_CCC_GETMXDS_LEN_FULL	5
> +#define I3C_CCC_MAX_RETRIES	2
> +
>  /**
>   * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
>   * @bus: I3C bus to take the lock on
> @@ -925,6 +931,61 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
>  	cmd->err = I3C_ERROR_UNKNOWN;
>  }
>
> +static bool i3c_ccc_get_payload_ok(u8 id, u16 req_len, u16 actual_len)
> +{
> +	if (actual_len > req_len)
> +		return false;
> +
> +	if (!req_len)
> +		return actual_len == 0;
> +
> +	if (id == I3C_CCC_GETMRL)
> +		return actual_len == I3C_CCC_GETMRL_LEN_SHORT ||
> +		       actual_len == I3C_CCC_GETMRL_LEN_FULL;
> +
> +	if (id == I3C_CCC_GETMXDS)
> +		return actual_len == I3C_CCC_GETMXDS_LEN_SHORT ||
> +		       actual_len == I3C_CCC_GETMXDS_LEN_FULL;
> +
> +	return actual_len == req_len;
> +}
> +
> +static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd,
> +					const u16 *req_lens)
> +{
> +	unsigned int i;
> +
> +	if (!cmd->rnw)
> +		return 0;
> +
> +	for (i = 0; i < cmd->ndests; i++) {
> +		u16 actual = cmd->dests[i].payload.len;
> +		u16 req = req_lens[i];
> +
> +		if (!i3c_ccc_get_payload_ok(cmd->id, req, actual)) {
> +			cmd->err = I3C_ERROR_M0;
> +			return -EIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * M0: transient frame errors.
> + * M2: address-header NACK (I3C spec section 5.1.2.2.3), e.g. when a target
> + *     simultaneously asserts an IBI or Controller Role Request and neither
> + *     side ACKs. Software should re-issue the transfer; the controller wins
> + *     arbitration after Repeated START.
> + *
> + * Retries apply to GET CCCs only; SET CCCs are not retried to avoid
> + * repeating side-effecting commands.
> + */
> +static bool i3c_ccc_err_retriable(enum i3c_error_code err)
> +{
> +	return err == I3C_ERROR_M0 || err == I3C_ERROR_M2;
> +}
> +
>  /**
>   * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
>   * @master: master used to send frames on the bus
> @@ -936,9 +997,17 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
>  static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  					  struct i3c_ccc_cmd *cmd)
>  {
> +	u16 req_len;
> +	u16 *req_lens = NULL;
> +	u16 *req_lens_alloc = NULL;
> +	unsigned int i;
> +	int ret, retries;
> +
>  	if (!cmd || !master)
>  		return -EINVAL;
>
> +	retries = cmd->rnw ? I3C_CCC_MAX_RETRIES : 1;
> +
>  	if (WARN_ON(master->init_done &&
>  		    !rwsem_is_locked(&master->bus.lock)))
>  		return -EINVAL;
> @@ -953,7 +1022,47 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
>
> -	return master->ops->send_ccc_cmd(master, cmd);
> +	if (cmd->rnw && cmd->dests && cmd->ndests) {
> +		if (cmd->ndests == 1) {
> +			req_len = cmd->dests[0].payload.len;
> +			req_lens = &req_len;
> +		} else {
> +			req_lens_alloc = kmalloc_array(cmd->ndests,
> +						       sizeof(*req_lens_alloc),
> +						       GFP_KERNEL);
> +			if (!req_lens_alloc)
> +				return -ENOMEM;
> +
> +			req_lens = req_lens_alloc;
> +			for (i = 0; i < cmd->ndests; i++)
> +				req_lens[i] = cmd->dests[i].payload.len;
> +		}
> +	}
> +
> +	do {
> +		cmd->err = I3C_ERROR_UNKNOWN;
> +		if (req_lens) {
> +			for (i = 0; i < cmd->ndests; i++)
> +				cmd->dests[i].payload.len = req_lens[i];
> +		}
> +		ret = master->ops->send_ccc_cmd(master, cmd);

why need retry here?

Frank

> +		if (!ret && req_lens)
> +			ret = i3c_ccc_validate_payload_len(cmd, req_lens);
> +	} while (--retries && ret && i3c_ccc_err_retriable(cmd->err));
> +
> +	if (ret && req_lens) {
> +		/*
> +		 * Drivers may update payload.len to the actual RX count;
> +		 * restore the requested length so callers can safely adjust
> +		 * it on error (e.g. i3c_master_getmxds_locked()).
> +		 */
> +		for (i = 0; i < cmd->ndests; i++)
> +			cmd->dests[i].payload.len = req_lens[i];
> +	}
> +
> +	kfree(req_lens_alloc);
> +
> +	return ret;
>  }
>
>  static struct i2c_dev_desc *
> --
> 2.43.7
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
