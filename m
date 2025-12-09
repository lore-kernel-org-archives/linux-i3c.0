Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742BFD3B980
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHpby7Dc2yecn9+WF/yWkD58zQOFuWiTe0SsehW7J+o=; b=VeZwyxJNi3mDXQ
	BVeZqO0B2GL3SSr67r7lOrpNUb3FbMAvljsm7xgjw5zObE1pSR/OwPc2wyMMuB0Q3S1Aa5fkoDw2d
	MIyvCTtBiz31IG2hSuwcjLK9vN8XEz5MaCtZ8kwMJDFTnwuyUNS3HGVX8PCYajq1BSh/fM1jReP8k
	PpUNS+YQ1i9iKYJHW8QFi24Yvulpvo0Ynvb/3O2i7TZECpSWdIji24Hd3lD19INBYDCkoDHBR0ATH
	oi56vB9xS6CNP6vgRzsqcectZJHJKdGpvuy/m3Fus5T6eMG/CwcilQsUuElqF6bigDgwTVEkL4wzO
	IlIl265iLjK/x8lrlD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0Xf-0000000EW4z-3nEa;
	Tue, 09 Dec 2025 16:26:23 +0000
Received: from mail-swedencentralazon11013067.outbound.protection.outlook.com ([52.101.83.67] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0XX-0000000EW46-2I9a
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 16:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2+iNCiEGyfUtKgYx7Lav/IxoqqI/NUL1VIhprKT5Y2qdvDhbTI3/1+rjfbdq3GVFhlZinZmHmszGwhDcfTdPtyd6j6a+oOI6Dhx15Q2v91Il2bu9EjGo9h/A4QaB1XNCZib9hYbRRxDANaGJP+NJq72WjQQgmVUcUyY5+GNAPoPXY0PJKnFvh/sSPcc0okBOI1k+MWwWxz9Id8gHuPxunASfUjBHmgAV+TUduPxKsCPKKkR3dA39SSiVLmQz0pXg+m4BIrYVHDWqfiPLwMaL9b0lUHy2BsVBSmtxjcVre/KfKg7d2OLnPnrM6Us8QhvhpFAYiUGiLls5SmSAR8wPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fIDPfExKkq9cZcZL/rRqfIJiT7dEWXZgA3Ay9Mxu+Q=;
 b=AjhpANodA69yVM0DA6pP4B66dCkECT3m7vshvo/QR23t+p+Nq+nntp0LGAC/pAXpA7+Cof2iZPyuA8SULW+jNLWPLBhnYyZyxWcj+tZbxROrCujT8pkDhv0+XCHHvD2u6m41ncmv809RsvNTvrABUoqLnWbwg/8ytN0Dqb2L2pU6Ftlm4OBeysFu8JM9CVPX/1pm/2Id9ayfshKrXsH8C8Q2fU5fgCv3OGc4zTgrgOqrDA1C9eGccE3XsaV3YyJsKvKGwtv72z01EawFk9EEDT7tSi5sAUOmag2g6OccFuIISHz2E4uJBz8fvvw3hLY2y81bj5fnZ0XZVyQE1V4j9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fIDPfExKkq9cZcZL/rRqfIJiT7dEWXZgA3Ay9Mxu+Q=;
 b=KeG3gki/Ag/+2uTHEOCEVcxghAOdS31HFV/v/5u1n2h6Y6QqXgEgG07AYgMpo0RFx+vFwziSc+K/kgiOxqLjeRAfQmqucQ9IWlIJ6V88PF885Wde5yktAglWZemmBhAPI7L+bxWTk591fRdEJ0kV2O/QIqOPcq8uqlPMVE0jAiXBsZpohQOdP6cG7ATAJXIM6qOm8ld768Kk93x9Bz0UV0UfjBnOIz9uRBJHc1coLDMGnCSja9mDtxjhssyTarwGbrSpQdFkARcps0Tq9VF9N6uaqBp0WoKV+8lIA1LZZdEdp4Nm8Mrb0sVSmhGC+R25MzQ0Wh5OEGwD0JHoz2OemQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS1PR04MB9584.eurprd04.prod.outlook.com (2603:10a6:20b:473::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:25:46 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:25:46 +0000
Date: Tue, 9 Dec 2025 11:25:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 3/7] i3c: mipi-i3c-hci: Quieten initialization messages
Message-ID: <aThNhejI+sj1MCss@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251209115104.124156-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF000132F9.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2a) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS1PR04MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a6b557-67d7-4a30-50dd-08de373f9b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t2B1ZITHHe1IBXtszorrxrSA5Ozp2hijuQwkErpZWCHjYwlTJgDiHZCIeahw?=
 =?us-ascii?Q?gE9QhjcvGgmc7/dWc1aIIFXmFQ1Xs/yDxpE4QGNI8UmwuiA4dSoajwy0nWYr?=
 =?us-ascii?Q?2D0M/LKY38lFLTeDB5t2Kl1SghImm1gIzWIcT3TBHAG+EtsWEZSy2TLKoHmh?=
 =?us-ascii?Q?lL5Rp43H7dPt1ql6Lyr5O//LhmSmMy2GpwkU0AaOebDPZBep2qKyuroxx6Ui?=
 =?us-ascii?Q?mNi3u95xkOLL2Vr7bTIiw96deRlhrilC3Wjudlz4zk/jgcjrlES89dqHPcy0?=
 =?us-ascii?Q?tR8s4MgCJFIgShjQOmIsKqJTwoMNP2928l7kwLQRM2k/XXJTByKnljHHbXGO?=
 =?us-ascii?Q?cQV3zYu4IoDYT5O4Nd12iQ8aI5XBBNTy+GthzKFP3XsDDhJ/4SOdeG+gdUbQ?=
 =?us-ascii?Q?utbJKAHVLYGhglvNYpuihanEmlNOtO2mB0YfyBYmJn5Yq3SSVi3kPjgipmvV?=
 =?us-ascii?Q?rFwDLz3m494Z2f7P2sd5c1UjUjf9nCgUV4OBKNwQuWzUecKKbYabOzKzPKu1?=
 =?us-ascii?Q?RCYVWXqUvzGt+MhfJMPz4vjaT/KhkwSo7OhonQY0fazIIAaYuH7uoEQZPKbi?=
 =?us-ascii?Q?/DP4ctD1hoAfZ1wc+AgUdHQuSKQIifHu2xYkawzfjc7vJFfjM3g7jCBnjK6P?=
 =?us-ascii?Q?/EYEawqTh0GaDUxXMjD5239TB2/6xNAo0V1AQ1luatb47s1n7IKKEeZww2jd?=
 =?us-ascii?Q?ldmv6y16PC4EM2zx8A6gaVrnROomkjnegbKmdfJO8nwJTMud1xqvulGZifZh?=
 =?us-ascii?Q?vQDIcGMmDguu5tUtkhSn2fKynoLJ9TVvRrOxeTe7nnA8eMfAamA8rBsd4goe?=
 =?us-ascii?Q?lEgjqnPIZl+3oy7oO+VNMV+mnaKl6shSqXospinWUs/yDDZFjGE287z7GqBh?=
 =?us-ascii?Q?kTFamz5eKpYwA6oS6aCaAurk2gFto/qRE3XTjVyJIkttY00RYbfYjIxhzfl9?=
 =?us-ascii?Q?+U9dDnqBzmSnxgw1vJi3AoaNGqSXwJg96+X4itJYmbaJaFHjhGdXCGTPRKlw?=
 =?us-ascii?Q?xYVYM9P55hXGC4czSPhfupGXulu24dMfDdBOn2QYiVPiwTYqlFVtUsaj0pfv?=
 =?us-ascii?Q?OU/b3N8MksW35VUcbfjBxe5/vVX8wwL5EDgQobgdvQ0cRqUcb2rnVrtednVa?=
 =?us-ascii?Q?2b59zhRNUFPqTPOCNlwN26pAvYoVIWXrDeJ7mJa8be/15vb7/WOIxVnO9ZqA?=
 =?us-ascii?Q?oLkzxvUiNbli+aCdBGWcYModqmHVR/ux51Z9LZTPNj3iFopCPtKRwav4cowi?=
 =?us-ascii?Q?C/mSnjwlriArkUE4AU/E4zQMvE2JdX9ZkB0I9tpKYODsQaBUxqIPIXkXSbtF?=
 =?us-ascii?Q?MXWuK7wuGSQ0xRbdKZwowDMO6rAR98N8pSoMzd+vE/co/JQHKUrkGotidd/I?=
 =?us-ascii?Q?wMG3SMPxGcvBfGeqB37ppLdeLou4lmo7f3Cqcg+NX/fuYa9NcVbTfDFE7T7w?=
 =?us-ascii?Q?G5jieashzuontQL7vAcNKWY2Nsf2CmrBavtnqqCzZfJ0CPD+wU7noNYss0QD?=
 =?us-ascii?Q?F1sAC7m3TFhOBHTg+hyIePtQ4FH1HhI2j1Lt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXCnJuWuabWiiInGrFpbdF6yuuuo6oMbuNNeWARlsnLvvm/AjEQd74UnvDcQ?=
 =?us-ascii?Q?TZZ0Q4fgGJydllBNFxWGgYuhNL9TlO6pU1xLYfpYI10oxoTN3g4cit4SrU0Y?=
 =?us-ascii?Q?f/M9IbN0N3XUtQ25xCJ2gL2fhb80roFd9D7zt5cUXiBVsdPDpGP/QelqjyyJ?=
 =?us-ascii?Q?BAJPfyoodjrcGW/MtwzG3qTj1rN8EajmIeCLarQIYsDcKk5GKc+ZXng2YxZ1?=
 =?us-ascii?Q?M+qCvIpnG0qYPjHz9ctNhO0SAiBckr3TEMeIMr18BHNK2GocVFRJoifet7NZ?=
 =?us-ascii?Q?vg9KIKVWKznNUSuqV7V74MwPxNs8QylE3XiEqvAnU1GiOGWO9l6I3v/R8lcX?=
 =?us-ascii?Q?/W5YypYR5qTX7IrTRvJr2aKiGp5erKJBjmf1eshH92TAfdWMLKQi6E6RaNlf?=
 =?us-ascii?Q?9Pyyq8QEMHyeNoxzmw+K0JImg/+b9e+LRxvKtvefvzLE/UrK80lVNjKkDCHo?=
 =?us-ascii?Q?0O9xCrM/3mCBuR1BEctn8xacIiG5jct49vGH1bNl1p3IO651Pg1nrNTivLo5?=
 =?us-ascii?Q?TsOCu2OHaJ1zY3r/QaIsImNZwXlZ8h9N5ny1lFuYA4+DDFnaC5VAryh2W7yK?=
 =?us-ascii?Q?ctYxfQmJS9Zruk0JgwUvtqT72wwQGKPMEWnjBOeZK3jAHQUbMih5bljlzIQ5?=
 =?us-ascii?Q?z6//jzsB2j84Gg3HpM/E/znYDur/p67oV7biaMeGlfCq14lkii8W6Fa3NR5A?=
 =?us-ascii?Q?tS565U3ZLogveO2SRtRlRWkRcbYotdAUvqJ46cEKV+XSNKjwd+LYQxTSmHUM?=
 =?us-ascii?Q?j7zSEx9/hFCmbw3WSnGUDjczqH6AyuLSGCBVPIP47rQHzWF2yMoa15VkNyN0?=
 =?us-ascii?Q?k6G0/aD7pbGgQztS9PSJ5NM1+2rC/vL1H9Q1pesfKZMn9Cd5ZPCL/vQojg4J?=
 =?us-ascii?Q?lj4Pz4o3Uwn+8GqgJdG44cP1rJc6RtlWwmoh7IjbpsRsupZhXmne2oEZA0pZ?=
 =?us-ascii?Q?lMBF/cwnrd3659dscwCCao2yFvjutBWiHEf2ynU239TvHzs/Oc/uWu6JH7Pg?=
 =?us-ascii?Q?VNmad06WF1sMmzKbiM/WCBT1KFa67pEnAZLOZCvbYe2X2M+pm6sM/Tv8mi6m?=
 =?us-ascii?Q?SQe2WgeUKf09ovNyCICRnLkNYHbP5h6nVHGf+AaHFu2jY7zXJs4iNxqbwnCH?=
 =?us-ascii?Q?5YfkpcFHaC64yE3zczvUmSjL2/yK7FenDNzO3DDRQW+u1xtuu9fPxP6F5lll?=
 =?us-ascii?Q?73p9nZ+0svpYd/5xJQ8Vn0A31PXwnY+dtG2QYrVmM5GZGPJZNTrkgztLSkwT?=
 =?us-ascii?Q?OTDaVlaejH26doYOQ+3yYegkjTM9sqvPT/FpwfDgUjv6dZbYlf7q9SDz32CT?=
 =?us-ascii?Q?VSYaMh+UI//F/cEDksM23D/+9bTqlel1dytvyUB/d3hCx7zX2QX+8W0aawmT?=
 =?us-ascii?Q?bimWMKyQuqPyc7fuAFBwdVZyEjqirpEcz6xvIsS+WBQiXzPyXfgLIHEfas+F?=
 =?us-ascii?Q?g3eVbqe3dfAfd9/6hKyBWELoL4RLfjjcI3PDvDHOcJmZvwYC74jIfyakd8HE?=
 =?us-ascii?Q?Algt+eHUeFoohdscIpCggRz96vfVn1+sCardPZ0mXDaHBuiQ2BxcTSOaNJLf?=
 =?us-ascii?Q?j1q6ZpTtaHL6LBFvKkEKD79xrbv86t4D/n1cxEV1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a6b557-67d7-4a30-50dd-08de373f9b93
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:25:46.7925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXCCpcLaano6gU+6vCxeEmfiowNT4J3n9a/4gPNbdunB9WW95+vqFL9hWplFAFd+KllbqVfNgwwo6tM9hP4w1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_082621_038106_B2EC1F43 
X-CRM114-Status: GOOD (  20.70  )
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

On Tue, Dec 09, 2025 at 01:51:00PM +0200, Adrian Hunter wrote:
> The copious initialization messages are at most useful only for debugging.
> Change them from dev_info() or dev_notice() to dev_dbg().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

If have chance, move this to debug fs.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c     | 18 +++++-----
>  drivers/i3c/master/mipi-i3c-hci/dma.c      |  4 +--
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 39 +++++++++++-----------
>  drivers/i3c/master/mipi-i3c-hci/pio.c      |  8 ++---
>  4 files changed, 34 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 211321f73e02..07fb91a12593 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -597,8 +597,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
>  	if (size_in_dwords)
>  		hci->DAT_entries = 4 * hci->DAT_entries / hci->DAT_entry_size;
> -	dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
> -		 hci->DAT_entries, hci->DAT_entry_size, offset);
> +	dev_dbg(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
> +		hci->DAT_entries, hci->DAT_entry_size, offset);
>
>  	regval = reg_read(DCT_SECTION);
>  	offset = FIELD_GET(DCT_TABLE_OFFSET, regval);
> @@ -607,23 +607,23 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval) ? 0 : 16;
>  	if (size_in_dwords)
>  		hci->DCT_entries = 4 * hci->DCT_entries / hci->DCT_entry_size;
> -	dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
> -		 hci->DCT_entries, hci->DCT_entry_size, offset);
> +	dev_dbg(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
> +		hci->DCT_entries, hci->DCT_entry_size, offset);
>
>  	regval = reg_read(RING_HEADERS_SECTION);
>  	offset = FIELD_GET(RING_HEADERS_OFFSET, regval);
>  	hci->RHS_regs = offset ? hci->base_regs + offset : NULL;
> -	dev_info(&hci->master.dev, "Ring Headers at offset %#x\n", offset);
> +	dev_dbg(&hci->master.dev, "Ring Headers at offset %#x\n", offset);
>
>  	regval = reg_read(PIO_SECTION);
>  	offset = FIELD_GET(PIO_REGS_OFFSET, regval);
>  	hci->PIO_regs = offset ? hci->base_regs + offset : NULL;
> -	dev_info(&hci->master.dev, "PIO section at offset %#x\n", offset);
> +	dev_dbg(&hci->master.dev, "PIO section at offset %#x\n", offset);
>
>  	regval = reg_read(EXT_CAPS_SECTION);
>  	offset = FIELD_GET(EXT_CAPS_OFFSET, regval);
>  	hci->EXTCAPS_regs = offset ? hci->base_regs + offset : NULL;
> -	dev_info(&hci->master.dev, "Extended Caps at offset %#x\n", offset);
> +	dev_dbg(&hci->master.dev, "Extended Caps at offset %#x\n", offset);
>
>  	ret = i3c_hci_parse_ext_caps(hci);
>  	if (ret)
> @@ -705,7 +705,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  			ret = -EIO;
>  		} else {
>  			hci->io = &mipi_i3c_hci_dma;
> -			dev_info(&hci->master.dev, "Using DMA\n");
> +			dev_dbg(&hci->master.dev, "Using DMA\n");
>  		}
>  	}
>
> @@ -717,7 +717,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  			ret = -EIO;
>  		} else {
>  			hci->io = &mipi_i3c_hci_pio;
> -			dev_info(&hci->master.dev, "Using PIO\n");
> +			dev_dbg(&hci->master.dev, "Using PIO\n");
>  		}
>  	}
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index f20db2899989..0f6bbe184e85 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -212,7 +212,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>
>  	regval = rhs_reg_read(CONTROL);
>  	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
> -	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
> +	dev_dbg(&hci->master.dev, "%d DMA rings available\n", nr_rings);
>  	if (unlikely(nr_rings > 8)) {
>  		dev_err(&hci->master.dev, "number of rings should be <= 8\n");
>  		nr_rings = 8;
> @@ -232,7 +232,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  	for (i = 0; i < rings->total; i++) {
>  		u32 offset = rhs_reg_read(RHn_OFFSET(i));
>
> -		dev_info(&hci->master.dev, "Ring %d at offset %#x\n", i, offset);
> +		dev_dbg(&hci->master.dev, "Ring %d at offset %#x\n", i, offset);
>  		ret = -EINVAL;
>  		if (!offset)
>  			goto err_out;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> index 024bccf23fd0..79c6b52df6e7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> @@ -26,9 +26,9 @@ static int hci_extcap_hardware_id(struct i3c_hci *hci, void __iomem *base)
>  	hci->vendor_version_id	= readl(base + 0x08);
>  	hci->vendor_product_id	= readl(base + 0x0c);
>
> -	dev_info(&hci->master.dev, "vendor MIPI ID: %#x\n", hci->vendor_mipi_id);
> -	dev_info(&hci->master.dev, "vendor version ID: %#x\n", hci->vendor_version_id);
> -	dev_info(&hci->master.dev, "vendor product ID: %#x\n", hci->vendor_product_id);
> +	dev_dbg(&hci->master.dev, "vendor MIPI ID: %#x\n", hci->vendor_mipi_id);
> +	dev_dbg(&hci->master.dev, "vendor version ID: %#x\n", hci->vendor_version_id);
> +	dev_dbg(&hci->master.dev, "vendor product ID: %#x\n", hci->vendor_product_id);
>
>  	/* ought to go in a table if this grows too much */
>  	switch (hci->vendor_mipi_id) {
> @@ -48,7 +48,7 @@ static int hci_extcap_master_config(struct i3c_hci *hci, void __iomem *base)
>  	static const char * const functionality[] = {
>  		"(unknown)", "master only", "target only",
>  		"primary/secondary master" };
> -	dev_info(&hci->master.dev, "operation mode: %s\n", functionality[operation_mode]);
> +	dev_dbg(&hci->master.dev, "operation mode: %s\n", functionality[operation_mode]);
>  	if (operation_mode & 0x1)
>  		return 0;
>  	dev_err(&hci->master.dev, "only master mode is currently supported\n");
> @@ -60,7 +60,7 @@ static int hci_extcap_multi_bus(struct i3c_hci *hci, void __iomem *base)
>  	u32 bus_instance = readl(base + 0x04);
>  	unsigned int count = FIELD_GET(GENMASK(3, 0), bus_instance);
>
> -	dev_info(&hci->master.dev, "%d bus instances\n", count);
> +	dev_dbg(&hci->master.dev, "%d bus instances\n", count);
>  	return 0;
>  }
>
> @@ -70,7 +70,7 @@ static int hci_extcap_xfer_modes(struct i3c_hci *hci, void __iomem *base)
>  	u32 entries = FIELD_GET(CAP_HEADER_LENGTH, header) - 1;
>  	unsigned int index;
>
> -	dev_info(&hci->master.dev, "transfer mode table has %d entries\n",
> +	dev_dbg(&hci->master.dev, "transfer mode table has %d entries\n",
>  		 entries);
>  	base += 4;  /* skip header */
>  	for (index = 0; index < entries; index++) {
> @@ -94,7 +94,7 @@ static int hci_extcap_xfer_rates(struct i3c_hci *hci, void __iomem *base)
>
>  	base += 4;  /* skip header */
>
> -	dev_info(&hci->master.dev, "available data rates:\n");
> +	dev_dbg(&hci->master.dev, "available data rates:\n");
>  	for (index = 0; index < entries; index++) {
>  		rate_entry = readl(base);
>  		dev_dbg(&hci->master.dev, "entry %d: 0x%08x",
> @@ -102,7 +102,7 @@ static int hci_extcap_xfer_rates(struct i3c_hci *hci, void __iomem *base)
>  		rate = FIELD_GET(XFERRATE_ACTUAL_RATE_KHZ, rate_entry);
>  		rate_id = FIELD_GET(XFERRATE_RATE_ID, rate_entry);
>  		mode_id = FIELD_GET(XFERRATE_MODE_ID, rate_entry);
> -		dev_info(&hci->master.dev, "rate %d for %s = %d kHz\n",
> +		dev_dbg(&hci->master.dev, "rate %d for %s = %d kHz\n",
>  			 rate_id,
>  			 mode_id == XFERRATE_MODE_I3C ? "I3C" :
>  			 mode_id == XFERRATE_MODE_I2C ? "I2C" :
> @@ -121,7 +121,7 @@ static int hci_extcap_auto_command(struct i3c_hci *hci, void __iomem *base)
>  	u32 autocmd_ext_config = readl(base + 0x08);
>  	unsigned int count = FIELD_GET(GENMASK(3, 0), autocmd_ext_config);
>
> -	dev_info(&hci->master.dev, "%d/%d active auto-command entries\n",
> +	dev_dbg(&hci->master.dev, "%d/%d active auto-command entries\n",
>  		 count, max_count);
>  	/* remember auto-command register location for later use */
>  	hci->AUTOCMD_regs = base;
> @@ -130,46 +130,46 @@ static int hci_extcap_auto_command(struct i3c_hci *hci, void __iomem *base)
>
>  static int hci_extcap_debug(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "debug registers present\n");
> +	dev_dbg(&hci->master.dev, "debug registers present\n");
>  	hci->DEBUG_regs = base;
>  	return 0;
>  }
>
>  static int hci_extcap_scheduled_cmd(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "scheduled commands available\n");
> +	dev_dbg(&hci->master.dev, "scheduled commands available\n");
>  	/* hci->schedcmd_regs = base; */
>  	return 0;
>  }
>
>  static int hci_extcap_non_curr_master(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "Non-Current Master support available\n");
> +	dev_dbg(&hci->master.dev, "Non-Current Master support available\n");
>  	/* hci->NCM_regs = base; */
>  	return 0;
>  }
>
>  static int hci_extcap_ccc_resp_conf(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "CCC Response Configuration available\n");
> +	dev_dbg(&hci->master.dev, "CCC Response Configuration available\n");
>  	return 0;
>  }
>
>  static int hci_extcap_global_DAT(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "Global DAT available\n");
> +	dev_dbg(&hci->master.dev, "Global DAT available\n");
>  	return 0;
>  }
>
>  static int hci_extcap_multilane(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "Master Multi-Lane support available\n");
> +	dev_dbg(&hci->master.dev, "Master Multi-Lane support available\n");
>  	return 0;
>  }
>
>  static int hci_extcap_ncm_multilane(struct i3c_hci *hci, void __iomem *base)
>  {
> -	dev_info(&hci->master.dev, "NCM Multi-Lane support available\n");
> +	dev_dbg(&hci->master.dev, "NCM Multi-Lane support available\n");
>  	return 0;
>  }
>
> @@ -202,7 +202,7 @@ static const struct hci_ext_caps ext_capabilities[] = {
>  static int hci_extcap_vendor_NXP(struct i3c_hci *hci, void __iomem *base)
>  {
>  	hci->vendor_data = (__force void *)base;
> -	dev_info(&hci->master.dev, "Build Date Info = %#x\n", readl(base + 1*4));
> +	dev_dbg(&hci->master.dev, "Build Date Info = %#x\n", readl(base + 1*4));
>  	/* reset the FPGA */
>  	writel(0xdeadbeef, base + 1*4);
>  	return 0;
> @@ -240,7 +240,7 @@ static int hci_extcap_vendor_specific(struct i3c_hci *hci, void __iomem *base,
>  	}
>
>  	if (!vendor_cap_entry) {
> -		dev_notice(&hci->master.dev,
> +		dev_dbg(&hci->master.dev,
>  			   "unknown ext_cap 0x%02x for vendor 0x%02x\n",
>  			   cap_id, hci->vendor_mipi_id);
>  		return 0;
> @@ -295,8 +295,7 @@ int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
>  			}
>  		}
>  		if (!cap_entry) {
> -			dev_notice(&hci->master.dev,
> -				   "unknown ext_cap 0x%02x\n", cap_id);
> +			dev_dbg(&hci->master.dev, "unknown ext_cap 0x%02x\n", cap_id);
>  		} else if (cap_length < cap_entry->min_length) {
>  			dev_err(&hci->master.dev,
>  				"ext_cap 0x%02x has size %d (expecting >= %d)\n",
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 142f3f79415b..5020c84c323f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -148,13 +148,13 @@ static int hci_pio_init(struct i3c_hci *hci)
>  	spin_lock_init(&pio->lock);
>
>  	size_val = pio_reg_read(QUEUE_SIZE);
> -	dev_info(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> +	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
>  		 FIELD_GET(CR_QUEUE_SIZE, size_val));
> -	dev_info(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> +	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
>  		 4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> -	dev_info(&hci->master.dev, "RX data FIFO = %d bytes\n",
> +	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
>  		 4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
> -	dev_info(&hci->master.dev, "TX data FIFO = %d bytes\n",
> +	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
>  		 4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
>
>  	/*
> --
> 2.51.0
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
