Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA7D609CE
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRerSNm7onFL/BmwghPNmtu2GDQu/he9hNf8oVFTcMo=; b=aqz+ci1lokojzM
	chjN8TF6B7lGuuESAbhQS5RP2iHEeK9XV0DXg9YwYUS3npCvcgl4i7iWQFjOJ5hgJ21xnamJIIL+Y
	mPD5osoYK8qU4k6ibs/kPAu2rBJCClaiFOnTyrDPTncedZ3qUe1eGwpxqRdgzn3mnbHe1kRhj1XVK
	k1vfF2ZoWjOWR7imCHP/A8HBK2+syqCyIFcuRjjaSrnqFzWI4C9GwyeNbvmpn0+lBmD4vIPor9P5z
	FWx4bPQdejJcczeZw58FCA9yIr7JFT0brSLpmmXpVAP/MzSq44iowxPDftZA0ngfs0/xmLvFCT86x
	25rulddbNqfNZIiKKQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYZ3-00000005aj5-2aPt;
	Tue, 16 Dec 2025 17:10:21 +0000
Received: from mail-northeuropeazon11011027.outbound.protection.outlook.com ([52.101.65.27] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYZ1-00000005aic-1KBX
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 17:10:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfhagX6pZ2SlcoxYeZ570YmgJSg1fdX/vAm5IDpfbmjiX19C+jiVqSFSe7Dkz6bOIy/EEwr/ItvBUX6IljgsSnsE/Y5jQSThY9pJ4X7HfR9quyT3aqyQqTzTE+hbK5vdUU0jTRlJ1MwalUqsHVFZJv8FRlrF5ax8Ay5p1DAmlKGClRBxa6Rf8QlLpeaXkIN0S5P+xTdFf+GsELLUeXhbEm5aA3LkIQUlfZzlRXcdYXttA9px/78kp5eBKd9srhZwvwRhxfv7xXkhq6rT6LFy6XpZ13WH2cwcpDBd/1T3z/SHGyhJ6CKWKIoVBeBihtXZL3B/iHCQsIWEDJlxJNEH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+RVbd374gc4L1mxSblwcEHLk43kcL3GvJJF1umBua4=;
 b=ah+/M7sCssoCwxpwPL72hm5uXZkllDHBIHeU9gZTtEGda9g9W0hp5KUIPOrpnQiYlT1RosjRrEnlhHXD/X+c/euIrQRp2vzGog2z0A8WuBMnsebpv2QA5xMWT23pSfKaSZjCKBbdmZRFDil03tCRaDAMSnPxFhSnR0TCOg6yXuHQ86p5Cp7JcdZU39dKylqVZ1asOCKPpEh3sTBd8LV6+yWQPioyjAfRTg/vuAXKenGMjr278Fgn0CCfBDN8FMPgeOoACcNAHEwWIMY6EJMyDz/LWvAJ1jL1fEPZ/LvsC0fTq3VS/TQKDXTH+dBT7jzeXnzhovLdgwg6qx7PrT0Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+RVbd374gc4L1mxSblwcEHLk43kcL3GvJJF1umBua4=;
 b=WHl4ryd6nk99X0QsXmfkDKUjWvBXSO/etHG5EpPglBr7w079qSebAQTmLobhRnDS0iQqQfW2khn8ZTsOnnWMOwmVic4iwXT7oU+3tjIET+lflQj4wgPDoympfZtB+A9PxcvgsLHHSFG76g7ROi006DJizNqY18wD15hA5lxYKUTq7396uen85z189L/IHqehWRYBeseAfarKdF7vqPDGv8XSuwriuYkjeUsNSPYbq269L4T5hWUljQZhdCArRD+FNUCH3ZdD2YewPKFNtBumFz8SDzTgERK97AghTFmzH5pYpeDPLRFgreEd/8qJWitIiC3CybtowLwhiZrO9+9Bcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 17:10:13 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:10:12 +0000
Date: Tue, 16 Dec 2025 12:10:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 07/11] i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
Message-ID: <aUGSbneCi4q+JPUz@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251216165642.164583-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbc7ca9-c551-454f-e33d-08de3cc5f98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?69xO3FvwiPPZoNW05+oA7TP61ViXdxjR8ijdX35eiRJndHcb7qkJuu3aR+Kq?=
 =?us-ascii?Q?m3izBne42l6nlHqAi7yZbZEcx7h7EFfTMo5RwRz7MF9atJmJxlw8Vfpo0f+W?=
 =?us-ascii?Q?568oz+8GApJ1Cgj1dqbWWo1hPhXOJFSFZ7perCo8nenBAoNci01Jio/KI4Jw?=
 =?us-ascii?Q?uFLG2OW9KewQgMn5YU2Q+0SaDJTx3dt4uBAfUHHLhgsgv46jX73DKsfuBGln?=
 =?us-ascii?Q?mQQWrDYidK5tAcwdi9YubFZrMYEigo4SFWTeRPAB276nwgFrZncGfG0/94NN?=
 =?us-ascii?Q?SOrprCCP6dYLNu5RjDWFpL1ReBbDR+vfdjRF3C+sqe3m62z7w27SxvlGHNnJ?=
 =?us-ascii?Q?IhjjmY27tdil2W48SbuPdfAO83U+skfwE0GZ/VhQTI6UaVz22VL1r5f9R9SA?=
 =?us-ascii?Q?2HujoLhORkqdNjIZmG2P4clAfMwQdYYphUD6SBklM31m29Gj/wK7XnKpftOk?=
 =?us-ascii?Q?2HpG3GCUr1am6b8kcoQkg7Y+JxyOZNXnzgNm/o4PaACGHrm6L/dB2UFYvvbv?=
 =?us-ascii?Q?s8mOM+s4xP7PWBX8FwdphFmxO2JFKKNq0tLbPfEFbWSr1wlMN7/v3Y8nxK6M?=
 =?us-ascii?Q?CJhE4Co8HXGX0Z/iSFH5CrcVG5B6saBDJ8lU8ZOfbhA2SvlpGkIEFP1ORvrd?=
 =?us-ascii?Q?eEUAWXFygXFHCP0epSMP2LrPv7+FzRZptZQOLepYdWg8A3PQnrMnXg2B+uHB?=
 =?us-ascii?Q?f0nm4gogH9Q2ouqfKYhuBiNzc3oJZB++TMvVTlurJebv//g2/j6GJjd0pZ8e?=
 =?us-ascii?Q?zBwcmdXwyJyFEmRQIMwQrFfh/ITC1hMoP6JnIGY6ddr6i/mPy5UCPpCftQoo?=
 =?us-ascii?Q?xfDExg/bwKpmKqOxR9BI06vfAuKkG79jxkKhww9412P8tojtdfSEYwo1RZcB?=
 =?us-ascii?Q?DaN2N6JKJyKp69JWk+UnNVupE/HuTU6aXk5jjwrBams2mYoMNmNzTcJ7AwxA?=
 =?us-ascii?Q?W7BR3se54w9K5VN57SJHRiFqTKabNtDTBChdzGURV8c+U060JWKZO/EsiOAa?=
 =?us-ascii?Q?qosu1rzXC0IQKGsMQFOeV5YHyg1f1koWS8/L7Hey05vdGwGGwhTt1hegUQAI?=
 =?us-ascii?Q?s7l9Xq2g5Kri0vQE09UVGuhGrZ4AqB8Iy332NuarETy5F9optAOGD5tdFntI?=
 =?us-ascii?Q?O9/Az4YYBPRdtLbf/axu2pK4jLfXYVyDahWPRHQemVsw3+hgu3Ql/98AtFOr?=
 =?us-ascii?Q?hOn9fn1AXiNUOs4yROAPN/up5q+bPfL9NiZB13MZSC6BjVRt+sXNS2mFNiXP?=
 =?us-ascii?Q?iESy91GgOlqK/A12HvaFzEQH002AiuktS/BcV2mpjwyDo6zAP1Vt257JVGL3?=
 =?us-ascii?Q?AqOcNUTHzUUIm5zCuxAj1EOwPKmWlqBovDeU3WY5dB8OxMio6lLE7F9tYnzy?=
 =?us-ascii?Q?ybFmJGl1GyXhVanomev3RO3xpqH5pOQuvKuZ8/9HI1ZIKnNVC7aeM64atqMI?=
 =?us-ascii?Q?EQ3eLSAyrZ8/DFr3ij6QEGDPnecXcxXyjad2Or0Wkwg2crl9a7wR0n+oTuqs?=
 =?us-ascii?Q?bNoU0bzwMvrlZbs3da+yVVIFzsG2i3qNL32y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xHpGlp9F3jw1+rdOU1QZpEc7vI+Q4IqeKNbkGfqki4KnNIOzmfwSPxKXyx7d?=
 =?us-ascii?Q?94aamFAdURb/hOfga5EdcFZMys943vDx5E7X67ksNTD3kPX8RY3ifZdroIzj?=
 =?us-ascii?Q?6EPgE3ZGCOortHcoCeLtmxnEMiancGAXal7sevqRFq46aYNQPR1Dd4imd6EF?=
 =?us-ascii?Q?McC6XjQdRF803nvgOHwG5/BPw0ONB0+i6wxrVj2CIinouv0so9UH+9uWmsDs?=
 =?us-ascii?Q?NW90e/+JhNJ7cjty08Wv5GJBtBpUFOfgwE3MHd2cP6sA5LDRomxZnoiIKJX0?=
 =?us-ascii?Q?g1rT/CEukbaLuMzfz/uHKpL1ZPDsp4o8eEzsC4p4nqJY2fOg8KW85qJzQv3p?=
 =?us-ascii?Q?3IGEcUz7lYPAlg3P1UOvnf6/EgJ5EpA/udcljNgEFPPuzLeiA2MgCFW6Ixww?=
 =?us-ascii?Q?7I0LQeC7RdsHkF177laPse7mROQTw67HBj6WJAAygDmpNNj3zJXR+wFseEW2?=
 =?us-ascii?Q?x0sWFhBckpgmCBAzDNuNzFQI44/VcgTTGPwlT0w+GTDN/GKTdV+T4ru8At95?=
 =?us-ascii?Q?J01Ky2tG9YkiFmIL4JDtyzJ9FAiQktM35npfVEN4I/Zm+Er/Jh9LU38u0zpn?=
 =?us-ascii?Q?/X/5FhFVsNe2JOmm0y7XGDKftSnKoFuuxUko2BlvPmmz38ilGJRu9MZkjT3Y?=
 =?us-ascii?Q?US+0ySxx4NeRiYAM+zOiJ4HzLOEvqQZvxAvGNp+koR9Nw/+P+n5026U2r8wh?=
 =?us-ascii?Q?z3Gwrg2Z2RERO0v4H5uTiY/JRFlFwICVXc0qkrtl5FJVeqKZbkU84OZvSy3C?=
 =?us-ascii?Q?Na22Vfd5fhUDpHVaQety1iIjEXRxKwPmViTKYLNZERfo4MydUVnNi25RiZ86?=
 =?us-ascii?Q?CH0gYJl5Jgbb1i3sPzobuG79BhQSl2i7RwJWQvJszAmTGWmK9rpZljr0foDR?=
 =?us-ascii?Q?CD563+H5qEQbiyZTweaFlBzwqPW0WtLNpD8EE4hrvhOcmmeDQ2ow85N01O2E?=
 =?us-ascii?Q?AEitYbJyruCu4BnQdXT73btqxXLttJraLT1FDPWyC8d/i2XY2Oh9aiQb+xm7?=
 =?us-ascii?Q?mPr+NYtOkkiSBWfE+JwHnpwN6ZcZVYIqQbzrattsa3SO7afJkOSs94W0bE9G?=
 =?us-ascii?Q?HnuEbkmJH1PsSyug9ESP+TIY1gATmZa8vDaEpRJACKtoSO7MTyn/KuVpfyF3?=
 =?us-ascii?Q?Fx2rp3ZMmE5NOx1SMNy9Euf8hD+qugtX4DMG1WeV4OL6XHBrbruz9tiJ6lzq?=
 =?us-ascii?Q?Y7MHEz6eBrxnf3Weffk2J5nbXk/cRDL2ipKrDY0ttKQdMyO8psffCfc5eB7m?=
 =?us-ascii?Q?POnmgSOQxvFct3NPHcVLFthpTn8GJ7fzH5Dk30oyvEaPDBwQqKCfNP1fIwSK?=
 =?us-ascii?Q?KWYNsARXw+Fx4X6aYao1Yt+UoiZvTcucRXo3DD9+okrS+WAa10KAaCTP4UoR?=
 =?us-ascii?Q?F21CweSBapWxQunDHG8lwetZKVwFJxPcrVVNNjBl3ejWQ4u/f7xidxgDv2Ac?=
 =?us-ascii?Q?eJY16VYdSKLcMDVqiifHqL0vw9n3v7a5YBQOWcsp+OxVItty7DDINNt++nvU?=
 =?us-ascii?Q?bk4D3W/9As5Y30Ayd5eEnWACTHPXyGxrdQxMOIjM8Qm7Qf3zvk1VXzq/5Y24?=
 =?us-ascii?Q?X+cBtQZxShIcJFvPQLlPuvudIlwp4xIkMvnVJOg2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbc7ca9-c551-454f-e33d-08de3cc5f98a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:10:12.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwQ+eRWcb2QH742KpwMNhUvIOIy54eUe++gAJOH88KKLnI5UxlLraafDTEJF9x435DN9ngf/jRu5/sxfXSUZwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_091019_364490_B034E784 
X-CRM114-Status: GOOD (  27.13  )
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

On Tue, Dec 16, 2025 at 06:56:38PM +0200, Adrian Hunter wrote:
> Add support for MIPI I3C Host Controllers with the Multi-Bus Instance
> capability.  These controllers can host multiple I3C buses (up to 15)
> within a single hardware function (e.g., PCIe B/D/F), providing one
> indepedent HCI register set and corresponding I3C bus controller logic
> per bus.
>
> A separate platform device will represent each instance, but it is
> necessary to allow for shared resources.
>
> Multi-bus instances share the same MMIO address space, but the ranges are
> not guaranteed to be contiguous. To avoid overlapping mappings, pass
> base_regs from the parent mapping to child devices.
>
> Allow the IRQ to be shared among instances.
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
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c     | 21 +++++++++++++++++----
>  include/linux/platform_data/mipi-i3c-hci.h | 15 +++++++++++++++
>  2 files changed, 32 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/platform_data/mipi-i3c-hci.h
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 3d6544a64188..6da5daf18166 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -14,6 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>
>  #include "hci.h"
> @@ -737,15 +738,27 @@ static int i3c_hci_init(struct i3c_hci *hci)
>
>  static int i3c_hci_probe(struct platform_device *pdev)
>  {
> +	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
>  	struct i3c_hci *hci;
>  	int irq, ret;
>
>  	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
>  	if (!hci)
>  		return -ENOMEM;
> -	hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(hci->base_regs))
> -		return PTR_ERR(hci->base_regs);
> +
> +	/*
> +	 * Multi-bus instances share the same MMIO address range, but not
> +	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
> +	 * mappings, provide base_regs from the parent mapping.
> +	 */
> +	if (pdata)
> +		hci->base_regs = pdata->base_regs;
> +
> +	if (!hci->base_regs) {
> +		hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(hci->base_regs))
> +			return PTR_ERR(hci->base_regs);
> +	}
>
>  	platform_set_drvdata(pdev, hci);
>  	/* temporary for dev_printk's, to be replaced in i3c_master_register */
> @@ -759,7 +772,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>
>  	irq = platform_get_irq(pdev, 0);
>  	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
> -			       0, NULL, hci);
> +			       IRQF_SHARED, NULL, hci);
>  	if (ret)
>  		return ret;
>
> diff --git a/include/linux/platform_data/mipi-i3c-hci.h b/include/linux/platform_data/mipi-i3c-hci.h
> new file mode 100644
> index 000000000000..ab7395f455f9
> --- /dev/null
> +++ b/include/linux/platform_data/mipi-i3c-hci.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
> +#define INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
> +
> +#include <linux/compiler_types.h>
> +
> +/**
> + * struct mipi_i3c_hci_platform_data - Platform-dependent data for mipi_i3c_hci
> + * @base_regs: Register set base address (to support multi-bus instances)
> + */
> +struct mipi_i3c_hci_platform_data {
> +	void __iomem *base_regs;
> +};
> +
> +#endif
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
