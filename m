Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6B8D29C40
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0An7o0GMi+Wr/KsT3wsznE/kkCznHrUmUrwW/J575vw=; b=NjUcndeCZApEUo
	j/LJpq/skyxqLh1/6jX3q8mK81m8UVAMO6QJlTKE4EKgMx58HpRdGQXqkiLjw/0gYkvGk+KkXRt0Y
	SgbVfN6uNQWJx3Wo95C4ChBBI9m1/hYPGHJDJvbmk2b4HoSPpqGM+emk22C24Carkh74tH4r2CCpI
	TsTNp6B+/CG4pbQ6kHfxGmjoyHBFAqT5s6sSnDOw/jeOM78EB8dFGVvcvdIsz8KqSP3CK6MKZ07eq
	h8AG7xmCEVrVYwZCgRT1tcLJei5/nuYPR5cqbfp1Uu3mgOUw4VIek4FqE7j5qyVnmIzaC1f35C5Mq
	WN4MMHDKlKp8k9I4EeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsCZ-00000002WDI-13gD;
	Mon, 19 Jan 2026 16:34:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsCY-00000002WD3-25q8
	for linux-i3c@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nQOrO8Lw+0JXggNw6Vm4P+Lss5VMsEjL0M0BNTXNghA=; b=XQI5lEsIJFz/nv2K5YnntIHuzv
	EzBT4MvoGabfH6sC60Ev+t6ldVBTKVaRl+qJJcwT3eoPIFbaTYOleZl+vpZ8mX5l0AHRstwzBcUCe
	X59KpBPuIS94DsSnrNKDI8G9sxV4z9QO1Tkw5hKzdi2e+kjcTbTPjNHNULd/IeAiM5QL1av1Iq4Sy
	TnUZgPcNUHRhQwgD8gAjdhTJEzIJ04C/+TK6xllf6JN8mG7+wPoOp6ZrAcbwAxLuugzHyqdP3Xk5B
	pVibf5ZpeVKIALli2MgEYfvpfdNE9of2qHYFvqcABu0BMU5vMJCLpTx/VKgLh2yw0ZKvDbJINs3mr
	ARnVEWRg==;
Received: from mail-francecentralazon11013028.outbound.protection.outlook.com ([40.107.162.28] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsCT-0000000CX7Z-248X
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 16:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWowygk0sPiyHI7mWOen7Op+Yt6zk25W2OPQ4Wlbt2Xd7ly3V7QqVJh52pECnuTjicdRP5go1mjJhWGVz2mBKXYH8DHKuHg2pbiT3iHIkNUQ7rBzHyhb3FlqQ/FOzwemPelp5LvoVpQ5xfs+IsUxBnzwj0IsytPbUkhTY/L78bsbHT/W4PdXLqsZW/rmry2eaEobdS1QovGunO3oGilLyarHSAhD5A2uhXNy6zXR6II8llRGrN9NLGVaNYgsFcIi+tceR2U9ud9477+WdxjOCr4sZcwLg1nEoj7h7qBB46vc//9a0ZyTLkbtuXLGMQ2z5TIieI4MXneIJ+r/gPxgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQOrO8Lw+0JXggNw6Vm4P+Lss5VMsEjL0M0BNTXNghA=;
 b=ObVXzAXNBEoGyIJAlfki5aVsyEjlBSm3vwWk9ReHP/n7AYN8ZNT1sIY4Jq37uflL/TlyO6scivLKdYnvpDFRhqjftDnS5AZamavbtspuccvES8k5A7H+Tmg4COgfZiVV4u9Z+u32VcI88hmlCd22QpatRMzBpjv+Rea5j7k19tZJF+IzDjrcFBuvj4+2PEXIJnEddK6P8wPd+lsYrxVBO+37NOWd+ONJmLxgucdJHYS9YnkP4ARI4oPLQ6tyNWh6kccgxRbXjslkA9WrJVJxit3WVkBKu9eGGjET79vbCnceF5Joi+djoB3nXE74Hb4xJsabAOCY+HF5jvef9vkPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQOrO8Lw+0JXggNw6Vm4P+Lss5VMsEjL0M0BNTXNghA=;
 b=SEaZb7jVWnR7+eEB6hTRNsb4NhhkmA7CLQZI57ScHBF2cMFYWCiDYMcAS/NWMkMGUDmgL0g0rfZw+snzNGOZtETCrSnGOXMqf9TIDhzlIpRpYa5RjE4rTY9Cus3ppXCzsw+6dWauWSHs2BEFmBtdDOfTjKp3B9z20m0PIzDVGSvr9HhpCL/gmpV5QLcttqAIx6G0NPd/aq056fmPFwPLeUG0ne/5+N4OaNXF+kUxslnTs0SYJcAs93RJGsxFnEpKXgQRMNjcH7E1rHlv5p/XQxlbO+JRdiGwyFw1/macWOYh7HwvaBVvbUTSZ3MW4s9dLGfOp+0rqCnPFTEQ2Vxv+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AS8PR04MB8200.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:33:53 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 16:33:53 +0000
Date: Mon, 19 Jan 2026 11:33:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 3/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Message-ID: <aW5c6xpzaT4NHMNm@lizhi-Precision-Tower-5810>
References: <20260119100212.29607-1-adrian.hunter@intel.com>
 <20260119100212.29607-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260119100212.29607-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF000132EA.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2e) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AS8PR04MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bd7dcf-588b-4bc4-1dba-08de577888c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ZfgTkUCnPxgtTYyf0uIZ9WZ4l7ViSNlLpE/HuMDUz37P5//JQJGKzsZRVaC?=
 =?us-ascii?Q?a81txpcejdFo7wAaBpPnosQGsS37uvl33Wd94tb3SNQ2nA0xK8m99wNqkPTL?=
 =?us-ascii?Q?Ty9eC0TAmD+VULiy9L/7JbFLgY0/U89J6fx92+MdGu7ge/2HUUME9Ljwn1us?=
 =?us-ascii?Q?TCc0UY2euePLe5818opu3AH0pdmbK7A1Po9ztsisRDrJt0UCuvMs/HoN7+WY?=
 =?us-ascii?Q?VgjkOQgOBHcLaEjKJgprGqiiwO1M3vD6vC+KdhPJ7QvMJ8CVoHgghmW5gJI7?=
 =?us-ascii?Q?Xo25IShvU09bjTFSg33P9boXSgzjDCNmEfknU1KmM5+Z4Jc2h4XcHQSNmKCA?=
 =?us-ascii?Q?dKdH8YhhDDnbgpUCt4bS14rjlTCnPdiiKPBewncyKq5fXT4GWZHcn/iVzLtZ?=
 =?us-ascii?Q?8B4WRO1o1+Ii0ilTYnB3sV7ozOKpOvqmymwuv/9FsKj49aPtPY2zkGNe4S46?=
 =?us-ascii?Q?9/eyJL3Q88kBGnWe/l516vvFbONhzzc2HB6PO7wO87YqEJcOi8Fjwqp4s8qe?=
 =?us-ascii?Q?cYPCqn6+JSrN9mYiHtyO6cQT9PXNJIaU4kOdQLTGWdrBaJoKcJ6RaVVI92Kv?=
 =?us-ascii?Q?jED6Dh7+Ml9BSnFG1Bb8+f5ZvYLNvNRjyG4Z2Amkk/c831zFrIJgHIJXO2ki?=
 =?us-ascii?Q?NXmlG2x6evQ7kWBBr6KMqUzrZZktsniYjCOBTExOV/M0xCsv9pRNMGzw/LuC?=
 =?us-ascii?Q?/61jNuQMaxershzB8xlr4BEbFURoM7KWLfpTBlsGQuUTJsLc9xmKLEyuwNak?=
 =?us-ascii?Q?mh/7tGfSvIKU0IGG4Elarp6Ugxhj8jXZBNADrgS5URp8H5PJ0Wkp9s4dqmLB?=
 =?us-ascii?Q?QWHBFNFQpsb5BNozvMqDkMvsEUBWnh+1NJyDHVA0/ALcqiu9WaWYWC2QJIqr?=
 =?us-ascii?Q?/4Wev62EBswVFvgKsekmIufeXVo++4b+MzTbnUs0v1vgspAhmc37tralAqDz?=
 =?us-ascii?Q?M+C+zMeWdlrw3Gu25HCppmxC01Xwkqbbo1Qe1xsKcGUw4t4uwoESyxZs+ahH?=
 =?us-ascii?Q?HKb2kLor3Q0bN3YZ5XcyDNdEuctVDPlLpo8IF+0lS2aNDTd7LnsmfuGliNVa?=
 =?us-ascii?Q?7L9VAbUay5/IwyfP6tRRDeFtcd8htVKAZ+KTcMY4NvNvZtmr8Qv8jHM7IQJy?=
 =?us-ascii?Q?WaG52ia0fXur5N7qnVGz2WubwZLLuZSVobuz6ma2wdeJXl2gU2z6X0lYtuE7?=
 =?us-ascii?Q?Gr/GQ/4Pw7Yk/FHs1V4rfLYaHscCt2lCIB8C5g0/Qv7QMyPyR3OFc0FyPgJM?=
 =?us-ascii?Q?HVByNLrW33zAwHfOdkNV5pnycDehJJVCF0Qo85vn2+dro7aCyew5bXUceskw?=
 =?us-ascii?Q?8vRyg3S7FZB8saryKlT7sP1TnVSAv/TPiZcKD1uJzKcRABpm+rTJ8utReD22?=
 =?us-ascii?Q?dXArybdZGnETy76ZnlhWboHK9zxaBWVIA9QVT3F50izZQCejLXV8ukY7jTJW?=
 =?us-ascii?Q?Rt3XcQ8DvvsXSRUwEh2KK8ARh4v/HYBW6370ploKQAPWDZ44svlLHmpcts4J?=
 =?us-ascii?Q?QWjNmjg1bORA7za5uBn1FAx4nBliyUp95crcvFtpJv/S+V4bACoafyXmhB6p?=
 =?us-ascii?Q?+3nZbHFnu0hr5W5YxWXCDGhAHqOPXmI1tjgrZxozd63hS8EdULAGhKGkbfc5?=
 =?us-ascii?Q?xKEVNbfQxPg2fxUBQPKEo9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMEv3SVi6Q56lq4uJ6CQwSwOPrhLja9mD2X6d2BDpoQJPgQBdgauM2+C/vDm?=
 =?us-ascii?Q?36RlLI61cl4OnuDzfSt3Allpju8Atp9o8OBE2t0LrJ0D+EWeo/TNwrziicAQ?=
 =?us-ascii?Q?pN/K3rOqvwCc1F/NW4w6IxbaIdyFyueB9fG+y3A+RoL13BJFCe0/aG1VndK4?=
 =?us-ascii?Q?6Thpvt3n5DSPa5MsFPFpqpb6F784LgLzI1jvGJD1wWSjA0xkVo1yde4NuxtO?=
 =?us-ascii?Q?Gyh5w2dmUATPBsmUYfNGomqPj2UvKczRGeME22i0Om7FxsGsPGnrMfiBj/ej?=
 =?us-ascii?Q?xsSXv8z/VvKMsnRdv/iOfm4zdmX/y8jAZw/6M+EPXHwH/cvADXmbVYScFUcM?=
 =?us-ascii?Q?qep9zknO1+ZHH6BlEqNLNXeqB10trumIrGi2AUtk2rWKbAZMPDOe5XqjIhbY?=
 =?us-ascii?Q?7B7saE3DicIEdVaTggGcFOyW9jIVcvR98DDLPbcyeezuNFf/Hb/vPvZjoeNW?=
 =?us-ascii?Q?TGKw+o4Tgrl6ej5cO7Fep/ZALXX4diXe8hlsstWF4Ghk0j8WP3r0yVsI4BK5?=
 =?us-ascii?Q?Hu1u60cM5peEUgL4OyO33EGsVovgoETMFDiG3y8wUTSjTAtYwTegH+aBB/Jc?=
 =?us-ascii?Q?ORNUlRK4MaFRCjOjnDgpcnMXXpjk88uxukbQSYSTxRBVTH2Vx8USK3z3PbIp?=
 =?us-ascii?Q?kShdcyMItAbr9KJfEAtHSnYXYVQ94T1xl0uU4jVhCbkzkWiMCIkIoa1JUs5l?=
 =?us-ascii?Q?DEGorFOBGK8xIQ6qsja5QW9oCQcAxb8n/YfaRNFEIBj8XJW9sZYEMFdXACXw?=
 =?us-ascii?Q?n+R/gbiNTfbR7K+mDs6NPXV02/RlNaG5uKLQeMTr4SodlIOXck7ZB7Zu7bBr?=
 =?us-ascii?Q?DjgIfIeX/Mn3Z3oTJeyqsyp9AytJcrjiL/X7R5IeE+FU/R2QI97w7mYLCu3U?=
 =?us-ascii?Q?4JThuLE0uTUvfpV5vblF/dGHOTrdWWuwB9qASNFaa6n1gN3/Geg4tbwDy1k5?=
 =?us-ascii?Q?UffZs/cZcDgVIpTA9FshUbjzdmKK1No/k2kvq1FjGaB9SBTxcCXJ3Da6TbUW?=
 =?us-ascii?Q?ztjQt6TNiq1GGsfRniK8mWPNrMrHzIP5h/ufOqa5SiD4eIDg/EaBSIL1p4KZ?=
 =?us-ascii?Q?vnMocg7/LtQHWgMMkYcj+Mik9E9VhLwndQmhcnLjC08qdbMlgXuYVylWEfrn?=
 =?us-ascii?Q?4in1Eqg8j2AR9gwUIbiGgbupQkGSiEFLwczwrKat9PCMXSJpfxlWb4eNrWmt?=
 =?us-ascii?Q?wGXL4oP0kv8NoDMzvVdqIvQpxIry3DnPu5CCdlEz2KojhwJ4b/rF2eFR67bs?=
 =?us-ascii?Q?GNInHA1cvLLcv2pHzuG5rLCKoA+932ZhpwqW2s9atifzxLfzkRbcUXLCPfjD?=
 =?us-ascii?Q?E9f38k8HxNkHlnbYDR096nq61ZBLrZqdudQyrBFY3Gxe5FpzZsn600+IHd11?=
 =?us-ascii?Q?Rklxt7D25tU4nhNqMwFJz4RYx5v+ySVpp3Ek1WO/8LbPdT7Pk+exDEn5xtwd?=
 =?us-ascii?Q?zjmVsun0zsqz+c6eZ2UkilOwkiQeMoe/1ETWlyN6GgKs6HaPhdwqPh7WAOC+?=
 =?us-ascii?Q?aUd1Ebbo+XydDMXMriRJlzkf5Bqnde9pKfzspwc+GxTwCjxnQB2XXc2jm1CR?=
 =?us-ascii?Q?vQCcbKMjWyvK9R9CZag4hzM7GnaRMZXuPzfH5msnvAM71gkZX6uIYvyMT92M?=
 =?us-ascii?Q?ifl3qOrwTxfXkOotSO+NstQoshX6wTn8bvz9tOybhamGotWoMwrT+K8ftVNV?=
 =?us-ascii?Q?QVG8DKlJBD6xLmZ+Xt6mlqJy5vVte9UvwR2myLfkY02b/IbR5WD/sceu0Fc6?=
 =?us-ascii?Q?vo/Wh9Pm6g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bd7dcf-588b-4bc4-1dba-08de577888c7
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:33:53.8137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKHibT2mVC4WaNpvvh5AYGxnKod0iF/rqJ3sKeZdHK/qVue0C7EeF6/K/cKKsNX0hwnSuzNVIAZmpEGCFXd5Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_163357_611026_AC43D61D 
X-CRM114-Status: GOOD (  21.06  )
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

On Mon, Jan 19, 2026 at 12:02:12PM +0200, Adrian Hunter wrote:
> Assign the driver PM operations pointer, which is necessary for the PCI
> subsystem to put the device into a low power state.  Refer to
> pci_pm_suspend_noirq() which bails out if the pointer is NULL, before
> it has the opportunity to call pci_prepare_to_sleep().
>
> No other actions are necessary as the mipi-i3c-hci driver takes care of
> controller state.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Chnages in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 1b38771667e5..0f05a15c14c7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -320,6 +320,10 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  	mfd_remove_devices(&pci->dev);
>  }
>
> +/* PM ops must exist for PCI to put a device to a low power state */
> +static const struct dev_pm_ops mipi_i3c_hci_pci_pm_ops = {
> +};
> +
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Wildcat Lake-U */
>  	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_1_info},
> @@ -342,6 +346,9 @@ static struct pci_driver mipi_i3c_hci_pci_driver = {
>  	.id_table = mipi_i3c_hci_pci_devices,
>  	.probe = mipi_i3c_hci_pci_probe,
>  	.remove = mipi_i3c_hci_pci_remove,
> +	.driver = {
> +		.pm = pm_ptr(&mipi_i3c_hci_pci_pm_ops)
> +	},
>  };
>
>  module_pci_driver(mipi_i3c_hci_pci_driver);
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
