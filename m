Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5D9D59D6F
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3OBzZFstayMZx/jn8mim1HBypADjEikAMvIyDDTLEM=; b=4q3Z7lYpXmyDoY
	iZTM1LbHFFidaKgz532cOePaG7CQb8XXvXSpZn/Bo1Xss8B6Wf/lvDs1z3VtY8kWGVZOJwY6IlvL/
	dOxViOjhXIF5N7IEnuosO9jzefiapa5DWo0r2qUVYFf8v/SNML8fRhKhTodiU/joGmDmYjdfHuLyq
	v1lGLwImDlkY4dKvnT4zQkVo8fGcQdUC/EbxG5k7zzpfbWd7brmpDPdWrnRaXOMmpwuHbKoOEH8Ww
	I54uTOlqxF8+PIsX0gweCWfScQyJVivwCLf0mZ0jSU3V7ARWLY8dVJtrwSsJyXXIbAwS4mxFYfWOJ
	e5Lp8PK1lNcB5P+GcBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU765-00000000u87-27O4;
	Fri, 12 Dec 2025 17:38:31 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU762-00000000u6I-1rUV
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 17:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkIn4cdW9V+Zu/ipov81EEwzUIdcwz8udlpmx1jkahoYBJ5r9ldnfCoDmvFY65X626N9bC1OruYLycE+Aq6apSw0pv0S9wAuvTHPvOia6bA44T3U8NbW3lds6fo7obEGheJMi0KnApCTEEKAKoGQUWs9FzSGi8Yo+ld8fLsU5hEFEv8g2wD7XGQpWbOKMDRSANCJryhuphQDmUrlOnhjjgGJHMcm3X+8PwzbAFwrBi5wOLp0i3FcqZbdSKJuzmMCR1FWgi9D+ENTGRNMn4jvfdHYiM8FnL51suXXkg4mGzvIyqM6C+NjzWHD31e7YGEtGg6RBvP18iILLkroP76XiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0ZbgsZVj9RfgC3vaXQEAxzmyfGu1UeZOmP4dYZrNyE=;
 b=hex4ORSm7hBjgA7P07QoQcRxl5D053v5VX1v3DZAgPhgAtPWHGgi+YwxYon3zLHIDy4/KFI+IN8ajleLNEW9m1MaC5pMAfDAH0bxjHy3Daw1taInsd9Iy+cwI5dZcRvr54/4CWc9qjqdhet+kjgPdJ5b5gY4TZ6eL/3EhktxWLJCrbgBZZEjgMFutM0Bqi07C679PKUt8yrh+47KMtad9ZCMVy7/eXQRD8/f5WA0PSwG/b+F1b9I6pCzd3AAdPpm+lz+R+iVhSJxe07BRZ83zgfZCW9r4ip7rNtCdhjvO/0uh1Vo2xJJOVcimoDh28zZLq17Bqd/t3ybSFwNzr11mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0ZbgsZVj9RfgC3vaXQEAxzmyfGu1UeZOmP4dYZrNyE=;
 b=Dv8iBfFU0pDMiT+80DWo0fa6axhvNe/MZPIxVh1FfSM9NJT0oDSLNdqR4h73xd2OCDQyGB5esgvrl5I1NPuj8IPfacmM5eOHzCAvFAc6iyGX2EhjzcpPzt+npXTTqXYtUR9SPy7MCt1GnYeks4lEHABUq4m2XarurFr5duR6rrCtiWp/8Kxe3qLdjajwYYDtS+93UOv0Tns24EiVS4I2ZmIpO6MMgab10jArtwdleFbYEoQkhaGKcp6c/1SZ8TkxiiPdotaZ1bJoDe9X2gZBmOVYsyJpTOk4Y/ZgmMT71Sqn/VRXEIwcJyTOjoWY525CPDmDungc3jA3qvXFcNUSJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10533.eurprd04.prod.outlook.com (2603:10a6:150:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 17:38:22 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 17:38:20 +0000
Date: Fri, 12 Dec 2025 12:38:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
Message-ID: <aTxTBmeSBPv25b2I@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
 <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
 <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
Content-Disposition: inline
In-Reply-To: <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
X-ClientProxiedBy: PH8PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10533:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b44030-6853-4108-a1e7-08de39a53dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xvVdv4su1OyAvRrN4C/9OlNW4ee9hzkIFPqDhi36bpAB9RgQtzds120CFGLh?=
 =?us-ascii?Q?NN5Jdz8l9leADNWom6vbajrqWOn8oEwhpgQqSwsGGJv9l/qSqu0lx1pqJPCL?=
 =?us-ascii?Q?8dmKO9emdHdQ0tzEEq++Fc7QlEkc/TctNDqewer19BHiW7O5n41Ff0vny9JF?=
 =?us-ascii?Q?Ab33DGLw+cFU+xSpazlsas7n/vpBr+5zSPcINw1ViwMKeRdG0/1HqpWkvlXE?=
 =?us-ascii?Q?pVd9jOl2FLbcKRpglEElCRLMmYczDhE2v7fGzDaUIOGqGIPaJn4xFG1bJVOd?=
 =?us-ascii?Q?W3QOQmf48JPWEfpmDQg0/87n568IMVtKeLy0qGTHMCtVuPXUF5lNQZ+LxKmq?=
 =?us-ascii?Q?C9+4a3zlqj4POZeSRT5KyHXXCm9V+OI8eRZ095QQrJ6TQGPJGXDMu+frRNNt?=
 =?us-ascii?Q?Lolxh34C+jLw2leZ3AyAzI8sUuYPfrTZO2fIWUC8iiemRZdHVDnH+saRpOt3?=
 =?us-ascii?Q?4mHpUVhi93LLZuk7sRO8qmVwl+rPW1pCB2dAEzrWIqLH7h/a/6tSWuONx6ms?=
 =?us-ascii?Q?eMm0EVtNIt7ak7pu2sUErs5lsrJKTY/K99Cod90IubKjQU4rJIw5NxWV2Ppx?=
 =?us-ascii?Q?Cgo6VnI/uk+D4OGLLWy+Ug5HZzUyzWiBaM/q+scIQuNmN/MFzB53DDBk8g+I?=
 =?us-ascii?Q?MdCWsXFcfVUVa+PqpSRD/VPyeUQchXS1yrnQOMtEJZSfkN1Iap64OeYZ5b0j?=
 =?us-ascii?Q?7ZB6QsWQUNe6p9AQXyuk+QLa18CoDIaIsGouybJILidvQ08A8Ho5bShIikRv?=
 =?us-ascii?Q?+Vd46ITtL3dblL95mJakyO+s2l4ZIstPpi+kviaSwyzqViOjF/Zy9XvCR4Gq?=
 =?us-ascii?Q?RBVSQo4nPiySATZXyUmMDoP0TnmNPtnriGvJdLKr0oH0MTHJvyOJp2WqSmzl?=
 =?us-ascii?Q?XLvkDZZTN31hECYVyGV2HDEUXQRePQLELScFofZ7lYvG7Svu/y2u5cyRra2m?=
 =?us-ascii?Q?l1zz8Rcq4Zzk5K1zP23rq/Wj+EPK6kprReLdxCEBWMRdNXi58l5NzJqRClNz?=
 =?us-ascii?Q?VFR/XEYi7qP3IVZHZMAu89FODIuptTIK8lCELzJ5s3YX7BvthCeyP72EIVoU?=
 =?us-ascii?Q?E2n9lBAbWOuYwrFcz4y7M8GFChVRHpv32P2fq0gRMbHpBTe3b+EMVRQuIa2d?=
 =?us-ascii?Q?lX5fbfNCqkc/aKdpzrCLHXBsSdGueZ2NeiZ/uL5qgsYPqf5YPGwpnnf7hWLV?=
 =?us-ascii?Q?8jQ1okHsP+hv3ez58l7Bk2oTNudijrCDCbq0+uwt5dkj5sxB5wsoU65mKShA?=
 =?us-ascii?Q?S4wSL6UYSuGQ7X+xNiF3g9dO8ROMBtQR4O5zjIgFqiPLyhcCfkJE4ZrsgQ0L?=
 =?us-ascii?Q?4eO8YPcM8krw6ikqSBz99FMKgiV0ot9P2wajvfxI8J8ZyEWDL8ePg88uZ4vX?=
 =?us-ascii?Q?soDL63olBlW63YkhuKE9IpV/QF0ffVUyy61/orYqM7uWm1ZfPX4Xze0LnCsd?=
 =?us-ascii?Q?AvDpQw8+Kv8Y6yVt+j6558v2ZZvYlRzVa0m412uOH06tUITWLlGV/CPBH4ei?=
 =?us-ascii?Q?KiI3tn85xFD2Nud/S5UoJm8PJft/iNnrXluE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jzz8af8k9rioGDnWHcn1lLtC0hO8k/DwovovO6XGxNAtuzvnYpOGGD8Mnbh6?=
 =?us-ascii?Q?3xn90PxwFy6+JQk4Th4TvKrhLnYg9UF7yo9IieDYCGeBIqdBu7wiPIs8ma8M?=
 =?us-ascii?Q?XFGcLj2zZ7Hz+aCUXpAWQv9EXVe0uBo1LMMlO2ZRIr+Yz5ACJReZ5+d/XK0I?=
 =?us-ascii?Q?JM92r+i9krig0sjSbrBY6bcwzJEkvJOlsDdNqGpz+5kZNVQsIO1iPSe/zs50?=
 =?us-ascii?Q?alxI8Lf7bWe/u8vFimUlSV/RW2ETt766ogJu0CmpofmmjhNBZXy0tDRVzfOf?=
 =?us-ascii?Q?riIIKszFfZT1CLHF6G9cB64AC0kWtzCo4QwxASjbH+8CwRupAJns9mbsr02m?=
 =?us-ascii?Q?qHFh9cEdzKhGbwf+O2ucL7uZFZ2uhX5jFOLqV/wXMA3OjAwlpRJb3B2dAWVe?=
 =?us-ascii?Q?cXJDhiYfz7z8mVtf3UTtr7lfFQqorf6HG2aDxR3MIicuNeHFRWOlxnn6xykC?=
 =?us-ascii?Q?v6FJLt2bUYYeVLT6yv6/LvEQXxv2JcnaK5SpNoht7J9VMVAiwZLK2HLdWJDg?=
 =?us-ascii?Q?8zm3Io0V/a8+kZ8GcgH4cWbBj8Hws62gkntEeorFv8nn9gU3AuRq7KdEjjuO?=
 =?us-ascii?Q?nZ9bz+bzejP7oQSwyij/7YVQqrpd86gufD+4qGM9/iyHDK5fvMPZrRB24oDn?=
 =?us-ascii?Q?HI5mYmO4Y9Td7JY1CzSVBFa8hWAIBbhAbsX6TkZgyqNrXDI6Zp5lg6tmeA6q?=
 =?us-ascii?Q?xthhkrM3v9FKgl2lFTVElalWeq8YuPA1I/I7T9ZfGr5r1FU5qULnpXhaBmgF?=
 =?us-ascii?Q?g3LSuD7BhZ6XuruogdGcK7PQpp53gYunZLNIIO17Z3OMpgi64WRjB2J1FzU6?=
 =?us-ascii?Q?jzDHWOBr+XXcKVmlDM7k/BTshLrH0twvyTx8p79aHWUuxKhntrvnMKg3M6f8?=
 =?us-ascii?Q?c1Z9E7o7RiccYkSc0xIyBYXKga7R15B6Rf1AYn4/LkF16/YBFg4N+Tjw21o5?=
 =?us-ascii?Q?vP2ITphDmP8p2sPDvB2w6H6BtYxL1vOIAB+UX13ae5ZHwDZGqmrnWaUfXGZr?=
 =?us-ascii?Q?OHCj40cP0ECcALa+dpXKzgIqAGd4Ufv/JOGRcU0uRFd9am0TOZX2m1WX2Jup?=
 =?us-ascii?Q?P4EJZdMbQNRoEjryFJwVX8bTbHaMUhnsg4P6Lz4LU+GOijmv4hkQnwpnDLUp?=
 =?us-ascii?Q?eD/zFosEIXIfeCXieorVNaW/TtLdSO5NXqAepKCuW9/XdtOEziR43ayY2p6k?=
 =?us-ascii?Q?7eMPgXqB5zVG7t0byO5YGeQLZc59DvFO4ox5BWRrXo9ONsiadmB2lKuqwiDi?=
 =?us-ascii?Q?kdE0LognaxMfM8WYRwfN2sPxM9FmmiyonIJUvoxKMi2MNfVpli0oVTgtcUll?=
 =?us-ascii?Q?ZtwPkGSf9h+U16ccgH+Q0CozWbKFL7g6KZHxfg8YnYgrkuFNxQuiiTvcUuxJ?=
 =?us-ascii?Q?/42+8uqWYswOD7RLBs5hvTeiuyuRqYrl+GqtEZ8hibwxIqK+fGlrlbixnKaJ?=
 =?us-ascii?Q?/XNOiZaSFdqZtL5Uu0k4l3TNyQX8gvSi0fUbBkYhV3/aCUfKMr4s5ohZ6YTE?=
 =?us-ascii?Q?QC5S+xQtYgdMMK7bAd0fOMB0nVsxA/lDfRvZvio1y70kvdNd7dyZxWWNwQjA?=
 =?us-ascii?Q?6rCGNctUjpymO1VIvfDXgduIC/ZAtx0B6mqk/yYJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b44030-6853-4108-a1e7-08de39a53dc5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 17:38:20.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wc81qp3SfmVchfTHODi8LmqHzSBxWhAJPP36rLANWz13n4nkrYZXdJJb0WxbqYBMTSOSc4jUC+8bpKJpq2aPyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_093826_493598_026F9696 
X-CRM114-Status: GOOD (  23.75  )
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

On Thu, Dec 11, 2025 at 06:19:56PM +0200, Adrian Hunter wrote:
> On 11/12/2025 17:40, Frank Li wrote:
> > On Thu, Dec 11, 2025 at 03:48:05PM +0200, Adrian Hunter wrote:
> >> Use pci_alloc_irq_vectors() to support all IRQ types.  Do not call
> >> pci_free_irq_vectors() because it is unnecessary when the device is
> >> managed due to the use of pcim_enable_device().
> >
> > pcim_enable_device() add action pcim_disable_device(), I have not see
> > pci_free_irq_vectors() in pcim_disable_device().
> >
> > Can you tell me where call pci_free_irq_vectors?
>
> pci_alloc_irq_vectors()
> 	pci_alloc_irq_vectors_affinity()
> 		__pci_enable_msix_range()
> 			pci_setup_msi_context()
> 				pcim_setup_msi_release()
> 					devm_add_action(pcim_msi_release)
> 							:
> 							pci_free_irq_vectors()
> 		__pci_enable_msi_range()
> 			pci_setup_msi_context()

Okay, it should be that pci_alloc_irq_vectors() provide auto free. not
because pcim_enable_device()?

The below statement should be wrong.

"Do not call pci_free_irq_vectors() because it is unnecessary when the device is
managed due to the use of pcim_enable_device()."

Frank
>
> >
> > And move these small patch ahead in serise.
> >
> > Frank
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V2:
> >> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> >> 	Multi-Bus Instances"
> >>
> >>
> >>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index 8ade911e3835..0fd3587671e1 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>
> >>  	pci_set_master(pci);
> >>
> >> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >>  	memset(&res, 0, sizeof(res));
> >>
> >>  	res[0].flags = IORESOURCE_MEM;
> >> @@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  	res[0].end = pci_resource_end(pci, 0);
> >>
> >>  	res[1].flags = IORESOURCE_IRQ;
> >> -	res[1].start = pci->irq;
> >> -	res[1].end = pci->irq;
> >> +	res[1].start = pci_irq_vector(hci->pci, 0);
> >> +	res[1].end = res[1].start;
> >>
> >>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >>  	if (dev_id < 0)
> >> --
> >> 2.51.0
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
