Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496A7D66B85
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Dec 2025 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnybaQwrtuxmz8YWjhRahBDLwXUbR//SlypmqZ/AGmY=; b=XYbvyZNpRiDtHI
	llEQGAY7WNAIgNCmYEDi8xGr+YCY0nJ391w4jKf3wH5vILPdsdhQae3guuDRLc2CaQwiW/1iGJs2e
	GY8oVYGvxgjSgqPryW/ZfwyFNnhl+/yBYZjylhHEhIXnt/MCvIxN6KBx0Mxa5qw4oN9bFvaHYZ9gp
	B1imCet8mbSPZbAlUgBLZVIFxorXkKybATPDUDicVvn0ypdptiJ6X6KbOfOcnprkq1qm3KO76cQCY
	N/OpxKhAyBNLy7FAPUjWSAwRrNgg8eCrrl3LpEmpzRINiHGKfYk/qKEHJIMYpBkq7GjO9hDvZiR/o
	FyCXhQOfRmfS4XJc9NnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVx96-00000007K9I-05P4;
	Wed, 17 Dec 2025 19:25:12 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVx92-00000007K8n-3MXC
	for linux-i3c@lists.infradead.org;
	Wed, 17 Dec 2025 19:25:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxI0+6yq7XWeKbgDb29mqs4Gh+LYebnhB+hv7oXKfHrFVXKRMshSZ8GoQDN1qMelJyOEMuqXt9XssTPs+Oe9JBLPsCWtz2lMh8S2imD4R6yG36Ux8/XmqojdoX2VrskSXbNxrjWr9Wx3uYtyF498Rx7jHItZYr18vtzffIh4oMzm1lL4B7xjihGcFU+PxvjKlifJrUzPzSZUDa+GmHL8uhyKo5RNhvkAg90r8aN+y7fi+al3W/0iiIoRCflpqUZnzJslyk3SY2qqRQg+PzXlCQreuandCYaeygdIlg1wlaFtE1qQcuU+MAddFGKKRPaTFJwZHuXLGbO9HLt+84T3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4MIh1G1RSjb1smZaB5WoOmfWcS2luGhKCmvePAmHuk=;
 b=ssn5QhumyshXFM/uVko4ky4ewWeKH6GrSik56L7vGYbuFoIjv/rBd4QTqPzh+W44utbTAs1MrNgn1MKURKI+jLbnbw05leZMOHREfLOkybMdA0zOdPZmvDAKx5H4AvTuKayzlcI9NpN9iveWw5H3UjTVy/raXYm8J2NPN+o5ZNiRiL4XQY3rkLGbnZwGww6LTu1zB93bS7i1+qs8J17FKGJrynhLjUkTy0yKDQ4LtwuN+o7Fm3LtgKYGdHdxMFXp7NDzFDsL2KgS3oFPuFmthsVZBjtP9zxU7O6xi9zRB9NxJKNErcWrxV8p/OyijZffYfVXfoqlCZMEeK2qQCssEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4MIh1G1RSjb1smZaB5WoOmfWcS2luGhKCmvePAmHuk=;
 b=nDk5vWp+JYH3ZtU2Ctib2c7FT2yI+fRdqllv7otSkxU1sqVYEtsc2QSKBzvDM89vewU+cQYvbPHVx8MAdWth+20Z6x+QoUYOOO+mUjtRdTiulmU3f2yJ4AN+pAQdSzI5stkN5atsS9lNTqj4UW9wpeOTjJ+2covVu12KrS7UPKkxa+kD4vctrlRPUWJw8zqCxUifJuCJLEp3FL7XoYk7lJVkGLXH69SAtDVIaBX1ZSLlfEvVtYKZvKX7Q6nxLJuLM1A07lNdyGpSLnnWsoXBEydlWe4nRezIhNlC59OqtLy6nGds410QpV8Y3gxb6YxdhBHFMozJ/ccamqebRDXwYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB12018.eurprd04.prod.outlook.com (2603:10a6:150:30d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 19:25:04 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 19:25:04 +0000
Date: Wed, 17 Dec 2025 14:24:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 06/11] i3c: mipi-i3c-hci-pci: Assign unique device
 names and IDs for Intel LPSS I3C
Message-ID: <aUMDi0JWDw9HFkpJ@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-7-adrian.hunter@intel.com>
 <aUGSHCqJ5+4Jwdh7@lizhi-Precision-Tower-5810>
 <bc482da2-5ef4-4162-861e-3f2f0cc9f938@intel.com>
 <c604dd45-fd23-40fd-b757-623e98e96ef2@intel.com>
Content-Disposition: inline
In-Reply-To: <c604dd45-fd23-40fd-b757-623e98e96ef2@intel.com>
X-ClientProxiedBy: PH7P220CA0032.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::31) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB12018:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5c69a2-e5b8-4782-3074-08de3da1fb38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wnKdWECMZfeD1TSdvqewxiOuY+TB4rY4EIdJtnMYeOnn/x6ehUu/hKXPODMc?=
 =?us-ascii?Q?zpC90S9wCfCiFakEgaLjoaaeXvLYCKNbnlyaXBhGIINroYPTeXOteuoMFg8b?=
 =?us-ascii?Q?ocTXllHgIWb1AE9KQDpzSnQuyTwsccB9OkADdmpjxHBCLAXxDCeYaw+S78Zr?=
 =?us-ascii?Q?YqAZcsyEn89kmXoLXzmKLaCK8xCf5lNsDmuYLwUm/aLoRLT3nXh8nSQqfjw0?=
 =?us-ascii?Q?WuJueDJTj4xsloS9kLXLsVvQFb6nReofwX2sChOy7cnJ+f/IKdltR7Lz2pAG?=
 =?us-ascii?Q?xh2uwspxHahyTBNCLUPHa2FRStJL3YLp+2dZC2EqeDyNqoOAgDPfM5MP9/Tm?=
 =?us-ascii?Q?fRvUb5u4TgjJbAHt9LNoIJ8KA3doy3+qcrTfmEGufxtA9Xt7kA8xwa/dRTp0?=
 =?us-ascii?Q?rokZQm8hlw72l4unR3d0fSnshZgyK7PQ8B46NRU2TTLLkRkHVuG/W8PHwlqA?=
 =?us-ascii?Q?07Uw8CkShUjpE72b9hgTTd7j62EZZAbpBM3H3xImbO1B18iBhXjzfMTuyBll?=
 =?us-ascii?Q?TYviMGejk0QnV+rfPsvH8hkDxaiTHK40WqiLKfN8vnS3x4L8riediMrYjsfG?=
 =?us-ascii?Q?DFnxx9CEhDGelPHyAsoQZq3LlSiuZFcDCQn9ffhhIJaPyYsukBsC0Q5Z9Puf?=
 =?us-ascii?Q?XcBw17BqReLMNIuxzw5hXHVgCF85oKUFhpp0qHKhzXdILZy7SSWecHDknhmz?=
 =?us-ascii?Q?NS1VQhbQcIHccplN5piFU5wfihSOmXDpT/WtE9v9h+m+332l839SyCD7KdFg?=
 =?us-ascii?Q?di+2pi6aqsnSjXmYowtSVGGEofPA2rpk2vWW76W4QRRO1BxHRyd8UV8UlvIY?=
 =?us-ascii?Q?YqEFTzrJpEIqGvnkRUWtk0uZbNmOhSgbNR0SzPENmWFOqJgdJk3RPKvCQXRl?=
 =?us-ascii?Q?BR7vHsobzu4zn9rbv6umVhrjqcJGEB5NnfkdWT6z0EEQ4tf+G3Sj6+RlJtXl?=
 =?us-ascii?Q?VlE6tN9zWEQCIbdNB4VqSa42oslfDhhiKuR3ddRFc61MW0DvQXpAOS0igvYm?=
 =?us-ascii?Q?+55cDgqXEsPRvV5ssgvKWi8F4UyYH3ArlpqO3UBXq93LXNn5Qrre7pPJZVS1?=
 =?us-ascii?Q?wQNGjlH8SwpqhsQQfxIA5XiTScLZtJqoH1vV0GjkX4vvI32J4Ah+o6at3FoQ?=
 =?us-ascii?Q?SWNKfSqs9TzWsh1f2Juj0CGfA6oRk4Z82qOEZH9b6fhVCJsHqDCDfTrtn9Mx?=
 =?us-ascii?Q?sF8dZIpACG7elFqmy3/ohhLBEszxEVBu1wAzfwUKKD9EZ6s9/wbIn6ceW2F3?=
 =?us-ascii?Q?K8Pa+Q2Prb93BYdWv63oXCQT0MN9/rqR2cUjQbRjAfIcnec4oVG2eUSec+FT?=
 =?us-ascii?Q?7l57xxIIr5+jwHbBpThG09p0HLHoqxtN734rEhhuGrYt03a5QEGIojAhns8J?=
 =?us-ascii?Q?+WAAZusYThR3R0X+rIxGMGX0BGhtq4UIJcgWGX0siSZh4sI29Zc8Jj9uVBJf?=
 =?us-ascii?Q?+/ApvWklfHPhlZiHV7XkCiVEcqcHJe/12JBEeAv6jJ0faO4mesJ0v8skzeCJ?=
 =?us-ascii?Q?QsgTmmGvW5OBO92mZLM0yn9Jl+lH5Ta8CwhJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MaTWzkipLJm1mrCdKFoRTOgBoSc/qZoA+ePADFykFRr07FK3hp/3OOb5sNX2?=
 =?us-ascii?Q?Be/PRPgB4JvptOKA4HGO0cBuNCgdLNcavebADH8sFdsyx/A8F0pTKSNSfl1c?=
 =?us-ascii?Q?waCYvXkgbfqQguSYXWRU8ViL7V3CTgxPeDuhJ7bpi3PEAXt8KKB0QVAvncu8?=
 =?us-ascii?Q?GuqV4b+dP3EDFBs1Z1X2nprP5/tCrGSSGchJJ7+o+QHZdEYtdPoA0/Hm2Fvn?=
 =?us-ascii?Q?3jTBa9x3/NIByPLoMzsGhWPxs5P8bnS8D3l6GgdyGUI5KIw16WyA8lcUZOaJ?=
 =?us-ascii?Q?/z4cyWFZt5SV8PzLNConcTwFsgrSjwzG/7TGM9G2tHRFzlPfqTREOvZntekc?=
 =?us-ascii?Q?mYmcDtj4hvoiH4HBgxTq9P4gcqngf9YH+HEwR2mJflaUKGJ3/qGoM+rNCKWm?=
 =?us-ascii?Q?sC73znaAUHcZoBhSQentZRWIirPJYxiNG70bddux7cXa68BU1JlpMrOwBIgv?=
 =?us-ascii?Q?zb7jI/VuJ7KIt8GNKbuO4v+0DejuHum6DSLgc+YhFMak3iAjCCoM4sWRNcxi?=
 =?us-ascii?Q?9XeqQ2wBa7B21AjAcNjAVZYyPF53+8pSVY8RPyfahYw3jNgyVTpZza+9w3JQ?=
 =?us-ascii?Q?Pzb7RwwZKC20POFCAbCGDlYOTAVhXTDdeJ+ofneX9t6/h2TpmH4iU7NlPfZL?=
 =?us-ascii?Q?DklSKW9CIfGCO8dR9g5HnCR7sjdpxXIPdEkFxkj6H4pAHUyGhJzURYRPd28d?=
 =?us-ascii?Q?5NRlgxiHcqc1V5PeDnz25xlxdO5uS4j0kcNoYIfeIwhs1k4QgVYDw7kW5iTq?=
 =?us-ascii?Q?18Ik0VJ8a4z3awIEXxWk5OdvO/rxfLf72x4xnb0LJY3UQuqLuWsmcF96k2Z9?=
 =?us-ascii?Q?U/Nie+R23pM6uFyCpRseRcq0kGnj0AN9Z6n5LqngTVYwS5Ztd110FXh+FYpd?=
 =?us-ascii?Q?CypuO3J7WfrQNY//oFDGLsQI8fKrVql78TWkxTX6wpAHUwZIp6OmRQyUwi0t?=
 =?us-ascii?Q?etI6JQ5Fi0U+bFijDQlpKxN05Eza/aA9flynHxoYyG0PSD9sCp94zHdf8Nk0?=
 =?us-ascii?Q?adXcU4b8mL1/ONd21gkf8fTnNXttt0z1M4jsmTXXf06lvAXIzX2qocVhW3d5?=
 =?us-ascii?Q?b/SHK9vutjShCQtSrKNIXF/bV+ggiLWp2+H4hZ9qCGXZnvkreyvvEBE2gufh?=
 =?us-ascii?Q?H9mCiG4lpYPBJO2B0T82SU4Kv26Gc0vhu/Exp61NrJWDkl6M/WbFUEeTO1sC?=
 =?us-ascii?Q?mYTpiFqsawhn/UgWoLr6qMEXG6nwDqXd1YCu9uVbECXb01vyevFV1j2s3C46?=
 =?us-ascii?Q?N4FCpWTZt5wlmfE+JxOODUx2LzouZtq4Ku9XYq1cuIzqTMBhDb8RlU/CbW8k?=
 =?us-ascii?Q?KI90E0U93yW+aqQ2XlBo36Wu3c8IXhVA//HqFz1Y46Db1mxlR4CYBeNNEGvm?=
 =?us-ascii?Q?5Uf/cmumkrw2rVfuk8VXFBgbwobB5f2tJ1ubz1lff9mciEG8HUxOCqQ1tFRU?=
 =?us-ascii?Q?M1sP/ZXwJIBhh2tZ3v5YzYiOZBWm5fjw/u88mYI0SYYeJX0HiShUs0Lj4aXL?=
 =?us-ascii?Q?BZItrQpvBvNg0ESd5kpyuzkVJliJaps9kt6N/tDmWHDAZoOoYjnYKSIkCe56?=
 =?us-ascii?Q?5VYRK2kAtAtLqYaEgFpeSfCg6DjhKJ5TWoH4N/l6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5c69a2-e5b8-4782-3074-08de3da1fb38
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 19:25:04.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQ71Te0vM1XIhj1eADhiSTJ3g8i/XXreK80xVd7/MaO6s/LTwVmRTWeFJ9+uLkZ4LuYDGz8oidaKtV292P6OwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_112509_015076_694946C5 
X-CRM114-Status: GOOD (  30.11  )
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

On Tue, Dec 16, 2025 at 08:56:05PM +0200, Adrian Hunter wrote:
> On 16/12/2025 19:14, Adrian Hunter wrote:
> > On 16/12/2025 19:08, Frank Li wrote:
> >> On Tue, Dec 16, 2025 at 06:56:37PM +0200, Adrian Hunter wrote:
> >>> Simplify the code and ensure names and IDs align with device documentation.
> >>> Use explicit device names and IDs for Intel LPSS I3C controllers instead of
> >>> dynamically allocated values.
> >>>
> >>> Add "intel-lpss-i3c" to the platform_device_id table in the mipi-i3c-hci
> >>> driver and use the same name for Intel I3C controllers in the
> >>> mipi_i3c_hci_pci driver.  Assign hard-coded IDs to reflect the hardware
> >>> layout.
> >>>
> >>> Intel SoCs include two I3C PCI devices in the Low Power Subsystem (LPSS),
> >>> each supporting up to two I3C buses. The second PCI device is assigned ID 2
> >>> (not 1) to match this topology.  Additional IDs will be introduced when
> >>> Multi-Bus Instance support is implemented.
> >>>
> >>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>> ---
> >>>
> >>>
> >>> Change in V3:
> >>>
> >>> 	New patch
> >>>
> >>>
> >>>  drivers/i3c/master/mipi-i3c-hci/core.c        |  7 +++
> >>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 43 ++++++++++---------
> >>>  2 files changed, 30 insertions(+), 20 deletions(-)
> >>>
> >>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> >>> index 07fb91a12593..3d6544a64188 100644
> >>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> >>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> >>> @@ -790,9 +790,16 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
> >>>  };
> >>>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
> >>>
> >>> +static const struct platform_device_id i3c_hci_driver_ids[] = {
> >>> +	{ .name = "intel-lpss-i3c" },
> >>> +	{ /* sentinel */ }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> >>> +
> >>>  static struct platform_driver i3c_hci_driver = {
> >>>  	.probe = i3c_hci_probe,
> >>>  	.remove = i3c_hci_remove,
> >>> +	.id_table = i3c_hci_driver_ids,
> >>>  	.driver = {
> >>>  		.name = "mipi-i3c-hci",
> >>>  		.of_match_table = of_match_ptr(i3c_hci_of_match),
> >>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>> index 0fd3587671e1..3b319fbf18ce 100644
> >>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>> @@ -27,10 +27,10 @@ struct mipi_i3c_hci_pci {
> >>>  struct mipi_i3c_hci_pci_info {
> >>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
> >>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> >>> +	const char *name;
> >>> +	int id;
> >>>  };
> >>>
> >>> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >>> -
> >>>  #define INTEL_PRIV_OFFSET		0x2b0
> >>>  #define INTEL_PRIV_SIZE			0x28
> >>>  #define INTEL_RESETS			0x04
> >>> @@ -179,9 +179,18 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
> >>>  	intel_ltr_hide(&hci->pci->dev);
> >>>  }
> >>>
> >>> -static const struct mipi_i3c_hci_pci_info intel_info = {
> >>> +static const struct mipi_i3c_hci_pci_info intel_1_info = {
> >>>  	.init = intel_i3c_init,
> >>>  	.exit = intel_i3c_exit,
> >>> +	.name = "intel-lpss-i3c",
> >>> +	.id = 0,
> >>> +};
> >>> +
> >>> +static const struct mipi_i3c_hci_pci_info intel_2_info = {
> >>> +	.init = intel_i3c_init,
> >>> +	.exit = intel_i3c_exit,
> >>> +	.name = "intel-lpss-i3c",
> >>> +	.id = 2,
> >>>  };
> >>>
> >>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>> @@ -189,7 +198,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>  {
> >>>  	struct mipi_i3c_hci_pci *hci;
> >>>  	struct resource res[2];
> >>> -	int dev_id, ret;
> >>> +	int ret;
> >>>
> >>>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
> >>>  	if (!hci)
> >>> @@ -217,11 +226,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>  	res[1].start = pci_irq_vector(hci->pci, 0);
> >>>  	res[1].end = res[1].start;
> >>>
> >>> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >>> -	if (dev_id < 0)
> >>> -		return dev_id;
> >>> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> >>>
> >>> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> >>> +	hci->pdev = platform_device_alloc(hci->info->name, hci->info->id);
> >>>  	if (!hci->pdev)
> >>>  		return -ENOMEM;
> >>>
> >>> @@ -232,7 +239,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>  	if (ret)
> >>>  		goto err;
> >>>
> >>> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> >>>  	if (hci->info->init) {
> >>>  		ret = hci->info->init(hci);
> >>>  		if (ret)
> >>> @@ -252,7 +258,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>  		hci->info->exit(hci);
> >>>  err:
> >>>  	platform_device_put(hci->pdev);
> >>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >>>  	return ret;
> >>>  }
> >>>
> >>> @@ -260,28 +265,26 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>>  {
> >>>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> >>>  	struct platform_device *pdev = hci->pdev;
> >>> -	int dev_id = pdev->id;
> >>>
> >>>  	if (hci->info->exit)
> >>>  		hci->info->exit(hci);
> >>>
> >>>  	platform_device_unregister(pdev);
> >>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >>>  }
> >>>
> >>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
> >>>  	/* Wildcat Lake-U */
> >>> -	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
> >>> -	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_1_info},
> >>
> >> If there there are two 0x4d7c pcie cards in system, id will be the same.
> >> Is it okay?
> >
> > These are not cards.  These PCI device IDs are unique to each device
> > in the SoC, so duplicate IDs would never happen.
>
> Note, that an id value can also be PLATFORM_DEVID_AUTO or
> PLATFORM_DEVID_NONE, so there is still flexibility.

Thanks

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> >
> >>
> >> Frank
> >>
> >>> +	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_2_info},
> >>>  	/* Panther Lake-H */
> >>> -	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
> >>> -	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_1_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_2_info},
> >>>  	/* Panther Lake-P */
> >>> -	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
> >>> -	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_1_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_2_info},
> >>>  	/* Nova Lake-S */
> >>> -	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
> >>> -	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_1_info},
> >>> +	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_2_info},
> >>>  	{ },
> >>>  };
> >>>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
> >>> --
> >>> 2.51.0
> >>>
> >>>
> >>> --
> >>> linux-i3c mailing list
> >>> linux-i3c@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> >
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
