Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57AEEB3633
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUYUpdGah9YkzRitJ/eQgRIAyD6acpDM0CFELbEqzjY=; b=N+8HOs20680S+Y
	p2sjavGPKLrb3piYcJzfSl9wdpCfgC73T2rqsq4lafskBqncpULCIdtTPoUGxiZRJEx9eKTV3ZRI4
	75i0dqaL36hS2Pw4wy3aosyBbnUjI/05qGVPzxowsV5FVT3h7vmM8E+YtOHc1i/PLC0mchf9Hutmw
	LgUyknDx1cPek1saF/S8OJ97cWqkcGc5LSkxdyxDolHPPrn6z3L0gcRF+tA8vKBqXFcJTEOPifmYZ
	nVkK5W1LXcH4VE4Q2w/rJlSryMLzJNW4uuEpw2aEQPPWdmxo3v7BAzzIqpVb03JLa+TrAvozrib1p
	E9KIb23YG2VCBYuU5SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9pX-0000000DnXA-0pyY;
	Mon, 02 Mar 2026 20:25:27 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9pV-0000000DnVX-33n3
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 20:25:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga082vxSzjLmP9kfLWRKJ42lvDld+HxTKkLNe+C4flDCSufQN6Cr7GHFGLUdlzzy/LXAarS7s+++U350hozSIbary1HWbzWSyE9h4cgtfnbqL8i7zuMi/dopMZBFwm37n3+gTCmuljyVNPoaRgoXpl7xN1AueyDZJTVeiinwGuRVurpF5zVvGr8xIZS9v0sdEZIgT+NTtbAuFp1LTFcZiLVlgPjZl7O7N4052Hfa9B4AglfHgx9srOcs5APXJaKJ0quzYrPI2y+83Li/U9wJriVM/LYMFz+h/vicGXT8A3654s4P7+qWqzDhP5t5edjthXLY4AGtknvjxkOP4ZPbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RromiofD3bXJ6RElgaikTJqFCNEkd1ZJJ8kTnm8Ozww=;
 b=r97HqnwlVbwzVVgivt3LvcVHTGB9GmEeC5Jy7H8DNlYvrmXospsRFN+QhKxlaEIKLuWGou2rqq3MK0F8qrAlSnSPh1YvhBSP2exAIoted1o3q2s9hGja5IuYQm4Dtrm7TRMIoPgtgmfHYYol4PPG+EiI9WW9MEGmv1oOYhT1D7xipJ2z9QhmFQtkRIWJpA17lk82vyVVLSWZvnRSruXibzPXKWDaWOhx6j9zJbfWYe37gHWPkS3YiH2M7colKGWxox4NPNtd4VOCmytRQ/4nwTErOdmdq4VOp719Saolb8W7KmiNL+7arp3OmLeDPOS5THgoX2Z6y/mpQPIjOxmVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RromiofD3bXJ6RElgaikTJqFCNEkd1ZJJ8kTnm8Ozww=;
 b=hhox8EIO6Oxddds3t5npz4ZeP7c50yLt4it9HiLPzC3qXQ5SMyaolCZ3xHgss4F8ajK3cFfrK2yX0r+Mm18wUJeW14ztl+eVC45rR8/FFmUAXwVsF865sq0E1+/KBRQAWmr4e/p3OtOBNjVCoueWm14rQKUhYlcFfQt2b5hNsU+Nbhu6Hrjhs8BdBGuxS/tl4e+xnqXHe1edPhTqfXJRUNUxyUVlKSevr+gCsXBJflWth5LXibRxrRrXpywkmmT6K1drNMji2QUlfXa0L1L2lXLRsT7LaHxVO5MC9na54eR53GsfUBlcR8sRNUCpmSyuPd9eXnpNdzZcf/1QPhwTgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:25:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:25:21 +0000
Date: Mon, 2 Mar 2026 15:25:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i3c@lists.infradead.org,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>,
	Jorge Marques <jorge.marques@analog.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Zilin Guan <zilin@seu.edu.cn>, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, cocci@inria.fr,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Subject: Re: [PATCH] i3c: dw: Complete exception handling in
 dw_i3c_master_i3c_xfers()
Message-ID: <aaXyKP4txWXQM6Ff@lizhi-Precision-Tower-5810>
References: <44203b94-0d4d-4411-9f9e-103ef19172b6@web.de>
Content-Disposition: inline
In-Reply-To: <44203b94-0d4d-4411-9f9e-103ef19172b6@web.de>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0f25aa-b2bd-4af0-4d6f-08de7899d3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 4kNUWfWx0/gQzbD/BFfmdfGph2blrGDk98seIk/YjS5cAPjOmaHhtOgrXR0QAnlW5B07E+4YW/rJectCdW4wpTuCIh1NvP5qLOE7NLr3QuhvZgvwDvr4B4BocbGw5IHOc8G+QmtEpB2N1HxWOzJaMq4/WjLNGLc+ueVwcJX9yz3gLgoAi8zQ0S/5KfAFEEenXW2YXxMPnAp3LyKoygv7jkAOEB7Io0yJs8MvumgXbK3Ugs2ZO2kKD4hl/vwfPR3JodkJt2RbiKzwEYqsHwxJUe7UPjoQgxj8NtksicNpd+TL7ghTx5L7lz0XlMuVY6UntDqZWZzQfcJu+b2ihY911+1LOSVTrBdkDSlmXZJ1DITn+4o0CJpXRrlsSfmf0t3NOOwIoLwH5gXquQkHAAe0S9pPiCkqOyccHdfD7u3tv2HXb2eRqLdUhc1aIbdqiOjDkCYkfQKPgcec38cBJSVAXGWuNGTztCVolripf2N/0AfAde/hxN1rC0CCISHKHkND/3ou9jUnKCsF4sDFvxlvzZCFA+jfyiBGubr9OFjl9xwo8rshZQ7Yjv30ARBYzrBIKSm6a9wT5DPAFhIV9W7Uj6blB+NGD4nosZzU3wcyGb85plOIXaltyXqJzT7iqZdQnYPuMueWrF4FNH5X2ghhuio/ehVMXNpqsKSlVJ0KGw94dq67/IlUkOxy5M/hjmlwMA1fqN9fkAc6ltpKJRGCo39NoZNRvntzi2jqtEWgQYLIplr94YkNlsa9ffEMzRGTIUk7S9JDeoOMXDx0lvtHKHMxpQQJi6nqwvutVVFPUfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvKUKooxW7zvFLlfw1hfAskc8oFfU8LsRCbCoJ0lBwn/XS3AsK3OFLOe3A9Y?=
 =?us-ascii?Q?8OXckuYNH4GUTY4zYGTouFCSdPl4e88x092pB+QdU5OqDOH7YxfpSElFSHn2?=
 =?us-ascii?Q?ovPlARLSLbVQpNms48qkFQcqZRBbw0IfRuqRa6vJ59vHTMNMVQoK2S1hXsM9?=
 =?us-ascii?Q?yiAmKZnrV4CkyXf3FA/jQiszwSLqXN1nBKpi3mUcDjYUO3XvjCIS2atngQt5?=
 =?us-ascii?Q?z9fsYo00ERFvwuRoFAai/QTI8qidZ8ClBiC0duVau3LqWqU1rGp3fjeFCBMT?=
 =?us-ascii?Q?wcVq0XYYWZ/xOnI6s7AWRXE/Y3Y5eXDsK1lucQ9QaayYJkGJilt/HOP46tg/?=
 =?us-ascii?Q?N/rpAQkCIvk7JBfKRIN7XBFV4kR0OLFXf2JkclvGVB6JXig2h5kn8rNsDxAJ?=
 =?us-ascii?Q?hctsimBPZBlOnFN2XGIUlRtYevVMsS4BeiDpclZAz+Fa3fK+ahsgacx5rEcq?=
 =?us-ascii?Q?P9ziOjhcXz160j2Pd2B8XBQUqU7nJnjxl9x9Na5sOYeO8YRhqniCHTgUcEnb?=
 =?us-ascii?Q?o7Xy4GPefg7eLxJQ76Fi8KiiFeAJcQZiHBuRqS6PY4LNEvI8vAbFg1t0VLZF?=
 =?us-ascii?Q?MNJfFgannoD5DrgOsCb7SLabCuWDz1pulwzqicEhJpEMAxb1TRhYf9C2piRY?=
 =?us-ascii?Q?dTHapsJUAmnhutepijKmIY8vP/BxsmeiDoxxwI41NX5USZRfGRgV0YqpmNeU?=
 =?us-ascii?Q?y91IQ/JFlkASU+5GnmvDU/tIVExPBGZ/o95pvUdalhZaplTGffrhgWpWIMEC?=
 =?us-ascii?Q?DQ4CAFVaLlOuiJ1sURib6xTHSB7BNcACRHreigyOuemxabqxYcpy5iHj7q9i?=
 =?us-ascii?Q?9AcY224v6Y53HLWTf5kpoYXlcTpBzb4R8t5p2QlZgl5yMlNC7lDrzuDdIwdv?=
 =?us-ascii?Q?f45eEvIKVIEOhKDftZ+8Y/OwQ1rExdsDOO5K24xkJl29DtXg/XjgJiU+LXvD?=
 =?us-ascii?Q?1e8s5w58GXsSp/vLnSfPVnKyHYlVldLxRHpGSQig7JaaDAlF3TkiG2+rdBu+?=
 =?us-ascii?Q?CRidBnnVYXNNkh9DAikFGxV+/HMWdBLwsTuMmMq2DsJCzPT7oEVSL98IxjTz?=
 =?us-ascii?Q?xI9/GfRnJtXVBoAJ7D3iyL1aUDLPFMfDgnCy67TTQxSmmSLFo+feiGyIYAcZ?=
 =?us-ascii?Q?X3Tclq/DJFdTTL69b7NbAAsjpIpMfLJa8Us6w7lixh3yh6wL2BAex6EjclJK?=
 =?us-ascii?Q?N8KEnbCy3pyQYjVir27Hi3tRUCm6DsWTp4uuFLU34zXDBfFmomfO1OIFkuGq?=
 =?us-ascii?Q?g81Njh4NbiCPZfKrrNETxx+uQANYyx4CbN7tc9/gx3Xi9C6iREIWsg7SZbaZ?=
 =?us-ascii?Q?NzPGv/0mX+fgOypMVGnLsw4vWKEGEtvSjziCklb1R7mO69lHQ5YOZuRVzQgl?=
 =?us-ascii?Q?jmTjkN5nhJLgurR4CAjdHMblV/R8jWdxg9LBgVHZdCKmd1mixj6xWZKXa94Z?=
 =?us-ascii?Q?LIsbRcFWr7ru80Ss2DCSjHmNu8q5ZGofrPnFiO/5MAAiCu+a/vtZS3PpvR4p?=
 =?us-ascii?Q?rI4w0U0+AYs0kzc1fqAYDu1Vj85iYJBXAvI6Hxb1MeJBDVVKrXk2KxTOAgsf?=
 =?us-ascii?Q?OdVnF1vHy2SbMtrjNjGpeYMaklX84b14+ELJ6ydNO0KthKgooXB/FgSjsOom?=
 =?us-ascii?Q?05GzU5+Vy0PF2CQ7tbK0XIkP33CzgSEM3twFWI1IMupZ02yMRGTIgqmKoWXO?=
 =?us-ascii?Q?ATtwAweAYlhCEhufYFQQ7u5DFUDNyYdL/RnC8Pdf/EvjPbAc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0f25aa-b2bd-4af0-4d6f-08de7899d3b9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:25:21.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jem9/Rn1dTQrwpdFQVi1Hz7+IPhIZHWaVlLxtw5NJx2fGXRMiwhtlOe/tlIWWKkdhr6ntdKBIBptz8i/bi4EFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_122525_771705_24392AB0 
X-CRM114-Status: GOOD (  20.60  )
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

On Sun, Mar 01, 2026 at 07:25:51PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 1 Mar 2026 19:11:51 +0100
>
> A dw_i3c_xfer structure is allocated by a dw_i3c_master_alloc_xfer() call.
> It is not released after a failed pm_runtime_resume_and_get() call.
>
> Thus use an additional label so that the affected memory is always be freed
> at the end of this function implementation.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: 62fe9d06f5709caa1fa68055873ff279e05ade37 ("i3c: dw: Add power management support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/dw-i3c-master.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..723f185584d0 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -953,7 +953,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		dev_err(master->dev,
>  			"<%s> cannot resume i3c bus master, err: %d\n",
>  			__func__, ret);
> -		return ret;
> +		goto free_xfer;
>  	}
>
>  	for (i = 0; i < i3c_nxfers; i++) {
> @@ -994,10 +994,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  			i3c_xfers[i].len = cmd->rx_len;
>  	}
>
> +	pm_runtime_put_autosuspend(master->dev);
>  	ret = xfer->ret;
> +free_xfer:
>  	dw_i3c_master_free_xfer(xfer);
> -
> -	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
>  }
>
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
