Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C909C5DF7A
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLPhGAmca8aJiDy5aD1Ik2uY0T8ZXe0c2usgpDsalFM=; b=EPwdQ4hux7AWxZ
	GvmCYzSI94LRAVj7EQZEtFwxptm6ZvID1dXkeMMBnn8879oJBjN/CxFPQUvAg5LHjcHv8MnSpMuVE
	h8pyL5yi9L3UL/jI8aTNG6dRFzgDik+Lfe7JMyU11gY/ZVHy646Fe5fWt1u/EHIam8HO21zQW63RY
	LMgbPbiBcnaFMxop7bhHDXeSUZ5qHTZgzH91YMkyG/prI/2xsP5s9Y6tNGW8wuH11KtqlA94sTAwb
	Kxq+DsJwLw50AXCI0J68RUdZAi7CvBdgAkua4qkC+UOYIk/tdFMDeC/TOeLk9JTX0SakvOAgnnIXi
	NMpBrIebRD8XwDABF8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3m2-00000006m3d-3b8x;
	Mon, 17 Aug 2026 20:17:34 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3m0-00000006m2o-0CsB
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 20:17:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaWchOMFXgLhOGmx9s6Nq/5xC5qw7rvlNoWyQP4h2VvSCHJQ26iE2Hv3Tafd6wNEDnDnB3IzQS79fADrZCiJyfF2FPUPVdbvCLRfrRu2JuvZyD0QlwBu28FUFFZWbo381gOFmoIrqvjZBmiGYFAVvTWSUiqjWfQL7SYiJ4Ay+u1bsI6n5SzKVxby6eSsD45lbgHtBKzTQWwqs5+ELvxix4bti0bWnAtjXpcKgd+/4xhy11GUW0e1QU4T/p9xoZdqzTJi2+u5M+ocok/3hY0z6MoPTZSjqN+dpTTyLbFjsjPB9MSOnHu6ud96RQPvOR/jfgx/AlkaRcVdlciZsFGigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qizrSn7P7fQ38oD+OaKVpRqmxyX5owNnKQSTBXsIoy4=;
 b=rNQABzjeRKJc7vEafv5Xfh4qM2NnW6Q9BNGjbocPVspmltyVR8ZyxoNrt6Rhkke0I+8LZNLPsYpk8NAo1sM318PWgKiNGjaZT1XvpsAHBTpaXPap2+FsNGnwZYKnZeROIKTb2EfOifHzC9+1p79BXD1eQ3DGxaGjeAI85oT/k8BQf5T9H4F9mwpeHJRNHEPVMV3X2QSh0qPCVoDTO71SVjvVOWQZw4mpCT3ZLaIhBVWdXfoyBdqmsbG6b5aZYaSlyzXK2tlKKzq557vz9Z7ALjGtYzqNDB5eRgbunXpCBYqcPWbI8eDjx9EYGq2kRBEDeF9w/9xZqEJfnl7rAv3n0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qizrSn7P7fQ38oD+OaKVpRqmxyX5owNnKQSTBXsIoy4=;
 b=FcI5UmUxoKivTkv52q839au6s2MWSLdD+AM7s7MiqrkiDE7BbXBFbc2RPwHHG/89rEBjuhMhUI43TSYm4XC3JoDe5TsacxooHQYTY0FHSG8lPm8cE9RPYqeRowPGmNvrp6QrRq0AAlTEIGAVKDkCxnJxDgEDXf2TCqphoh13VlDgfyiRqt0JOSxu2NOTy7/SRx3ysOQF6Hm9bj2q6m4umWgsgDXjciBJeJHS51sMZGuN57J0vZgJeRauLcSkCTqJoTqfRE05CNOUIxe76hQgyqUOMr/0nD1RWXk9dXfe9U0HPoy4Cw57Zn3MvZc6iXMjbugDUs4rx2n9F+Cqytuoxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7519.eurprd04.prod.outlook.com (2603:10a6:102:f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 20:17:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 20:17:27 +0000
Date: Mon, 17 Aug 2026 16:17:18 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, conor+dt@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH v15 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <aoNsTqe2PxxakLon@lizhi-Precision-Tower-5810>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-7-lakshay.piplani@nxp.com>
 <20260817105340.4517D1F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260817105340.4517D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0172.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: b0156718-7d1f-468b-4132-08defc9c8ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Mg3kWw9Cg7oWJehdSiVGEzliJ6xxeUj20MYKOdn9xVSE+20MDbi28YhSPuqBNCFA+i8FU+p/TcvuhHmPYUiibSv7C5HPCEvduBLn8vDogVyJ/oo4eLHY6pyQN4GT8ttTYvzAW/St8FD00gFaBJaSlIiBL8TB52RZqJWkrzd4Rk+VCNjbIJ8C4G50EoboH01FHB9Jo55lHYwBENiTRMbtnJZGjWj7GcdpCzOoHtIHABXcN/rLVF9tO5sMgLyWIzDbMPbZbVSec55SfKPahy/vDm8uiC1u73DJWD1vpv6JjrEqAbpN4Z2Tgg0Fk4zB4UD3U8G3CaV8vte2b28vmL555Yq0KdEXqldXvh/scvVAvHSKK9WeIyYrox3k7AyBVPuG63FEhq0lt0ExNiiuytdySodbE6Oil5cznmaqVCsLpo+gNMGAnlSGt6yGOTEfiG29y7TvcGb4m6XpNGG2JOH0IkvAhQCgLsQMpi8vdpgjBJRMxZ7WnN/Hr7zXN56MGgH0fg5u0K3AhT5AKR7jejPWudsSswnGeWHZmbhKUR9HvwJ0g9vft9sztbVptMQTA/Vxs56kMFa7LtwU8Dr8DsHD1KN9h6ai2W561L2JlPsik4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NyorQpb4BM5qVbKUk8drDQeonoTzDFHrM2coFOvuE3uHLgN2hKme0FeMoD?=
 =?iso-8859-1?Q?8Q+JE/Ts4w9iYo8+n79HqGBEshG3t4A1q1y9iS0FrbLdXr7iH9FkwSu3wC?=
 =?iso-8859-1?Q?AaWXy+Hxo6LCHPiAwpcDmU4f4m1HKAmvuhywTEVUx22f//mEjeOL71dSri?=
 =?iso-8859-1?Q?3j4grb4NvXt9DXAk+RW8/baohnAlIaiQfzfh2tU5ubHP//DdwjgYbyqhPd?=
 =?iso-8859-1?Q?e5LMvIA9HJZOmM/8f8y6kpiQwjl3MKO3Hnq1WN9oYkpx9LUUssOUDXCAoz?=
 =?iso-8859-1?Q?Xt/N2/XW86TD/5e/EUYGaAHg48SZTu+vdraV2JOWrH1/+LGrNM0lbJ5WED?=
 =?iso-8859-1?Q?o/1gXBn61RQq5R64oa1AMoKbNe07HoBipUmkvr4Fkpbb2uiAaSPFq+Y1GW?=
 =?iso-8859-1?Q?JggPjMNvezZPBQZRnbCZzZsM6KgWEkOLAGzwVU+zCmVALodZ5EwPxRbnsD?=
 =?iso-8859-1?Q?3Paiwmz8Ciq0/j5cgrRWwyq20poLphj6js6WV/7UoR0mIu03+zxHoNJT4A?=
 =?iso-8859-1?Q?Zsfrn/SWgQaAp24MVF7h1wt8xD+C/syPdEMPGX0b9hTwENBGHvk2qa8Ler?=
 =?iso-8859-1?Q?yjr0/htBKVSfSC0IXnmyPeURhBVY6BbZcgqkQfL4clWkBM+lW2AONVZfKS?=
 =?iso-8859-1?Q?o1hU5hB7TiNe2VRy7CqnWfSLM7Nh3x8PCR+rr0E0wlsFsDWg/DlnkuZdKk?=
 =?iso-8859-1?Q?mgEBrMZFTe4HUwLzq/DLItP5aotbxOgw8NyoeT6t0IoCsCTmk9HAvTZZ+u?=
 =?iso-8859-1?Q?7f7st1C4V8PNyyQE3QwJDeGk2THNXszQsBtqJ24cJcCeTflzf5zmKGyOZk?=
 =?iso-8859-1?Q?/vYDZ2s99iQeSg+nXf1rYavhvgjfu3Ke15KpdS+/bCHZkVixt+NGqBeC+4?=
 =?iso-8859-1?Q?kD3INqXSA5qB0WfZPQf1cDqC1nQnCLw7tFXdGbKcBS4Gq4fvNYqGyIinP7?=
 =?iso-8859-1?Q?EHUSezJ3EM3R7RBB/Wat1SlD7iRyK4gXWfBby66PlvCoHQoKInCVIAx6jG?=
 =?iso-8859-1?Q?oTommjFpagha3ZcgOoOjBRnjWpX0AyO8t7RwgXhQ9spSAbfRmoHTt4dU9j?=
 =?iso-8859-1?Q?37ecIhdmZJ6Jcc89qRCVHj0ZAUgjF/MrEm6TAzdTBzEKSRsNFWEvDPsMVl?=
 =?iso-8859-1?Q?xKuMZcsYTPYcMXddiED+s4nL5H9wDfeqPcmdjTCZEv6z93+mBA6AZsng8p?=
 =?iso-8859-1?Q?jMwiRY9mXF/eYKk30Bm5QblkCpU/QxNYkB6Nl5j3W9UGTVpWloOu4OrLiR?=
 =?iso-8859-1?Q?DUJdxWy2aE+epJ0gpebxHwjDkGC/BoRu4Qf2KEgDO3p6Z0XJyfMEIt/MBh?=
 =?iso-8859-1?Q?CkuEQPpjx30Sedpx5l/PR3K7PRJMabC1GFzU8x9LxZ6QSEOTZxRKku7cP3?=
 =?iso-8859-1?Q?fyq2V/yQyqMl1jHM/252w3ruI+2XNtSn73nO9UbNvLyumVm40GqfuAOEdh?=
 =?iso-8859-1?Q?+DgLq8egKGPpLJ7jgJzOm6ZD08ivRpopZdH+TXKisW4lcOh1CHwjtiI1nl?=
 =?iso-8859-1?Q?0zvqg+wBaFEL5/3Es711YH6/V+sHwI1vZF1px75RBgRD3xLzDli3swB1wN?=
 =?iso-8859-1?Q?23O8CvYz6osZvu6+H7oKWZCxYf2782Wkoex8vX44ItH9SxSsDXv+qSMy8O?=
 =?iso-8859-1?Q?PjeEu1UtgLXBpt8l1DKgu/mwxgPgo5d9rhizdI0xB1ikMIdrAosMG+UgCa?=
 =?iso-8859-1?Q?zmYU2JFMrlV4Sx1Tao+EQbcctmEu3c88MVVTNvx/wm1c2U39eh0PpqL5fD?=
 =?iso-8859-1?Q?S9Q0IojTfWYIWxUFxJayFi1JsMntY+kGdKKVIC8hQKUU2K0P1CYme7/V1z?=
 =?iso-8859-1?Q?GHYHDiAp8xRQRulTEDtut29ui5j2+qw9Ap9aorsm9t1dIAOg6CS6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0156718-7d1f-468b-4132-08defc9c8ed3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 20:17:27.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C51KkK2yKQLnC+bCUDWUxZhKgWAlgVqLBZCMM2pa1P1dQJYoEtzjTTPh5hYBTZUb4wvJ4feLmU4R/YeaxlV+L1XS4sLRASO10vz4u6OnSusK0yBRkyFX4u+Gk5d/5Mov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_131732_117617_785E9B1E 
X-CRM114-Status: GOOD (  31.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2026 at 10:53:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Delegating DAA to the parent controller incorrectly instantiates=
 downstream devices on the parent bus instead of the virtual bus.
> - [High] Address reservation incorrectly skips assigned addresses that di=
ffer from the static address, risking dynamic address collisions.
> - [High] Freeing hub device data while IBI is active leaves dangling poin=
ters in the parent controller.
> - [Medium] Non-atomic overwrite of `parent_desc.info` causes data race wi=
th asynchronous IBI handlers.
> - [Medium] Nested acquisition of identical lock class triggers lockdep re=
cursive locking warning.
> --
>
> --- Patch [6]: [PATCH v15 6/8] i3c: hub: Add support for the I3C interfac=
e in the I3C hub ---
> commit b929a913a5f82c8ea68936fda262a420d33a7ea4
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> i3c: hub: Add support for the I3C interface in the I3C hub
>
> Add virtual I3C bus support for the hub and provide interface to enable
> or disable downstream ports.
>
> > diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> > new file mode 100644
> > index 0000000000000..04726393004b7
> > --- /dev/null
> > +++ b/drivers/i3c/hub.c
> > @@ -0,0 +1,675 @@
>
> [ ... ]
>
> > +static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> [ ... ]
> > +	data->parent_desc.common.master =3D parent;
> > +	data->parent_desc.info =3D dev->info;
> > +
> > +	i3c_bus_maintenance_lock(&parent->bus);
>
> [Severity: Medium]
> Will this trigger a lockdep warning for recursive locking?
>
> The core I3C subsystem already holds the virtual controller's bus lock wh=
en
> invoking operations like attach_i3c_dev or enable_ibi. Since all I3C bus
> locks are initialized with the same lockdep class, acquiring the parent's
> bus lock here looks like it might require subclass nesting annotations.
>
> > +	ret =3D i3c_master_attach_i3c_dev_controller(&data->parent_desc);

beside check other sashiko report.

need use i3c_master_attach_i3c_dev_controller_locked() if require caller
hold lock

Frank

> > +	i3c_bus_maintenance_unlock(&parent->bus);
> > +	if (ret) {
>
> [ ... ]
>
> > +static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev,
> > +				    u8 old_dyn_addr)
> > +{
> [ ... ]
> > +	/* Re-sync device information after the address change. */
> > +	data->parent_desc.info =3D dev->info;
>
> [Severity: Medium]
> Is it safe to perform a non-atomic update of this structure without holdi=
ng
> the parent controller's bus lock or the hub routing lock?
>
> If the device has an active IBI, could the physical parent controller's
> asynchronous IBI interrupt handler concurrently read this descriptor and
> see corrupted or torn state?
>
> > +
> > +	i3c_bus_maintenance_lock(&parent->bus);
> > +	ret =3D i3c_master_reattach_i3c_dev_controller(&data->parent_desc,
>
> [ ... ]
>
> > +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> [ ... ]
> > +	/*
> > +	 * The generic IBI lifecycle must be released before detaching the
> > +	 * physical controller state.
> > +	 */
> > +	WARN_ON(data->parent_desc.ibi);
> > +
> > +	if (parent) {
> > +		i3c_bus_maintenance_lock(&parent->bus);
> > +		i3c_master_detach_i3c_dev_controller(&data->parent_desc);
> > +		i3c_bus_maintenance_unlock(&parent->bus);
> > +	}
> > +
> > +	i3c_dev_set_master_data(dev, NULL);
> > +	mutex_destroy(&data->parent_desc.ibi_lock);
> > +	kfree(data);
>
> [Severity: High]
> If data->parent_desc.ibi is non-NULL (triggering the warning), does
> proceeding to kfree(data) create a use-after-free?
>
> Because i3c_master_detach_i3c_dev_controller() does not automatically flu=
sh
> or free the generic IBI workqueue resources, lingering asynchronous IBI w=
ork
> items queued on the parent controller might dereference data->parent_desc
> after it is freed.
>
> Should the active IBI resources be explicitly flushed and released before
> freeing this memory?
>
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_do_daa(struct i3c_hub *hub,
> > +			  struct i3c_master_controller *controller)
> > +{
> [ ... ]
> > +	/*
> > +	 * Downstream devices reachable through hub target-port routes share =
the
> > +	 * parent controller's I3C address space. The hub gates access to a
> > +	 * target-port network, but it does not create an independent dynamic
> > +	 * address domain per virtual bus.
> > +	 *
> > +	 * Run DAA on the parent controller so dynamic addresses remain unique
> > +	 * across all downstream devices, even when they are behind different
> > +	 * target ports.
> > +	 */
> > +	ret =3D i3c_master_do_daa(parent);
>
> [Severity: High]
> Does calling i3c_master_do_daa() on the parent controller cause newly
> discovered downstream devices to be instantiated on the parent bus rather
> than the virtual hub bus?
>
> If they are bound to the parent controller, won't subsequent client trans=
fers
> go directly to parent->ops->i3c_xfers, entirely bypassing
> i3c_hub_master_priv_xfers() and hitting the closed hub port?
>
> > +	i3c_hub_disable_port(controller);
> > +	mutex_unlock(&hub->lock);
> > +
> > +	return ret;
> > +}
>
> [ ... ]
>
> > +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller=
 *hubc,
> > +					     struct device_node *node)
> > +{
> [ ... ]
> > +		ret =3D of_property_read_u32(child, "assigned-address", &assigned_ad=
dr);
> > +		if (ret)
> > +			continue;
> > +
> > +		static_addr =3D reg[0];
> > +
> > +		if (!static_addr || !assigned_addr)
> > +			continue;
> > +
> > +		if (static_addr !=3D assigned_addr)
> > +			continue;
>
> [Severity: High]
> Why do we skip reserving the assigned address if it differs from the stat=
ic
> address?
>
> If static_addr !=3D assigned_addr (for example, expecting assignment via
> SETDASA or SETNEWDA), this leaves the assigned address marked as free on
> the parent bus. Could this allow the parent controller to accidentally
> allocate this assigned address to another device during ENTDAA, causing a
> collision?
>
> > +
> > +		i3c_bus_maintenance_lock(&parent->bus);
>
> [ ... ]
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260817103844.21428=
02-1-lakshay.piplani@nxp.com?part=3D6

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
