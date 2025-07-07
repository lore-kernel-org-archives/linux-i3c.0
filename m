Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA293C8303C
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jul 2025 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7LhZtWg3pC97GjlbOZNT2vSU9+nZfrTYyMgAb2aOnI=; b=uR+F5B3jUqqWtS
	f+x0YNbi8HVbx07wadlIwYZJKoqdns2zyaxgU8jA6WFYkIY7y+tiAdFF9AUjBfqDV6QO6ps2H/Yb4
	CqrcdoR+b48GSpNzruGveqa9L1PXU2NPI9DLPWj4VRAIfPBdAvdktfvrDsJ+zxI+Q3nWfpXeLYwfp
	AWLJmmJTWJvzUQY2F1ep9eMBsKoD1kG8yffjh1Tn/xhpVK+sulCyNH2WrokxinmKcH6guzN6Yd7nM
	YBIsQrwPMaVetJJJMAikn0iEkOAUuiovzJlM22skh+SMI6QfTftpUDX6JgnuTUjv6CqLLh4eRNkgH
	VSxsuoSMDUszczzo2vdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpKh-0000000380I-2zfS;
	Mon, 07 Jul 2025 17:08:47 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoZY-000000030Re-2DcC
	for linux-i3c@lists.infradead.org;
	Mon, 07 Jul 2025 16:20:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlxqgtAFc7rVDxaIsapFGXjZ2464FwIqi9k5B90jdSGQXiOEpi2I1E2BLI1qu8QlUM/OpKWRk9VkG2VFdOwR4sJ9CVIE+iwhT2EHR5aD4/dr+uYMUska/8eMku1tpDZdiU+J9HOsrF5P7yzzzcfibQm1MtNbpqpWenGiOpfBqRpo23Y9Jyptoo1Kr9xDpI+PltvBPgjCd6Xp00NvaZaAdUmzlo/sh0JqNC80Cuxpuc8/SfE9ci1obJB1HrY/m4DramC/6XSx4dqtXXhPzuYazysVheNRbuzYFyaOGi71zHw34uuGC7p9xdvqeBhU1aFMqcKL8O48rWyc95kwPIv19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz/8q++t5CFcf+YzY5bz5/W4LCMsbHJf5C0CZ4fXjUU=;
 b=LeXHCd4YrVOT/styFHbZsvkOCXWnqKIiyhO2JGnObHYnDIXZWBdOrJhlYoNP/e02OXz/4bQbFovBp5D/oMtAZ/J2J0GKibKi7buTXH/A62Xqim1uXeueaKwx4sApGr8mwSa8q7tL5wqQiQbbJLAiID9bsa20STgv+/5Gbce+ott5c/UwV4CWQwuwUaJP4qBWrnVC+p0mYaA49M/J+KWvBKkoaBXkP0rgXbisZis4C+HSN70P7cvkPk+2+hvyQU4YzC4qvGNTv8iFUgm0qxMTcxQnXDKuOJMeOMNSWPYnr4TXsDunCSThMbZoP6trXcWfRRw0/84TV9ku8zeBWmB3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz/8q++t5CFcf+YzY5bz5/W4LCMsbHJf5C0CZ4fXjUU=;
 b=kNt2lXGOXlkzbeWVuI6o8EC7qEk0NdZkpUTqyPgIASpFzBlOm/sspSGvs2Jz+HedVOyvzZafuWCs1bVrtGLALhG1jHc9+x/Uyw8sz2n+Y+o9E8RXIw8mw2e3TQbQNLFTJg9l0HOyqm6kiu0CbSkZQV70FSIfqYQdAMeKIgZMR39yonfN3sXZ8a5Ufv+skDEzOUQeHsTGU0SzWQNdBuD6UE2azxM9qJR/Fx30UM3yM8xuwESeLjFDKpTQoy2Qn2LW/6EJrcm1pS2Vf6Sx0EKDCeV9vHDp7Xn1VhMPRLpBzmvJqUgpTaIW3xEDpGTYAAsCf5lb/Rnn1c1pscOtDBR2zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7030.eurprd04.prod.outlook.com (2603:10a6:20b:114::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 16:20:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 16:20:01 +0000
Date: Mon, 7 Jul 2025 12:19:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: prefix hexadecimal entries in sysfs
Message-ID: <aGvzrs+xoWwrUu41@lizhi-Precision-Tower-5810>
References: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AM0PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: dc724cab-035b-4046-a44c-08ddbd721fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o02Sq0TsHZjVLbGvIvenq6Nwhz3TYE0v/eaOSxRk79uz9Bw5AeJCBWFFNZ6K?=
 =?us-ascii?Q?W5C9mkZ2Ulqp+O5ggQOdcgbXrymSo5OjVtZ3nWoP6/CPgPsAnQECJDWesc7q?=
 =?us-ascii?Q?EhlwwR3a58OeH1Om79L1yhXv+S1y1LRjwlDH9a+I8oIdk3JzmlRddjDJUKEy?=
 =?us-ascii?Q?FKNCxoIeQX22yszcmQK+7bblX/c2TXk/5EQVTGEG5z83ITSHrxo7BQ+IFR1V?=
 =?us-ascii?Q?QRLBEIMOrVot53wIQRv+KhxpRLjcZNmDclCfP+TCywf4HdmKVnrg/HWNlLb5?=
 =?us-ascii?Q?YjIg93CH6rzhNZQU/4v5e6WeZO/e4Yk7cn7eXC7GJYRlQC37OfQcXRT1wPqR?=
 =?us-ascii?Q?cdz1uaoRy2t2PxCqUG0GC5HCjhXiCjEIPleTjaTcYONUxuZK6EJx+RoMOb3Q?=
 =?us-ascii?Q?THFHS8u13AsT+cx+RecyVQZ9Ap7aF79v0VXb1Y5c6zqqoFG+tT/+Edrv/Dmm?=
 =?us-ascii?Q?HtMQrQafDX6V4ryCfPDRtsWM90PpN2JlVL02VXMqsTcKhj9RueNuEMQKB2IE?=
 =?us-ascii?Q?1r6K+6VKeUgJmmbYfjo9KZ6QWIHTI+xGvXaNIkaaC+5P0VaeSwmUVSod0TA8?=
 =?us-ascii?Q?hIRiLxVkqNJQNnw3A6E6hU/PQXmlruCh/4Wrbbc+7qi7kTWcXsFn7Mj5loLC?=
 =?us-ascii?Q?g5HwC1O8uiiRqYcQtq1UFGbou24Jq3PO72gqMoXyAAr4xY2plpPY0m1k/ZOH?=
 =?us-ascii?Q?5XA5rR9bnprV0lhTD5UUDdCSMa4iO7dzTap1sKEB5RiJKg8f8ngtJEcGb+3k?=
 =?us-ascii?Q?vqZcnHRjMFmE+xg+Zy3r/FpB3+oP/II6H6qZ9o/IUXum9Eiep69s0TXuX9l8?=
 =?us-ascii?Q?kl41/b5I2fp96QT1M9oEcdcqXCOStGhbWlxbrmmwzavaJT3nsWv+237mGtQX?=
 =?us-ascii?Q?Iah4mQG+a590CMsm0tUoOc3rlHvdL2WPR9KWcFNtQ/BZgUBiWh8vWPR0EoBw?=
 =?us-ascii?Q?S2DKqPTTfBNftBaq9KL1a3Lr4EBUV2wffc7LKGDu+W28qGIu81l7d24poPv9?=
 =?us-ascii?Q?Xcu6v5AjgjSQ9aRuqURML/4q1gzHiG+7O3/X79EeNmq4hRKap1KdGsomwfef?=
 =?us-ascii?Q?Y26I+gOM13u0JgV7ecErQPs0rq0T3wKidZ/xIeI1+v6hxb7SiCMqaPcJUdhd?=
 =?us-ascii?Q?qXbrkQDu280EOdXI/cBf3IHT8azlINkQTJbnRc/1OblTpwfgpANFV/7iNhha?=
 =?us-ascii?Q?qUizEEOCPTm19XfkYHPyL0aG4QIhTG0g98NW4wIF8fQUhbZXAxPsJ2GJiFsJ?=
 =?us-ascii?Q?SYhg074GMthRMp/beweXCUMVrsN86GV0s97ZSFd+VL5YC7v7PdPAJxJOb3Su?=
 =?us-ascii?Q?5zoiqBACwXuJ1LIRqvwwOJS9bxTDcwArvmkATyZYfTL/EEkE44/PGNBmOOgu?=
 =?us-ascii?Q?lHSmm+kHhDmNhXlDjfsfrsCUd7+IG7/e2TAss8Qy1WbhWfojOYmUEP8vlQqy?=
 =?us-ascii?Q?UmjY97iF06upZ4KJrXktPc3hdmh+GYZfksibmfjK8JhcX05ptIbd6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TI2Sxr7HWmNNP8wFgFQ7bk8B54ghpdn0PMNesb1x6iBloMs/3cmLc/eGKPQ6?=
 =?us-ascii?Q?yj7cGtfqCgSmdSrwSCSw/eJERSNuZR7M6JkIYcEv3hZobjdBl0nPn1qrD/J9?=
 =?us-ascii?Q?FpcxyOsmng95w5ohXp+4CrriwnClcTCzCFkpp8rcXIGLqfFcYqlW1XW7+gyK?=
 =?us-ascii?Q?j7aaDq200o/cRYhuxYLRHYasGxCppzLDdr1Bnfjoj+hx+UX+KdSMHxBq/Pw4?=
 =?us-ascii?Q?+oDBpPFsbBGarM0Y2L/T/ZP6BnYwJLdOnPyxLrbDG7qUJJOa4QAY3Jlbs59U?=
 =?us-ascii?Q?g1wOfgOZVKw95AC8tRyHhIQhNquuFQurpyQJfARH1FAM2tnOCjcYy2WXV4T/?=
 =?us-ascii?Q?Y7ynHKX/tZ74KBTtK97WmHDLEdmSN6I216Dv2IEKcugMPxSOOplyDAQN1mwQ?=
 =?us-ascii?Q?0L1o7j+C378qdY4kqRMwjseBVW4Q/LVCS0K+IrcsKvUkAcDiBEjImGdHBXtQ?=
 =?us-ascii?Q?vnK5yA8CjAVnS0CMo8yC2zPkhXWQCv/I2R0reYkqhZP4VzU9qKdTouL57RXS?=
 =?us-ascii?Q?VG6QxdL/MXgsRAGxnnlFrBDt4Q61q8ANSWd/ajpKy5KjjUPTio8NQWtJqG8B?=
 =?us-ascii?Q?5jsnCxyXTpbPolJTCmw+PTkeuat0Zm9bIKkSfwlX1ZdsCyMuIkdyLqGmBDM2?=
 =?us-ascii?Q?9dpdgtKqQK2ydtYKTWTxzcHGfXm+Ri3yAeKR8AZWdghxchUH4oNru+c2gfIS?=
 =?us-ascii?Q?/xjzXvP+UJGXNWjQJc5+ayLvG9uhlDdxbIP/JCeUAh7xKTWHN8bBK8D1BXcx?=
 =?us-ascii?Q?jL6kTfQwrAJv7EtiiJbgFV77v0qZCFWTE+1zZ7BksZO3rIs3e3qqjmWThRuI?=
 =?us-ascii?Q?wybvj7r/HnuAb+uty2ymjUjeGk2wN21WVHI0J3CDVrYtRykbVeiVmKyqXjqz?=
 =?us-ascii?Q?mFaR/Hq3qNqMJNpNTj3GEWWu7w0Vh37B0tbG/WgHbbOlpmM5kRMzhU+UEClB?=
 =?us-ascii?Q?1ItkYfigbg7Z2suwqPPsUws+Juy3A/zOgTcrJ1HLL4GshhOonu9IrjIm0IVg?=
 =?us-ascii?Q?6yBikfvlZSexXJPQyYhYQMlVgIiozdkoHBQyBw7MPenmCfvB4PaemAAWfv+h?=
 =?us-ascii?Q?tMButBeibl4mOKWbLW/bp5NUqmgJgR2nHF6nBCZpt7jaYAFO8vO6LO5PIVHL?=
 =?us-ascii?Q?nJKBOMtXHgubXceLRkSbM2kqMkWEmN+fCc5AhkS0YVUvYK+UlvzQE1w5dUh6?=
 =?us-ascii?Q?SpzJSYbUT+Q4FXKi8vGbBJQCBavrGAbJXfdaTYhTpNHrkefN7SW2vbut4TVH?=
 =?us-ascii?Q?t4VQLyC08cvwgaEZUbK7woBiHDFWaKB9BdCyIlwUW4DrP1+KFGPFHMb3uTPG?=
 =?us-ascii?Q?lM4bYYDvYZwtznR9C80XxjS7w25ENzok7V4NNe0LKXTDBh63ZJ4lfjP4szWW?=
 =?us-ascii?Q?rIQPfr9O6igBvlUjK67lw6qb/h+6AlC3PkPhMfdF0FkuqFn3++KIjLj8mE38?=
 =?us-ascii?Q?wT3E8bbya/AvXwSb0OPkWHFBBBUq8OaD/k9blkFMTUHqylbV72qviOouI1F4?=
 =?us-ascii?Q?QqqaBOwSZvIKOTFqbfe+E2fRc67QI8BrFBEQUI7xvG9/8/L5GrGQlxk2qJil?=
 =?us-ascii?Q?Kug1tnNCF0oshWfcmq1woQQJiWDSwK8VD7GF7fcD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc724cab-035b-4046-a44c-08ddbd721fe5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:20:01.7469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GaQq2xukVIihj24Cpdrn5046lKBo6NuV4jW/V1zynancpr5vZ1iShpswObbJnn7D4zHajENGvUFEtmkqT6t9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_092004_572242_536B002D 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon, Jul 07, 2025 at 01:54:08PM +0200, Wolfram Sang wrote:
> Hexadecimal values in sysfs should be prefixed with '0x' like e.g. PCI
> and SCSI already do it. Also ensure the two digit length since BCR and
> DCR are a byte in size.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ea6b99c05f44..ffb734d378e2 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -141,7 +141,7 @@ static ssize_t bcr_show(struct device *dev,
>
>  	i3c_bus_normaluse_lock(bus);
>  	desc = dev_to_i3cdesc(dev);
> -	ret = sprintf(buf, "%x\n", desc->info.bcr);
> +	ret = sprintf(buf, "0x%02x\n", desc->info.bcr);
>  	i3c_bus_normaluse_unlock(bus);
>
>  	return ret;
> @@ -158,7 +158,7 @@ static ssize_t dcr_show(struct device *dev,
>
>  	i3c_bus_normaluse_lock(bus);
>  	desc = dev_to_i3cdesc(dev);
> -	ret = sprintf(buf, "%x\n", desc->info.dcr);
> +	ret = sprintf(buf, "0x%02x\n", desc->info.dcr);
>  	i3c_bus_normaluse_unlock(bus);
>
>  	return ret;
> --
> 2.47.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
