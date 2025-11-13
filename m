Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBE0CD8C96
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiYgf/LRJ1mrQuyFbif0HVCz8ls8xqOO7rdpNnhqi3o=; b=px808enCgON8MT
	fiC+oVmnJGT4XdH6Q9V1NU/uFGl8aCw9/PhvNfi7PMAxUOIVXalTu2QacAcGqP+PXB70CDVPjcBPw
	FI32DrQjvSisL7E0XKdp3U12m0Q+YMus95edqnxRA1KStrjQuo3PPR6UbDUBUSWeJOOfbX810RwxN
	N6gqzvVHt29E9/Oz20yEPHYOdgTC53T9zZmu0gKaXDV+8ORUh0jeaUW3Vua8+gFbUHQTKtChCM2hb
	KdiUaGPvalR1SscI6bVHLWW7e+9QWE4eqHd0KWduYoeqB3jOWmnnTEGG4sfrLpfrnD9JaTJBcbCQm
	BRL878jFSARSlaa+pv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa2W-0000000Ampc-1uff;
	Thu, 13 Nov 2025 16:19:16 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa2U-0000000Amno-0KiI
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 16:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psGtxsgEx4K/XXAACJtEtkK+tRppe+KqWScOJgmoGaWM9DMe0podZ9rJjCMgrqB2u5VN4X3JH177wgoLq6UnwD54yB7cpwWCfD3gDJNT0eaJHE1oW/GN9gcpC6I9xHOZbM8B9WRO0+Pi8Xu7a5uX8C+eA56B3d7qRCCPn7+sQ7+VLCX0hYcntipwtnw7d9Qcji8jDALpuZo6CqIvWAT7LtkZgQ0RPHKZimDNzJsF3J1EsZLJqVlkg96014qNwa4Xa0Q28rHfGhqd77D4htfOSQtRDMoA32i1IvHTJsS6AHKTK4nbprHqHukhunqObhB7XacFUZwJPwQ0xF/rDTSt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEz9XbW5GYfra0w5h5r6rzJNAm7D9U1PtU40gpf8cLE=;
 b=rFxqM3zbrIFGNHvUrUdsp3ARI3le7/rKwbgVdZAPmvRUGCGRmYe9CRfuAmc7UV/XydkMvBpRjjOWLS+VNlgEp6owkMFeCJM9VeMZvf+/C3uLcLH177Eg0IePMB4krmXcbWdGHcNUi+1MHl/h6y+nRgrQ53gbVz7mxK4QafQF93t2uJRqrLYe1DfFKxmgHpO/1iSuoAIa5HN5t3HjHJHMoRsSXVgLHwJQUZGK+DuQk9QErHcwQJCorAUCIjPMbrliQiAsi4E5XVfMO+62kr10SieIPaLWYMoo0Ck8V5z/5t965te/5wW+JexpWiXNEEOMYb6aWmXd4NxqAvRebxdeLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEz9XbW5GYfra0w5h5r6rzJNAm7D9U1PtU40gpf8cLE=;
 b=lOSbNFw+QlYKWgOO1jyl0AI730IG5i1QN0LF1tHwJ6z9Q9eThGLdGgoAebqGAx01doCu7cfj5VptZUXtsLGrrUsCSHoHS9z1GTGHkzz9Cr/zpygkskSygpsUUzIUIBQF5XwyODk79hnydwGlzzc5dzw24Li1BNs7MqkP53Kc2ccfs9mOSP81FXwi+v+XkQwzFX0nuZpFq5dC/V+sT+8JkWNsJxDEt3FUYnjdf5iwXceg6WNNqIe9DzBTGrIg7OYx72QEHA0zgGL1lcwJHdwdXakBjIjkiO8awFbUksVx9BtHLGCUSAt8WsE+rYXDx9WL8p1C21/8VB2NkHYYdPtnSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:19:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 16:19:08 +0000
Date: Thu, 13 Nov 2025 11:19:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related
 identifiers
Message-ID: <aRYE9Lkn5PDLXTXr@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-4-adrian.hunter@intel.com>
 <aRSuXx00hYqbMzIQ@lizhi-Precision-Tower-5810>
 <ce8fb9c4-53f0-40ec-a296-d8cabef5dfe7@intel.com>
Content-Disposition: inline
In-Reply-To: <ce8fb9c4-53f0-40ec-a296-d8cabef5dfe7@intel.com>
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 771042ed-0503-4d20-0b23-08de22d05f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|19092799006|366016|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?50UniDeHLigNpVUqgh/Zq9Gn8chbYQUC/Os1RWln5yyLR2QSNb46qf73whg2?=
 =?us-ascii?Q?zYwmUk6SutcNGQ/K9FHG/7ruRukKsGfKorsFuCnNo0r9Jvm7Om3kUHIrevZH?=
 =?us-ascii?Q?Ds7avXkLNHPSgQYycXj0msZ9QkYtF3+bc8nkdgu2oRSt/CEytyepvd/YK3Xn?=
 =?us-ascii?Q?dtz4lf30ow1UF1gSd92fRvdvT4zPbfacxyEDYO7jj4Ne4aFsreRR7xfcGM/L?=
 =?us-ascii?Q?wTsKzp5RoRY2ygbo5Kel4Ki1TB9mYUpnzhUGW9NAhvqs0+164TrVJlMYQ8qY?=
 =?us-ascii?Q?rzq85VMMTQ5qJ/b/winSwT3sf1od6//4qPRpUB4myve9UPgm9Ud9i3YeIcxr?=
 =?us-ascii?Q?GODmCypcFFw/yJw8cLWwsM1QuHrubMKXXWKUCK77strTDAZ0gI2ckSzIoBDy?=
 =?us-ascii?Q?6vzlEtT3zU6Zbp80pQgLYbRp+u6KiyZec5zZcLgO7tDrOXQzEnvt1u1j6fSX?=
 =?us-ascii?Q?mI9Br3V6TOorI9ch5Ijkr11wLXwsg9QLfjAW9nN+CW1npemZKHEGMGoLAjOS?=
 =?us-ascii?Q?esmISILBYQFO/a4RjAkJuifmNnZKSbgRFGyluADuopfeNGEmzioaoouUHul9?=
 =?us-ascii?Q?OWhLtw05+3gXqQe+EnCFOlCLjt8QEmcIMIJkPIvGM9VIgKQ0sJDsSIwhPuNO?=
 =?us-ascii?Q?EKHh/aaBF/imhnUBbNM8QL5vh4vF1av2icVZFw7mezeBUfpFBzfnnYtqk/gD?=
 =?us-ascii?Q?mZI/MBexDydS99aMyGI1FegNlwqelJl2UowBa8GPgUC4JT+YBlRQacs8tjzy?=
 =?us-ascii?Q?Zr8jXVpVr58oJNPIx6t1svvyWsBGag+A8nZe1d+QX+gJZKByIq3fJdIzA8wW?=
 =?us-ascii?Q?wR6CAOAv2S6qRxhN75Vy7WMW7GE9XvmsNFojCYkCBRE5GbUJNZH+WaXb4u96?=
 =?us-ascii?Q?31MLYh8cb+WRktj6gzJcmfQ/TrfwbQmxadjv6aQRwhzrOEsN37EWklfFVLkv?=
 =?us-ascii?Q?q/feyxHrLFcaeqGw0ss1dOZ+EPRXgRlAMJq0v1N45y4M82xcEehXkG775WAC?=
 =?us-ascii?Q?oEWru6E/BRAlU1LU8akekiOiQ741Y3/E4mNfVJcPN5KxV2H4BE5IYgnCP3dK?=
 =?us-ascii?Q?xcngLrWJJAirTPxNG4b3rILpAo7EvxXKtjWrNWIuee0O/RyROuoDMzfD1S3t?=
 =?us-ascii?Q?4//Xgkb1FD04BU7HXCCoB3wXODH2sqBAKScJ8erpmRCdLCM9hgUQNMWJrZc5?=
 =?us-ascii?Q?Uhk7jqV/4HM0vx77ucvbJF1akNZMlxywSxAcntQmWIMcU0Sl4bbc5iZ9VDgP?=
 =?us-ascii?Q?E9RadpoXRo9g/BDM//U8Fu9V+aE/nnPwY5eWiqxsPi+Cu1or2JPVnj07ZylX?=
 =?us-ascii?Q?7qrUQkvmhaBEldlSzWWFEM9eNlxDy4RwzegReb6+a4RUsJQbGCY30xn9GlZE?=
 =?us-ascii?Q?GMHI8h4aL8wzPtApfzA4cpP/yZBqsxvXiqnH3ss7dJ1/Xv/vzyD/i+Zsu0da?=
 =?us-ascii?Q?eNFXgiDaimpkVa40f+MM976U64zve8sBfRzLFf73qlkphSLP8D0SPdCiLWsI?=
 =?us-ascii?Q?ZxOKNv3EgCvtqJCnlxO187StQhDZNyOI+6B9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(19092799006)(366016)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOFhjRrWS4At8CbUqkvzI2wtEV0iQu9suoTfwhr4v2tCZVV+tCx+f0m0zuD/?=
 =?us-ascii?Q?O2j6OLdHRKk7VyLS1SCx31EmqgbmJVmEd3gLn+jpUTSz6tZJK/ke+Xaqq7jA?=
 =?us-ascii?Q?jhc4YwX1UkkhcFfPXx+dp33NAgAqxjrBcVYTNUIG5NKdEmlu9dcsj/LOonCV?=
 =?us-ascii?Q?Wxdle0CCcZziwufmtAI77w+RS4PJWBsLvINQ+kTDKnyJ3fGWVhiJJO1TeoOJ?=
 =?us-ascii?Q?jNSjHgA4MkpHG8CphZHjnD85iAeG/9mQEPwEARHdHBVYI7fwlvcZPxFRp8uL?=
 =?us-ascii?Q?FIVbRDyBm1YLSEoWLZUW0ka6nT8AEoDI3OnzMMs0Wy2wO4TasDpFtPH5MNyw?=
 =?us-ascii?Q?7xNQ5qbt6tW7vPKIlkqHQlSle31i0lS3r0F/SEN5xpuoo/756nwB8OiI1/3a?=
 =?us-ascii?Q?7suyfndebTC/NFWPs5el9pQNU9mtB3gVlgRbfHwO+GlYnPqFVtNhnHq2V2nK?=
 =?us-ascii?Q?4/d6LlBtTxAfiCvdvrZ7BTBxF+pIeAqJUCA1rp2EDrueYEzudqtEQe26B+Di?=
 =?us-ascii?Q?PCOa21f4KRIcqWv0mT/uebBHk9rbl18I31vqIwDxIBpFZgHjKZwW9Oe8K2s0?=
 =?us-ascii?Q?me3kDTZ/rW7hh0dMlmPzGiloNsMiUNvUZ3UW5LoDrpDGdsJLrL690iFblG+j?=
 =?us-ascii?Q?GLPyJEnLf8zGNVVIWhz2usIswSAu45cw6XFTu2CmmOMXP+QdcGHVVpNJkSck?=
 =?us-ascii?Q?cYLyhjx4a08T5BgW/yE79eKtgcwpdChQNr2Poj1yj4rfnxzcyqWrvn0F1XE3?=
 =?us-ascii?Q?wg6WqldsubOXQi/b58/Dq4zXGirtPcCImVrz2B4xdpJgo1td9IgECh7fimhA?=
 =?us-ascii?Q?Zu6INbfyNxbYVh4B+3+SioORGjZVyy20zh1ZH1YmwcYuxA1bSaF/fzFWm+77?=
 =?us-ascii?Q?gX7uLobf9k+WR/6Hp3HanCi2jG50yoxy7Fcea1lO3uBRLpGcB1Q+RJDX7Klh?=
 =?us-ascii?Q?nnBRT97rnon7apI3NY4SVm2Hf9qDhk/SnB/A7cyC0U//Kb5T+i1duvwpfBDE?=
 =?us-ascii?Q?yfcSs4Kg5NxW6KDJcdW8vgBeBzLLBmy+NSYVWuEtCpoddVDZ/E3xojAitgko?=
 =?us-ascii?Q?irpAf6g1pRATJVBcHfVZxVBaSmZ3gwtbzLTgqA0/C+ONzPuxMuDEi85xodAu?=
 =?us-ascii?Q?QM4CvbnG6DFaE0wE1JxrpRz2lqqoRI/emJ6p+LoCyC+stwlMl7TN8ubnK88Z?=
 =?us-ascii?Q?U/v9JqTl1NY6OMS8rXdL2yWrsgIzyOpXf6iHvc8RhIbTcygC7sA1QZdWDFCO?=
 =?us-ascii?Q?90HEswVvVmrxQt7lBWA6xmtBunWlGQfMWOuLVHGTBwrpX8MvzTeygzn/5i9+?=
 =?us-ascii?Q?kX6+pB3IKqE2IIuP7Pb67wVdEiSEEFjlcLwfufmK1RsKwHD54nxhSU+gLOz+?=
 =?us-ascii?Q?j7jctshqpDkCuVV5qNfERCxeSvfRIhEIsuB89uTqcjLoPPUcfzfu/XViPawx?=
 =?us-ascii?Q?6AZkyiVysPk1XKGvh4uXu4ogA4906wDlUzrl4eTM0/7Gn+c/svIbPqK1hWX6?=
 =?us-ascii?Q?b9m0l0kBBCsBrmUER8p6MzB8NPC0kC5dQpQ/772xi1DMSsns9Gh/ctyCcLS9?=
 =?us-ascii?Q?Wkodda+vZnQlOtJlpnw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771042ed-0503-4d20-0b23-08de22d05f18
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:19:07.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmTtnmO3Ys5JrC8T/2DJIcmyQCSKxzaiyPOr+kdNcUCHjdIfFE2a7eU9u5v/OCWZdmOS1DQXlSPyhOXDA9EHvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_081914_142644_D53E3B7F 
X-CRM114-Status: GOOD (  20.32  )
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

On Thu, Nov 13, 2025 at 03:01:02PM +0200, Adrian Hunter wrote:
> On 12/11/2025 17:57, Frank Li wrote:
> > On Wed, Nov 12, 2025 at 12:03:29PM +0200, Adrian Hunter wrote:
> >> Rename some Intel-related identifiers to ensure Intel-related identifiers
> >> begin "intel_" or INTEL_, and for brevity.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
> >>  1 file changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index 617826628dc4..c74cc511a344 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >>
> >>  #define INTEL_PRIV_OFFSET		0x2b0
> >>  #define INTEL_PRIV_SIZE			0x28
> >> -#define INTEL_PRIV_RESETS		0x04
> >> -#define INTEL_PRIV_RESETS_RESET		BIT(0)
> >> -#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
> >> +#define INTEL_RESETS			0x04
> >> +#define INTEL_RESETS_RESET		BIT(0)
> >> +#define INTEL_RESETS_RESET_DONE		BIT(1)
> >
> > These are already begin with INTEL.
>
> For brevity.  They are long and "PRIV" adds nothing.

Generally, needn't this type rename unless you need add more registers
defination later and want to keep consistent.

Frank

>
> >
> >>
> >> -static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
> >> +static int intel_init(struct pci_dev *pci)
> >
> > intel_i3c_init() ?
> >
> > Frank
> >
> >>  {
> >>  	unsigned long timeout;
> >>  	void __iomem *priv;
> >> @@ -42,21 +42,21 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
> >>  		return ret;
> >>
> >>  	/* Assert reset, wait for completion and release reset */
> >> -	writel(0, priv + INTEL_PRIV_RESETS);
> >> +	writel(0, priv + INTEL_RESETS);
> >>  	timeout = jiffies + msecs_to_jiffies(10);
> >> -	while (!(readl(priv + INTEL_PRIV_RESETS) &
> >> -		 INTEL_PRIV_RESETS_RESET_DONE)) {
> >> +	while (!(readl(priv + INTEL_RESETS) &
> >> +		 INTEL_RESETS_RESET_DONE)) {
> >>  		if (time_after(jiffies, timeout))
> >>  			break;
> >>  		cpu_relax();
> >>  	}
> >> -	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
> >> +	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> >>
> >>  	return 0;
> >>  }
> >>
> >>  static struct mipi_i3c_hci_pci_info intel_info = {
> >> -	.init = mipi_i3c_hci_pci_intel_init,
> >> +	.init = intel_init,
> >>  };
> >>
> >>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
