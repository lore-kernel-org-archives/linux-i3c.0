Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8637FCA1012
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2L7na72NFl8Y6/LoBjTeIADKK4jLW5LnIUu4h14jcy0=; b=BGmbEKlqaYipMA
	M9PGXLKHYdtqxlgCw6oG8sfKUB8BdOgErsDeb1gTUqwN0r14D7S9+FW7eBly12CuHL+wR/kwYCaRt
	L1Qb5OnMoCvJNFY1ZLZ3q1E0nNIOh0VnZJoyHLSp74p0onp603Z1IM2u8vhLBsAMBs/HxaoAhAyvw
	FN148JlGSiNu1iE+wbiE9mjboqls5fcZhN7xTFp+ZAJDE/YlERba8cekUONOL6t2UtRcNklwEY1o4
	w1KKgyfa5m0flB7d+FSoRTIPjBZMRCbB7u6Hf++U7uFri4/qvjDGVZibp8oIPfkV6OlbUCC9yl1Cr
	9B6KskZDQNRswbjXNE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG86-0000000E7Uo-1G63;
	Thu, 04 Sep 2025 20:00:22 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuD8f-0000000D44K-0wkc
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 16:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTNLLCY0VlgTJAVY2Ih5f1aB+fIb6BKjqkQSFi9yaYxj9Zcreyo5bde3tmlV4EMEN1N85lo0bW8z+gExSOIjX8VVpcGbconOB9YiR3TEO3RVJkcFl0cIK/5n1bA6lTrDQ81EgmiOTI41L2jkLumtuxBHgHgvgHHfqNiVRGDO1nS8QV0NMgRvJkWm3DYKWf7fIfqHf2NhbNNwdymI5gK1D78NkaOXxB2MMpJKwGKa5P9wLaWGz+FA9QkF8b9xpmfUnYeHtQ8uk53zD7SsEg+Nsa6JrM6whBjECLcESLXVLZfAeOIfGMwaiS0XpY4eKNr9AiFEBWk2tpKKR0zxgi8k3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuJzuj5qvLVDhtI9oOlrHYZ2pz7VUcwlZMxSO66TB90=;
 b=by7AJcrzVp7/LHB9tac3UO/3kq9Zt/fT6FbMd+zMdB9TiW7S9zrgADvYRxvWOFLS94qdxCItI7SJWSLvBaUfVUSYxaKha9JG3eLT8hgS/HUiMoaQ2TUiTOYBZvde+Qc8IsdxQN1cK4MdzPP8t3lP0UJY+su2ZveFUh5HsKQLhrCTM9LUQ2MaaybXbx56YFA3x3+/pPK5Fc3J5OR14FENXfUzZwEsexY5+vVk4ynipQxQMsGVJ1If3TUm4tRmpbbsNFV2hyMEqAvKkgc3z8ouqEZr6qn4GgTBn9wmGgI16FjfE0TZhV2X8Vg47XnzG8TAlUUYdb0QQNqAcVE/Dsqm4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuJzuj5qvLVDhtI9oOlrHYZ2pz7VUcwlZMxSO66TB90=;
 b=DCKpAvgdrk8QIESpd1K+hPbt+8Em+IqyHeBCmEElkKGRwqpjuh49vbarPfGOpcBbNVJdJo0Yn/ttuVx5BoP1JZbDdoZZd534TP42TOMh3hQvNv3ILtNiA8U40jsCKF2NKXS31vdd735xvAbJWcXCURX1YYZCYd17IV8L517UQfFtcbnAkJPG8tHUTN3EyKWHKQX1knFo3841P7Cd12Wc4kL71XXRA9X1bXD0tUe2JkeLHAUNZIXd0qj8HTeYQ+jblljO5TLBQJlyJ+9zI990igfhwo/UV2cxOJU+7w+cOqBAzwfAbRelubARssiudNb34mv3lZ3DyZyengMFEbpdrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 16:48:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 16:48:36 +0000
Date: Thu, 4 Sep 2025 12:48:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] i3c: Fix default I2C adapter timeout value
Message-ID: <aLnC3s9caGEAQjyC@lizhi-Precision-Tower-5810>
References: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: b2325f1c-d5b6-44e4-e22a-08ddebd2e48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?plqBeW6uerq80a0IcKha9pwRTiLJ4izDyvZDhCBMKOZ7nB3GyF7rCVxLcUdl?=
 =?us-ascii?Q?3QdnvCJSlMFQ7dFY2dNqLAoxKBhhf1iAJIsujvaL/ix6rZ1Ftc6pquw8cWe6?=
 =?us-ascii?Q?F7vKi+q3ALC1FOP9yKzp9NTxlgzo3Rvin9KhcVPAj/FNyCXMsYqnIVYWt+zZ?=
 =?us-ascii?Q?9I8BOy/2Ro8COWnFyQsCc8Th0ZC0HEM2oRvfAuZRJPrPg2463mKYLwzGY2HS?=
 =?us-ascii?Q?bxBTW8l9doxzsKvoU9D4V9GjDgQHL8Q4HSroVuEJJYK/sEngwwsTtb7le5+S?=
 =?us-ascii?Q?2Rni5X6XnJOnGLB2CeedmQMx3/o+wU70FkOsPz54MsmGYWYzSyAKEzv9BPzz?=
 =?us-ascii?Q?8grHpx3KBzdVhiU8SFv+Zdljl3FtLmnpeIo8PEX/qss9ewIqSSixWQdywPUc?=
 =?us-ascii?Q?dZtkqvldSCYGZxPl46u8xqgS5mE+1UeOEjKsqMSNRxcKlkpSYHjlbwGvhKPQ?=
 =?us-ascii?Q?M1EinAXAnFjq1haogET7HRLs/RaVt1wcSPJi/7MHHlizIqDW68ToFDMr0ele?=
 =?us-ascii?Q?gN2vwf7JKfobNGNO3Mm1TDpMFp09FbhVvn92uBwht7gAEYwhYMjZnRdjMpFs?=
 =?us-ascii?Q?iCnCiaIqdyUhj+BF0wnBRzVplzCGgG8uoHk+6sJWpeFD9L7y+f4hyOT+Gnw2?=
 =?us-ascii?Q?hBIvNtiHINg1v2HeD7Kp8QnVrX+AjHJbmJG4Lig8As8edNivvKHd8D39OeRm?=
 =?us-ascii?Q?H5NIVi3GqidfEwa4LddJaehFDfumnMUD2AQgeVtRod046gjNPex+JQZwjk5m?=
 =?us-ascii?Q?R0PKWJ3craUHmvat4zdWsZkY3/TJ5ydT+ewid/jlDPLC9/9AGZADy/xzOZQT?=
 =?us-ascii?Q?QWqWGfRLPjPotjcW2HTTR7woX0pijJYjdYkocEbdbn3kqMUMS3Alsq5FjFVn?=
 =?us-ascii?Q?eL1ziioO6RPyMHAcsbfxb8OUeqGYq65UF7TLkH91eVbnrJe72fyVUqR57DUj?=
 =?us-ascii?Q?CSvrbak7hUxlk/HqkoZ9rMeVHGxEG9Wj1ch0NHeueJe9QPRrtYI+SF96Vaat?=
 =?us-ascii?Q?i+opxSRBn/WR3hJtA04Y7fsbVXmSOkdEwyaNcDYogoP2B9TF3VffKK3R512T?=
 =?us-ascii?Q?KlT3TP0mfVbXa8bn9XUUFiO8ejWYTLp3Zmmt1onhj2YItMzFPsrz7N++uPrR?=
 =?us-ascii?Q?w9dx/3ufgg83r5W5ui6FQ8SbdKkSuhfjagn/993Dfa2sio3PlE6F/8UevA+7?=
 =?us-ascii?Q?A+Brg4VlZbOjiRbjMsbkQxT2Z3RXYHmTQP+RQ2CBVTekYM7yzDVcI2TXFZwl?=
 =?us-ascii?Q?IVDi1ZknnaH/hVuj4ayYb8MpEA7mIeOG7AM7i+TUIZ9JgMKb0PxMoJFZQdq1?=
 =?us-ascii?Q?glLLNKSzy+7fx+hcRY+xfNu+vUtbaVHOlIKbP51mFULEVRuEke7TAMukcwX9?=
 =?us-ascii?Q?kygsZkjJWMg4l6Nnh6vkMcQhexn9CIPm+3W4Jdgx0ksME6nP/iNUxpSdiIXO?=
 =?us-ascii?Q?xZfk9oLLnP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3MbQ0Ra9WdAB/Brr1irTERFBQKgyEvhHpKRolh10eewW4LjR0aqe9V8KIpc3?=
 =?us-ascii?Q?IJHgz7FMoIJmNnIZap1/99lhHLm1ds92hLZ2U7Y3mNnbfqzm99KyYIaox/85?=
 =?us-ascii?Q?Vp/wqDAEGuBMMyo7wVTjIr0ESPebYrAwengR+Qg0Kewm6TRqHr1zo2+1T3qY?=
 =?us-ascii?Q?8qnEmX5aFrWP+c5Z4vPKiSlpDYq5n5k0nmftv4frtsI0DbPGUB40uhKmMfAj?=
 =?us-ascii?Q?+vJWz9LbYccSbt+pqlFiVxUO2Srrto0y8ieQa9NWUM7R4YTtv0hI6XlZh8kV?=
 =?us-ascii?Q?h7t1cGH9QVsKyMP7CkANCFiNTbexC89PoUaOBg692NzFOtU37u39NTNy6Ym2?=
 =?us-ascii?Q?aRr58WTxLk3SeY5dnphl8XJ8P6CDaiisftp0blmDMzPAUA8Z9U1RL1TTzxaC?=
 =?us-ascii?Q?5Oc3r1sSBPc90YqKi/JhAVYzdFUIseuzzvm5r8YrqhfH96mk0MZpUxk+A2d/?=
 =?us-ascii?Q?h1Osptm6fDhZoh+XB3li4FNkJzBTfN2cLugWmvs4ghjxpZE9UZS9rVASUsXg?=
 =?us-ascii?Q?dVIT7GbGi+P48VUCtJbCbg39YxT7TWQmjC6YeBqmYMZ4vCU1k7BCJ8QDTd+y?=
 =?us-ascii?Q?8/J+TJ2LvvNMao861/8h54qpfMtlXvM4NTIRy6DklMMXcJ1O+pZQ4dEvr8yC?=
 =?us-ascii?Q?IXo3qS89m7adZRSrjdfdu/29oYUi/XxV2D1jd9J/i99n8POgXAm7pihjzOYz?=
 =?us-ascii?Q?H01lImv6VbUELdywhQf3PC5Jqv8XL/xmd/eEUSS2QyJxuAs8HIhFKICAlOw8?=
 =?us-ascii?Q?4C0FwnncuR4+sYMt0UZ/9axsRpNC2DF74K3tORplwwwrGI3ty/qo7lYIJrhT?=
 =?us-ascii?Q?bJNwx9Pi1Wu+k63y4udBRk3bBVRRsQ8PHVZP4iEfKN/fF/4KwC8WHZ/GscWP?=
 =?us-ascii?Q?d9Z1bhoiqemLi2rXeFfHY9DleW7LGu9NaCstO7CBky8dpGoDQuB0qkpn0Pg0?=
 =?us-ascii?Q?RXdj+BB46YX9YUWBHTC9r5N6aNKg5NhWlo3Tj3RMlu+zj/BIOvIM7IKEz4B2?=
 =?us-ascii?Q?bhKQnY+vFa9DVwA6D+97xR1UYJeY6flG6QIGKzoiKIlPqB77FbfujTOLSTrq?=
 =?us-ascii?Q?/IZ56ig/9DAM9gU1YermzFRarSZitfA8+563Jt5Uohdfbc9RznjSqCtgfZ22?=
 =?us-ascii?Q?p+VtpgkxCQT3NcLtfwZXIZikUJTUOMkxS5/3mkOTHXtyk3f8LqD+jJwy39yH?=
 =?us-ascii?Q?vni9XIVSH544s9cIX2g9tgMRCyHzYxU8bOcZbjACyxHlcdYnD6uzhRkSnLIp?=
 =?us-ascii?Q?vOi3Wm/Sbgfd2owlmE3WVhXdrUEnRpa9k4hi9hdowq6B/qMe+Y9MUvq6zMWn?=
 =?us-ascii?Q?S/FJtLKk3nCO/kme1fkoz6wtcbJaSBDBh2s4HwZHiUvX+iUEOpROikbLAeQ7?=
 =?us-ascii?Q?ym8MHp0HYZJ1uHvmdcMcz5Ikf1ZdBCCqKZarnmlz+SIVaoorSVHrrHxEDhw2?=
 =?us-ascii?Q?7eIhmyi6xjn2BCmOWGJXCqPbK96J4DBXhfQvAGhFzUNYpGFwxf5bC6fPDtuH?=
 =?us-ascii?Q?8Mgk/M6AdG3Ok58etTbT8o0IWU2ap/HgufZY4tG00MMp9geqmbQAEsNGbpd/?=
 =?us-ascii?Q?vAl9h3VOG13dBWS3gOVi1fZLENX6nlPjzZWbZJbA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2325f1c-d5b6-44e4-e22a-08ddebd2e48a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 16:48:36.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6GkqAOQ/WB+Csb8VXcJ7fOm0dBzalOq+b+lAgtpC3U1xC9ZsjIKw6FiHm7LSzthaTTrln8EPbRqji68iQiQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_094845_275563_8AEF6431 
X-CRM114-Status: GOOD (  18.55  )
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

On Thu, Sep 04, 2025 at 03:42:26PM +0300, Jarkko Nikula wrote:
> Commit 3a379bbcea0a ("i3c: Add core I3C infrastructure") set the default
> adapter timeout for I2C transfers as 1000 (ms). However that parameter
> is defined in jiffies not in milliseconds.
>
> With mipi-i3c-hci driver this wasn't visible until commit c0a90eb55a69
> ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers").
>
> Fix this by setting the default timeout as HZ (CONFIG_HZ) not 1000.
>
> Fixes: 1b84691e7870 ("i3c: dw: use adapter timeout value for I2C transfers")
> Fixes: be27ed672878 ("i3c: master: cdns: use adapter timeout value for I2C transfers")
> Fixes: c0a90eb55a69 ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers")
> Fixes: a747e01adad2 ("i3c: master: svc: use adapter timeout value for I2C transfers")
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2ef898a8fd80..67a18e437f83 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2492,7 +2492,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
>
>  	/* FIXME: Should we allow i3c masters to override these values? */
> -	adap->timeout = 1000;
> +	adap->timeout = HZ;
>  	adap->retries = 3;
>
>  	id = of_alias_get_id(master->dev.of_node, "i2c");
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
