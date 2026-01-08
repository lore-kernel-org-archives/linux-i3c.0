Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C8AD1D477
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsaUQfO/A/uF19EdxQJ8w8blwCmcDUnQnESWBcwoBp0=; b=BrGHk9nn9rSDA7
	UMLXWqrrMjdShgAsjp8eQCRNDNi0p/Ct/VgVTNU3fmFunQrrVbgGuXnOP9r4oHJ0HQEe9ig13IeHD
	EWUF9e0ThOLyuEaMGqXEHKTh8noQSEfxFXKIlQE83yHY0qPyFb1NY2aU2ghWZKAOwe10yNYZY0RvC
	gJ7ZGIxz0Smn5886/TnVKFt1KPMSZvGWw0b0o09HVcvAnTHv1eAKtVVrgeC4r5NmBB5yy2tuCikky
	EPu05arcHnHegjrNC4tDQjb8g/8XkR25SA7KLgmlx0w3tp1cR6rCuqu7r0nnYzV48JMlaaxS0sZzP
	3hiD65qLeImPRMqTE1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrln-0000000HUPT-03W0;
	Thu, 08 Jan 2026 15:17:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrll-0000000HUOq-0y44
	for linux-i3c@bombadil.infradead.org;
	Thu, 08 Jan 2026 15:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xiAiVnNfILBwNUs79qFLAuQSQIZ4VX1hjtmSF1i1dPE=; b=ldflCzdnhDz/aWEb7JwZWVob5f
	YKcUIr4DAL2uh9Np0Q+7NbKjfvEMzZNrolvyTqu7Umsr+h27NTQy2guVJRGH6subdtKoW8i+Ram4s
	qoCMbm107ip6D8L2gFQ/VBnOkpf0DRzRLtHv2nxoCPCivgc7cM93IPnRiNmsG2pT8LICZCD3ik5Ge
	ys2uXDmOO84Ua87ifybUqyEjeBzh6ByoKUhmTyG/7xKD3owJ75rEBqXXpsWsQSMXMYCz2ycDidis8
	r37axl9h+41YUb/v0an3za9FKj3lh/WeJelOh+dDUN/hb6RvOGJRt6qp/cAMiMaIG8Nbaq7ZcF0SV
	EzZBUr5A==;
Received: from mail-northeuropeazon11011064.outbound.protection.outlook.com ([52.101.65.64] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrlg-0000000DU7N-4970
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 15:17:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdGXZmL0nFnWrZB1ECUKAiepiVv0LDruUg97fzJKTuVECnwhl42/IUDOwyLV5BGNNBJvAu7R3r8H/6w/CySLvpmtTHdkPEmYqRZmqvMuwoWodOXz7aseh7nhy6ZRxqHuoNKWJTW+TS/SsRZocMGttnmTSxyTqBKPDO7bQ1EI4RNayGQ2Q2wttPeWOPRyG6V5yUxn5rvDiCyn3bFi7TWu7PC/3zumJD+E0st34Jxc8s8kxNk6pjO644MxXI5lKQYu04Y037I9cV3+fan+gvDg5xemgrK1DNqmOSSfmWXBdR1MvyEky3g5l2EoKu9nfD6ek+xagvaT5kMLUcYNWKE90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiAiVnNfILBwNUs79qFLAuQSQIZ4VX1hjtmSF1i1dPE=;
 b=kzqSY0E27ToDWSfkgh0LoneLSvsMfIoWQqiPmPMnpJI01IlOgsuhBBZS6mCNm33wEHIIxiO8w4h6uYwjCiWFrvXn9vcoJLcTUYzR/vOPm5pVRu/uA9aHoxwySI/wo+zfmexmHDpBpnlteACSK3hPLcbYUIrqA7Muw0WJf3Nt+pD+na3ylU0WC3XWLt7cpgruOlwPUWdcDGqNvzS73MUQ8Q1WwqHwhUJ7NgykJr4E5dK1xkzY6k9tAyGt4uiOLiDdxx482EXL2RzeLCkJFlh+MUdC+8RGOgz77h17LkFD98ewIILWPZZRC5O/WF5U3qF5vdpM21Pk2um285lnAqcpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiAiVnNfILBwNUs79qFLAuQSQIZ4VX1hjtmSF1i1dPE=;
 b=fStKsIKQ7viQ+W9Tn0p8hU3XDbdLY2OE4mkz2oVDq12ElxrquVnigLEJH5jy6nPitI+IroNprnWuXnvQh/EHZm77un2gop3i9Z+VvVzjb9prn/a1FU/+m1NTqPUk3jc1gKhrn67IKx6YLLNVKXybLj4DSsYa7caVdlpKZ28+/HYJoa1/ZswXF/jQF9Xz+zByX3SKk7H8tVNo+WDxvMM332k88FHsODjIIY+EzkwTJSJxGXvTtG3sqw5CDwJjnYSzNaeO6HHC43jWoQxFZ9eFsedEMOma5QmihZzLh/ZUGkrtUeEDwKINEo9ANRPYV+S5V2ZNKBIUAuzKNH3RtcxyLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU0PR04MB9275.eurprd04.prod.outlook.com (2603:10a6:10:356::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 15:17:40 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:17:40 +0000
Date: Thu, 8 Jan 2026 10:17:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 20/20] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Message-ID: <aV/KjZCaVc7V8p3A@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-21-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-21-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR22CA0010.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU0PR04MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af8eb5d-89d9-4a8c-47df-08de4ec9108d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xJ3LJ8HVliDwai1xuz9DxR1EDDs4k3fOiuzBo7BldLbpfVkGufz1E0kwAZnb?=
 =?us-ascii?Q?3Olw92WnrhKPkB7RrONLvGtayvvKFoQ450U8aqgTrNX1YUYWrrU6kcsA1YVs?=
 =?us-ascii?Q?SNFQyBJVUdoXb0mtSGM/UM/rGmo6Q+ktbdWa7jPD1AMmUiK8Fa8G/LgOpssL?=
 =?us-ascii?Q?Rk0wzbH/3X3THWffpNIsdTokO6zuoVrM+eruktumUop3sARuBdiQ0KaAI/Hg?=
 =?us-ascii?Q?m+hT1LTZnets9bDup3OKP1qrQfFoLvxG4EfZBYl+lwSfp5/a7TV93iT0d5Kz?=
 =?us-ascii?Q?BaoxLDykasDFK+QJReAwM36EHB9P/ZsqkEVpLLuj/989nycplZRWMFU6jMpb?=
 =?us-ascii?Q?9hOVaPTjs28Mb1Yq2yTiNdOM1UYUbEp+ZQgSbBDn+hNyXjttBGTXgErpvJLe?=
 =?us-ascii?Q?Y5HNeZlAL8pL+Ly3HfY9oYV+Dbg1vCjI/+coMWpkuWMNf2vnjDq+17JQ3xd5?=
 =?us-ascii?Q?vgeGUGKwgHJQitbMEU/sDNPDYCGXkmFha8KiksDBxr+zDsEA2fLlX6+EAA6E?=
 =?us-ascii?Q?xNRiKsXJTm8bwfMZQK5Opbi4HX5U04Vc4jmPgHrgZ2kff6kYlUZZdQS2J3sn?=
 =?us-ascii?Q?pr0LWWD4jZP/zwzgImZqodvOBDHIgPP8EmuV5RNoPBOOR1+4RLhDAwjDOTc9?=
 =?us-ascii?Q?OTrtnzhTIRDNOWE0cEQ3temkPhw7KV40PwpNlBQy9z4gUcaAjWusVBMZFeQx?=
 =?us-ascii?Q?yzAr1VSSBi8/Mr/tyZY0hGTOMcQ3j8eIPw1oIKd7N578CAybXGHyqIOlSCAb?=
 =?us-ascii?Q?Uwrav8F5TCOaEg4VGq5IsL5vn68yWYy30q5mweUpIql8j5iXdTqAd0m+1AW6?=
 =?us-ascii?Q?Q5M4aRRaq2Ri2pjS21E+9aYGYUoAKIgS7bEeta5s9icRxOSy061hzLXbQtYk?=
 =?us-ascii?Q?Pi0NCTxQSp9UIeDl+4UbhT67iSGRTEhCmm8fNAk/pcwZsX0qDfcYRTBXqiOU?=
 =?us-ascii?Q?6r7gG13TPsgKwbb/YoymyaP6NLPXAYQJA8dgwIOksQeU5+UKO+ObF0gSw3Io?=
 =?us-ascii?Q?IktVTI5zEVar9OVtPymO5g5qxEvGCXcT8mnr969AYf3flazKGnmrDUbTC4Yk?=
 =?us-ascii?Q?dkd2j949Ok+oXcdpYBlqO5Kghf0c7P2vTvxXK/LpfUkxi7Tiu5e5uMTYyxeQ?=
 =?us-ascii?Q?+398gcHsutHL3dUFY4gS5hQUu4D4/qTOk2LlarKtFAd1Iy9eG3QxFGsuWLxB?=
 =?us-ascii?Q?n/MCXQWdOJNYMF4Ac1/Nqv+2OGs7CFejuFZmnZrshxHdDpgID2XhC8HZYef4?=
 =?us-ascii?Q?LDY3sKMrzklIzMzDfZdkb/U0HeEkX+CDf+r/VALh+Atb0intp0z4GPgwDXra?=
 =?us-ascii?Q?/aZbdoG5LWVT7VYjYGauFUM+LAy6wIm30cFyugAb77s7wjw8Bhqnb99zyMed?=
 =?us-ascii?Q?wQ8UnUzogawCMwq2r3dSoOyO2h9TPA9u/IfMBpbXVMVM5OU5Nq70ZMGA1mta?=
 =?us-ascii?Q?lrPW/yfcKLcJSIeINEwcnVxYfhtIvQsL8Tiw35ktHoMv/lBr9k2v9KzO8EdD?=
 =?us-ascii?Q?JfJnX9pQ0h1RliSgi6MrvWsWhdlO/cEhzB5u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5C41i4kc60Ryk0ZfU6S11k9HXpBjdespMz2j4g7N8kYm6M4e02Wib4J/UBg9?=
 =?us-ascii?Q?faY5/I3QH1uo0c1eKGHymR8XbpriS1cPiM40Yeu3I8vaTWKwdIU9bIUHmlxQ?=
 =?us-ascii?Q?RRQJf7y7+jDQBVjnUHFDd3VVtRoGBJg4XaSIXW6bPncDcYoUQfiBIBHtN+Vr?=
 =?us-ascii?Q?CNR/poy9D55XDRyqQf1SbWaMFilyCw+XvZcR/J8bvbhcL9LpE19nYcLXQglk?=
 =?us-ascii?Q?FvMczRX6CbfrKE1RqRsrWrzAKMwrAN7KyzzxFbf//6CinBHEcoWyjROpVmHD?=
 =?us-ascii?Q?sVaQwD1y1xjI+vXElbsYppa7v7Tdw+bsyo3lOHl+Hu1tiCYGk7Hnfq8LOA8Q?=
 =?us-ascii?Q?k/IbuWmykXI4it19apVUYT+eqlxZJEAMuUcyaOTvbtWPMfNuoloL98hCjEnJ?=
 =?us-ascii?Q?/HcEeJZs5dTqTLJgiZ65UT6rLLrlroXy8BzxWgLv6O9zriIj/2yX7Gf5GFGA?=
 =?us-ascii?Q?V/pSiR+mgv3sAC5JArFMx/mF7JlBYHsENFuzqcDYc9o2Q0uqyGBijczfLY2a?=
 =?us-ascii?Q?NGBqlvgTwfvNJq4/eUdGuXB13LXKjigWsLdBX6EXtIyqk29aL3LXHg0imPaH?=
 =?us-ascii?Q?j/8ywWBIye/ltI6p0vC4GD7PwYH6NVYDz+u0SqK1lrjPVusVqBe0SFV8I5a+?=
 =?us-ascii?Q?LUgNRYdZ5crBwBdcKq/2fyTP2OWekorYt099nc9VlzBMnS8vCMhha7GFUNtu?=
 =?us-ascii?Q?UzueDgN/HsMGlVL/Ul+1GXcNDmNTxTwp4I8HjhMZEcAorNCIYIODzJ8MjpOG?=
 =?us-ascii?Q?KGKqNrGQ/52pPzmCHeuE7e8E/D2VZqzZiZJadsPMOBVPnaaVzjf45QQfozTC?=
 =?us-ascii?Q?awsbogcUuv//WzWf8gnE76jG+4HAw2IAvVbDkbTsIHrGRGRyfGePjGHGN9Td?=
 =?us-ascii?Q?FqSBhlyiKr9780bG6Ulk8q0qL7VsgsqyXRaSzr75weQzhTjxajABvV0Q3BQ7?=
 =?us-ascii?Q?T7eyv03xGSEhoZrUVWtwfI+7uWusbN2HO1ALOUv8QQLqf6oCz4bKUWn2gyXx?=
 =?us-ascii?Q?RaAf2GZmYzCJBCJ8y+HGqap2dub7iLKq0fKTH1SquAItuGdk80xwKyg2IJ2B?=
 =?us-ascii?Q?m/PeuH37+H/i2X8aExwvfsbCz9K+eil2SP4gxAuJHNxk8WBJIEzM4Yj450nw?=
 =?us-ascii?Q?L0a0S9WUj3b0nGEUOi1dm4NogS0kNsihx0ezy1bM3K6bKiKiQYQWhiHqisAG?=
 =?us-ascii?Q?KrNqSa+EqGUGg/NzYeVjtZ9HQCUpnsd50/rTpXg4TVzuHuZwIMcdozPZCnC0?=
 =?us-ascii?Q?2iuCLvhI4J7FDDlbb+kGBUix6Fw6yOXZ3INXWn6wZm/Nu7Rp3TirlVt8oMDZ?=
 =?us-ascii?Q?jIH1nAEkdcORzZWvYWs+dlZb2VaeOo9P8PsDKPI9Q4dGmO69FQc5O07BEb8a?=
 =?us-ascii?Q?un5u6e4Y7TwkXLBOU3MtdeJ0NOIz87Gr6p8iv6/CNNhFx5h9MFuW/k2PkHn7?=
 =?us-ascii?Q?ogv2lA7oqOP+iroyfQdSJFROA6qOK5g6U0seDAUjMKjBmsJkIjVMUGkzQyeb?=
 =?us-ascii?Q?9UhnbTM3GW2Ghv4PS3Km1vg94jbXBhXd7QaAONrUISXKKFv7GJUUFfutlP/i?=
 =?us-ascii?Q?iHgEPQ4lzgH25aKHzCCcOb55UTFEBxciX3ZhjpijW9ujY8g/u1mhFpI8cvsz?=
 =?us-ascii?Q?I/RLL41R0GwShg8OiA+yaftPsA0RA6OC4NS7txKZw2YXKhMPzutouov3ARQ6?=
 =?us-ascii?Q?mXVr8UOns3pK5eR6I9QFi8fnyPIPtBbdxa5rpHegdJAHncxZNWWOL5kpdAW9?=
 =?us-ascii?Q?Hh7zVHjTDg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af8eb5d-89d9-4a8c-47df-08de4ec9108d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:17:40.7356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80NuXD9ryYEfh1IWJS8zkdmlUl0QBOnbQAciMFtyQPYyOi75BgMe9LfgPQcCN0PHxUWgRZFPMod9Tl+7hbaTGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_151745_133404_B8D1C40F 
X-CRM114-Status: GOOD (  18.94  )
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

On Thu, Jan 08, 2026 at 10:05:58AM +0200, Adrian Hunter wrote:
> Enable Runtime PM for the mipi_i3c_hci_pci driver. Introduce helpers to
> allow and forbid Runtime PM during probe and remove, using pm_runtime APIs.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	None
>
>
>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 458f871a2e61..1b38771667e5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -18,6 +18,7 @@
>  #include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pm_runtime.h>
>
>  /*
>   * There can up to 15 instances, but implementations have at most 2 at this
> @@ -208,6 +209,18 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
>  	.instance_count = 1,
>  };
>
> +static void mipi_i3c_hci_pci_rpm_allow(struct device *dev)
> +{
> +	pm_runtime_put(dev);
> +	pm_runtime_allow(dev);
> +}
> +
> +static void mipi_i3c_hci_pci_rpm_forbid(struct device *dev)
> +{
> +	pm_runtime_forbid(dev);
> +	pm_runtime_get_sync(dev);
> +}
> +
>  struct mipi_i3c_hci_pci_cell_data {
>  	struct mipi_i3c_hci_platform_data pdata;
>  	struct resource res;
> @@ -285,6 +298,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	pci_set_drvdata(pci, hci);
>
> +	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
> +
>  	return 0;
>
>  err_exit:
> @@ -300,6 +315,8 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
>
> +	mipi_i3c_hci_pci_rpm_forbid(&pci->dev);
> +
>  	mfd_remove_devices(&pci->dev);
>  }
>
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
