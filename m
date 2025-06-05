Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF447C5B543
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFtSQgI87XIQ5KYIV8HVzIGzgWRl2R30vQegtNx6lZs=; b=N+X7bQANEwMAr6
	I+xcoxgSr9c1Lh1LNcOOpaA464/bVrFMdc+Vo8SHPfcR7VOGonsiRGJiDgOtm9u3jO/uO76xIrwiJ
	ivVxEwP6SC4aMtRKxpUesH42Jc1q/+0BEoWMxTqBxcRzK2eto3ZpPK2c55C0wXV5Y5BCYBbNZ+eJ+
	nk0XjCbrJGcGiETXZcxkVXHD9wLnTExo1hg4tP+JqS88YhDqISLNDVkkc8Me8SYZay/mcXbfWyBhK
	9F3aa1wlB841KAA+kuX7XbbnKuRgslpKNcn8pVW3v4E7WExtccMXruW+ApCj7QfBoJji34jY42IR2
	2yfxBaJ8hre6d4JvarGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCHn-0000000FrnX-2GpM;
	Thu, 05 Jun 2025 15:13:43 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCHl-0000000Frml-1sPw
	for linux-i3c@lists.infradead.org;
	Thu, 05 Jun 2025 15:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dahd9DJJhFb47CqU9u0TtmKjn5Pjdxm6inZ54VVhlnknbv9ucxSsrV/qy+hJlFz7qUUfHDQ+iXtqmf0E13Ben7aDASPIOPZHn9YM0CVwNkHrAOXSPOSxMmtUDIkW3Y+bzout5iTwxkDcg6/PyXKSDJRf8H3JDKA3iReuQ94I45474uVyDcU0EX/RlKg5BqKhOyRHKBvSen8Ni+WGFZilWs83k4z9Ipkbqb2KcISCNdqkbbYBXIrT/mQ8mV8Rjr/lnt9GYIKBSFKKRHvxpbBaCQZ4XacLLjVIZBn2tBnPINMh1KFKdoS0JM/HPzOzh4fILmIcZdTY8PApbb3Gwia1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dff8E5H8YQcilVSIGiTU6RvZ8wJUkL9qAe1ZvFz0mLY=;
 b=kos8MnTyaxQkGMSI/TABnCd+7HNtzrLtTx5vbwgTnoa9tmhUPGiFRsTUGGT+Q445TvxQXNN2pq/PSqJgkBZF4RNrry+es0eDxdmez08cfMT7EbpOlx5/kEkvLpdShJtaIj6+GP0B8aGnBJym35K/+xh6y/WZxYfREfwncKH4XxfiqcBQ8xahmIgpzm2drMvDl/kdVPoQ+VjRt1DJx2Oxbwj7kf2yzkHwyqjwIgIzWKLJKd6cUpf7pWz3g8ICYauSj3fVSFca3RYjyW01jXPRVN5TWesCHwwEBsFn2HfUNcpXA0Lx2DsxmpWwz7UIGlk/JognpGPWRAjtEqmYW7g9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dff8E5H8YQcilVSIGiTU6RvZ8wJUkL9qAe1ZvFz0mLY=;
 b=aUfsAzUxw+2p/o1Z2hPK9xxHWs40r8nhXvXx8hC9Bu9S/qyXK6E+jsTRD8YKdTSWYJJL+Dz6Nc21LJD1QeatAMr0xnIMtXwI3Rc32dhTK1ZNYm78NzMx2V5vN+Dcpr6aXMI8W+n0Y8L/4PlCvTpF5aUE/j/NWF+GZGZaB1roXMvci6mf6LCzf623HfXCjBB/jvbd6m/X98fYnyPz0sG3OGO7R0Qg1yE8CyRfcqsdh9/ZJgcZTlnZveGATGSeoST5N/pe/3myXz34605oW7Zcq5LPV+jPiYtJGJJ4La97r3KIbOyd3pRKp7w7JCkG1vewnlQb6R/kMCob82pwpuM6jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6883.eurprd04.prod.outlook.com (2603:10a6:208:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 15:13:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 15:13:28 +0000
Date: Thu, 5 Jun 2025 11:13:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <bc599310-9287-4023-a204-682771574528@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: f298f1ac-ff3c-4aa3-7f4a-08dda4438646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/WvnAV4EviWgysT5PPt3jqm7IiLx4OXfMeRSnFi2Fy7YN/SjHnrVRWVRMfJN?=
 =?us-ascii?Q?yWrqWlK1ysuMQYOZwTiJXdVNX294oulMjWV5qhI5LAe5Fw7S+fJEJbO3WEB2?=
 =?us-ascii?Q?Nr79qwzSVU2TXCIy6YL62VVqc/eEKjmP44uCuPTpZsDv+2ViEVQ/c2Onb2ku?=
 =?us-ascii?Q?/9Tn45qBu0tafnECMZMZsbDyZGqAVsFXzbrlacdVEVHO0r4XafPfjqPIHdDg?=
 =?us-ascii?Q?gKtXa+5BvJJCKUUD3CR6nxsmFgqBtFHceQiz4Gh3jMfpSNxrTo1OAoMa4yUr?=
 =?us-ascii?Q?S4iZSzPBRlyAvZAaycblS4f5zCrZWnf/O4hRtX1r3gV8nFPUoSRa+z0vcEq8?=
 =?us-ascii?Q?wmkGaHcEqO+/uUV0TBjC/cUn2LbMOqLiYykHNlcjkynKwrZ07QePly/Yfd0E?=
 =?us-ascii?Q?mguzHRt0UXoAOBPTmLMGjvBj9YAdIXdEXyrs6pFmvZoFEAqMIvnrCUNWh1pl?=
 =?us-ascii?Q?85ghnjDRzHdq+gdBL4B0n/oeZYRXWTUBO7Sogpop/IYkBp0YAi+is3OkS25F?=
 =?us-ascii?Q?jj9f41K3hJoAkZGb7Mw0hhZ7UBZqP8HQjrcmV8MD8HZH7ZB2UG+sKcwx4osb?=
 =?us-ascii?Q?p893wLkahygy1fkikX80QO38ybiFNTzocArxk7WbGtNM8TPRdT7G4+EjvSdF?=
 =?us-ascii?Q?QsrCuQVeusqSp4Z2n2vOqSepyFuQ/G913F0+w2erXR52vb+D/jDWrnhxo5xZ?=
 =?us-ascii?Q?EC1bcGa+s4P9mc9FSmNuvbiGaxlOfh76hRAP0Ft4A/qWuwfuZHotZ21PXYFT?=
 =?us-ascii?Q?1MZSPMHmgEDnUHaXwt30pyCcBe255gosRW4RVyhK3lYoRsjnhFx9AIdem2P4?=
 =?us-ascii?Q?omJ1DKoiqS8VPfQxJVPQ4Jl+k6fMscacF8YOQMgqjNKH7ljb0hDqsG/wnlCH?=
 =?us-ascii?Q?Brii6JTOm2kgi8LlA+ciAdNP8AN/zEQ8kCvWnFpPKJpX35EmeTVxdILQQNzB?=
 =?us-ascii?Q?7t67F2diBU9VjU0pEf0k+05FNNV9Py/HLqSFvofGDxG9e1j863RvDw9Qklhs?=
 =?us-ascii?Q?SUfvRRrlQ93PpPwmBdsuLfsYgptzRULJYaGPSNf4Lwc2Nf2elNxio3kcyzR2?=
 =?us-ascii?Q?61wEBJ7cWuD4rGHrMIme6r2rLt88EUBQWcILhuGuD4j1By5moW5dleXR5Kf+?=
 =?us-ascii?Q?VsxsPvGmRwfiaxme+kyfk6fZe7GBWSJe1ud/rP6ToLjU29fCGULv8bMhC9dZ?=
 =?us-ascii?Q?WHLgVTob0N+7I7OSy+kjCYOMTvg3uwRzoubcSP0cQ4Qp6Ck+fENIFpmWqyfd?=
 =?us-ascii?Q?6XSkZbeVdRZahP4mQcpYzwQckCTYVkEC3xADF29Tzh+08dMOPFS51dRnE21L?=
 =?us-ascii?Q?4J8Mred5BrrYwuFxG/6Y8xgquRqriFsJ8c+3zTBaWzpYSqcCim7zEo3JIy2w?=
 =?us-ascii?Q?3tbovMqfL6GMvtTrXVxFgv2X6dIRPZw4YJvXyoyfLZNnBvF9dMjwwsJ+tvGa?=
 =?us-ascii?Q?sWrEXp/K4v/S3G3/NQfvYO9AZ8v4Sh8SMEJA/A7ZqEYSJpgEFR629GV+gn39?=
 =?us-ascii?Q?Pbghs95AxYx/DXw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JWSgWjZtP0L4686sHY/aRa77DfO8KOwQ0tyhN0LGyFjlPfO6ceWYXgo/8GK?=
 =?us-ascii?Q?7DZnR22NwP31/g8vxRFFsIAxt6mgqwVShOWSHquxJmorR7d3K9HVefojs96c?=
 =?us-ascii?Q?9dn7wsGlyVGcVTeGMWoCbRd5S9hC8RkIesKoATaUWV3Y9kafwCK8Z/9ePTiv?=
 =?us-ascii?Q?gUa5ymdnZBv5gw8wDBXadop97c76u9q4B9Td0XP7BjP8rFkRkFKV+yLGteCG?=
 =?us-ascii?Q?wiyYUtYSMUw/GyUJKODtD7KWcnO13W5O0pvZhcjRsVMn2cZNr/VrwIn5q3CY?=
 =?us-ascii?Q?qkEpgwk6LckXWnfWTMk4JVel+/ENm4aavJvZbMLH+mN61v0BKFqj2SpQZ16X?=
 =?us-ascii?Q?Jd1A3AS4aTxLQPpWMWwSt2pFc+hBwnYKjp+gzkvkF4OkVGYBE2tbD9lj32kl?=
 =?us-ascii?Q?ktVMv5/bVz0L65s9Rt7eSdABbCBAzq3QBaaNy2phq873EvL9lwA2OuoX05eP?=
 =?us-ascii?Q?ND3/hGCC0Hxp4at2G6Dod2+IGy5lnd0rewuW/Sp8qJwNgnNof4xAl62y2GT9?=
 =?us-ascii?Q?sH++zsNc2CKxo7FkP+IWxbetSN6afoADnfO+YeAooxFnGc8GCi9PCvHL7whs?=
 =?us-ascii?Q?UPo1UgC8bwb0z5tvbwI69bmLk6TaaUpvaR+Xs252BIC7nyGiDo7arv+D4Z30?=
 =?us-ascii?Q?CZoibFmfPb7EnFJif56CND2Y3T4Ofhnyhy1njKmMYQcWktmELXdlEYpIckhj?=
 =?us-ascii?Q?y93GfjkOAS7k4CJ1gwqENBUJMMnrSTnX/Jx2WdqjKj3vfD9FigUgGxucKJ14?=
 =?us-ascii?Q?ZX3hv7J90ZPHifHyh2TE/SKL1/lhyyGZakFFEfLYENzE6VdHC5Nj2pT8nPSo?=
 =?us-ascii?Q?lMLKG2Sf2hVABdeH2zdK37ZDvsSeW5DnBD9XM/1syvUG1xCS6G6qSqLaFbRn?=
 =?us-ascii?Q?3TuS0EoGbn1zuPiltmlSIrzmhcR0zM22C56PxXP1j6TRpFSANzk1KXXZLvlz?=
 =?us-ascii?Q?eFmhzD4pXb4w7XBGO/4IdB3SsYre+NWym0oEUKPH0w0n1hC1v/h0PXk7OQw2?=
 =?us-ascii?Q?Ubvk5o/6rjNX6vR8N0+fTAY2eVrkkGj6uMKyQ+cbHBhwHjyT+90aJNsstGSp?=
 =?us-ascii?Q?Wt2zs4HHXcwum1pLPeiDnI3Hdh7hufi0k8PtCh4XJ5mG5XE42Gb7ZonqTh2U?=
 =?us-ascii?Q?WJMDXni5aKc0y/TkCeGFjS0OG/96yQS24xp8pdMI8vEuDTH+CdnFjejIBxgC?=
 =?us-ascii?Q?yjGEYYahLOhoffbDPO+XRxpQtM8P032XNb+/ls0Ycxu0Oi+OupFWH1Ma+PiT?=
 =?us-ascii?Q?9rqxBk/c5pC30XJViqooTLZpIZBi8pDQuySqVDEWvmiMIc7imPFPRgfXqFVc?=
 =?us-ascii?Q?kDD25JuwM0s2Q3lyDDWwo9ZKTFYvmxv8RapPieBAwByfrimFQs0+0HbYZXRq?=
 =?us-ascii?Q?pdZIOhYIr1XmTxoQTzZzTpjUDUk+aN8WO8w+ypf8VJ2uIULULrevOVkzPIhJ?=
 =?us-ascii?Q?VuMoCVZ3sMEj6tuj9ML3ASH7E+PwAOh+QvtYFzgi6aYMZV0FnrxnhmWe7urB?=
 =?us-ascii?Q?LRP47r812RRn7AhD4xi+PIFyDwZts2RrScUObpqW1338V0zWyBb/GPwUgYrw?=
 =?us-ascii?Q?Z4ifLCE1fuN355pr7JeCvf2o9NOJIizNlHTM+zPa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f298f1ac-ff3c-4aa3-7f4a-08dda4438646
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:13:28.1230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhxB6MzrUMuRffWPUWotzPkyofTF5VoM1EmyerNXGXi8AMBU3y/T77+qbAoCWnHNxFj3yMr+SWkjgKULRJgehA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_081341_513218_98470BDE 
X-CRM114-Status: GOOD (  37.34  )
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

On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
> Hi
>
> On 6/4/25 6:00 PM, Frank Li wrote:
> > On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
> > > Move DMA bounce buffer code for I3C private transfers to be generic for
> > > all DMA transfers, and round up the receive bounce buffer size to a
> > > multiple of DWORDs.
> > >
> > > It was observed that when the device DMA is IOMMU mapped and the receive
> > > length is not a multiple of DWORDs, the last DWORD is padded with stale
> > > data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
> > >
> > > A similar issue, though less severe, occurs when an I3C target returns
> > > less data than requested. In this case, the padding does not exceed the
> > > requested number of bytes, assuming the device DMA is not IOMMU mapped.
> > >
> > > Therefore, all I3C private transfer, CCC command payload and I2C
> > > transfer receive buffers must be properly sized for the DMA being IOMMU
> > > mapped. Even if those buffers are already DMA safe, their size may not
> > > be, and I don't have a clear idea how to guarantee this other than
> > > using a local bounce buffer.
> > >
> > > To prepare for the device DMA being IOMMU mapped and to address the
> > > above issue, implement a local, properly sized bounce buffer for all
> > > DMA transfers. For now, allocate it only when the buffer is in the
> > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > DMA-safe I2C transfers.
> > >
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
> > >   drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
> > >   2 files changed, 46 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > index bc4538694540..24c5e7d5b439 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
> > >   	return hci->cmd->perform_daa(hci);
> > >   }
> > >
> > ...
> > >   }
> > >
> > > +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
> > > +					 struct hci_xfer *xfer)
> > > +{
> > > +	if (!is_vmalloc_addr(xfer->data))
> > > +		return xfer->data;
> > > +
> > > +	if (xfer->rnw)
> > > +		/*
> > > +		 * Round up the receive bounce buffer length to a multiple of
> > > +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
> > > +		 * transfers may corrupt the last DWORD when transfer length is
> > > +		 * not a multiple of DWORDs. This was observed when the device
> > > +		 * DMA is IOMMU mapped or when an I3C target device returns
> > > +		 * less data than requested. Latter case is less severe and
> > > +		 * does not exceed the requested number of bytes, assuming the
> > > +		 * device DMA is not IOMMU mapped.
> > > +		 */
> > > +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
> > > +					   GFP_KERNEL);
> > > +	else
> > > +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
> > > +					   GFP_KERNEL);
> > > +
> > > +	return xfer->bounce_buf;
> >
> > Why need use bounce_buf? why not use dma_map_single()?, which will check
> > alignment and size to decide if use swiotlb as bounce buffer.
> >
> We do pass the buffer to the dma_map_single(). I've understood swiotlb is
> transparently used when the DMA cannot directly access the memory but that's
> not the case here.

why not? even though you have to use internal buf, why not use
dma_alloc_coherent().

Frank
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
