Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF86D5B85B
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=076kktCCYVPBx0cbTlTrM5tKW9clJiG5OI6SgtoP5H0=; b=YPhq/SXiUZEv5E
	O4ymnlEO6lBJ+Tp1CkC3yF0cINXlF42vi1LXqojk75LrNTllBQ6nQSAl46i7cvGPE8LfflzLFCYiY
	nLRixVotAbh4ItezgJZGmfKSN/GOIvAH6x7JpS1rMdYzQuS9/XNjROz3qYG5C9U4Y5X5Z9toZOH2s
	+aXDEZp2Cl4NNoilfgSuJvzJmtJzAlU91J8U7QLyZxb+kA54PwB9tLzuQK6gVBg6ZjIkYKi3fuWzy
	sZDSislo6rDAkxOuqOE5P2H8ZXs+eDEZJ9PRwr+Wrfd4yvTLLLbBEd3U9+o7So1sWeMKiitwvKB/x
	WRocmVm9QhKU3J5McS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCdF-000000045IU-1TOP;
	Mon, 15 Dec 2025 17:45:13 +0000
Received: from mail-northeuropeazon11010002.outbound.protection.outlook.com ([52.101.84.2] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCdC-000000045I4-0BRR
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 17:45:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEExAOMhZp0iF1DaxJI2VzX4k3f8/ecKyu+mbhVsZDLmFGM8xa4WhsEX7rKJPtbfUR2VV+ap7FDQ8nRgmU/ptbaR3nziQeCisZM/1iP5fkF1fsFfhVqc/wfqs0edJ2obZqH4UDrWIN+ZjAdGjEykJsFoizHd14NGcY3EzMcy8T+09rdVxMGk559BYpCLFy7HafQ1nlBS4M32/VjGA7IY0jmmeR+BQFGmFa4PNhRVA9EuxqxO5P5EYgFBE10KQXRJ6/uR9MCzO5ll6q8cGNACvV2XJrBEX5iQtFBylX/z+78f94elZ82YROaGzOM+x8XL3Jb1nk2RNRm9TfwsTJJc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES9r7QvH5lxhnuuPSWnh7mqrUyE8qGAiUYnOYwmj4Bc=;
 b=loOjcHqxXo8nGxFtHXQLqpYdOEnZhggSFpdMbBWlhCmx58ca33vgu6Uvt2TS8XHwKlLr2a+/zc4XzYCX76N/dUmw63iEM1Miav3H+P+zzvJBk3lhPNPIm+6dqv5ZRvzMiWCcrMXSa9QKxWf8Z5EagOMfr6hwFT0V6xoXBFEtz8dts0ezgwCGh1cTQMxlcoar/jJX6el2mUu3yRyrDua4pEOVpsMZjS+hrtH23Vl7eX9V1Z22KUfo2hWm8wCAmI7l6ajmk1TuwseOfmvhhGsu8ozp0c8XAooTBnxR3c9CXFKmq5ELTo1OwcNEhLe/hx7REGifn3efnBYSUjBjHQL7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES9r7QvH5lxhnuuPSWnh7mqrUyE8qGAiUYnOYwmj4Bc=;
 b=Kc2amTt78z6WVxYgZcezGS5V9BvKwvnBtayURx4X7m8OfHwdil0s2QD+45tmu75r5EWNvm9//J5AyJ8oXU1BUTnRTKzz/AG+KsyYK2MMqP0drplkcSKtMyUDsjLdMvQeZxdQrWSX5E1R2Ww5twodoYhcDQq1Ogr/ke6V5PNmlYUyT/PIM48s9NzJRS/eY4cD+ZJ/3Vqz5YdCBDTYXaIWjUdnxWNbWXB6rJWk2/sHEsN6dCqRQ9kUmJNuaAXr2lzm5THyF3oe1xBx27025Mm/NzidGrZk18qeu7cQHZ2yVabU4FztqjovLsThUXif/jx5f2jl92s7bgfyk1zfw1Lzdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:45:05 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:45:05 +0000
Date: Mon, 15 Dec 2025 12:44:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
Message-ID: <aUBJG6GjX+z5y4AI@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
 <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
 <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
 <aTxTBmeSBPv25b2I@lizhi-Precision-Tower-5810>
 <96366268-572e-4a11-bc94-058d37db2418@intel.com>
Content-Disposition: inline
In-Reply-To: <96366268-572e-4a11-bc94-058d37db2418@intel.com>
X-ClientProxiedBy: PH7PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:510:174::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd261c1-55a9-4da4-a2ee-08de3c01ae7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|52116014|1800799024|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nrs4b5qTh5qSlXHPOQVYP5i9eKHNMIfKhM6ZYLqzpKXZpAO1H+Ff8V61eWHS?=
 =?us-ascii?Q?zXe7zpqSV/954yRMoPOLDp4JueQNKEIZXcWZaL3cTb3eD6S+uvAyfVd6A+N0?=
 =?us-ascii?Q?N1R0kMlg9+FWZgX0O8Up3DYL1a6KvSjORooUnc3UztSbGSL91LTR8Y9IUprj?=
 =?us-ascii?Q?aO5R6Se7/yBY7lGJgridXYy16sTKtPhVkaLMQ086nX3RxUk9g3u69ZaZ7ii/?=
 =?us-ascii?Q?M4OePRnOLBM3vXLMrHbicY6htXdWxr1PVHacgUnZ/t3q3gA4A2r15qWSbNdi?=
 =?us-ascii?Q?dNafLCnV6VRL2/2+NnWwmgmSEAHxuyV3ZnwSuwODQ6jlI78B9rVaKWI5sRu7?=
 =?us-ascii?Q?Xk+c7LxvgLxGE2ERv/ef4tOh16v8ydwZOZbFYu1XvZVn9klTtTUhaMc9yhiF?=
 =?us-ascii?Q?7QbgI6aR42cekjF02jH7w8nZb5WyfZwwaCKqnuUwYJbNBarQCVfKZgx2CmBy?=
 =?us-ascii?Q?YK1xsmOBd2XDMgkx2ojBO0++VRgiGLe3WjzhmfO1xwj7LJ7ozRwNqOLuJcMK?=
 =?us-ascii?Q?dbJ2wFpUJB4Pnp5gXyYUsnmGpythObCGCKZfHfXdqoo6mN3EqmJcq6tE5K6+?=
 =?us-ascii?Q?ldA0aEq8lzJdJ6VjZgzMiiqaq2RtkEmLt0XkXTWhodHuAj0+Oo3IAFBvIvLg?=
 =?us-ascii?Q?5mXdtzNtPCXua+jDYKCcSreOHUqqavBYTHcdLr0OF82IlkS+BAzYKzDR3vLD?=
 =?us-ascii?Q?KlM9znBJ9cqCZBxJdUqhQ+8WgIsPQW76rZfnxMT8zuqwTvzg9CK9nUQUd/Ql?=
 =?us-ascii?Q?v+Wg5qjdvMS7OSDvvTxZEJZRH1c5qt4i1tCTv/iRnaRlTYjlB1RuBfvK6azh?=
 =?us-ascii?Q?gKS9OytY2VuhPMBFlOysuk6qw7a6/ePwWIM8ZNf9tXJTHTOGEmXyDv9UFjOC?=
 =?us-ascii?Q?xB35cwRK4iV0tyediP//588XlQ+tPnoNnZgDljgQbJ2CQgP+hvy87NTE/FDd?=
 =?us-ascii?Q?Db2yuQMdlCLRE9nBV0pNlTErwK6wijf7o5wu73X5u8edANoCZjbcEnqMcGKn?=
 =?us-ascii?Q?oLJz9D6aw0ljIwkBdLqAIaF1obUXR87dNysHRGZPdnInAJOjYPR5SBxmh3GQ?=
 =?us-ascii?Q?blf2OFZKGi3Tw6KpTpxXSEzcomI6bX9o7wUJve4W/FrZ9nz6b2C3UmeNWHZT?=
 =?us-ascii?Q?6kR++aRU5s4kY0fjswxsKKea/jkiLhAjsmjMic1uzbKwNlzRRPgMfCBCMuHm?=
 =?us-ascii?Q?yngb2FNoJtMFjWL6MX6/2zbFcg1do08q4vKI/z2YZQ0z6NZcKnb6HRtaOFlK?=
 =?us-ascii?Q?902z5ih5g0d2s7Y8SWWyoIBUjFvtN1AnnUWUSrlVN24wxysed6AG5OQiYOok?=
 =?us-ascii?Q?PGIKHbEJS1GNlXbTbWag06qDOBlY8rDBIEoUapcPcPkR85z3ZDFeAJpzdtmE?=
 =?us-ascii?Q?bfGrT85vAXTA9C3JPOgEvaw4ACOWQhb5flJ1acOZYphDWwsNxutlzZL9XjBl?=
 =?us-ascii?Q?GCcrNyFJymLcK0okWojm9ozKpkeSfJ98XD8JW/sqH8Sd3wxoBQGvL6W30b8R?=
 =?us-ascii?Q?dK4sMQfkdAhpzIfdd1u/6ALkMs/q8As2oyMX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(1800799024)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aEcL5akycaLA9m4vCGWflmNHBtUGj3R1ZW9xkRZsWr1T74aFA6od5BjfYhip?=
 =?us-ascii?Q?ETNIMIxOWM0LZ8l9QnloHfF1pcBQhhp+cUXMK51BH4oRC29H4pTz93CJe0nu?=
 =?us-ascii?Q?ANMVzuL7fsXzVIM5K+A5zxL6h6nvBOzvjwq6u7230S4h4HK6Bb4FnfL8ZcrR?=
 =?us-ascii?Q?Uz9aL3lua/WU7I7B/XqXWiReSLnZZPRiTC1Hk9LF0nDIdfZ8gdVTXwCva0QS?=
 =?us-ascii?Q?pvPVxL54D/1nh50SoH2O+P/tciXkTRWHy+YCOS3WB+675E5Huz5H0/nupmo6?=
 =?us-ascii?Q?dXnyjQFjXqdmzXdhlMXOrfm/Z1gQrRCdfe2XKHK7nXD8UcdoBTf7XWFxFCV5?=
 =?us-ascii?Q?KAkOAX6HjgbkVDaqQqbldeVM5XmUHpYL0WjenrV+mya6wFXd8vYQdGg1ukpG?=
 =?us-ascii?Q?iMFgSeUDJVeMU3hQsL/F43XvJyUI52adLAck+eplsgbLoIieG8Pm3hc7h0KV?=
 =?us-ascii?Q?61say77iAPcXEutm10yPDvBz3u0teMR0ECveZp+F6/W1Wd6UQ5obrYkmutul?=
 =?us-ascii?Q?3wmUsYkss2KmIoIiqb+XcCrltLjZhljstrXKYNUQ1/T+jNnUf1Il0NAJIDIm?=
 =?us-ascii?Q?mMdxvEF16PpC2saX+e1NU9Pc+kgTlecjuhNeMBmeXbAVn3X/iZ5aALsHv9cw?=
 =?us-ascii?Q?Fb3CyMjIcTAJoSW7MDZOLWPb4ExXtD2Ajmetcg939C5Imji9x1xGMmRk6jOU?=
 =?us-ascii?Q?pCySqSCmlREHS1VRQ0MtdxTQNUHgnceSJPobKIeY2/alnHkeKZNLKEWMe/oA?=
 =?us-ascii?Q?0xBoIPQralHAUu8d6dIkqHp8Bo0aZnE/BjIvrZWNc3eQAqQNRdRXaa7r046N?=
 =?us-ascii?Q?rBQcjHDAUGxkZ3ztlxmPf/SOr3Iy9NO8KV3cIlOTj8YUlBAjBKxnX66HYpcx?=
 =?us-ascii?Q?JZe9qnyQ+6mK6lc1n4bZSxZZJDhaL9tMeXnpPAEnkoOnxwtrrk2KwvbbHCu2?=
 =?us-ascii?Q?gW9C73sVNv1BK6yO+dFc42ULsgov+4FypHVEZE4hFiHMODs3+/iJMb9UugF5?=
 =?us-ascii?Q?2rwm/w6VfERW+jriczQ4m1OcH4rsHoWKQm02Gc8upqFN6+I3sEz2jiFuth2P?=
 =?us-ascii?Q?uQ55uqtVxhALBuTKy8Fnb4nNUAj1xfvBXi4FIOIM7O9cx+lZlDejJQqayIqL?=
 =?us-ascii?Q?nno71W2Lu6hWOpzaHGIfmqtZrIYoe9hHiALssMvavK4EG8VLQUF7U3hh0Zj5?=
 =?us-ascii?Q?f21JLYcrrAlsW4bLhLr5bp5Df0pqLYg+DqICur1TZG/havF7c6V0Hl19fMGS?=
 =?us-ascii?Q?+1X3HqMNazRUvro2dksFYymnVq0kvAsKp80DXAGkl80SZTwmlUQAgiGC2wqa?=
 =?us-ascii?Q?5PkXjYibYaELoh4eQNEhVJ+ga77arpMZ2hLw6d8baiOj4B2HwfsVtVoEsWOw?=
 =?us-ascii?Q?Sx8c93B69d9CIJyso9GrheSa/zb0dTJHLY+HZfjuBMly5OQckkv0lNx5JKDG?=
 =?us-ascii?Q?P4cK47WBn4q2P9xNOGbTihy8QXTyH0Af9uKeQ/8sHe9DAO3+fulv6s4W27TJ?=
 =?us-ascii?Q?QYn5AfvVjbauoNsLl92drm/8Ks/2Q4duo9TdyjviJ9P6qie7fCBP4uWZ3Iyi?=
 =?us-ascii?Q?3Qfm+aa5D7nMyrqqgyj9Uoc1pvO6xcGs/ehafAZ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd261c1-55a9-4da4-a2ee-08de3c01ae7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:45:05.4564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4M21socRdYgTdLr0+IVRe/cVpYBsW0fbvqckCvdBGB9YnvnuwOICO7G+MFZCbApLVK0iX5AfRlK/WL53NUnS8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_094510_310382_09140C29 
X-CRM114-Status: GOOD (  25.99  )
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

On Mon, Dec 15, 2025 at 07:26:55PM +0200, Adrian Hunter wrote:
> On 12/12/2025 19:38, Frank Li wrote:
> > On Thu, Dec 11, 2025 at 06:19:56PM +0200, Adrian Hunter wrote:
> >> On 11/12/2025 17:40, Frank Li wrote:
> >>> On Thu, Dec 11, 2025 at 03:48:05PM +0200, Adrian Hunter wrote:
> >>>> Use pci_alloc_irq_vectors() to support all IRQ types.  Do not call
> >>>> pci_free_irq_vectors() because it is unnecessary when the device is
> >>>> managed due to the use of pcim_enable_device().
> >>>
> >>> pcim_enable_device() add action pcim_disable_device(), I have not see
> >>> pci_free_irq_vectors() in pcim_disable_device().
> >>>
> >>> Can you tell me where call pci_free_irq_vectors?
> >>
> >> pci_alloc_irq_vectors()
> >> 	pci_alloc_irq_vectors_affinity()
> >> 		__pci_enable_msix_range()
> >> 			pci_setup_msi_context()
> >> 				pcim_setup_msi_release()
> >> 					devm_add_action(pcim_msi_release)
> >> 							:
> >> 							pci_free_irq_vectors()
> >> 		__pci_enable_msi_range()
> >> 			pci_setup_msi_context()
> >
> > Okay, it should be that pci_alloc_irq_vectors() provide auto free. not
> > because pcim_enable_device()?
>
> No, it is conditional on pci_is_managed(dev) which is true if
> pcim_enable_device() has been used.

I have not found any document said that,

 * Managed pci_enable_device(). Device will automatically be disabled on
 * driver detach.

which have not mentioned that it also controller free irqs.

I suggest commit message descript whole story or change PCI's document
to descript it clearly. I think other person should have similar question
if he have not closely follow PCI's change and go through PCI codes.

Frank

>
> >
> > The below statement should be wrong.
> >
> > "Do not call pci_free_irq_vectors() because it is unnecessary when the device is
> > managed due to the use of pcim_enable_device()."
> >
> > Frank
> >>
> >>>
> >>> And move these small patch ahead in serise.
> >>>
> >>> Frank
> >>>>
> >>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>> ---
> >>>>
> >>>>
> >>>> Changes in V2:
> >>>> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> >>>> 	Multi-Bus Instances"
> >>>>
> >>>>
> >>>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
> >>>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> index 8ade911e3835..0fd3587671e1 100644
> >>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> @@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>>
> >>>>  	pci_set_master(pci);
> >>>>
> >>>> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
> >>>> +	if (ret < 0)
> >>>> +		return ret;
> >>>> +
> >>>>  	memset(&res, 0, sizeof(res));
> >>>>
> >>>>  	res[0].flags = IORESOURCE_MEM;
> >>>> @@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>>  	res[0].end = pci_resource_end(pci, 0);
> >>>>
> >>>>  	res[1].flags = IORESOURCE_IRQ;
> >>>> -	res[1].start = pci->irq;
> >>>> -	res[1].end = pci->irq;
> >>>> +	res[1].start = pci_irq_vector(hci->pci, 0);
> >>>> +	res[1].end = res[1].start;
> >>>>
> >>>>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >>>>  	if (dev_id < 0)
> >>>> --
> >>>> 2.51.0
> >>>>
> >>>>
> >>>> --
> >>>> linux-i3c mailing list
> >>>> linux-i3c@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
