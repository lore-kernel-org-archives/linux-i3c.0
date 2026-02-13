Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522AEDF176
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Feb 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJRcGgwhwBW31XrqmwvjBZBl78os58sspVmmXePuZCU=; b=TCcZhNRjj03Tax
	RKNJVlrqKRnEHVhtAMB736kojb3irVsh0e4LRQhO7za9poJgLZrHUEQ8QUnnXXbvvQn5dOkhg9h3S
	/XVuEr6oAdGMtHPBiwaGHk3E/Uk6/IzrgpnvNWjwX70w+rPPJX8biL5vkLuRCKTDcscz9SizqBJ3r
	0R2NV7oZIX4yQ02p3A+gGXdn4QWMLnDxNYpClF72+++u5xK0EFylI5UNsXZ0dqjL+CRGpQRawBwUr
	cMUK/r4S4Q226uIQDGFQNnTQfa0pNtAVdriJ760iUQ4Ah2wmVWJ9DRboSwU0KrVs8yngRCX92b0Ya
	QjvObOGFitr510Xl6qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvbW-00000003dsn-2BY1;
	Fri, 13 Feb 2026 16:01:14 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvbU-00000003ds6-0Yn2
	for linux-i3c@lists.infradead.org;
	Fri, 13 Feb 2026 16:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBaUpQ24UNnvbezz+IRFcZhnLq6GN8Nd81FUR/2NNEOikdJumxcmHB0Ahno6o1f8cy7RgN7v5PXEmIonPVVXwKYXOpHtm9Ci9eeIq2Ysiw/NCrhY+rmiMus17E1HOl/4WkZJzfA+FW1tWYUDWOMWnSZJuUOG/h8wjr0e7mutckbnU4mbBBV7zO4kASKLUjxp8jvKxGxuC28blY0PyT0sGxXb0mTx3rC+EnmkbIqPWIoVQj92J9BFxRGR0erdnxySqDR9ODE7jR8VcApRX6Miwo3ZfxtmDLFZ2Y0qQz7G6CWw8hP6Q4lGFZH2D6Nad8sEWbhivSDXLSW4Ud39MgGSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6zd7uzUOF7TB74uu3wDgjwf9iAJ52TMHt0qSqGrrHs=;
 b=HV2QaCPMEAMhGsGlwaC/eqLK1kE+eJSk+f2OR3ab9y7WpO+VOWhW5WTozWTXCLinvAQkrXN6YRGugSXyCLaS5CvdXaR2z1/JZT0e0e1vZqlPbKIS/BHv37dlsq5DczoTlbCHFUN6vN80eT+pTUjWo/0R3EEBkWFhNnkV53K4K+uP/rHj1QS2+ShLW+loblIgGdi7YYt5d89ZgH9aVVLhRI3JgQFq3UCrisdm6yqFrQKcQNPKR8nnJVKeX74WkTnd9qG7Vi1DxanzYq2lt35wm6P9aIO6lW2uV50zYm4Vab+WRDOonsHbwbEK/8VxNkeCf5tfZRj/b5xQ7CqoUp9eWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6zd7uzUOF7TB74uu3wDgjwf9iAJ52TMHt0qSqGrrHs=;
 b=X3tDAXnly4aljUE5m13eBkqneWyEG6R99oBgkfVirM45w8UY6dbKRantkZ+zcbfzfqM6jWioUD7wTArtXtFW0IsjmHf5rbIFNX27uzh8GsLQhbvLzcGb4g86HnZgB+bI14MHvF76QNGyAIxI6IX1TcgDVjWl5wfXf8tNebajEvjDUEK6BrfwcgB0PKwuL6FiVEkK/pUjFOUsu85ugYKQ7ni5ZnLxLxSaygyIQemmOy8DHnQQVJTx3E//vdtgLXOqdmOgtb1ZtBF/oStceoYyJsf3bhMSWQFVTzyDoel9q7Yyn3+NdELAmz3GyLNPIwyg3usBCT4IgMvZMHFnU13Nmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA6PR04MB11945.eurprd04.prod.outlook.com (2603:10a6:102:51c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 16:01:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 16:01:07 +0000
Date: Fri, 13 Feb 2026 11:01:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device
 attach and reattach
Message-ID: <aY9KvZL8hMHLITBA@lizhi-Precision-Tower-5810>
References: <53f5b8cbdd8af789ec38b95b02873f32f9182dd6.1770962368.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <53f5b8cbdd8af789ec38b95b02873f32f9182dd6.1770962368.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH7P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA6PR04MB11945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f45f41b-5234-4144-94a2-08de6b19192b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lzuCbF163vEeSLlQco1K3HIVLRDAg+MOXHmeDndD47KMhg/ECmxcJ4IzNWn4?=
 =?us-ascii?Q?SQJHI0q9ToN24hlPt2cDyuKbb/NbNteZvDziO268lQTJkPTYJMfQtxK2uc4C?=
 =?us-ascii?Q?/XJcboP0xfKJF3d3M73jYDk7NTOJVsmaeEj9vpYjorWujrqTzexpZ1s2g6Q5?=
 =?us-ascii?Q?5HMiMk40PvVmi4/l7NScapx/Edeo2N0l0/NWlsKyzzLnvhWGXDwcoY3GdNJN?=
 =?us-ascii?Q?p0MQv0hOLuoCMu2K5cfz/WdwF4zCvNrKiwWjHmMmQ5ifU9hOWW5hNBP7o5zq?=
 =?us-ascii?Q?Ahkm4OO6e+4OhSKaxQvaePZ1RVAiCO+T542MfIuS1XboDgivJEXj6d+fZncI?=
 =?us-ascii?Q?0Z599L1N5lrRcsWUr9QjGDpLRygTJl78bXl4HXSRepd95mtdNwRxVXvyJyS3?=
 =?us-ascii?Q?OIoJBasyTLg1c1dDN1emd/K4S7bX1RwTEVvstIYLwRYIdBfKnEsw87dqMEnx?=
 =?us-ascii?Q?KI/tOXKON/FRa+ayp76e1kJo15/yAvN342Woz3aWzBfIq8ctbPopJrOTo0Ik?=
 =?us-ascii?Q?nwrBZn+ZN2RBkTLhVp8fcnv+c1Anoo6VtXyVoktXaA0JUQIzou316GcOqTnv?=
 =?us-ascii?Q?ZQJF/uwNlhBt6Kdq9FIIncl7n2PexL/7tMedQ1LnfvNgP7Nck3xxEnsa5P/B?=
 =?us-ascii?Q?q9GXifEj26CVBNhhiWfquF3E3dJULkU8k67s97wY+dRpld8reDfbC+glQ23T?=
 =?us-ascii?Q?w7udc6tUCby/uh0FY1/KaAgJ8GOSKSX/y/wGfzt7YjjN0rzPbJbpIKSpKtAz?=
 =?us-ascii?Q?+kh599UJU0DxNsaT9rzOY7E5+zgDFneGrcvt4YsqipVgR6x8CQJMgVcCp8l8?=
 =?us-ascii?Q?RpV34owikUL0FASJnFdmzx84ffNZC686vY9qvJYyNmvcT/mi1BFvJphDnw8G?=
 =?us-ascii?Q?4covzrzX4XkUhT2ApD/NVzWxCwHHlntehADU552pw7Nn6YmFaZnSE6DMPtVG?=
 =?us-ascii?Q?Del1RZwhpq7+kz0yAGvmzxgr6co3s53oXxsmUm5fLtzLKYPbsKViFqu9lx6M?=
 =?us-ascii?Q?lmUwxnejehqeW8ZgwUT3JPqoo+GSmUY9kWGPQ2k4BS8JIchRPGeh53X7jIfD?=
 =?us-ascii?Q?1iCKtbDXxrdsDSx59nuq5M5WRgt0hUK8x9/qx6Wrr567Ez6ESL2riNsDjMNC?=
 =?us-ascii?Q?fZBCu98iiOa9NkdUwSIY7h8NutiM1E4neu8JX3B2vM8kSckEAYwGQAWXpaqW?=
 =?us-ascii?Q?J/f6EkQsnJkiGH0gjPWG203btAr98jrYfZKOrV0n1059WmahwPl3yJf6bl3L?=
 =?us-ascii?Q?d47MMK9rwQ9yEy2kvoHPOuEs1wjJy4/cY0zAVCGmESHv0gAL38Og8pkXhO9c?=
 =?us-ascii?Q?KCrONHwBo0891fPHLjxtDramigZ2Eh9zC990HcXvmdZB77EpgXsFCQnywmrL?=
 =?us-ascii?Q?iT3oTpcpcH6NSJFjl1PH0CBdSeVVdSStuv3BAy/9nhxMlZUyf79XCHzj33+6?=
 =?us-ascii?Q?MDIviXT4VYFYPhJU+25C9f3DZUdEgco2OkyCzICpFfq+WOEU5XZxlEjGHgSF?=
 =?us-ascii?Q?hn9/xtwb734Z6f+87CEpkYpcWQiylOg/Yq6YI90YvcNco5dws9mGeMDARuDq?=
 =?us-ascii?Q?AcSdfv6cGvWD9A6MsJwjEZXWBQbIWJ8yrctXoqikhnEFHJi4ajLaia3fsvpk?=
 =?us-ascii?Q?pRcl+Q9YCVp2TbrZ/kGlz0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ymvP5dpBYKEln5bhM+4u25VQF1DBOoAolRUzw6Ee9LnEmly4kTt9qgiAofPE?=
 =?us-ascii?Q?RCHnA9umAHio57AM19iqAQBE6QPi0fSHWe79Vrn4Y/GPE8kJip8H7zSO3NaJ?=
 =?us-ascii?Q?Oq/5WIadRMJSeSupMp51Um18ZBY96YMMEWfN8B4fhGy5L+LPnKUs7h1OpVZm?=
 =?us-ascii?Q?cQVA2E/ja0JvDiMEG6Gva0rfmyIrSpJnaQcnjWaNp4cH8awDoPGC7cb3kZFC?=
 =?us-ascii?Q?9Yx/9LZOS/ePBM1pVE7DRJpwVBHJxXqbYwSzL6VAQsydXN378vYGMI/1s02l?=
 =?us-ascii?Q?IjaQk98RSkEXp8ghrHsGktGR/l5Ia7bI3J/fybwLT2iCxeLG+DI+y/1pA+c+?=
 =?us-ascii?Q?uvvcWN8Ev4viLGHSNnSdY4YKWDS5XFZvB9dM7p8MVYTt5Mz2tNe89oaBRWAY?=
 =?us-ascii?Q?oujH6DFyd2V0MPmKCjaQwsUrznHhNulJ42/9fjPgd53kyp3azu+EdnzJeECj?=
 =?us-ascii?Q?pyz7aSVdsndR+X/PWI5RYxiB3RQuPJufFRE55s8SsXLq/jXr7vK5FhwO9naw?=
 =?us-ascii?Q?jtrmNfxhhXFtVSmL5NxEADmJNo94YO960R0U/FJYPHXN9CPWzgSbGtkYJSuc?=
 =?us-ascii?Q?74pWbSaamPeKhfwivJL8LmcWmoidZLLYFWsjXBJFnnU8sJls+Hp48s7kvZCy?=
 =?us-ascii?Q?a7RSUAI6GEOUjODCkX7RideVS7crdwAIB0VtK6A9OBDY1K0HOzTwjxMjM1yz?=
 =?us-ascii?Q?DT1g1ud1n0Uuw9aERNQ9wmWZjnERqw+5afE0vVfl+sMvK+DaL+NhPPQ0R2Xs?=
 =?us-ascii?Q?LiY6qvbQfOhIRk7IohIbjm7jXlKCUOHo334364WA8X9FVUFib+iyqGcVZdUi?=
 =?us-ascii?Q?dmTaa4cDPsu9uSeqhxO2JaMJL+2x9Cx6QlpXWyzTIP7lXSycddkLlUYlL+kn?=
 =?us-ascii?Q?Z1Ec3rujCAolXrj+A82wh4n6QUQ8zB6GHeWUBgN5sR/BP/vavgN8iEmiTyxQ?=
 =?us-ascii?Q?vIKpfsc8FLv4VbMjXTa0Ub2mFTxqIDit+LUduQrR+hXqwceZUQq+mvY64hb3?=
 =?us-ascii?Q?v1iC2wBGlndLT5L97hwkkv4P+vWsyZHKXhd8xMVcQhW/+yecyFKPZoAv2Rpl?=
 =?us-ascii?Q?iDbldDQuYBzEvLJSEP4mLKj3YttfvCFtUAV88QVM9P/GOfzNBcMXxT4FRi/y?=
 =?us-ascii?Q?uDKC11ptaHMZYl3aTj0cnXSzik1WNsHkejbTC5MznHOzHC01sVYszFVRmGJ2?=
 =?us-ascii?Q?YhX4uXpmDsv6tYzJxTpjcAgfAT4Wp1KA9Fh1JELoAEat0kyPyI/WGRx0bBI6?=
 =?us-ascii?Q?8KJb+QMx/+4qNavHnPcuY0Od6/uqA+rqJV2dXotLVzjftFt5l3g4rYjGg30e?=
 =?us-ascii?Q?LmPrZsv9uEsn8OOoseZeC3fU4T1RfEque/P1XFBOqxBeULhrP0J8cbK+mBIq?=
 =?us-ascii?Q?8faNhzhGxlu/o1noCXfEFbWeABJqLeOY1UQhIxHUFY7m2kA5jnEoEE0vgVyt?=
 =?us-ascii?Q?XGuEvUT/LV7wg71D821pd3OxPdGm6LV3lQgUtSUNtAdGM65ie0TgW38MdmLp?=
 =?us-ascii?Q?KH9KtLbloMykEM/gKOMUkTp3y6WdoFNB5GhX0lHQe21Wcihz1zgmXEaCni3r?=
 =?us-ascii?Q?BTyUDXs02SSn13rnGpfBcqKgWYU7bvdZvakzoRZGiE/a0P4KL9u6uAAGa4Vy?=
 =?us-ascii?Q?4Yn/t/aKzc2gkP99oEmVwCryIv5NE7OrQ6+vV5PUbWuTUXRq4Cb1tS5HJhYk?=
 =?us-ascii?Q?iMJVgwfvI5lW9sxBTvSt9xQJXK07w1Kxzkl049yrl6m110p7emyg/M1fDr6G?=
 =?us-ascii?Q?MBjBePqVvA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f45f41b-5234-4144-94a2-08de6b19192b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:01:07.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0hS6x6qQqDrKfuiFX1OlSErgAPvfSYXZZLi2/eNShqRdOT83tdLxWwNnXA9+MAiEtRYoI79raqRwbmLBofpNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_080112_200140_BD42D880 
X-CRM114-Status: GOOD (  18.31  )
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

On Fri, Feb 13, 2026 at 02:00:48PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C master controller ACKs IBIs as soon as a valid
> Device Address Table (DAT) entry is present. This can create a race
> between device attachment (after DAA) and the point where the client
> driver enables IBIs via i3c_device_enable_ibi().
>
> Set DEV_ADDR_TABLE_SIR_REJECT in the DAT entry during
> attach_i3c_dev() and reattach_i3c_dev() so that IBIs are rejected
> by default. The bit is managed thereafter by the existing
> dw_i3c_master_set_sir_enabled() function, which clears it in
> enable_ibi() after ENEC is issued, and restores it in disable_ibi()
> after DISEC.
>
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> changelog:
> v1->v2:
> * Update commit message for better clarity on SIR_REJECT bit clear upon
>   enable ibi call.
> * Add Fixes tag.
>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 7eb09ad10171..d014f2cd6071 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1024,7 +1024,7 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  		master->free_pos &= ~BIT(pos);
>  	}
>
> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr) | DEV_ADDR_TABLE_SIR_REJECT,
>  	       master->regs +
>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>
> @@ -1053,7 +1053,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>  	master->free_pos &= ~BIT(pos);
>  	i3c_dev_set_master_data(dev, data);
>
> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr) | DEV_ADDR_TABLE_SIR_REJECT,
>  	       master->regs +
>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
