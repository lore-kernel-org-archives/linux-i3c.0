Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EBCD12D6A
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 20:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o88jf0FYr1TmrjLC3zBd1vNysJFRL2bKD295gmNbdEg=; b=XXzQ6f6yOdkqrf
	/daYtWBXio6ImokHBg+9ACjLMc2bv7lsPfXy6hnT6CfXg16wJiyeOuXW7nopYJv/FPxvv8B9IwdCG
	20kAk3OWBgKh87iht02c8gOxtc0XrC2/mq+xH2e6gJHoQCnGxtHYchQxr9Pt09OwX0eM48+0/9esD
	3ulKyBVMPxCTC6hXnTNxpMw39oWGfsLEyraC/r4kl6zsjeMDIIpyr+wWuvhlJM6SsKv/oKW4FIpdW
	0uH0uaxfsgbGP+nBI/oeSKrsxVK6Qb7E/yD8s7uXRR30eO5CXXALZSEvNxJQ44XtIHn4OF/WKJNaa
	y0fDMAZEZOYJYthBOv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtaS-0000000733Z-1biy;
	Wed, 03 Dec 2025 20:36:32 +0000
Received: from mail-francesouthazon11011063.outbound.protection.outlook.com ([40.107.130.63] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtaP-00000007334-4C4H
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 20:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EW8zK5e5PJHMa3/QK5W1N5BanPbC39CzQiJgqfFmRojpvyYQvqGbOJmkSy4tcKjmCJlp2XrFhgVyYS0VifFM0rHj2ppG0jbDMYiTjlfgZIurBvEv7Hqo8E75UAzYaPHP1sRKrV+vNuz16z2oAZ8noqF7sjy3YtdSY38CfGrpz+oXiyh7CD2kBBn1vQfgq7awagk3vpCSEbOUUB54gH8bVcsOTUExFrJuXfK+VaMIIQM8UQsoJto+bSCmuN60egxu9JN40w4x34z0H1XLkUjWo4iRzjO3tuDUpiaKv12U6kH/OqsFa+YGxtbySmYJgeC0gBtSkpeeo/9N5IkENqYfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th6hnLLEOgzz2427LnYNC8chOzj67oa4wtuy8DlM29E=;
 b=qVekzYiI2mG3T20vuyMHyM6No44OlzzjkrSgWBri668hQmJtRplwwu/Gd6j7M15B1Uu/R2MUHzvZ12H+/rTlP7I/7P0tMmmXlezrVy8RP6vSBpR09lNHkxKx+sSSepp4Bx+qekVD1F1S8+fFL4pLUzdV3Vy6pqKluJWyGheqWc/pPkbxO2KuzuXjVYtoW10Ks32lhFu8xfZ3b+OalWbPBfpuPu6m3LgzpqF9RBmdaMVArroOMm9g86igdNcP7BlIhtZECQDsQ4b4eCH1sFnScFg5ESEeX/EtX28BlJsp0IweLRgx7gbnHKxC9odZguwNDHjjAkJ6hROxfVTXLjKmag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th6hnLLEOgzz2427LnYNC8chOzj67oa4wtuy8DlM29E=;
 b=StqMnPq/jkW0nlOEOqGCK/ttamsjg+BjnmXXQE/9Ic9JG/cPx3HhOk+PILzWdPesHKrRZhQsYYQgSno3hojgDQgGRgscsENT9y+UkbTMX1Y/2zXfq30kkgZxO8iimRwth4f1MwqlaYmqlLD4Ree2XaV+PhXMFOgU5hliXmjMEcXS0CwANnNmvYMHpafgHTjxtUX6Vm530l2WXkd4dhOHpd1i/xNge3bLDFDqX6AYPClMbVDsODruJX2DbPu8Lw8w/Ym6wc64bqDIRQdQFbn9iUoTax46YEXZ3sUi5vgJyAnqeBXhuaUxBDxdJRjU110jUP/LoAs2sNXGXKvy6+mohw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VE1PR04MB7424.eurprd04.prod.outlook.com (2603:10a6:800:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 20:36:23 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 20:36:23 +0000
Date: Wed, 3 Dec 2025 15:36:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] i3c: add sysfs attribute for device NACK retry
Message-ID: <aTCfQIWkZ4/U2U/6@lizhi-Precision-Tower-5810>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
 <a12dcd1eee62e7394c233ce67e0463d4c3767fce.1764746266.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <a12dcd1eee62e7394c233ce67e0463d4c3767fce.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VE1PR04MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b4e5b7-d7d0-4867-a1d7-08de32ab9f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SnsZDp3hUgmlYsdJEZg+M5sT4BjuPDks+2OSVZhx26cMDZ0IrimSe49PVyhC?=
 =?us-ascii?Q?/oPJqTCFLEtJ6QNuHXVrv7ZcFi/eAoswSxklEqkJWKbDscChFhStlHd5suqi?=
 =?us-ascii?Q?1vLKz6VEvj1lWHT6VZydyy6S1555aoKCibgOIBkylyvQzBUBLgFmnWZ8CToy?=
 =?us-ascii?Q?j1Dx48s2Z0l7DYCa1BlR66Wm2LkvoSHBS8MPQAHXD4tw6mvKjphDzeHLmhbS?=
 =?us-ascii?Q?gM3JPzfkyMM8I8CXU3AVBdsGCVb0V6wboeIQty421OHCUu/q33qv9eKiz0A8?=
 =?us-ascii?Q?1oAK/3Twwt/fl/jX3gh/I+uYwsIvy4vowVwrGFRns3a5L7UwEq34G6/c4Uxs?=
 =?us-ascii?Q?Gww7cpJtTTs0a5LKa/0y1vWPjnn9LHf1IW6Y9thIa5xam+uo94h+aYrr/SU9?=
 =?us-ascii?Q?GpiLycVvKu9QuVO0Sp+AbgeKZYcq55BKKd4Q+tgAsq3duAgUT7qoWKq0//XR?=
 =?us-ascii?Q?ZnXKDoeBCSCAjRAbCr9ti+NZkmjEDcCstBpa4NnI+cqIZmf62Jwya4Vf4i/s?=
 =?us-ascii?Q?UIhjeMZ4zsURMyqq+mTEVI0shsEGEyyz5OE5sDjjJsyDEKukLg2fW+Dzm5ri?=
 =?us-ascii?Q?TWiDqiFvFTg3au1Pq88VKZO0elweem4iZ3PJtowI63R+X6Q1skoEZ0ifloSF?=
 =?us-ascii?Q?AnbdlljLLmAqrxupIPJqLttn4MYWzteC9IANWWvjBmCESgg9pzky6HuZWQCe?=
 =?us-ascii?Q?F4gBD3heaAhwYuoKaqh8Qkmn301++wxWaeEcboyC67it/UZ70pPfaiLWG9Mx?=
 =?us-ascii?Q?iAfwpDlf1hHkQwuGMjv2J0aqa9mx6tjHsq+MrmDfLHJk6x7zpdnYaajVDV57?=
 =?us-ascii?Q?A5xc8q2usf3euyfgC8xIqUKheXQ/0nGo0+cFv8dJ/y3v/CU5RiA44iz87g/2?=
 =?us-ascii?Q?WF4MnNRgEvgPY0az42EonWIg7en7Ms9t08GGXdGZ7mZaBYAC9vHQnn35tlHb?=
 =?us-ascii?Q?Xb5PW9pzoDTFWHS3Fo7DXIQyL0Z8h94LIgWh++mjDmhts05VPKxSK5uXCRg0?=
 =?us-ascii?Q?0TEbSED/A25prEwUnPJln5qrUh0XLAdvCxuJgo3NWHQwIFebxjF3wCmh8SBu?=
 =?us-ascii?Q?3sNqqttzIkxnuOFTLDQRC+fjEMwh6CSpaWPy7EGCWeupG8E1krN8DASicoXZ?=
 =?us-ascii?Q?M0s5lXVN4xfOrn60k9vPBcY4Cts8Of+y9OOKD5rNdfYZnJcGTGV42VHbk6TY?=
 =?us-ascii?Q?+w+XfnENLd8B40XSy2E4Na2C/51xfvJLA0JOJL33pE1Oyuwi1L6gdIw0pKFb?=
 =?us-ascii?Q?zVkOKxCEWgAWpv70ABch9ZH126KdkYOJu0FmwLL7sraTG+yWGMsGXzKO2h6D?=
 =?us-ascii?Q?PmcgbDUxkG7q/RiQzQWypqzT28uGEtO7hqUD7kRxZdBpNeqWuMiJz0ucdkoV?=
 =?us-ascii?Q?70MEWwXUjbORk5qoErtdvBibxzb42C2H5CcGACRg2yzDx+td9JKVMg0Px8eN?=
 =?us-ascii?Q?r+rJI7W2OWm0XwpDgXOUVgYqU9lWbYMKSpIUmTGVAxd+pZlyGFTAvZ1AN8DT?=
 =?us-ascii?Q?YJ9+l5/HdgTfKuaVWXYrMJTzgqCCP9/WLLmb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OqfP3PxbJj6FI6zKZp0dsvg2j8Q1x9P+NLrMKy5zZkn1VT05VSdEj2ZqCFv8?=
 =?us-ascii?Q?s5K54esIj2yEpUYGx+6u9pFpGiouKF538tO+BsLnyQ516oqugbpj1pjZEo1n?=
 =?us-ascii?Q?ss68CztjnlteOSXISKk9cNlDAXOGgYiJH1NHohCwn+faotHqX9oIE4NH05V7?=
 =?us-ascii?Q?uAGieyc1b6HECfvivyDmcjlSeEUBcN7ULI4/OX08D6TKvv5DGc2RPblT+gxu?=
 =?us-ascii?Q?jx2VehwwGaXmGOlP8OMVuf5AmOAJlPFQU0kXGIAufWmF0ZMv6zb0Hkc7BiUw?=
 =?us-ascii?Q?5huo5kraAQyESMlWJvykB/6QvxMUofqRKdw4dz4yBZPpo/Gv9mhj56AkyyOY?=
 =?us-ascii?Q?HG2CP/7UJDtX9VM3OZCsVNp4hUCnJBrIvEIpEp3+mmluR2r8S5Z1UJ2egTiS?=
 =?us-ascii?Q?olDExIlO7ls3LO9Ag3rM0sdsweh4Irl4FKB7e9oX4OQVsn1QnFczruNDFpAF?=
 =?us-ascii?Q?xG2uKQenYeeGJ6eo4hgqiK9pGT4Xz2kqx86wo0dOlpQSDrgpw713+AZbHtse?=
 =?us-ascii?Q?4xf6JYn0AQbYUl9anM0W59z9OjT1KniGeXkCQvVwe2S8abFO/GnSAC7yd0g3?=
 =?us-ascii?Q?aySTW2vzg3Yox3L5H1Gmu2K4ykEVarQP8caLePCsidr2QbU0dxnWJwych8vt?=
 =?us-ascii?Q?EIgiNBAjL1BchR4AXzz0DDcZ3t5Kl1fXV1MUf+sVS56lu0BLRaeqcDqlB6Yd?=
 =?us-ascii?Q?1diQi3aPaX6lUi0N3i053QjKMAetGQmM5TmAqawZAa8KHhilgC7kbfzvCQrA?=
 =?us-ascii?Q?CFpDkxl0Ye9vV4W8Oqjm3iPTD9AgHYjESaa+Ir6UXN+UX82aByl5ynjSuNtQ?=
 =?us-ascii?Q?4wWdxm2mDJAZ2tsXIbx3fs568FnXxdeiqmJ6+n/rhaEhKeCQLyH/XLu+5MjB?=
 =?us-ascii?Q?JY4fymy+pR2MLEbKQFh7yy3OENmErNcsRrBWzws0HNCbWZBqmy/PYI/etIkQ?=
 =?us-ascii?Q?jVNNS4g8ppXAljAO6Q55rOpveI1O8XzDoFe2PhvaoCsrSw81X1nWlF+a5Ljy?=
 =?us-ascii?Q?k/+WSfUd+SFrkInVBW+U7dEdoc07Ujtaqt8cPPYemZl+FhwcyNBFg30FMrt5?=
 =?us-ascii?Q?sk86my2cvaborR/0+v22UUiil9AbflM/oQgWdpZjM1eHd+J7BN5TjiBDRzH5?=
 =?us-ascii?Q?1wOrCPeYsTTeSvpigz4kDsLfMgMTd0ni0WrBp96Vb2JeYKfhH7fKQJ2Sa1jF?=
 =?us-ascii?Q?bQKfTzBbcFYcjj57lhUm6VQ7sb0F0/Lf621nWFfGNS7Tkg35xn3oW3nm1hl7?=
 =?us-ascii?Q?K2wYODDbza0KcbRLHlToAh2LA63WzhFOb9gOUXo076ZeclDS1HG4NDEhurBk?=
 =?us-ascii?Q?iGt3ryU7v6FRAIEcqOV800cDsK+/Vub1BIUekTbiuO/ny5MYMfiGTurP+ijF?=
 =?us-ascii?Q?Iy7iPIxxVGVpusnnWViHAjvDUbweVbTUlgN82z5nqRBxoOOPCJad907Z5CWz?=
 =?us-ascii?Q?QUL8E6ginK6mYlg7dSXplRbqWdSZ20D/A3XvWgfEi5RrqloqtG0sz78ujfr9?=
 =?us-ascii?Q?OnkSNX65MaYlRi2Ooz6l7KHE6AwPm2TO9j5JwvAeegVdaGKTtCq/qybtzQ9+?=
 =?us-ascii?Q?ax8Qtl4scbTRK2OZ5+If6i8GI3teeYPkPph4cAQm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b4e5b7-d7d0-4867-a1d7-08de32ab9f98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:36:23.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OwH6JrlzXOutWxTQczrgDjooN6jCRQWonSjvOD7mW67kv4CZMzkf0CjTBesSUlWdzk6fDt1bnikHiSECQHa/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_123630_056918_6D3C9DC0 
X-CRM114-Status: GOOD (  24.59  )
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

On Wed, Dec 03, 2025 at 03:21:03PM +0800, adrianhoyin.ng@altera.com wrote:
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
>  drivers/i3c/master.c       | 41 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h |  5 +++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d946db75df70..e67f54c6e865 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -685,6 +685,41 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
>
>  static DEVICE_ATTR_RW(hotjoin);
>
> +static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +
> +	return sysfs_emit(buf, "%u\n", i3cbus->cur_master->common.master->dev_nack_retry);

dev_to_i3cmaster(dev)->dev_nack_retry.

needn't i3cbus varaible.

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
> +	master = dev_to_i3cmaster(dev);

you move it to top

struct i3c_master_controller *master = dev_to_i3cmaster(dev);

> +	master->dev_nack_retry = val;

save retry value after set_dev_nack_retry(), in case set_dev_nack_retry()
return failue. master->dev_nack_retry should keep previous correct value.

So you need add argument at set_dev_nack_retry(master, val).

Frank

> +
> +	i3c_bus_maintenance_lock(i3cbus);
> +	ret = master->ops->set_dev_nack_retry(master);
> +	i3c_bus_maintenance_unlock(i3cbus);
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
> @@ -2962,6 +2997,9 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	if (master->ops->set_dev_nack_retry)
> +		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	return 0;
>
>  err_del_dev:
> @@ -2987,6 +3025,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
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
> index c52a82dd79a6..ee254864c8d2 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -462,6 +462,8 @@ struct i3c_bus {
>   * @enable_hotjoin: enable hot join event detect.
>   * @disable_hotjoin: disable hot join event detect.
>   * @set_speed: adjust I3C open drain mode timing.
> + * @set_dev_nack_retry: configure device NACK retry count for the master
> + *                      controller.
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -491,6 +493,7 @@ struct i3c_master_controller_ops {
>  	int (*enable_hotjoin)(struct i3c_master_controller *master);
>  	int (*disable_hotjoin)(struct i3c_master_controller *master);
>  	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
> +	int (*set_dev_nack_retry)(struct i3c_master_controller *master);
>  };
>
>  /**
> @@ -510,6 +513,7 @@ struct i3c_master_controller_ops {
>   * @boardinfo: board-level information attached to devices connected on the bus
>   * @bus: I3C bus exposed by this master
>   * @wq: workqueue which can be used by master
> + * @dev_nack_retry: retry count when slave device nack
>   *	drivers if they need to postpone operations that need to take place
>   *	in a thread context. Typical examples are Hot Join processing which
>   *	requires taking the bus lock in maintenance, which in turn, can only
> @@ -534,6 +538,7 @@ struct i3c_master_controller {
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
