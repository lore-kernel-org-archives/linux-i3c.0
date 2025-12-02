Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCADD11700
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu3CQZkMJMOOA5jFhKGOI5elxIF05GUo0V00NrIETlY=; b=Qy6iBCidVYKwyg
	CXD6XIilpqb9T5uIiUay3lxudmUnu4CITkgIUpAJK6Yuu3cF8+862B+HG+oX11MmcHICvrlhq5iRg
	znj2/jm2YyJJBmYd7FdYnZqks6NgS3eARipC1+f64/0oCIFSq7+g6Je0ZRbtVwee1jVRVu1OLk0Gp
	pyylNEvK2Wc4C2o79mt8WE4LOsQjTtrKXfIE34bvtiK6md8EUeB4XYu1exqrzg4n7rMLxWjgB975e
	SH6NbwXyJULmAFZRV+fbUozEWERW7tgY+CfpcwEMRIUmpMpOsSjOeIk0YOeGwGDZuhtllk8j6QAfH
	RwfOoDZM/7b8BNNpIjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTXl-00000005dW2-0sJG;
	Tue, 02 Dec 2025 16:48:01 +0000
Received: from mail-westeuropeazon11010012.outbound.protection.outlook.com ([52.101.69.12] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTXh-00000005dVc-0kBs
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 16:47:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkKbu4SV4fW7Inu4hZtvINoO/RaLuQHGERQ/FveXAIO3zgh/Y7TJaAku+FE4LzE4/n0+cBdkKoEvYssIWvvZ/2g+HCtRsdtPiUz82R6+vIPSeVPSynjF9RVoCPSE5Wgubdc+eX1/d3ALSKjsWHtooCEx3nyyBxxEwJsAn3TU7oYwQhx1u2we7EsGhB1wv0N9RqKJSYWMnrJGsggokNB3gcZVuf5qMvR2f1GQKFQXrGp3kqYPlSybnFRSLXx3CbyOqNGJBt93m0DGl0Ep6Xihh78SFKUCdZckdXdsPIUpOj1STHH7rKbzfqcZygBfHo+Xw8Ni7lQ1KvTgzZMZyJvZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6w1Qju45SYKTD2t0pCwRvIm3S3mt7ODJqBE5JgZ0O0=;
 b=aoqT6w6TH+dNgU03Xcb//pmWNMpi0S35njbsK2K2uZocqJjBQzmmE0RbO0b3VCNC2HN/3TjFlJUiAhTx7eyw7VX+CJlP+mEmLB1UBbSSwlKGE0L2aexfZydM66pKKTdULbzzGLOaf8dYm4rkAvwBFRhq6WA4RkXn8iuow9ogOxEk6pGlK5dKTUkHezDoG3aHtVAiWg5GMmfWBBXWqs0eitAeMudBTs/3zEKMLoHY6JUqx6jSBf2VUtFYadVQ2yrRMt/rC6E3kxfFJIsbfvSNGjOryvrKiXiWLsSxKQVTU3Dn7XTHs2SDeXHCLAei3E8xMtReDhJl3nrkRkWu+JnVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6w1Qju45SYKTD2t0pCwRvIm3S3mt7ODJqBE5JgZ0O0=;
 b=QJnQCYQuDldaDEgVf6TIjG2pn4j1mgg4StyhFsfFJcNVdAxYvAYzas+yKKjxcf+pLYKAEbWpzWnQgicitGkQKT69LIjZ+5uaWq7QElaHn8FoWcvLyUPsCfDEJqFlTwjM3ETg+SxSdk2yis9+AIDnLRgR3TLY9ZqiWyW8B2oaaeqvtBVWtGN2YSxN8Fs1EIHGVu779z825IqKtMzvXoYzxZMmDtkVUE8JJCYFTlKeh0WQCU2Tv7e+wZ+ra8TdMZJiooIhKYoP9xBGhP3O98CPUVNE605TaxwDCVr4jWspCfFaCCqjcsNRPH/sR+0kPRNnhwsYvNkbuljbpyQP2YtzKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9802.eurprd04.prod.outlook.com (2603:10a6:150:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:47:43 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:47:43 +0000
Date: Tue, 2 Dec 2025 11:47:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: kernel test robot <lkp@intel.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i3c: fix I3C_SDR bit number
Message-ID: <aS8YKfhPAxvpj6xy@lizhi-Precision-Tower-5810>
References: <20251202153804.2640623-1-alexandre.belloni@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20251202153804.2640623-1-alexandre.belloni@bootlin.com>
X-ClientProxiedBy: PH8PR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff6af17-9704-4231-3e7c-08de31c28357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eW6vcijzJd30vLZJgAaswBlyWYhuhO6XSsk7TJdZyMcURh242Y4N7T/eakbi?=
 =?us-ascii?Q?8JzCP88TsBlRRZooUUh0XZRBmMyQLq4OKjzyd7ezJYSIQMmJkisIeAdykknF?=
 =?us-ascii?Q?oY+zGekZQLFFpF1on7gwvinZfDrC/XtA1tXWOqJsVADerNK5/YgjlJWD2Xo2?=
 =?us-ascii?Q?fWKu0Osi8i0hEi+xGzNKKIbSCY/zxeRPeRaR6qyVzJQKhchkAwmi/G8YQXOn?=
 =?us-ascii?Q?xzjB8TTGFXgkNx8AtmoSpT3a0gpm0QLJuf19c72Vwc+9yA4vRFiJUhoZzsGB?=
 =?us-ascii?Q?PA7o8pyQncSDVWbf0jWg9qlIV2FoE98uEmZUYEelzgqcL6TmodUoqaEBRuQF?=
 =?us-ascii?Q?5nVdyb7uuGgQ5XEe9tRSfBAQ4S0yaYd1ZHo9HuTX3grOic3+X2wXC1S+FeBn?=
 =?us-ascii?Q?AcWaJepiSS/zbhkEXIN0FszlZUlzWasBc9lXOqNiitEIuO+iTMQGV2KHxecT?=
 =?us-ascii?Q?pLIL0mROYc2Ct+HXgmIsg3zGHpYIo/QolTOMgQwose2VRYHFTN4+IEOL3uyU?=
 =?us-ascii?Q?7jW8/2jlggXbVmTSMpQ7ftxeBnFUVP0ihGxL2/UhO4Y7Yqg40QRnKnwJ1EPM?=
 =?us-ascii?Q?01p69NZprlphku0gsLxp49f0tXJYXWnP2sGlXnHCaUMOtv1eq4obwLYOhdI4?=
 =?us-ascii?Q?2to8TaM8Y4wq2o9sSQgIDtRb/5zAiIkZYhKcx7LlA+gbdSu2K9BoBkgpCzoM?=
 =?us-ascii?Q?F7oKgStATmvevsY/519fZOjcJMHDiOx6EF28KQleZjFS2DfmQVMJHIPFmlOJ?=
 =?us-ascii?Q?Hll+x9Atpitr8YC0bZy7H20KPBzzrI7twYrjxQQB5/eBYeg7/KPEoRgMHOv3?=
 =?us-ascii?Q?19866edU1QFufVUkA/LNHghXg1Fc0tCf8s1JS35DtPQnZHmtrcEWKMtCSDnA?=
 =?us-ascii?Q?gYxZeW6TUgFwMmGNsPdsDvR+BPkb7jUONiXFIwotszo3JhHH+L4eVuFp8zqL?=
 =?us-ascii?Q?lJarZB96RP7nX/xXwBRwzuV/PEIFBX0ABQoWedPHDmLx9Beb9fBEhdOU5nE+?=
 =?us-ascii?Q?k6xnTlcmUccUtJPDEguPXQzBgzTTIz0l9GUxsqhfgUpiG/HnuITctzqSIOro?=
 =?us-ascii?Q?M3XZB3TWS1rbhpyqEjITh+NJFbavCK65e3oPv3RfcFnHddQ/HowvjMj+5mj0?=
 =?us-ascii?Q?cio3/bghCo//0NKTQZn5O5fEHxgubO/ln4kRuh9X/MVTLboAwuUmG6E/AHHv?=
 =?us-ascii?Q?372hADZnbNMxdLrqIrL9fhBd4l9FCriL49WHPZSD8bCv2NoPjkIyTiYumpQX?=
 =?us-ascii?Q?kzX+RbDLjcBQHEbYsX4P+Uyxk07abfhtXfn66dPRTOdFdJzd2jb0f8M03e5r?=
 =?us-ascii?Q?ZEzTk9x5ASkceTyEAMqlq0pqnqBKHpdZZYVOsdlSHFs3SweyCatvO1yNXSck?=
 =?us-ascii?Q?QJ6Y8+Yd9LPE4ZjKa6tveRSXLpyoCMgG/ainoodftxcPqTrSw19Z2n17VW8O?=
 =?us-ascii?Q?2zQGbBqTHIONQSptVuM4UjZSI5RiC1hG/T1oSW0WTcZLgyAcTqPXblOmRico?=
 =?us-ascii?Q?LZtDp7M+9QJMx40nxXeEQlzIVAp82lAR3XuS11PYPU+KeZsSluVwH+5frA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eFDpsqGhrB9UC7x7nv4FHIMC/fLPbWVZ+kLPVufmQorgKP2Efau8MGgcB08o?=
 =?us-ascii?Q?3Mf6un+eahQf5DRwD/686s07hhG0f8dVh0hCEzjcyoEKyfoEzCo3WWd1LIhU?=
 =?us-ascii?Q?P1DiHWCZ5S9vX3BzDEt2dyYVvAt7fwCvLrYvD4yvHE4xR5lHlfFamYfWrzg7?=
 =?us-ascii?Q?+xbPwiemrgmDk4/tJJZD7F+XDgJaTypD5vpYyJk90tLcdK+xZn/LPnbAlo5n?=
 =?us-ascii?Q?Ln4M2r5OFw0uZLVIYQYd+Sapjmm67Dqz1+l+dTk1DDQdxdY49Wcm1L6GNtrk?=
 =?us-ascii?Q?QOjl4upWwEqHGM6vgy7DFHGz2rpIUbIPw077sT4Dnks2ElXfWBN4bzbmQAqR?=
 =?us-ascii?Q?QRpcz4HHQxUhreWMzZjiMLvLSWXh5ef3Yf5nylIvH0zc4GzwUues4iPJz/RY?=
 =?us-ascii?Q?9C2iwLpL9z/cbYOILC+VMHd3+WkTZOQ9+6dOM2iZm2jdZ50FPBCJv1RViaNu?=
 =?us-ascii?Q?HqkiHe797IVdkq4nQdbU9ffknbYhuuTHXuArATubAk0TY8ecX3g31PKKl1BF?=
 =?us-ascii?Q?G5UYRqW5LAqQw/CoOB9w/XoLFWG2M+mHXlrdf2phoP6JbOrt6XqpNqyYWxDw?=
 =?us-ascii?Q?OEg8gse1KAdqn7pQVb8N1iymkvim/MJ+SUcJ5450AP6oOye2piJGTGFhQbRC?=
 =?us-ascii?Q?a32NRw9ueP4EwrHl6wPkVEORtFU/ixxAA5BuKQ2ScDsTksOfpo0z0eV9Neze?=
 =?us-ascii?Q?vM8onTICZQNIpqGZ+RLYR7dMZ2mXjsFPxJeaqo7+kZyavc0U2DggKDTh3dFW?=
 =?us-ascii?Q?IZyrH5hcfH6l0f+r1WCElH91V8ETqCL05Mh/1qbcF1sDVIlEDyEN8XrWSKkC?=
 =?us-ascii?Q?IYiZ2DRDmBsRzfsPOqdFtIvHHXXppfV7BfZg1AR4nMZmulBwGrUaIrwE7VdC?=
 =?us-ascii?Q?8R7TYikiJIJl5DbYAhtgoIjEwrFflFMeOWQp4e3hJ2pnz+z+VEjp+/TWoGYs?=
 =?us-ascii?Q?KNLa4tQZN2yuwshr/UfNXps4Cq6pn1sPUIHwn30C36yHfJecHU2rpS4ahgtM?=
 =?us-ascii?Q?FP9gesAhSbcMw5+9W5gRO1PR9brtudB4ULmacLGm+FQInaznn2ZHA0UOMy6/?=
 =?us-ascii?Q?1EHymghoH+32ASZ5HPBWPKbjblTz1FgMDB7O7r76fizSON+FAYZeUjzF6h9g?=
 =?us-ascii?Q?kf4KCxCd3D99JgLNuZLAUu+Z7lcWVb46zh9Wzcr9tkpw6VlwG0n33yNpn5wO?=
 =?us-ascii?Q?kvj6W1c23Lz5T/XzH+2HAk08xcrZU3rH2JFsD5wRzTZVQ84N/NHC6s3fK1Jn?=
 =?us-ascii?Q?2zKXU11QT1AopRkxT5lrXhgxX2QKNYrMrBSWMtnQDWLi0prt8qy/T3a8ANKs?=
 =?us-ascii?Q?ZrLWepVh9u23lGJAtvLgcWSXtc9gHFHUyaZwSZ0h3VyIk7bL+Js8X7KvqoCH?=
 =?us-ascii?Q?qwd56u5/LJKINfucV2GIzgiXDUinlc5Pyt32FYiCq/IWCfvISBlmBZbyLJfR?=
 =?us-ascii?Q?oSWadsDytEhv3lsgcKoay4xDY1e4VhD54ZYQdjp3oNo2tN6Cp/JL1mfGq4CZ?=
 =?us-ascii?Q?/Lq8GgMtXlPLosfBlYKeHo4l/26Ir4Z/yq2xmD9/QDSa28OWMGdQ0U/u/2Ur?=
 =?us-ascii?Q?/BZxnkDgvB20emIkA5Ktbg6nw8p5Mz8WSVBah2gc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff6af17-9704-4231-3e7c-08de31c28357
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:47:43.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qD4/XTUrZhGVXXIfHMz/EWBNIhbiXZvVIKIUBYpYVYvGuc4qXC/yYNat4ESob9SHG6SdF2Itr20MeG7Q4Co6kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_084757_253912_C3D7B213 
X-CRM114-Status: GOOD (  15.04  )
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

On Tue, Dec 02, 2025 at 04:38:02PM +0100, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> 0x31 is decimal 49 and doesn't fit in a 32 bit integer, switch to the
> intended decimal 31.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512020956.Dnz8A2H0-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512021613.97jVprvJ-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512021644.lp8ZMSx5-lkp@intel.com/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Thanks.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/linux/i3c/device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index ae0662d9d77e..9fcb6410a584 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -51,7 +51,7 @@ enum i3c_xfer_mode {
>  	I3C_HDR_TSP = 1,
>  	I3C_HDR_TSL = 2,
>  	/* Use for default SDR transfer mode */
> -	I3C_SDR = 0x31,
> +	I3C_SDR = 31,
>  };
>
>  /**
> --
> 2.52.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
