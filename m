Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F05BD1BDED
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxuakNiluTovYHkwynJ25IDYvNzTT6kfAdp5g3puRrY=; b=VbZC+Fz4nGFLmH
	5oopMrIPsCOxIMUtZpGdpg/6bFM4xgAz4wKkIHJjCXpp0oUO+RmlTpteH0+8kW6eNDSh5BoccbYW4
	Up6uydPKZoRV833WiaUKMsAo971wraE3zLrI/orsCXlSgh0asPZiglyG7fyQ6hlZNFXRogPkj//jS
	zKZHhEw0LAfjKyLNnVXyesk4v4fl4zplOv+fpsBoBOWeYcjLdw48hG9SYdKe+rYiybjcL0XKJDiyC
	qMUHfy82QDtHepT6POzBWFHCf5VsA5keBCvetSuVKeUSIrzYXjXRjlWuu18OKjZX2LJpDge3BIwvV
	SUiILf7PJZmEpJu/3nsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t83uE-0000000F2pB-2caH;
	Mon, 04 Nov 2024 20:42:34 +0000
Received: from mail-dbaeur03on2062e.outbound.protection.outlook.com ([2a01:111:f403:260d::62e] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t83uB-0000000F2o6-0qTn
	for linux-i3c@lists.infradead.org;
	Mon, 04 Nov 2024 20:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekDkjUu7A51IROlbQQn12zEEG+VyKp3Cn0EKLwW6l63vbQ6uLQN4yXNEnL5mWH/my0LPVaRndnQOGXJWpMRWrQMwYQAf1JWjDk6Er9UQWdgukec5T4mN5phfLklEm+qMXIH7lz3xRkSBlbegf1ohGWaH6wbvueNrzmP5ptrw44aHM/9F0pfGil5sRkzoRI0ks2x6+Pa1+oQYyhJEMTSj8MA3IfjsmlkO1TS2IzsTmuIyDRj2hqEI/TrPv+VEmUPBNhCY6PlU3dhV/GUl8dwZpafwlsOHEPffOBKSczFYQD6isH6rCzkdpbUr2E+LcvxkcPKoevRr5pYdZfXAvDDwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tkj2Gys7O+La/9vq+ytjF/l9QOftyf6e6t9Q3pILko=;
 b=y9H2o6K7qNVkqFKjFrvQ0gzVjJl3k9tmFvuXj8hhZNWzDSviGhgBDav2vpOOVDnjy6EvR38/WeFcuJGIC75WDfC+84n5EbesrNVu55U/sdj44A8GOKLes8JZvSXOZL9BALUxRneLu68rams4+0zvgi6F/RTWW/0pX2TZ8fsFyav453xv6Ah5YXUUEwV61c/e5+YUzSQLp4/7FJki8mYlEi9E786OvHDwNoT3u/Uf2yHFBq5YWzQxXVcYlb624q61y8pAGkujWdbGBOSvkKky/efYme/REE9KNPkOWOSw9nnZAfF2q729CMBm4NmOGzYT85JckjVAMw/ffgppqBCnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tkj2Gys7O+La/9vq+ytjF/l9QOftyf6e6t9Q3pILko=;
 b=UZ5ycDGkgn88dshwqQBY4QvelHwO1K4LRUfgZSYm7iQORVxBawzaJl/5CR5MDaaIktYcAvbQXN3hqr7LP3juIZzOVRdAHS8m6yZDoUfykftvr/DnwBo5JAbid2K3EEzOyIHY4a0bn3pUblI5LeHK1EoOmMuhDHcW8TSAt8zewKjS8iTXkBRJYEfYX1DWnDhLWonJJ64DPCvLjQkB6W7FMN5eeKlG+NvntlNYN7FEgsYAXnqGmUDuJIvd+tNZbr1liYdYVOxRoolnq3oLqsaGs80QA040oixy4zlRC2u83a44RI2u+EEjV5TTwZDaU/5VcSdm7ByH7BB5kXmLtbrhIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6865.eurprd04.prod.outlook.com (2603:10a6:208:181::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 20:42:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 20:42:25 +0000
Date: Mon, 4 Nov 2024 15:42:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Document I3C_ADDR_SLOT_EXT_STATUS_MASK
Message-ID: <ZykxrQ8DDCrbtF2/@lizhi-Precision-Tower-5810>
References: <20241102132841.2446176-1-alexandre.belloni@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20241102132841.2446176-1-alexandre.belloni@bootlin.com>
X-ClientProxiedBy: SA9PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:806:22::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: b416d305-ab34-4666-81d1-08dcfd1130e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XVWsJb+Sgs+uJzMYyEIzgoGH0tYWTKIzATQH3uuPSKMq/W+6fKcee3XA7C+J?=
 =?us-ascii?Q?ItMpiLTfQH+V2kd0WGMhgjBzfjU0zr+Lbz0OfzXL9qHL6r27Wx6U4prKkYaa?=
 =?us-ascii?Q?uQhTzzuy3aMfWn96abPhhT5/G/hqsjY4CZMdbyoXE0HLXC5L4Xfw0H1A3tY6?=
 =?us-ascii?Q?jbzBEqmLAlX9lD7jS5jXqjLGjjxbKi22CGO/v6EgxbJFjoovrNoAj3ho0jQa?=
 =?us-ascii?Q?BK7ySYEuc6BYSwAn9q/Jm70S8f2jyLFqAF8n5vBYLrDQHMtf1M+kX+q0EMo7?=
 =?us-ascii?Q?2az+76jTGOtlGBAUJXGGXjTSFDil8x1E4FUZuAdqpIe28dGvVO59cBEqBgy3?=
 =?us-ascii?Q?RxddB1KyAtHq+H4g+LqF5plGftwJL44AUUpBTNeSPgY/VrrPoshyNVcLyzcl?=
 =?us-ascii?Q?CsDIpLHzkJpLlLe3T9WlBTx6u6ajV0uJmeChU22BObCxtqKSK4MTqUdOChd+?=
 =?us-ascii?Q?3q56QzTzcSdyTPV7EEwiz+BS0k8D+Mol/ChaLHXpvH1lbatHO6R3TnnkikTI?=
 =?us-ascii?Q?+dUywpfjOrfl3BXxFMzDbUBK7VbF8IUlDL5QM2WJA3H2llEWCspaHkvubhtW?=
 =?us-ascii?Q?YtN7k/ZkyKUqbtKkmlRk7PzBf4/nmI/555NBcu8BXXCWhrzC9Ko4BZUwqCuu?=
 =?us-ascii?Q?b2XwiJD3YpzTr1Rk4ijZIJzT1KSmHn3Wg7r7LM15HrPY441oORVdxwdsnfii?=
 =?us-ascii?Q?a4q+8ZTbS57O+O5XehnaoQy46G/iXt2ASrptbIdQqUtD6VkQ6v4TOBryt+tf?=
 =?us-ascii?Q?1aXHu/0rheiVOVAZoz/ol+ZYJSJH1S2/azV/xlGyf06OkzLyXdLpxkCk4y35?=
 =?us-ascii?Q?FkeKh+RR3zdJ5k3Gfu9Ov08kq3PZcymTtBRXKOA4S39bCka5U8nJ7/vqybuo?=
 =?us-ascii?Q?Rxg2Hndr3ae7MniNimeDrdzhSdwMJ59L89A96aNe0aFD3Yfwe/thaPwUHKo/?=
 =?us-ascii?Q?zx3ycb5G9OeEOmFHgj7LJyrSCJmGCA9En/R4sQS9LogQqDUeSMmzm/3gjdbn?=
 =?us-ascii?Q?AzuuCRp2Vt2n/4dktC5qT9rT43OiuSPr/EBoUPauZU/gf4inMRusr0avMnH4?=
 =?us-ascii?Q?M+uH8/dFM4r85CeeBvt5Sd5BiOFBxfuDvVDZ9fWEEZV0oQBsnEUMeKbqtK+P?=
 =?us-ascii?Q?bW0fdmeU3aXC0Tpv1ZpipTY6e0s8isqhZFP1Qb5tWKnn+mKMgrCKHj2NjVsg?=
 =?us-ascii?Q?RRutq/zaQnX9a9wutx0XAyOBTR3055Zg16HCiiZmysJ9qtBXhkSGM/v+7K6/?=
 =?us-ascii?Q?JD68haGl/acJRP8I7F4X12ayrlJr9OuE7/WnFyChc+yhoU795L+OqhEcMP1u?=
 =?us-ascii?Q?GKFJOKWscAzmd/s6O7WO2DwA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9TgFW1awp0Hdkvo/UXmZ29vC6aGSk45sudTELFDi8iRWRuEefK2QCM8SZIs?=
 =?us-ascii?Q?d3qg63/y/yi0U+VhfzfBXT9gvHbu3mI9aOzbmSV4xmBSM1O7KE1+7g4Y/mvb?=
 =?us-ascii?Q?sypsB8vXqxtZTIkIlrDUa4ae4WtTyQu2AX8Bllkg0mGjfMKPOPGy3B1dcW+s?=
 =?us-ascii?Q?NpA4xxylY0Fn700Bl3+FKnxdkS1S9zlQG+VzypY9liuADk3K7NORTo7TgUw2?=
 =?us-ascii?Q?rK0ArkrZCBmQ9OFgYFY3MhbjpIywLmBJK5iLwm+rKf6vrovYKHmf0XrlH35M?=
 =?us-ascii?Q?KlJYvDalEZfd6WOaorKj1W5BSsaBdKDm3KQs3c9pW3EQPzeAc7wyHo/99BVr?=
 =?us-ascii?Q?E1ZFRYOM37j8RxWfE7cfCsWbR7en4u5qWJLRztUsbyG88tYdmu059R3h4THw?=
 =?us-ascii?Q?F/2eRL6OFPynL16DRSusvZrN73UAfadnTLv5iZ7jEqtazTihyiNK5KkL8eTQ?=
 =?us-ascii?Q?4lKD+Z0jb3rSjAh58sqsP63mfs7Nb081nkTTptLvW2hZUAus+mOT0TGyVa5J?=
 =?us-ascii?Q?xTJr3PrZJMn8shRhyemP/Dme7YWJHrQO8fUkV+7hTwVPV6RG1Zfvl6Nt+DLB?=
 =?us-ascii?Q?On3TQ2zjwZnhfsBf0BCSD2EWRIJNl2dv7259jeOarqIYte5G1GRB+FL5fIP3?=
 =?us-ascii?Q?axgoa3UIAPG5LZP8Zb1XqKJKtCfoEmsQ1hZu+qzbP0/U814X0/YZF1oPyO6o?=
 =?us-ascii?Q?9P4KyRL67REiXnvRuBcHxaZ4BNSlYxjPqI7LMLibf2zgILFiANUGmGahhkz8?=
 =?us-ascii?Q?GNSAhPV1MV2mDj4FjOMMs5OPv8Wh2HudpJ74IvTFQOF+HKf0qnZ8kLZv+Yi6?=
 =?us-ascii?Q?xab5zS4lsPnTMM/kEjy5TSwQPmpfF7TsCkaGpPs7zzpduSrZi3GigS80N8dc?=
 =?us-ascii?Q?9QBdUAX71aFQXsvEHd9Fn3kVrM2cr2VkTIZm3Ope0B41Ylz2rDEQXydL7p30?=
 =?us-ascii?Q?yEPnCWTWuSH3JbguVJKNVsgHGjRWa4xZih+qfIrtDqYSDWXGXp+A8Z/hYYDF?=
 =?us-ascii?Q?mG5447z0cqrst+IyQiwXzmJ8XNWHm5FLm+6aAo1yLJy59Hhiu7mjk3+fxjzk?=
 =?us-ascii?Q?EVpvyhyPpNLKnkuuklJ5BIpFKNMfOS0tDjS5/kZYjjUp3nak+6XgnplgkI6N?=
 =?us-ascii?Q?SrM76dvvdcxu6uRed2rXuP2TjfiDbe0xl0V2+xTEQPoHzpce1AyjSEbh6h19?=
 =?us-ascii?Q?Eui27ggyxt9VSnG7yC2O7Ermc0ZnjXXrp4jtWFJuE1IVJ59fgLzf6eIF1NnZ?=
 =?us-ascii?Q?Cg2OvrbtSkXbdNLRmECPqTfL6bTndbgD49wOzfvOUVSdKjTlIw0HnuKEvDVF?=
 =?us-ascii?Q?VmPgrOI7QwrRn27SWz5b39LFJPGRc5dWU1i965rbKF1Incfg+TYiRt7S+ZE/?=
 =?us-ascii?Q?+cufQ3hcyQxsM9L/KNQSuSHjOqZcRpCOdCzvhqRHLukZxA0lF1ZICIfTIS/V?=
 =?us-ascii?Q?X3QTssdMyL82P2uvcx/y0R+RDqeDMwl2w1JR2VqhD0ZYiqh+PjVT/AaXylsL?=
 =?us-ascii?Q?U9IcdOXcOG7KKAUK38Xwi2QBiHYGObxczXSDq7SyiwcVCBtXpag+OgEuJ5bH?=
 =?us-ascii?Q?evxAYPRDkw2qvxJk8TQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b416d305-ab34-4666-81d1-08dcfd1130e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 20:42:25.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCXUDNRC5KAxlSOnRgczM8FllmzYfLcMlkwxn6HxBUuNqeDqOCOcBCAz++MO5y7XQiwDfrvokuYQc5clFJaUJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_124231_263747_9C22C20C 
X-CRM114-Status: GOOD (  17.73  )
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

On Sat, Nov 02, 2024 at 02:28:41PM +0100, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> As the mask is part of the enum, document it.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/linux/i3c/master.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 6e5328c6c6af..12d532b012c5 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -298,6 +298,7 @@ enum i3c_open_drain_speed {
>   * @I3C_ADDR_SLOT_I2C_DEV: address is assigned to an I2C device
>   * @I3C_ADDR_SLOT_I3C_DEV: address is assigned to an I3C device
>   * @I3C_ADDR_SLOT_STATUS_MASK: address slot mask
> + * @I3C_ADDR_SLOT_EXT_STATUS_MASK: address slot mask with extended information
>   * @I3C_ADDR_SLOT_EXT_DESIRED: the bitmask represents addresses that are preferred by some devices,
>   *			       such as the "assigned-address" property in a device tree source.
>   * On an I3C bus, addresses are assigned dynamically, and we need to know which
> --
> 2.47.0
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
