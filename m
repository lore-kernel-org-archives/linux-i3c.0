Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ACCCA5FEE
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kg0OChwGQiUs5TGW0fu9AfCsTXH28BV8f6q6UdtzSN8=; b=yDlp5zlhpngnkynnWRsyde5QeN
	edaW8XZnIcTOL1YYyINuWknaoM9iQXKS4b4KrJAzYRRctb7U6dHgWEjyBEGMwjJTJgkEvsNDfoLJu
	rrzFVBDghU/3ruQaGX35od7w1wXYUDdvUXuPo92zwt20Y8rRWGxRoF7Zl8t7t2T4cQP5R4HdGvRuu
	Mt28jNFzmFqp7QL3l64+dFCah1PEpmAK29XZ/Qxt4pDq6Nt5sUv6T7nQrm+Ab0rqUEfM2wJ8SH807
	2dMFaCFeQ3S87tcjI11bzZr5hD3fGyzakaPmKTrAEagtLn7Gu0R+SVNHom/FW32xFN3LFku4gwDHL
	a63rkhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhinv-00000001PB7-1NKK;
	Mon, 19 Jan 2026 06:31:59 +0000
Received: from mail-northeuropeazon11010025.outbound.protection.outlook.com ([52.101.84.25] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhinr-00000001PAB-25d9
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 06:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGTiRHQxBEQgN/WIc8RxfylF0jgX4+l4p4HI8u/1dXpkKSSFwoOYeAchb/+J9N4acOmpof//5Ih0przNiXHcll9Bj4cQiFjkeTSbtB30+/JEbEO7nbDK3CsfFYBI2Gg2sZgSB2rV8uXEmj6XFywxzBWRenUSGSj2V2IGUu9Fjg3/SEForaafhD5LEEl6YtCj1l0V6Jq2og++iwqnCyHSWQOtum//y4dWOjdBE4D20uNII7VTmTACaRYTuohAnbYfuL24AfKCeNLZawUKnSUWSpZmeurtl4cvxo1RN0OUVAby0z/qkhKx3Oum6jqK0Yl7Mxv/aG03vg/Plcq4QbEWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9Rp/SsJztJxRufs0VGL4CwYGUwEL9lcGDkT+jR+/xw=;
 b=xrfGAq6Tr5DzJSovk35PTdwr1ukU30AicE6DLbFCmMpr5nVLK+e97SiBhRqrOi+zDlhPQY9SehMUqVHRuALDw3ve5wsaB8rPtuLRfuCDYohPxpMX4hSe4ejwgXr/ABKWI7XHaujcbf8/kySMZh3AL2RC9gOe7OxrlJNJYgAzv3hIDK/zxlEltZfQJdSKSCYu/fgAIrU2L/wgt0a1484E8nYMXjePvL2wxx/q9aNxFkBLdP7QdgBfp8KW9jyrhjgQgQfvJnn+lCH7OpL3qw9ZaUppPjWSPSdJu7Xgs4zfidnDRZ7ZqkvRIzszVU9nfDseRqzxVkJgqv8wsrdu5TnZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9Rp/SsJztJxRufs0VGL4CwYGUwEL9lcGDkT+jR+/xw=;
 b=XuDRHXg7z8BnXKKIvVQ8N7n8O7KN3NQmvaz/pfvlSycyGj/TOEX4yHIFUntdxz1vZoHWXebeILe15MQ4ru6cb5NtIXRmVtiYOnt45AdFZtBm/0lbbkJFnYMZcd06VsFVGGBqADajYX8yDnZa5QV+omnfikzU4l66Tr5jDmLruwtmOHj7fKylBi2badjE6Mf9JOrMwMeGVepKVWG1pyDc5pFB5iq0EuJYwFHw6Rher1OCk/PvilVlZVPNI/YBqBlJMxU7N8LVHtZaRX8u1Gg09gCISMh216asOCWKDeBHc4RaF6zi8CqlrVKfMXv0bfkdpwUHYUogNKKEI9sMPh7Tbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PAWP189MB2545.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 06:31:49 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9520.005; Mon, 19 Jan 2026
 06:31:49 +0000
Date: Mon, 19 Jan 2026 07:31:46 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Adrian Hunter <adrian.hunter@intel.com>
cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, 
    Wolfram Sang <wsa+renesas@sang-engineering.com>, 
    linux-i3c@lists.infradead.org
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add optional System Suspend
 support
In-Reply-To: <20260116151237.96721-3-adrian.hunter@intel.com>
Message-ID: <fd311803-94bf-2f24-8941-3285a7358e1c@est.tech>
References: <20260116151237.96721-1-adrian.hunter@intel.com> <20260116151237.96721-3-adrian.hunter@intel.com>
X-ClientProxiedBy: GVZP280CA0003.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::16) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PAWP189MB2545:EE_
X-MS-Office365-Filtering-Correlation-Id: de55d6c5-b2a6-48f6-49b1-08de57246cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?06UVa00B20VNlLCw82Oy3ivPouYBxJECE4vFs7ehM/6dYE59HsobhFahjHUT?=
 =?us-ascii?Q?Tm+BcAUJuennirwpEiSraniAzLR0i4NdgK/H1rBbZqUQ6tW2aECiv3PhAbjK?=
 =?us-ascii?Q?LRXuoHVarThoCYxFBMwixI+3gA5TcXJXxaBQJZpyJTK+5be5xNs8sePkncBX?=
 =?us-ascii?Q?1lV2O46HkxOhiohM7j1RXdrat2dFbCLRjJ7Y8uupkJuxgeuKF+TxQrbY88wS?=
 =?us-ascii?Q?IMrQNkMBjPVgDy42zJGNn2QUMSGL3iFUH2bsgpAuf8CX9V0TEdWcbRvFlIC6?=
 =?us-ascii?Q?vBMBcN5L/VkpdDIEDRVhcbgLb0VfF/isadLrnbxhZivE4DSk4V26fXcsmS6y?=
 =?us-ascii?Q?ToEPwPMIZwxO2mj8mvXbxv21PgLd6AQSpY+TGstcYpMB14+npH5USK9Xfu3N?=
 =?us-ascii?Q?u9/WpxSZN5S1mHaMuMoO7PWaHz0Yo0psh5pS88cQ/P5qiwjpqFhOvd4JvkXn?=
 =?us-ascii?Q?fLx2rnEpBDA8aQOdRYx0XsB0FtsiLi4OHhI6zkKd6Gpqi56HmWgrdbqqUgnW?=
 =?us-ascii?Q?2Y+c6gq/4228b/zk2uAP+q9Yzz0D3jxe73+Tm0CrBX4BYHdgyhG1uLLep32f?=
 =?us-ascii?Q?+vaNe64H/J6+99YeaqK8blaB8uylewqcGn2SVVggZu/7rYSCO5+bBP+EK7Ax?=
 =?us-ascii?Q?Nb9SK0vkuED394yDq/imkkG8zrBmX6dCmiJVKhvHtIQrVAcTttUtaovdfQeY?=
 =?us-ascii?Q?JiMwP2dOn+1DyyrDsFHtPQsoh9NDs4GDKb4OGAvsKyUfSJRaczP6hnOifM13?=
 =?us-ascii?Q?AzHrRLieWGUmZG51HiDdYkPWdRVI25H4Krlsf/GQGXJKs1sSYhJ7w1tkuxCM?=
 =?us-ascii?Q?78T1y7LKoo1musFYWX0JKVPcXv8GbvMkoizMtXzGtUN2AXxDiA1y7F9Bp5wP?=
 =?us-ascii?Q?axBoAzSoDZ7L+/uFrpxSRoWStQ33QyGsq8mmwcRbCJWPOmft5TOZSTGI+N6u?=
 =?us-ascii?Q?1gb4RPBGTCeURS5K3vQhEhKcy19OVEyWsAoeREWZbCUjWI5Kdf3LD1N41Z1U?=
 =?us-ascii?Q?xrDgDFnvaVEAueSo+6vpBQN1n3mkGZNBzxnOj06nyH6jx94rJIZEUbdriInC?=
 =?us-ascii?Q?K8chNvZAWkY6ADKc064mrqZRtTk6SDblWxpbMWaM54JAtDv5Wl09jrDH1uAk?=
 =?us-ascii?Q?MwaVP4PIgSt7xBcnSdQKAV2p/bgvwrLxiuSBPibRfKTHzNa+PPVt2797lSRE?=
 =?us-ascii?Q?h34NqI90U/wFVQQep0wcGiir/eUuGh6fuNtL+rmZrAlyMZocltF3cJaGirfR?=
 =?us-ascii?Q?bssxnrYHVNlxt4tcHIFVJx/u8l0Ot+6YrQpK6N0/KdzJ4KDvj22xvkaf/NQH?=
 =?us-ascii?Q?ggd8iY4Sk4hmMlkH7JoqcIh/GBBlu0LDpwtA+3KHKkNGId7ePUOmU95qDIF4?=
 =?us-ascii?Q?ktDvs1bUUMoPx/hUJ+khJGZp3FsBUlEYZCpe9EwhQAUK3IMnsxOln9U7dBuH?=
 =?us-ascii?Q?SfaNoKvy+JyS71lSBl65Fo5veYZA0KslVLglWfrQCCfcQFYpiiIM1QMzA8b4?=
 =?us-ascii?Q?Ncrv9aprlEyAo3y2inkqtjvK8HpTB3lmEQ9P2UgPY1/rl/w0cgxfGz0e6rch?=
 =?us-ascii?Q?TKygGc67BvO+BsUfcug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hFfUFX71UCA/wp8A6C6X1+kerfc0pQGMsBoB00fiJdl7hzbZDyc7SO70xQoy?=
 =?us-ascii?Q?lMd6LMADXCj7IAwG54yf09A74eT+EhKUX8wcEZIa6GhoZgJvzhM/esnQ2i0v?=
 =?us-ascii?Q?PmxWCSUa4ZbiWCSDr78kDTugxb6ivi9ws9QQpcXW8ENj4NP+xnVBekD+UgTX?=
 =?us-ascii?Q?ecuiPxa0vfdIm/habySnfrcBKEnSaqir/YxtZCMnZ35fJ921ButBWuM70T4A?=
 =?us-ascii?Q?bgsn7uVUNDQU6iC05TQDki0qsIyZiCqbKK8Tm/p+9G9LYJo9oTZOGZu/wOZE?=
 =?us-ascii?Q?LKrbbL5++Bfeb0Pr1Cxf9OUMtOSkLhwJn5VAdjNS8O2qBfP7qhP4LNA4veQn?=
 =?us-ascii?Q?29A/JDlt1p2o4jt6CL58wdbjzupTYZdVpqT3heLDhxI9d4QWGfCmdDqtkhx1?=
 =?us-ascii?Q?VLW40JUGgNI6bgPbrbjX7L54QKPk3Pyd5u0iDmAFMkN3Wul8rMqw4US9mZ5u?=
 =?us-ascii?Q?1yODgv58bYqteFxPH1CgNH9+ClmZWESb7pHkcaZK0tF90D6eXZmeVFowHfSz?=
 =?us-ascii?Q?iqrcVgp7zGMsFXF9I4TRkUWQsnhk85eldgSUjKuBdzYiBBHzgb2xJNYEfy9E?=
 =?us-ascii?Q?PkRjbjeGpwG0ELogtHSc8lGZzRYW8erRNbILxIUbrHss0510mq2sKUrvpOYR?=
 =?us-ascii?Q?gXOfHIaLau4riU4764R0ut0E+bK4eD6Qjy8iOzLSSDkXdmyOKsKaRqwsuNf5?=
 =?us-ascii?Q?I38QLvvbpsF9+n0VZ/RBPtj5t4I9C6rYs9n27bZfo3c9ixrSrS/zohA+SohA?=
 =?us-ascii?Q?hinEFN3R20ERbyB/K/DN8Z2CnTs5ms+1Hrtou0W94Kv6I6Z/J9ClodcRYzc0?=
 =?us-ascii?Q?hAXbENdPpYFPqXJKN/Ta6mt9H18nV5q/UiMf2b3ZW8571XeT0lbdo3dkOPJL?=
 =?us-ascii?Q?UlrQlaVeUpai+OTnymUNY79TiSBHNK5RTPDKhCEDYAjCs1Czb2n9vuOtFyxb?=
 =?us-ascii?Q?0oJENCBbqO1dJIyqxi73pLC/3rGmp1MdSp+DtrsUywriN2PKm2tM5HKYuXPl?=
 =?us-ascii?Q?v+ogz0qRQjBQI7tJztnhqAWsUlTUE6SGabMqUrtT40LeMuykzqSNXy69eOu1?=
 =?us-ascii?Q?AXKZHvjJhwPnqYLXsmO/mozeIH9dy3bz8MNtDRDwYRU+mKsAmvGdNOGr9uXY?=
 =?us-ascii?Q?LKvvPCQe7aTVFsDSVpBxmLjcP5QdX3dU3gjJKu1ql/D4uzIknmfZl6mVnJMU?=
 =?us-ascii?Q?tK3vhhkVAhBz91JcVga1xulSDcQHEocoxADnwEoObLyT9Zrul9yDikfWNzzB?=
 =?us-ascii?Q?xTcU9+Oa29pZXXOlJ/5X/EgrI3mYUXBSgxNCTHNyU0MVBU0pU+RAp5cn5O7q?=
 =?us-ascii?Q?M/LRLaa9bHPodOzAULpmM1sk6xc9akiOO4fGuTH1QyR3/2Ox+8zLFrogE0GP?=
 =?us-ascii?Q?mY0bZH1a2vxSQo9XVnu5BqVDRnUsAwch6weXE5xyqAvEv78tn4PTXEF1xxIK?=
 =?us-ascii?Q?nZSCSBsq9g7DqDGH/GLn8Mh/ZbIPe8oLrNdhhoforNYK8r3Yy6FDraMa6seT?=
 =?us-ascii?Q?EzmtuisFtddfrHCM65c09tucSMYIhwJ4P0JkGY2HOZ62madL/UhdvRcAXSf5?=
 =?us-ascii?Q?Ort9UvZ4s10IrTiH5SYlAGcdsyacFablBQhqeRnvHUHaDnVhJTzlxsQtq658?=
 =?us-ascii?Q?9pTEitfj9OV6OZPO8S/ZlFBa8ddGOY+en8fW/sQr96lci6t0wgDExLCUZbCB?=
 =?us-ascii?Q?P6SfNnfpuyYrv03oYIpiTplRa4bILBWPdwEmD3ZiJU9qbPZbXtYhPUggdpjP?=
 =?us-ascii?Q?kq1SpgL/xw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de55d6c5-b2a6-48f6-49b1-08de57246cee
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:31:49.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0nX4XII6TeQGHXaRasnvNR1KzNpeL2WJzpSUEqtbcGD5Rxspg4jJafwulMK6KCri6dUQKVsLGO0PGDixdlWgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2545
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_223155_594070_93173C77 
X-CRM114-Status: GOOD (  20.09  )
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



On Fri, 16 Jan 2026, Adrian Hunter wrote:

> Add system suspend callbacks.  Implement them by forcing runtime PM.
> Consequently bail out if Runtime PM is not allowed.
>
> On resume from System Suspend (suspend to RAM), rerun Dynamic Address
> Assignment to restore addresses for devices that may have lost power.
>
> On resume from System Hibernation (suspend to disk), use the new
> i3c_master_restore_daa() helper which additionally handles the case where
> devices are assigned different dynamic addresses after a hibernation boot.

Why do you make this distinction ?
RSTDAA+DAA during boot is motivated by that uboot might have assigned 
addresses.
Why would we need to behave differently in suspend and suspend-to-disk?
Its fair to assume that I3C devices might have been powered off in suspend 
too, right ?

> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> drivers/i3c/master/mipi-i3c-hci/core.c | 53 ++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 02c5a133e329..b972d8bc81e6 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -769,6 +769,53 @@ static int i3c_hci_runtime_resume(struct device *dev)
> 	return 0;
> }
>
> +static int i3c_hci_suspend(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +
> +	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
> +		return 0;
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int i3c_hci_resume_common(struct device *dev, bool restore)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
> +		return 0;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (restore)
> +		ret = i3c_master_restore_daa(&hci->master);
> +	else
> +		ret = i3c_master_do_daa(&hci->master);
> +
> +	if (ret)
> +		dev_err(dev, "Dynamic Address Assignment failed on resume, error %d\n", ret);
> +
> +	/*
> +	 * I3C devices may have retained their dynamic address anyway. Do not
> +	 * fail the resume because of DAA error.
> +	 */
> +	return 0;
> +}
> +
> +static int i3c_hci_resume(struct device *dev)
> +{
> +	return i3c_hci_resume_common(dev, false);
> +}
> +
> +static int i3c_hci_restore(struct device *dev)
> +{
> +	return i3c_hci_resume_common(dev, true);
> +}
> +
> #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>
> static void i3c_hci_rpm_enable(struct device *dev)
> @@ -945,6 +992,12 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
> MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>
> static const struct dev_pm_ops i3c_hci_pm_ops = {
> +	.suspend  = pm_sleep_ptr(i3c_hci_suspend),
> +	.resume   = pm_sleep_ptr(i3c_hci_resume),
> +	.freeze   = pm_sleep_ptr(i3c_hci_suspend),
> +	.thaw     = pm_sleep_ptr(i3c_hci_resume),
> +	.poweroff = pm_sleep_ptr(i3c_hci_suspend),
> +	.restore  = pm_sleep_ptr(i3c_hci_restore),
> 	RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
> };
>
> -- 
> 2.51.0
>
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
