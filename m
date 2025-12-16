Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506D5D609C2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UxWdcSki8AT9crUDJdI1W95pcWxt1eXjdZFOlAfIgk=; b=gj0hYCVP/9hJCa
	eVebgV9zfxmNLMmQTphxyN78DN1MuDHGzUi73MlOFrb5DMMOP/D9vSzbHkU0aS16uWZF11xlKK9nh
	PfMoIlIWBndUmvt2ZsC/GVwmE8UV5C7eK3uC/AdaGc7xkGgbmHIw6LfhAX3//pmnlvRsuKKCmTAFr
	YGunnEw6K9nbM4srUYexzSE4bp0+nVnqOzg65NF/Ifw5jwJLYj3CKioXACymoDeZSVZeUAPWt8Pf8
	UgbFYszM2e2gpRHae+wyMrE+P0fiAS8OQGFbUVqSlBSckRE7AlQsLwR2gjhjDgFlHkiGWqWlUZgJP
	gAric/06fkC6kp910EeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYb9-00000005aqx-0Lpt;
	Tue, 16 Dec 2025 17:12:31 +0000
Received: from mail-francecentralazon11013027.outbound.protection.outlook.com ([40.107.162.27] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYb6-00000005aqL-2Rtw
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 17:12:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZpLI7Rnnhf/fU+VVEa8+j/1BerEoneRGLaoGyrjeu/i3zFqiFYKY6kEpK8TJ9l/sE0FWnIptdrzQvzSyTXrQ571G3I9/7f5PKSTpIRFIbv8X3irqxPSbi+zICZJlfasyf/sWCs0ZClOk9r93wb6k5pZMJC/ddIRBhi0+/Rr6DrnZ5Oy7LHpT/w2rkBJYLlSODmgARBj1vBxS8H1fEH/h8rJeP/UuqE47cnyApfdUHpQj2r55XZx7lE9WS6ev/hlkHApx201NE7KkHWW6Xw9gqR1eOBwhbpyhtc6Nn/ElbnqVZvrYndBAkoRosMHvBdgkfrQ0vb3djxT6LJTjX+OJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKDXStOSTl52Qe0Cn7LFSovnLnA7AcM78AZXzOXHZ7s=;
 b=Kz5XwzMlhmH8vi1z2DfQAq9L/Av4IEWZ3E+ZfwrjMUOjj1Jom9VqnVe1AaqeDDhwjVpmdwDtQXR+DRTHeQsqGf0+3MOb3X/aNMnzkMYxXxDn9jnhtaC2Bqe4ru1Xb2/HncjB38JBevnGoC7cC7zlNjal0qNhIE4xqH+x4DoNp/OwWB5WIqGCqgOlxssbZ/iSiYUgXoM2Mh+zUroPAX+cwiB8MBeGZOXrcwSVwdC0Q/YoyMBa5PXvM+HxO3G0bOV1FmmM/JSAlkWuD8YLJvO4Uc/meZPMp8qCjwPYxMfiyUm0/pxTpQlT/E007Q3vdKyVEI5eVH5NIIcqGyQW9EaveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKDXStOSTl52Qe0Cn7LFSovnLnA7AcM78AZXzOXHZ7s=;
 b=Zedn5M+nG9HAZPK3XuvEIEAMXzxqa0Dto6lLXEyZH9tvC773x+M+OpiCtQdqY3drAcMc35zD9wRKI0At9sblsjIiIxTmhU+V+7v3Wqk3KaqydiboqMbKhgm0PSKHFHwVBMx/DrhLOQRnh5EVCy8+e2CokCg1HYpkJ4o1EJkga7oOvuyUyf57pv7ZY2jMu/+f6g/anb3/oMAqq+TFcYbcDHjQZ/RyvZSMvCnwgmTL/4Tyu5ddvG0OhTb6mIRzanZQ0RDmx8xfGOWmnJx82tYDzlJCcOto9+i3e0J32ooxKyaiePCOgxH97OqztjurUwAaA5uvFxql3kNznblu55ZSWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 17:12:24 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:12:24 +0000
Date: Tue, 16 Dec 2025 12:12:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 08/11] i3c: mipi-i3c-hci-pci: Pass base regs as
 platform data to i3c core device
Message-ID: <aUGS8iPsIGOjc1j8@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251216165642.164583-9-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db62750-d7d4-4120-00a3-08de3cc647fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tXvKhNtvQyhyQ/YlKLcrKcmxmAhJJMB/OHPKV8O+80EzS9PICBQOHicVsdhI?=
 =?us-ascii?Q?gUaxPHoTMASxdQUa+fyl4QW2Dpr8tWMkoPSQKihwe5fYggq+g4w5AmzNj1h3?=
 =?us-ascii?Q?3r4z8h8TK/9YIQ17Jupr74dWkmEOMkVMsf75q1PE39052tdnwntjT6OJJsdi?=
 =?us-ascii?Q?HL49+Xy5WZuDM1a3yNRUMpm+uJJ4bx0S0/PtsvGGRkyy1/BNNNA/XWjSzHGB?=
 =?us-ascii?Q?QtowsXOdmHYRX137eFssO16uEdud1ims+jURWR+jv0er8YKtLZj1A8OCfofX?=
 =?us-ascii?Q?cEdzZleErGV6V+BuqbmAp9uWF7MgkLhVCg6C3yiDw09UvwVlg1fi1EniL3BK?=
 =?us-ascii?Q?js7Nxe9IyC5Eiu448k1dedhlwriOJL60EgGOoOIFovu5S0Z72m09w/0VvDQo?=
 =?us-ascii?Q?qHvq8a4aoPNhDHB1fE7TvYI3E0sZXu7hwxSjtBRJccCjZNhxpAaCCcZnFTYG?=
 =?us-ascii?Q?u8yZG7X8+VIq9+slJH3Q0ztXTpGf5nNmyseCfklZjABjI0wzWztJ8VICz2FX?=
 =?us-ascii?Q?9ZKD8+m8O4FPOlBNMtSAlJdD4Ix0wHEBrcjuLX3AoL41bcfwkRLGvVPrcnkY?=
 =?us-ascii?Q?qpULnqhjF6/aFjYdiFbmnRNM89QlxS3ijDJgwXtaJx5VsTnT3I+bVXMK6G8m?=
 =?us-ascii?Q?cvUIWp9ekn8Y9IxZB5NgzeypOfutRTWxHRcQm7+fiEH5j4FhH2KSnNrcKRM/?=
 =?us-ascii?Q?2gpoz8yGSH4/2H2NW6sNbOkWbVKgEMnKdJJjk52qZyVdi0vspgwtgApJw9ND?=
 =?us-ascii?Q?iTcaZqePRBPM1ZjgCcB7RsJt50TfZ97ei+jntnMspxbT//MGUsV3AXOS5rdg?=
 =?us-ascii?Q?kifuPV33RMNPrOiWl1BZfFvRERnUPd1Vwks/q+a6RjbxJsve/fZ2wStY2ULf?=
 =?us-ascii?Q?eR2cyL9Ql+DJMOS4WjO2vyqxHVAoQNxr5SQxWPMjEvtucS6YVbkNyblVTxgJ?=
 =?us-ascii?Q?e4cE+5iC0iKWTt+mmr5QKQIF7MXQXbVRP+X09ZcGkV0mJcbmf0079PKbt/3K?=
 =?us-ascii?Q?i3vIdNenOE01qJAit8ihA7GmL0TXWTNIrlasGMq0lKmsbftUw6Du2nlesvUr?=
 =?us-ascii?Q?36MOjKLxFulVQbSWsaJGKKMnAh4gxmdnCvdRqpQpB1VzTh1Xrky22wPLeWYU?=
 =?us-ascii?Q?yBGOsgIjZbdi71MIXwCpvepQVeQHlvlIpmebYUbIss5NTrIbTD4QzpnVFB1y?=
 =?us-ascii?Q?A5P5HBzXKgLdp3QXQ0ViJP3mZ3mHr1ZsUn+jqB+oNZMXLj5OTq/zLLewVWCC?=
 =?us-ascii?Q?XEWdnjF0FRgqg00UGsLisb2LE+Qn6Gj3ydyaRvThhpzcBvP9KkQaXnmE4A9g?=
 =?us-ascii?Q?1G3IvubTjz/VPJGc1OtxT/VN3ldNhzWS6SZeTM8gyWPl02GCUio8PWqsKP7W?=
 =?us-ascii?Q?56kyB1gTlBnxqScpA4f6SIWOmwvaetcEQXaItQwNb6P4Sx66ti+AxliRAG8i?=
 =?us-ascii?Q?ohhHmTg+jLNbGrse0ceMRKUZI/lqluZgwMImc79Gzhm/mkRG6yVj7SC+WyTZ?=
 =?us-ascii?Q?/hAXmVPYnneEz1X3PR042oJdAQOquAGE5PVd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sUVIhoJTr/RVObMrYjyP0smkZXtCa+L/6++L+odXp7RxDsN5+eIXMwFKIux2?=
 =?us-ascii?Q?kbyGOkL5TqCPOjnF5ipsSsz9d6IU3U/rX6muwGEnOqob/Y3YfNw3/aAisDhu?=
 =?us-ascii?Q?NyGdmi6r23JaGlnWF1elFfYKHqdCzX6GHn7H6R5mS8R2gIYA/6av+Xs5Ox8Q?=
 =?us-ascii?Q?B0qcepDujTr0d9pYv+8NIq9ZLxbwinuULzk7uM9pO2lq2YTKoQ4XXjC3gs4R?=
 =?us-ascii?Q?yIL0Mga49Wcp5swOJqaw5XGWcFVJVhM60zzdlSfO9gGnRYZsr20lOxmm7L1v?=
 =?us-ascii?Q?2g/Kv6gZoCCUq9OAlrv5R6PI0hjrLJH1V/65ftVZnB6fysWA/hMr0zBVlNCo?=
 =?us-ascii?Q?fjqU5/61D+cuv5+L5rHvAotC+VooTJidDsoG8/gTgwEbwXiA4w0D5e3q0GF5?=
 =?us-ascii?Q?6RuUmk1j3DTY3isJWwlJjq82gsqWCPgJf4P2bc4carrm0TBKT5zSwzzT4kcw?=
 =?us-ascii?Q?QWN+nSS9in55CipgCRMRhhfVkFwSIpDnbkmCzUHJBoKIFjqPX8qJraYIkHL1?=
 =?us-ascii?Q?zkf0R5dW1Yqd9JKl1Du4y5+iB1p+SJt8ECio0IGE0CVDXwUsF3qidw17WNlo?=
 =?us-ascii?Q?f8Bj5NM78+Vvbfh28IyPsqMs1rDmibUDcnP0XvpX1SwRloJvzOGwznGtF5VG?=
 =?us-ascii?Q?ESzOgi+v1gtNRjkuF+a8FCt1ODNqmqU3L7jJAlLeOFAGl45kWOdFKUNAyuyX?=
 =?us-ascii?Q?yv3k75EMI1QKzkbA+XhL3LB0nrwj01coSO/J9M9b5NqrnRfKcJOm6ono2ioe?=
 =?us-ascii?Q?pXw/XWnn/SoDaZIaGxuUsymjLdQBEu6B0ITzWjMXXpfjdJEiVbAUz5Yl8Ax1?=
 =?us-ascii?Q?o2lfoKQzB+kXv9B6cYzOtMCQ8PJeQAJ8+Z+GM/OrXDUpB7P08UST1SE1CZfh?=
 =?us-ascii?Q?gbcHuDOzRkZrv+gpblmi3OmZc2ryccWmTufoRFnFCxXJNnsaNMTWDdwE7tNK?=
 =?us-ascii?Q?xw8NiG6ELJabgzDXyN6TklnskSaky/q+/r8SNjrAGnknFsfEVPmPXaHq5zk7?=
 =?us-ascii?Q?Hu9txSsXypc6uHTkiHuNT2hSh5zHsFg81WOhMciDiLxWDY1SCxgYl1MOWp1j?=
 =?us-ascii?Q?N10wmY9ad2GYZvSGLmzRwpwNho5Rl77u+NLSSrxW/hz/Lg1yhVmCBEskzkXM?=
 =?us-ascii?Q?Cj3bhwSlPK0axdJsCMqgfTRNhH7pQPCAMwThv/2HQquDe6ZFf5rSggGHwhrl?=
 =?us-ascii?Q?UZzGtLOGNIgH3TZ++JpIB9xxL/drOIZ+IneWmhVCBw25E5c88t2MHi3Z+bFo?=
 =?us-ascii?Q?cs5iGskQ0be1pXlXJmt0aXK5l25spi2c6BggjKovrPwIBqWBQLQd5OBp8Jg4?=
 =?us-ascii?Q?ZBElg05jD12GG/ATl7v7RyYhGWeyhCbBBnkQ6vbvASFy75JVBI0fxSNSR/e3?=
 =?us-ascii?Q?Z8gYyBDE1HpKUxJBxKmVWsi+WCAUaxTe1iUT2RTR63Buo2WyQFq6Dz2mwH8s?=
 =?us-ascii?Q?5mUkzvfEe2K2uuX8lgN5stuflDbQkcVadu30XVPwwnHwZE2podflkGUMtgZK?=
 =?us-ascii?Q?iro9VnnZWnc/VO+cCZey2UVC0KVbj6LvhTptDs9UJ+mLgtxW3HRy96M2pVtY?=
 =?us-ascii?Q?TEQ2dS6RrsFRNSmpA/6zPQtj8EC17ErM9zTrozaV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db62750-d7d4-4120-00a3-08de3cc647fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:12:24.3068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxW0hfSRbGPrnuuF7g4oSkdOfFeuvyLxDYS/T8tKQMkuUuceew3lFYOfYxOXaS08k1Q0fP8kCrPY5UByY+NnPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_091228_625367_B608E591 
X-CRM114-Status: GOOD (  23.91  )
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

On Tue, Dec 16, 2025 at 06:56:39PM +0200, Adrian Hunter wrote:
> Use the parent's MMIO mapping for multi-bus instances to avoid overlapping
> regions.  These instances share the same MMIO address space, but the ranges
> are not guaranteed to be contiguous.  By passing base_regs from the parent
> mapping, child devices can access their registers without creating
> conflicting mappings.
>
> Prepare for multi-bus instance support by passing base_regs to child
> devices.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Enhance commit message
>
> Changes in V2:
> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> 	Multi-Bus Instances"
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 39 ++++++++++---------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 3b319fbf18ce..ca562a5634e8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -14,12 +14,14 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
>
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	struct platform_device *pdev;
> +	void __iomem *base;
>  	const struct mipi_i3c_hci_pci_info *info;
>  	void *private;
>  };
> @@ -32,7 +34,6 @@ struct mipi_i3c_hci_pci_info {
>  };
>
>  #define INTEL_PRIV_OFFSET		0x2b0
> -#define INTEL_PRIV_SIZE			0x28
>  #define INTEL_RESETS			0x04
>  #define INTEL_RESETS_RESET		BIT(0)
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
> @@ -143,19 +144,12 @@ static void intel_reset(void __iomem *priv)
>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>  }
>
> -static void __iomem *intel_priv(struct pci_dev *pci)
> -{
> -	resource_size_t base = pci_resource_start(pci, 0);
> -
> -	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
> -}
> -
>  static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>  {
>  	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
> -	void __iomem *priv = intel_priv(hci->pci);
> +	void __iomem *priv = hci->base + INTEL_PRIV_OFFSET;
>
> -	if (!host || !priv)
> +	if (!host)
>  		return -ENOMEM;
>
>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
> @@ -196,8 +190,9 @@ static const struct mipi_i3c_hci_pci_info intel_2_info = {
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
> +	struct mipi_i3c_hci_platform_data pdata = {};
>  	struct mipi_i3c_hci_pci *hci;
> -	struct resource res[2];
> +	struct resource res;
>  	int ret;
>
>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
> @@ -212,19 +207,19 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	pci_set_master(pci);
>
> +	hci->base = pcim_iomap_region(pci, 0, pci_name(pci));
> +	if (IS_ERR(hci->base))
> +		return PTR_ERR(hci->base);
> +
>  	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
>  	if (ret < 0)
>  		return ret;
>
>  	memset(&res, 0, sizeof(res));
>
> -	res[0].flags = IORESOURCE_MEM;
> -	res[0].start = pci_resource_start(pci, 0);
> -	res[0].end = pci_resource_end(pci, 0);
> -
> -	res[1].flags = IORESOURCE_IRQ;
> -	res[1].start = pci_irq_vector(hci->pci, 0);
> -	res[1].end = res[1].start;
> +	res.flags = IORESOURCE_IRQ;
> +	res.start = pci_irq_vector(hci->pci, 0);
> +	res.end = res.start;
>
>  	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>
> @@ -235,7 +230,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	hci->pdev->dev.parent = &pci->dev;
>  	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
>
> -	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
> +	ret = platform_device_add_resources(hci->pdev, &res, 1);
> +	if (ret)
> +		goto err;
> +
> +	pdata.base_regs = hci->base;
> +
> +	ret = platform_device_add_data(hci->pdev, &pdata, sizeof(pdata));
>  	if (ret)
>  		goto err;
>
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
