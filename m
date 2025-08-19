Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4933DCA0EFB
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jzePjeg0m8G2nMHYUuWJO5vav6EF8UUAewRIpdWX3Y=; b=Dbt9GQYkafGaVO
	dj0KCVBDg/nHJBmCacP+9bJynDhdNFqp4saY+C2SLVW/hURj3XMqqZyyEroh+YrnQwqD2HMXJuc7U
	kvv4CyCiE/S0od0IfdlD8PrIP+C7FGy7IqlOL4i1gnUlauqwUh0I3zXw3Gow0HGixU05DYYEmBAYP
	2QuZwRX0pvtwXfXg0btXv/1OJhlkV3oedYzxpfee1ZMcYiryUMz55y1kY5Vge+shs9KuoLOpb/OyA
	avqyy/sNz+L6mMfbhwQGqm11VQTUzQ6UHhQpUMRMbCocoJmLhpfe+KHCBMtdBjY6waYgEsFz+I4mw
	Vj3cAmIVt/WnClAlnClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrl-0000000BF9I-474j;
	Tue, 19 Aug 2025 18:15:25 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNID-0000000AkWP-34wx
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 14:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtvehG488izcDOOF2xFJ5nLarUiPElMv0SeUlkGah9HKB6aml59+VzqNtb2xMRbfe1pYL76wEejx97Fo/BHL5lGvgk2xbq8hgn6BCYC4bT0F18PrzN1W7tJKVyJx3tF6QfygcR9jBp6FoWwS0kKaOxd7E7EwUUHwpeMwrSlvzwm0WT6zXD3o96sGSuM3zcx3S/nG1gYOAQWj8M7F3P+0jycuZto1lhGs7+0J7xQIXh5LLEgOoq1aSD0H1OPF+QhNdSZgQ5Hq4cKvgp0DGUqK+NuNlalQjKla921bOs/aDeOubD4YCF1ukCvf5T13I8mT4ms+j3h3RB79x2mfq/nwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwvBc0hbah4KyLjNIDT7z/QetwJC0dXgas0xeLGeqf4=;
 b=pZwbK3a9gJwFlfOGhXY2vo3+YBUQdgflJ/cY0OdMJ0wlbwYxzK82ZKQThAEsIVgXLyLA1ceSwyPhxWgX7EYLwJbwIhbDUb+ul+Xg5byiC5Cd5YpCJEnFRnLdrA5hgIoIB0qxu+fpHNMWIkVVIIhc/zPq4u+XqAQpupbGLHRedMWFOlEgUUVLP03WczERBGHZcbsrnU+tjs4dObDX9AvyNMzo0OLiIUlUb8bTaGst23Z8Q8iUSgXhb/hmhCTE15HmqmT2AfKyGpyr0pTXhJtWjyjDJNiKV2PrP7UnG1lhwsHS4+L2Zno8bCF/PpPBkTT6CjQvvwFu5gfDDELZeMNyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwvBc0hbah4KyLjNIDT7z/QetwJC0dXgas0xeLGeqf4=;
 b=A26teIHy4EnJvc0UiMmhsLuji4yBRusRcUKk/umRSKcK1K+toPM/2ziCo5GGnTfESP2dTZBnoqKV5crdZ1c/lnX5ThpsMYy6FmO+O9XHkEBSjx7Zlv97iZKu7YKUfnYG0MtZUCoZS5f/0uRDH5eSdvUNxjcM2zYu1FRtDKdrOv9Te1zt6++wb8KLjW0o2H8IRIQXQBhedmLnlGkFUk/JgnGNSFoiMgNIkQNdTAz2RKsf0EwomThv5IcUe6A7ngdB7jHmUzsfBeWrIcd83MlDSxbJ3KD2A+Ra9MEl0NxGT2hHysoxGL8Pu0hRMVHIKO8lX8d9rpfeYA72IugIjBxHJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8773.eurprd04.prod.outlook.com (2603:10a6:10:2e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 14:26:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 14:26:25 +0000
Date: Tue, 19 Aug 2025 10:26:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 1/4] i3c: master: Add helpers for DMA mapping and
 bounce buffer handling
Message-ID: <aKSJiQ3r+PAPAcZj@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-2-jarkko.nikula@linux.intel.com>
 <aKNPp+xieX4soWCj@lizhi-Precision-Tower-5810>
 <8c3627b9-9730-4ced-aaa1-f9003b4e942f@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <8c3627b9-9730-4ced-aaa1-f9003b4e942f@linux.intel.com>
X-ClientProxiedBy: PH1PEPF00013310.namprd07.prod.outlook.com
 (2603:10b6:518:1::b) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cda63d4-6e67-421b-2528-08dddf2c609f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rfNbm2LVEdOv4Ga6fPHytz54l6HchbscEcprkTsEYzX5q+DE6H203W1D/JhN?=
 =?us-ascii?Q?Uz1E38DgWXGc4b2HUMCcI1Dlld6O/OE9spy7WRsSoyr4+VYc3ZY6LVATFVkf?=
 =?us-ascii?Q?KehwnAUkCc4TGfnXnkUzoYRCnE6pT/HD3uZ8TjBmJVWvVCh22NQ+Zm+mKHH/?=
 =?us-ascii?Q?cZm2J8SEFYH+psCkcnuPKse5CpPMN6yXGm41wKzd942Ta9UDG5IMVEBYT9QK?=
 =?us-ascii?Q?vC7AXQb/52mn6Dwq1GkLjW1j54xh0gJTTlaOErkTUBN2SeDxQZBJKDxF/jd6?=
 =?us-ascii?Q?sZCLPSZPV+wFSPJx++H7ksRIC96knsrj3Cpx6hhBlnFjIb7atX1BwMY+DcQl?=
 =?us-ascii?Q?kP92jbSx5GSWCm7Dm7fkV/gRl3yCE6I/ISifGfSVz+hiB9Wkvg0yCiM5cDHI?=
 =?us-ascii?Q?yz3weTbLlQxRRr9DhsokMWmtkvB+EmFjRDZq+S+mEWZ7nKDcePdJqj2PZmIc?=
 =?us-ascii?Q?DYBl8sbyiZYk7mLwanC484WjwLlInm2qMjv+IvHfF2JcFbowyAWVODxfrcED?=
 =?us-ascii?Q?MB+iF7dZPL8htE9nvxzkB5PribTmnXdR1XTlrlIx63n4LT14AjJzcp68rE0H?=
 =?us-ascii?Q?GggUvOFrh6PE08n49IUFFtnqeV7VA58KP0F5e1KPfMR2sMJFoHWlz86d1WNP?=
 =?us-ascii?Q?64eH6cWJI87Uv5s5Q18dmoiB5AuKNU5pY6Rp52VMeb9E2C8UVfl1CAS4TQV3?=
 =?us-ascii?Q?nTjoL1a5Yvm9NbysxRNy4ODIIPQgO6oMKAtnG9SbUoD18B1sgRVVT+x9pc1i?=
 =?us-ascii?Q?fJe/caq5DJdIMXcqBbsBHLqFuKQajMuXIZS8A2NGTxLRFISARRbA64sh8/dY?=
 =?us-ascii?Q?ePU5U6McTnlHc/9PJnmK7Xac9W0kunUYB+TnoXT59kDH3SAjaAJQh4/JY1Ty?=
 =?us-ascii?Q?5Rok5HvsMTD9k5cn8KehDnHArHecsnxYQzq7jnk1EJgGXFn2sLiYxcPzaHxK?=
 =?us-ascii?Q?PD3TTTivYTPLw2t7yBKF4byMkxXMwtC7Cm3f0ghRm05lZ2JhPY/VGFfST7qi?=
 =?us-ascii?Q?wQ0LqRGHbyPdqIL6Yvaac9kjvODxaZHjA+WVOn0Jua50vxgpTE5aANqnherp?=
 =?us-ascii?Q?Pnhm2XIJhFbm3+sv0ZBewEEglzUZt12zNjezGog/2lf7m33JHeDxQOKxyQ2p?=
 =?us-ascii?Q?eH5BCwjTgI/GVEd188HAzIOUnZql3if2sRujZcsGRQ8j7RqSJPIA31hjvXKr?=
 =?us-ascii?Q?qgT8ySAhOUl/FKCs1KpMmEmLRx36DOTrS+o7YYttyCJtEYZstv215YbXQzQ/?=
 =?us-ascii?Q?cwlo0enF5rq5sEaxR2UiPaAR+i2IX8YKLSMivfSjj/eCNm06cX+2xUBJzrR4?=
 =?us-ascii?Q?U8UsxLMyo4jn+0wf9r6CGf7+aaAAdyf787MOTaDGLAZ9hylpzS6YYnRMNImz?=
 =?us-ascii?Q?JNtYY8auo9fbpKpBaReXoSFSOcLqT6J8yaAKd3W2op+Nz/Le5oJizupYSR7h?=
 =?us-ascii?Q?mwcLeFvSoco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QB7AP9KuuLXkrNwL653NXkCOMZbAFgoAEBxw6m55gGmJnYfIjlRvQHaFobsf?=
 =?us-ascii?Q?EVQudc2lAX13+HvHrGisb0MqPnWy9MWZOjbHTGQsT7oYkG942wVm5Y7YJn/8?=
 =?us-ascii?Q?JcuX/8Iid61pKbofnfikYZJ+Fzmj1V5aurKjF0rLCZymfNCuJQCzav5W8Hpp?=
 =?us-ascii?Q?lNJMAFOfvAeh4+3fF4cuFkQuWkUCSgJ20aUTm49pBuxRcXdwwsZbkNcGThfI?=
 =?us-ascii?Q?bRSVIs0Wx+0F55LE7s+EYvfK3SDycBQR11Zuqr5pbbcpNLsxSoJT4Y6jDqcz?=
 =?us-ascii?Q?IFn7FXlQDDIM5C3yX4NGjbY6iCqO+rIN+OcYE2TPfRlOG8czBrnPJdI0gC2n?=
 =?us-ascii?Q?Fwzmz2ok+C1gxyhtPGxJTvnzW7CxsWe2giLU85Vn5MLKm+mQZAfHMdCmNGNj?=
 =?us-ascii?Q?H9k1vAX2vARhqYTElzPL1bVyDC7+mEQNEJePCNlIXg+9/KAq7FthatAEj01o?=
 =?us-ascii?Q?oFeAsrze73RsfCN1sKc/D+dz2qOmZZaeGu5Caf216UxTlQTo4oOC74yROYWb?=
 =?us-ascii?Q?rqD5+1yQLmO9kyY4qaoGV6ee2OVLm/V0aWrqtb0edPxvxWLwCEHDkECQNWW0?=
 =?us-ascii?Q?Aq1+PlYlj42wZbW3Wf4OudIIWZfOUpWIgx0a7GAzX1ky6L0VymruWy39S4bO?=
 =?us-ascii?Q?pLDXxR46NhPhBBktsEyDG/At7pfJdWi3s662QnkTsmrRX7Nh8HkJUMKs05BI?=
 =?us-ascii?Q?B/EDGNZjcgyU4S7tXTkZOsYVnLrZNnizq6+1qToKykvYm23CjqX0mWsbSzTK?=
 =?us-ascii?Q?qbsgnoCpNebx/wmDKna4xkJNFCv9pwyt8zNHc6nXLmqXhXRl8KsvRV/Xsaxl?=
 =?us-ascii?Q?SVraVOULtfWmXAZpSCUcpeCEcwAJYW9zn0yLV2DVT/6ZTrLwU2df5+BYkvbU?=
 =?us-ascii?Q?Ajj98A+/6yCIymlK6k0OfFmEjsIwezMcnSL/IW+WphfK9PfIDp5TkHQCTxKL?=
 =?us-ascii?Q?53fpOKoxjUW2P2E28p+6rRB+rrgDfVTfxDnhOKKGHb92yNh7lI8GsZszC1Uo?=
 =?us-ascii?Q?b2o/CIFx5pk8KuTocEDo34F8BJvV1WR/arEysF4VFIlALA3QY0kSQ1cnUZrX?=
 =?us-ascii?Q?4UFlDjE4Ke9FvrbHMs/bg9+N55aJIIwMrdhupTPGJPCBWvJ08Ha/n76WehhR?=
 =?us-ascii?Q?zdKcCnfs7z67xz1j62Z08m51S3fRsi1uae9nQqzor6qtCV27XNpbzDzROwAh?=
 =?us-ascii?Q?oUX1IZKren/N12tjoAxxsFRLbPLB4v5WJi1y19n2kxeOk2wghcErVGbVNVil?=
 =?us-ascii?Q?cPK+yH+jMYuXj/n/XfihOQ6tEFT73xYJIsUSgnFquZniL/XnLAS3pAqq8wW8?=
 =?us-ascii?Q?9ahwQdeh8i8UlOECPupzZvKMCYo18bvtk80nbyta+7KmdaQ59E6AKgA+fJ6J?=
 =?us-ascii?Q?CFdYxGUJ+8gDjns7IhtcVq+a+phH6vO0extkmEAVW5TDViCOngbp7qOTZEas?=
 =?us-ascii?Q?ISbFnSjMKyD0QwIykCKDIrPgEvAf2kVX00/NA41rSgUeqV92Lg+K8rd6ceCK?=
 =?us-ascii?Q?DM83t7XqPnplR/RSYIbumbHo1n3cz2rmsLU1gN9VJ41nbdKJVlk9uz6V/KiU?=
 =?us-ascii?Q?mhoyBG7DR0H37ffQA0hPSsoDfanO5FWzH5xWhXmV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cda63d4-6e67-421b-2528-08dddf2c609f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:26:25.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bw5XjtXtpizYfqBAPv5RiWApfBDBPMyIF049oDSTD0dOSTtESTpsiEfpS6ixNjch5AbJ46/ZCeAjZJcM5a4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_072629_773479_4E2AA8CA 
X-CRM114-Status: GOOD (  30.24  )
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

On Tue, Aug 19, 2025 at 09:08:36AM +0300, Jarkko Nikula wrote:
> On 8/18/25 7:07 PM, Frank Li wrote:
> > On Fri, Aug 15, 2025 at 05:12:39PM +0300, Jarkko Nikula wrote:
> > > Some I3C controllers such as MIPI I3C HCI may pad the last DWORD (32-bit)
> > > with stale data from the RX FIFO in DMA transfers if the receive length
> > > is not DWORD aligned and when the device DMA is IOMMU mapped.
> > >
> > > In such a case, a properly sized bounce buffer is required in order to
> > > avoid possible data corruption. In a review discussion, proposal was to
> > > have a common helpers in I3C core for DMA mapping and bounce buffer
> > > handling.
> > >
> > > Drivers may use the helper i3c_master_dma_map_single() to map a buffer
> > > for a DMA transfer. It internally allocates a bounce buffer if buffer is
> > > not DMA'able or when the driver requires it for a transfer.
> > >
> > > Helper i3c_master_dma_unmap_single() does the needed cleanups and
> > > data copying from the bounce buffer.
> > >
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master.c       | 69 ++++++++++++++++++++++++++++++++++++++
> > >   include/linux/i3c/master.h | 26 ++++++++++++++
> > >   2 files changed, 95 insertions(+)
> > >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 2ef898a8fd80..497bff57248a 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/atomic.h>
> > >   #include <linux/bug.h>
> > >   #include <linux/device.h>
> > > +#include <linux/dma-mapping.h>
> > >   #include <linux/err.h>
> > >   #include <linux/export.h>
> > >   #include <linux/kernel.h>
> > > @@ -1727,6 +1728,74 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
> > >   }
> > >   EXPORT_SYMBOL_GPL(i3c_master_do_daa);
> > >
> > > +/**
> > > + * i3c_master_dma_map_single() - Map buffer for single DMA transfer
> > > + * @dev: device object of a device doing DMA
> > > + * @buf: destination/source buffer for DMA
> > > + * @len: length of transfer
> > > + * @need_bounce: true if buffer is not DMA safe and need a bounce buffer
> > > + * @dir: DMA direction
> > > + *
> > > + * Map buffer for a DMA transfer and allocate a bounce buffer if required.
> > > + *
> > > + * Return: I3C DMA transfer descriptor or NULL in case of error.
> > > + */
> > > +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
> > > +	size_t len, bool need_bounce, enum dma_data_direction dir)
> > > +{
> > > +	struct i3c_dma *dma_xfer __free(kfree) = NULL;
> > > +	void *bounce __free(kfree) = NULL;
> > > +	void *dma_buf = buf;
> > > +
> > > +	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
> > > +	if (!dma_xfer)
> > > +		return NULL;
> >
> > nit: add empty line here
> >
> > > +	dma_xfer->dev = dev;
> > > +	dma_xfer->buf = buf;
> > > +	dma_xfer->dir = dir;
> > > +	dma_xfer->len = len;
> > > +	dma_xfer->map_len = len;
> > > +
> > > +	if (is_vmalloc_addr(buf))
> > > +		need_bounce = true;
> > > +
> > > +	if (need_bounce) {
> > > +		dma_xfer->map_len = ALIGN(len, cache_line_size());
> > > +		if (dir == DMA_FROM_DEVICE)
> > > +			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
> > > +		else
> > > +			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
> > > +		if (!bounce)
> > > +			return NULL;
> > > +		dma_buf = bounce;
> > > +	}
> > > +
> > > +	dma_xfer->addr = dma_map_single(dev, dma_buf, dma_xfer->map_len, dir);
> > > +	if (dma_mapping_error(dev, dma_xfer->addr))
> > > +		return NULL;
> > > +
> > > +	dma_xfer->bounce_buf = no_free_ptr(bounce);
> > > +	return no_free_ptr(dma_xfer);
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
> > > +
> > > +/**
> > > + * i3c_master_dma_unmap_single() - Unmap buffer after DMA
> > > + * @dma_xfer: DMA transfer and mapping descriptor
> > > + *
> > > + * Unmap buffer and cleanup DMA transfer descriptor.
> > > + */
> > > +void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer)
> > > +{
> > > +	struct i3c_dma *d __free(kfree) = dma_xfer;
> > > +	void *bounce __free(kfree) = d->bounce_buf;
> >
> > This simple free, call free(dma_xfer) after memcpy directly.
> >
> I'm confused. So should I use __free() infra only in
> i3c_master_dma_map_single() and use explicit kfree() for dma_xfer and
> bounce_buf here?

See previous comments. __free() help reduce error handle. here just add
complex instead of simplify code.

Becuase mipi use build in dma, __free() have not help much, but it will
help much if use dmaegine because may dmaegine need check return value.

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
