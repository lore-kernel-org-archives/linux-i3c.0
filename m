Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868C4C5DF94
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2026 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cex+hk45X/L+f9Ig/r1tUPfHCB/I1hasmGEep1yyX4Y=; b=iTNgKnYZlOVD9n
	ygUi5ESHLZkkTfaCkZ1IxH2JtqbfgZFMUwLhACPsDLJM30VI39tsZmtqw5INLSLJF2mmEfQLZcLAc
	q7f6TmgM9M9srDn/ti1wXoTeLqusaWMWv8JCbw3OrtJE92j5f+F6IpDd/WRMsIK5wf0JGdgxR1q97
	Nzz6cs23gjMM78c875KFCkhDkONoS5nU5jX83eKe7FrHOiSXxHTdDWHE6wOK6Bvc5Liurydd4u6oH
	3O0BMDpKte/8ifhfp6pd6Q0GxZf+RNe+mvXDoAezzJazcWwnFBXsvuT9BKx+cDQg3tN9MpENU5fYd
	xdSm4lDiv1GDAuxqB0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWFc-0000000GrcA-0qaV;
	Mon, 24 Aug 2026 15:06:16 +0000
Received: from mail-westeuropeazon11010027.outbound.protection.outlook.com ([52.101.69.27] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWFa-0000000GrbK-1A0P
	for linux-i3c@lists.infradead.org;
	Mon, 24 Aug 2026 15:06:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jox7HdU7sxY9tXMJ98pBxiZJgSK1VWWkW/ugJmeokGUh4JJRy/ZdW0dfhWlcJ6BAgzJqGUh7h/aNvaUnVrsAr2lBQJBevWGEq4cmaLsIh7CmXlSoDhLcEzptNnmSE7tbCBIDUl5OvTsdWc+jxmEo297SDGwcw/tNJzu1Fgks+GjiAqdPDhbOfw3nbdPSjRQO6y+mI7ashgDuDD4B/cRFlVb42k3Y0eUsmrEU3LmDpYoFfqKlvF8dghCzNy7am/AiyvukuImdobf+IDFO1b+n5tXwvIDYRVOOfwRqGCnL3lfAmkEl/bN83leGMfw6iuAwf0jFXysMaMiJ1iOkhLELHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi42k63tJKlaJ/00VNS4uk6tyzStRMuLOU/cGsw84pE=;
 b=uCxL+ZbbdEtZle4Y7Vloruq1uXqZme++cEvRWZlHBveM5LlWpeKdPFCW6d2FXCOo1vYC8033swTQ9eKLBe4hCAdNJKneEWiiL1/R3Lb77CCWTCjuPFQK+sdXK0UzfhjBPEcVZWzxA7hBQcm1HlmN1w5ulmrJ/8rylrcgZryhrvi7R9ohL86G/CKUvA2rI1bMqYtOmzmU0o9kBe+UXrI1L/SuJRirHY5M0JHDNhlkYzNDsAwpUYr8T8tLaXOBq0xzuuJ+qFlJbYtmGNmQt0sQxR+v2UHq0z+eznLdfPqII7J1s+mX4RbrfdOhd8EvqdzCGVz0DUFEe6Fo7wB/HvZuxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi42k63tJKlaJ/00VNS4uk6tyzStRMuLOU/cGsw84pE=;
 b=EXAPRzMrA4Qy76UivqEiYGje6LcMq52DHMYceAr7Yej2K4Emqs6dkkXrDyFULTzMBj+IruASMdJXWcaDn9vhBab9YQ4zcJTLCZTWgPfE1sioxQhHwF5oWfnA1uUzEAP5zMl85pyVhTo6xOFl0GXihoJIb++RPddndj1tQbH5iYGnKgFENcA2SWAZ6Qs6y2iPapSnKcQYCIEhd4SzpQxGw7OTTTGtKYQ8BHFHT74rJqw86KHSuyzW1xujfMx3MvddpE42+F32x5Fz9MHrxU1+Q3rTemwnOVoT6gjgyYVHp14qJ+vllYCbgqnhjoQo5QbMUuFSldM2GGVjDyT05xxXLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11697.eurprd04.prod.outlook.com (2603:10a6:800:300::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:06:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:06:09 +0000
Date: Mon, 24 Aug 2026 10:06:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <aoxd2Rq3qIoNIosY@SMW015318>
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
 <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
Content-Disposition: inline
In-Reply-To: <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: SA1PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11697:EE_
X-MS-Office365-Filtering-Correlation-Id: 4040c069-b62c-45cf-3bf2-08df01f13ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|10067099003|5023799004|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Cp7DwXL+rqFva3vqS81IjbCidTmkX0gi8Mmrd3XKDIU97AydkoVXYKs38r6E2+t04FTYP3tb3mmOgUa4It/Kp4RasZStJ1wYwvmtmmR3mBZA5XfJMHMjWhwJOTlPp+1pjOUX5Mc3erIexxcH81GQl1MCV7Q5r9bLfEJSKvg4COE4KjrSZjepvtCZZYx0WYla8mlkRtt7SZ1PNwUxVfyLFhoxYxxhaAoYXyJPRO6nI8u+xgeoO3W9V+QPy/Rm+6300HV1L1h4hF2tr0u9Y7+8YLScg/vOeLQzn/f+SOfXCmx4oTGL7+HqtApjYYDlOPGcsYmiExf8gXQs2Gs8tFv3bxa9oqaOrepCTt7FWmcx80limnBuo3CAD6VLz+FRsasGsZuy5IEJtJU+17bQOMPFgtFrt9Ssu2KAbY6ajpndEXd4pDdiF+5BInOhg8yQvMTmqHsCudRVpNEujIf2tgSViywpOMAffME9MIIJWt3BAjAYwqbfO4zIpheQWI8/BujqBkVlm9Ti2UW9s5gSrrjtfthpSJ/lB4eZFj279UgLW6ilYIj5I2k5vw+yL1eMsLzkptr0koLFPF6dh9t1vYkudKIyyWnIOlhkQLUmdpyU48iugFWjTxZTUnbve97bUDqU/hM1920MK9JUgrH/NcpVtwt8IFTdYXZ8LCh0D9bz/ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BPMiAXD6cMZs5YIwCPTZ7loWwaYfBMuno+txiLvGw8N3sc6tt/pRnzd2LWpg?=
 =?us-ascii?Q?jYYT6A4J3iA+fRiIqBlxefT7wjLOy5/0n8v8dRGwdnQTvdvK/v6puqOXhPsY?=
 =?us-ascii?Q?OpfnLW+KHjxn1ZukZtBkvfgX48aK1oZtEZDa1Fyz/2LkCpyhLRtirC3PWR5p?=
 =?us-ascii?Q?trkpQkkAlfEVw5kasmuS2tXpW+FvC6fiFEzQJGSEf/Ujkidm0+rpKy+HunuH?=
 =?us-ascii?Q?OvlvVGbWKt6MUk+91h9o4njdZ1tLE6jHognXlDAGLBytwhaBhOk3I+VAOhdi?=
 =?us-ascii?Q?mQ2S1g8s9YBmEEmmQABh13ikJDJHBycV2YQYp7CokvI6ruucKQuKiUoKZWVk?=
 =?us-ascii?Q?VxReYnCeW0P82CzTlJ2LuHi3ptBbm33NnWWKREtQ+U29ICQ2g4p/lxzEpzlv?=
 =?us-ascii?Q?nnpN/mdnUV4RXzemPPAJW6nG0OuOy0Ux2zZ8s+gP1epBYjJAXU9FoDtXTfpA?=
 =?us-ascii?Q?f8fTcVJkMvOMWNCH+5o/Goc6d3b5U2kSIuoSKrPuTjggZAmU7ZnA9Iv1Bn6d?=
 =?us-ascii?Q?1r1t+WyYiiKeBputYOzWeQHMXJL2a6uGUEEy87w5RH6BCr4XgrKYPBlQU5r0?=
 =?us-ascii?Q?482ytdzIzsdM8FBzVePbL0/M0Bg4CCNZdB7szLAva98AckNZx/MqF2ypN3eO?=
 =?us-ascii?Q?lpo2g1zSPRCvYgyXc9wvgYokJxDzPtAqR8DaShCBbv7N8u6He/6q0pL/+Zse?=
 =?us-ascii?Q?D4AK/7C/ILfv1OolovYoovMefNDPwafl2kkyUmMPHnZTa6szZOVbMIIiMJCX?=
 =?us-ascii?Q?8pHQp5ZhQIPo2Z/8IYii6+RaXtQm66flXkykABW6MWsjJn5dE1qNPH19n0vr?=
 =?us-ascii?Q?YeNjmUlK8EKydUUXnQ/3RNX2nRHyxPcXN1heUCJEvjvhvNgMWHkZU8lW54i3?=
 =?us-ascii?Q?Y6Eq1WisLe74ec4o8bhIu0hc0+y4SvefS+Ej9dSfeqBKD1zHcng4LYb2cwpN?=
 =?us-ascii?Q?SkLSrlgtr19gr7iPpqZ/fNwmCBTchrmk4FhrK90DgGU9pOKQAK23HvcD5JIi?=
 =?us-ascii?Q?sMh5rBucZvhkotaEoBfQ4a3o4A54FE31VSxlBy6NJqwXJUHGIf4CqeyzEcrC?=
 =?us-ascii?Q?mZoI8VosOrE4MIgbMU74bl/uy4apMF+NmBlESPIzQv3AMgBd5RpymtL+DVRq?=
 =?us-ascii?Q?Vnzm6kvEl0Q+Xph/2q9u+j8LhGv39X67JY6CWnT1Yfw0XTNQbTyAFBsM6JPh?=
 =?us-ascii?Q?hy0iJU+E3KAYHdFk+BvLpW1IpV7JQtxh6K5tDosDgf0pV64iG5Dh5xZWkjau?=
 =?us-ascii?Q?dQmNYF/5khg+VEO9TDzSCAX/+qsqQ3kot6I2mU0K7OD5egqGVc/V7ECnD7rF?=
 =?us-ascii?Q?Lk1NrYjYRNuyydp2/nks6kPZ2FXNxpGKrlTBbT3pV3j1iz0XK8Vr0DtsZrRO?=
 =?us-ascii?Q?E8OFFCewmsnWf0Bk2kskmL5lNDhECt+uu88e7Aor4kB+2DromNPI2OxIqf4/?=
 =?us-ascii?Q?R9w3gwfi8UAfZ7ahF04cPomdL4oMayPHzaKuOrAqOvRYgbXCpm3tTXBX6tEA?=
 =?us-ascii?Q?8PePlr1l2kNzZIP+Flzx89U0sooypwK53qDj4TWZ5ZenB7eZSq1KwSnyu/fk?=
 =?us-ascii?Q?948I74Jy0PbcHgMTInoSn9KIIpw7ax791f1lQ2uVaQodpq788yRTkr2oCTBc?=
 =?us-ascii?Q?yW8hRbXhym95OHbzwfx0nHXPPsg+uVX+v6VfoJjrxbyglRTUn0yvIB1PntjL?=
 =?us-ascii?Q?cPCY2ln2vO9woAxgMn2Y/Ev2a9PbP6ETpBosx5qzWfwBmKYXMAXvrzBsXoaY?=
 =?us-ascii?Q?X9MjNJofdA2tFx4hygdl0gTvEPY7VfRk1gxY0/feReZB8M+PoLsd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4040c069-b62c-45cf-3bf2-08df01f13ab7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:06:09.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOGf1wtYa2KCbIebSQK35+vCqhAIgKpoN3dEHB0Vxg5da7HCYHzl9n9vE0oH2ioA0WRkvkA+GfDIYgRzHjt67m0l2WPjHxTh2CX8jjXNVRErqEUl/4jP52DYqX7EhVMv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_080614_321976_7237216B 
X-CRM114-Status: GOOD (  20.47  )
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

On Mon, Aug 24, 2026 at 10:18:33AM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
> Changes in V2:
> - Rename the properties to "xlnx,in-band-interrupt-capable" and
>   "xlnx,hot-join-capable", and expand their descriptions.
> - Express the interrupt requirement with dependencies: instead of an
>   allOf/if-then clause.
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a8656..a04becc07374 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -32,11 +32,33 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  xlnx,in-band-interrupt-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with In-Band Interrupt support. An In-Band
> +      Interrupt lets a target signal the controller over the SDA and SCL
> +      pair instead of a dedicated side-band interrupt line, by driving its
> +      own dynamic address during bus arbitration. Such requests are
> +      reported through the controller interrupt.
> +
> +  xlnx,hot-join-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with Hot-Join support. Hot-Join lets a target
> +      attached or powered up after the bus is already running announce
> +      itself using the reserved Hot-Join address, so that the controller
> +      can assign it a dynamic address. The request is acknowledged by the
> +      same machinery as an In-Band Interrupt.
> +

I perfer put both to i3c.yaml

Frank

>  required:
>    - compatible
>    - reg
>    - clocks
>
> +dependencies:
> +  xlnx,hot-join-capable: ["xlnx,in-band-interrupt-capable"]
> +  xlnx,in-band-interrupt-capable: [interrupts]
> +
>  allOf:
>    - $ref: i3c.yaml#
>
> @@ -54,5 +76,7 @@ examples:
>          interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells = <3>;
>          #size-cells = <0>;
> +        xlnx,in-band-interrupt-capable;
> +        xlnx,hot-join-capable;
>      };
>  ...
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
