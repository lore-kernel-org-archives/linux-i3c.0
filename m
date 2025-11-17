Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8E6CEBF61
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ltj1PU/cNUskyZqT3XkaVC46tAqNvPpbozy4EG1ejRM=; b=Hdu1yFsF4Wg9jW
	He78ROtO/VQnONR3t8KFOiaYWWK966UmLjuls5y3MjNE6ucU2qIYuePJdzfuwLaLrv3H4urgyukri
	6h9RVXsMGFho+D/9LXF/vKpon22rhtAjzHawrm9VjQbBBFtwRkGGYoiI214KoU5deSyNjliLcCZ2t
	dm7mlpfNBudvivtDJWoj0SOVTQC+OTCPLzaCGbc6pYfcUDzkBEHooC9jPS9pfTbIB9SDUhPR7QOEZ
	T4sOASXbTk95vSdHzL/8TIJZFwyVXI4SYrVTVj43uBA1CYUVzJNoT97f5yircJdrDpPYR01W5ECJb
	+mi4sTdHaLOY3gvrEIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1G1-0000000GKjL-2yDy;
	Mon, 17 Nov 2025 15:35:09 +0000
Received: from mail-westeuropeazon11010025.outbound.protection.outlook.com ([52.101.69.25] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Fz-0000000GKiw-3xzQ
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:35:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGTghugeDm0Ccixd82BdlmC1J7bDGxsBf/kO8Zt0et9fYiQKwUoDqNbVO1aF+UQlMqgNv7Q9LCFU8umjmU6WCL8wy/sTdFtuyo9/mT8KIU0EZH74ZUjM2GBppgBQ5Uym8zLkH+ba0K1Xte3ZsZxdqLJT3VFVyQmrgJ5rDRnb0c12ecY588aCVdH8cfZFf3SmBaRPX78brlmInoVq4lC8vSGWmtAPSQpoUsbur/JqcACXilpJUfAE1iQE+SX+X+eVd5ZBlF0S9cJD+iUpcCGDkXH0UXWDjrKf1kyitpzclT+q6EG4sup2pUUYZTOPo8oal683FKaztelwMsdbHf//AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU4js5jDrkZri02cRU3//czeS4BGH/ZuI/C8zOPjMIY=;
 b=EplaRfKCGVN5WTbOK1VHbUbgrDUYSo9J3uQP1w1bTQ+3lvlfSysEAB5aj/3yxbYCvy+CFP+boOym+PDmi6vH5ogqVHm5MvSSDzFO28iZFy7PrbLAza3xqes5wLWkpgpcqstQWhP88RHC4kjzewSCdzoDqNTDtLSbFoYabvtQmUU2tELlSrh4STRyv1/koWpc/KmFEXgSjw7A+uNK9cbATfi7n8XQAZYdhzxMMQ4xKMocAHVE6f2UurYL7U1aqAefqQK9/XI9vEJgH4ub3ONyl/BWscRZHhep2vlux62bCuh2ult3N4iMB5FwjY/mmwVAo6sIhibG6eRjeeKUKqwZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU4js5jDrkZri02cRU3//czeS4BGH/ZuI/C8zOPjMIY=;
 b=L6MvTsMGt/UNLzkYV3+nVmstRJkJwsFSVyWRjsv0Q3g0HCbZF+nWqM4tQNoEGntDnmvbqxIwAejEISJIUmUzANMt+luupNUEdbmNWfjCCq6ddvoLrUcZeoARPulVedxre0rZ2CcCeYZih0WknBIFtlHC8boQUifGtjOInaAc3mwfbrG/GUrWXvgRouw6u1aVOwXIIQ2vti+JCtEN+TCH8/ufIUWI9IqtmJmeS01ryxypSKwmaJm1x/X55D3TfhanaWPdiyFTWoQSGRC3jo6uTstHV1Bo6pW4Ah+X5x/U6LL5GvodVmIkdvwzJqNcbeCanLr2CMyBug3gDfIj1bN9AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:35:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:35:03 +0000
Date: Mon, 17 Nov 2025 10:34:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 02/12] i3c: mipi-i3c-hci-pci: Move all Intel-related
 definitions together
Message-ID: <aRtAoavGqYiUTqFv@lizhi-Precision-Tower-5810>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
 <20251117131609.65988-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251117131609.65988-3-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR17CA0038.namprd17.prod.outlook.com
 (2603:10b6:510:323::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: b7556d6d-d073-4e97-dc63-08de25eee0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wPc4zdthj5D1y0V2/yEg/ROqSaQtJHOui7HfbqHfsjqOlyKmtUfCxdivVFkT?=
 =?us-ascii?Q?+O0xjS/Ey0GK/To3NQxUAB4/4J97L+hsye6abWQYTGfD1GWtA4J/nsXWT09V?=
 =?us-ascii?Q?I9BtrHgmzqrOfBozgN4ahkgiIFlAivSXDFWcaPxqHNhZJP4j83WClwK780mF?=
 =?us-ascii?Q?rjBIxLflm17zhKG8XfPxd+X4abzg7RFDm38qYgqRGwiMhafZRrrdPO3/SYdh?=
 =?us-ascii?Q?Efhujw7+KzSQPYqLQLdYJaCwDMC+z978pMV+8oGbjSr+ttW7B5b0stY6gMRy?=
 =?us-ascii?Q?hYy1hZYgIjiHsnsITDesxhQt6OwA7Vxq5h8bAkvRHOBwG4bYmgcNC22K2GVd?=
 =?us-ascii?Q?jWDVaTFX1IJ/ZR+rzp1n1xCqghX4wnF6Ye/+thvf11uI0lWObAHnvLEMsyIj?=
 =?us-ascii?Q?ZvYhE/AJIPGZyouWuTU4vLCtk8A9/xybOWEnej6s/DNJNaJHRBzxIs8W2GjZ?=
 =?us-ascii?Q?O7Q+D5fCnGNHuB9ubG2y75DwqQcMzi0hawHJD3cJ0WWkTTn6VrV9E51igiOH?=
 =?us-ascii?Q?hyNeHYxL16yV3ha9d1faei56oRuvFlErjxsDPih9V/kevgsz9MJIhdPR9ddL?=
 =?us-ascii?Q?nnRzHzkpPQeiyQqTomZ1q8gPAVK7aXdV2YbAWfcvgHDvN9l57kfB5CZVSAhz?=
 =?us-ascii?Q?Hprk3UUE1FeVVht2NR4aL7xGwbgvnKPCI9M15po0ZYVrnfP2qOiDA8OvdhV9?=
 =?us-ascii?Q?XeX2U1005Mn/p3o7j0iEqJS9NTimNS2KncZooLSnuhf7od0gosMuaiGGKRGN?=
 =?us-ascii?Q?BjUNRKRTB5RgMueCzmw8MHM/S+sSKibht1mG/h4pK3N7bGgxTR02ZPpsrw9v?=
 =?us-ascii?Q?Cb07xCUzpB64ilrCSlbACngvlnKMiLHr5lEHvpyxYZ7eo7aqO68tqZtRQuUG?=
 =?us-ascii?Q?BIXiDSwK55ZHTuP+6KH7/0dePziFsYktOLbQl58DUrUsRx2YnGJKxvGhgY3/?=
 =?us-ascii?Q?s99w83woI+imE8LDIKRnaCsSQaZUVW21EhrEnhlyvkrWrMyEqJCiN/oa7LZ7?=
 =?us-ascii?Q?yi2BeSSpWt3eIqgA0wunQZeLCuHmN/CqqnVM48Hlr4cQQGcc/5L2POSVi1Q5?=
 =?us-ascii?Q?gpEjUsw7ZOwhdt99ofhLLCsdV2TbV8tPWjkNnugrDDfJ1qyTrrPvyRcHDMas?=
 =?us-ascii?Q?LsjTh+s4uTEUp3HNr2jG8TKcKxcA8EFWe7r84IEabAmSIdBjWhIAP4AcjIin?=
 =?us-ascii?Q?wiC9/B5uhAu7YlH/xpLyZw8s+N1R9fJw5Ftnxt0Ru2YKr1EGgQDXLcgd18bc?=
 =?us-ascii?Q?4NmK9rsvEtVPg0sfNoWCXdSnZwlM4FIxLc0eQ5C2iGSinU54D+TPoi3QTyPD?=
 =?us-ascii?Q?JUS4yCXKkW6TjGNZQkSowYO6AYQJV3yVn/D0jsF+4gA7Y4IwWoVLkJnpVcWY?=
 =?us-ascii?Q?LALkTt5QoeTU5JPSs5jDA9Dkxy3Fqo4b4Ld72diAnHj6vyl2k5TXPMNmp1gz?=
 =?us-ascii?Q?kU5rrm6j/AM4+hFE6gEO6PXq+Zi+zJguwxBi9CqwvDWSHBdj7jfryxh2NpeT?=
 =?us-ascii?Q?evdTAcFxNNgmaNeU4yMHGZNnQlNfI+yx2zoo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUX6ldOgbMcfhCVuuAAyylmqB+pHxFkS/sc42Jso+fsqH2CjwwWaxmI9YT0Z?=
 =?us-ascii?Q?lxXiCUGnvWxV01YS9qAnWuF+gm+MnLyCZdfIQ82VPbKald9g5iVEHkY4Wd3N?=
 =?us-ascii?Q?7axBTzhWzf/iot7tVeJVboRuIXjbFlRdjga3/RjrqgwjOYaAw8I7+5t1vrXl?=
 =?us-ascii?Q?TWlMG3UI3QlUSAToXrWYXWpqWx/pZ4+nbej9z1/b8nFdd8n5KLUnraB2ldwi?=
 =?us-ascii?Q?62N39mI73/cz+t0WzvUQC3adAjbIjgULb+pw8zblOEdiiVCfnMbY1MrZW03Z?=
 =?us-ascii?Q?VdVfVQ0xXvYXWL6NlSiwDlTndXOeFzqYZbAfrkFBCIYXZv7vP/luarEKqPp3?=
 =?us-ascii?Q?RmJFH8WSVzyp0weiUCsqA6fi/EAv3+cRZTldAnBC2v/Q1N3CFsMrpj7ifGa8?=
 =?us-ascii?Q?Nl6qZ4OsGpDACiYUSPx3Gp+RNyZIk40T2GUxK4prWG4lh/2YKHHw+3Zevkpr?=
 =?us-ascii?Q?z7qYlGbHcrX45HznISU4EuX4dC9Oklcb9gNv6kLfrmqcF/Ih3dbbENr4GyWP?=
 =?us-ascii?Q?WXCoJWBan0cvAdBxZ2R/Z/EHz7VpJthT2W6is6lP8S5a+OYNf2FWaNhRX9ry?=
 =?us-ascii?Q?dW6yuKQbnvbbSzDP/KSDLIaeL8PGaunxMMxB8K8Hpev+5BJeNqItHZ7xxcda?=
 =?us-ascii?Q?CEDLl8wA5dg4CiCDluBsnZej3ibBQaYDk+js84HzXXzCFVAf3F+Ruv4vKlS/?=
 =?us-ascii?Q?BqhmQUFi9yThNmDbjVF2L1MLXxkwP4ZByx3YoDpxC+3EuJ6YRy68NtIayGtJ?=
 =?us-ascii?Q?3UtkhbD/l2hCr/sDw3q1R/3eGFs+cuSZjBR/XHPqYtx6cKmZD/dLekauq4N2?=
 =?us-ascii?Q?cdG/GALORtIBmU+h56MiZqfRgTAkM5guJjaQDLbirBl2D8aK0ta+c5Spsyx3?=
 =?us-ascii?Q?j1IzYJD+Cy1Sz7tC6i9qFe3zcZE8D45wN56iMYaiqmHtV5PTQPeBNosvbP7L?=
 =?us-ascii?Q?t/vG21GHw6EM3cK3IVR8f2VEbO1ZnhJfGevpIR1ECWV+Ge3qBbqQhpbkIV4e?=
 =?us-ascii?Q?WHVMo5YZ3K2NVHyESVqDFrJorD3r1NGbiqxhc1OhRdcJAYLeS6lRUW67YGw0?=
 =?us-ascii?Q?i6RYcmNtMwxb2HzauSLHdgWSIEw4/oq5WiLnPcsM3woNmgghLJoLKkWzDYZR?=
 =?us-ascii?Q?3J2pEq2A7+Wn0wfaAixRad/RqABusAvwu1VKMq9/JAmgPv2ioUp6LQEbsrl2?=
 =?us-ascii?Q?tIzr9ei/eG223/G+7rhuTfHQxeEKsAk3R6HlLJ8qKwfoQPz/HmZ3Az5ohoV9?=
 =?us-ascii?Q?G26PDLMGb7s6tehuU6Jb6I8s9uz6NLjUh3RuGI/a9RdeMfi9790J+yBvnxZN?=
 =?us-ascii?Q?l0+IRnmoUIJz3MRVVc062FEu8wCSpHOPB7hjiMxKnoViVQSXNR17i0NeEGOW?=
 =?us-ascii?Q?3TS3nnfdiXzLwRZ+OkWBEcHgLsHCmnS7ltraC9RQJbdhbtmuPVd+Y7MZwyJA?=
 =?us-ascii?Q?XCWF1nkGCVmvPup38VMODfgfNFo3LwwP7koXmKtNrhCzUASkKAng6YLw79H9?=
 =?us-ascii?Q?3z2FCxGswYiHmIuA3Q0+4DjGN2ZHK0/T3ipAyrHkbS2sE4pZzDOOwZWh+CS7?=
 =?us-ascii?Q?30etXuZvevfQj3ncOohp/o4XHoVacRkfmpyRF09/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7556d6d-d073-4e97-dc63-08de25eee0b3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:35:03.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wbyiz7FrC12HY8X2A2JwHD+aU6k93gKcsEes0dFjbQScODEml20Arz3ocPLTSYmxEW/KY2M9to3JuIoQbMptgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073507_988879_1AF07011 
X-CRM114-Status: GOOD (  16.48  )
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

On Mon, Nov 17, 2025 at 03:15:58PM +0200, Adrian Hunter wrote:
> Move all Intel-related definitions together, to tidy the code slightly.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 3cd15ca7d391..3d854cee05df 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -17,14 +17,14 @@ struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct pci_dev *pci);
>  };
>
> +static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> +
>  #define INTEL_PRIV_OFFSET		0x2b0
>  #define INTEL_PRIV_SIZE			0x28
>  #define INTEL_PRIV_RESETS		0x04
>  #define INTEL_PRIV_RESETS_RESET		BIT(0)
>  #define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
>
> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> -
>  static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  {
>  	unsigned long timeout;
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
