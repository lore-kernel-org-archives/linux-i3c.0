Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C82ECCF9F8
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Oct 2025 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gul7gDmLWv3HKISwBIYrcLTxgSCGR1Iziyf+e2GDYII=; b=h3FBevlyawpVnY
	3lDUnUn8tKIQ6lKVeBR5sj4y8EdDMCcoYlecbUKXLrt6tyDCWr3hal/nDJruBii++2IFpudblVGbo
	VWXn2DYFxnH2lVI9E4W1J5xOitcvhqAOywGSzK4wvizgDQdf6sQegtOU9PchNRCOiLrCYUx+pkCdz
	JIzjsCBUbGByef+Xn29odRsH3KqLy+QX/jcg9+XO6nWuXTn+LSDQpwUNL/ilJgsMwD8WreUWQ82bH
	eee2XjIOR7x4drLPSS+K6Au+3EsyrTzRfgwccwIK9BLpDsRTq1smBJ7gGxCtRwmIm58oslv/sADNM
	hZQWdPP11aVsxvSQroSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEu7c-00000006dwf-3IDL;
	Fri, 31 Oct 2025 18:45:12 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEu7a-00000006dwC-2jXv
	for linux-i3c@lists.infradead.org;
	Fri, 31 Oct 2025 18:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cU+1GVoWbHSXf0CCSfjGHhUFBrLEueWIYhMdZexO9xp/S5X5fPiQMPCg1hGh/7jcZJQPJgMFcG1Y1gH9ZfAnCIPbQnOIBdCr10mM9QkzS5qgnN1lNEIc/E5N+Sh4QqRq67LFHcxOgmkuF7Iltkl+ytRHBKOpFi2nA49Mi2+5TAbrFyTwUvTPZiwZjOQk1vIeyZ/nHSqoPbY+Kvsgbc9iqdy8/J8Dn4FIoHonAIRJliq0hX1tcpEOkw+Y4x6XmIYatHhq84cfRu5jKQlJnlXPA6imLeRhF1cLd/+pS7Mgj8rLsFpDbIjnwqPbto90J7midX+K3z/M5OB3KyJg1tA5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2UN7D5fHbBXn5HyWgsqdvCESwAE9VVmnSElMDz2F5w=;
 b=RrI3KR7/2LovAnQLBUhk5PSMl+vkFLRViMAhMpyUWvPHPqodyeUuJl8GYcI5kYrmz+G6ajhBdMAJV8V4v80l6iSZ7Vguquqf+DXoGUNxq4e4lwm4qtNhy3tMU7jj7HhR5gqj6+UNjUthATUF+UOXz3VDIgL3SAmXKh4xNTuesLteyuWZZd8GpmuE4qUGGsXSt/OWoCPNaxXxM0AosTa8UuxDr5yfuVfLMoyOa0SeKBXmrgNst60fg4nSZ7rPogaLZNB0iesPKniC+dBv1eJNE+m7SHMRdev/myXSZREHLWTk/9Em5TvNRRe94fWNJcrevPJucHca+fNobg+GmZ74WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2UN7D5fHbBXn5HyWgsqdvCESwAE9VVmnSElMDz2F5w=;
 b=huY7BBw95P4Tw5vdHzC9z7JeJrkEe9mqBi5tLpKh2naqsOvb7VClK4WPpNSZqkmS15Vteo1WuvSCpBj5q5TwJZr7xBOR+cBOrZOUFQeO1OERdaQwlZrVnk6ddBUNhck08M32Sda6KjTUvx0vGzAU9ag7SaxD1T49QqFgVYIeLGLNSNesrJzoGr0bn/+DLRZF4q2Aq8SDwNX+JZUZ3+GDBBEvEIVdqngCOPYuHue065FEX7yb/ybsERh51CP0ocojWlRihuH72n79fuuKd0W4okguPIMXvSSXe8K48cYzZww5DMDHqRouLAOJSpr9RGYkFTzEYRbeY2PXBZhF4JMjaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:45:06 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:45:05 +0000
Date: Fri, 31 Oct 2025 14:44:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, wsa+renesas@sang-engineering.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: intel: agilex5: Add Altera compatible
 for I3C controllers
Message-ID: <aQUDqTBciwz49A//@lizhi-Precision-Tower-5810>
References: <cover.1761901158.git.adrianhoyin.ng@altera.com>
 <f1a8b8265fc2b0fc7d89023f91a74bf048639751.1761901158.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <f1a8b8265fc2b0fc7d89023f91a74bf048639751.1761901158.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH8PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::26) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b4ec81-9b87-449e-a463-08de18ad9be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+XPN99nRUEUXgJX4WO2+Uf/5L+Cd0pilaFdnhmVg/RpbdgB3KBS8eYUrRRYh?=
 =?us-ascii?Q?f4U6vWHsMjf4Byhlmv+TyavoF0VuQkG3HAIox4GDSE/SqzAzYEa1QF3YFRe+?=
 =?us-ascii?Q?/CRJ7ubObHnPuWTwNHXv/TopjB6cznlL6toI9mST+0SH8eMIf7b155s5a8Ib?=
 =?us-ascii?Q?sszxipTVskuyUfBjbFM12kPIfAa0jWGMrRJID7I7+mhukQd7uU9j9W/JTzD8?=
 =?us-ascii?Q?pNZiNVf5plNq3y9uhxzFJOJ07JBvr9QVYzeTwZy22vwwtrZn4Tg3jvPpXKrm?=
 =?us-ascii?Q?j/sulC1ZYpfBdcd5bAx0dtwCdcd5xhAEn8DhFthZQt407RtshLH9epKUgCmX?=
 =?us-ascii?Q?/Oud7xRi5J4C7K2cf+uUjhRAi2A93NymNBrxD268jv3jwKWFbbmClojx5saD?=
 =?us-ascii?Q?3g3nc2IZAi5w+qCBefXJL5v23lBuiT9IWqIiOCDUvlc81UEy318DxRJWHF8i?=
 =?us-ascii?Q?5a0Ogp1nkSBBQM25d8QGOlq0lcuhwiibqskso7819qESFdvow+E6H/xyPn/J?=
 =?us-ascii?Q?ujp5iNcMN8yTNt/EcclDqqDym0P5g8GkmaOdKmw64Ro/9S/DQsgFXZpCSDYY?=
 =?us-ascii?Q?mKJ2C4KqA960+wryUnNRV3dFPPjTlHeXa72vFpAMpGW4ra9udfcxm3IQzfIm?=
 =?us-ascii?Q?Llvca+boDHnGsvn+PajUPfazNXSASqhYei/3L0cE2xJRjO/mJKtO79FP2T03?=
 =?us-ascii?Q?dUHy+/sJRmDAKlEnNwuZOn+Bh94D3BkELybuCcWBaE8aejZ1i80o+tTQmc/E?=
 =?us-ascii?Q?jbf54a7BI3zNQ5m9cpKcdpC5YRaPFf11XoLzwh3wp25hCvd9/eYWLDnEDHoy?=
 =?us-ascii?Q?sfA8aEOatbKEGP79z5l+MH0HP8MXnPX94cWTH/O4oCf92wifWuftlH4HJ9E9?=
 =?us-ascii?Q?oUg7sPaySGuhWAmF3bjFnJxrAc/tqx3oI0aKK0vgtjpm+dXrMXlSFB4QaRrH?=
 =?us-ascii?Q?u2cDOYtEJI8/QWheji3X0daB9BzElY6sxSxSwYVGd2ZMXGhcGHanZRCSGopz?=
 =?us-ascii?Q?TTvOs0Y8f+OqA9asclq6VWs63MfBCc71JUGrLyhNC7JOH9CYXPSSKF34b/yi?=
 =?us-ascii?Q?dqECha0rpcYI362xdtGmegeqtQzH/0MJa4xZDNxDy6LPa7SgSY+7nyGSTHGm?=
 =?us-ascii?Q?8PPwFG7yF1IsCYsfXWYeZkOrp+JG5R8SRUWpsiTNTSTgspf8P7IoqbNJ0UBS?=
 =?us-ascii?Q?T1LC5jtLcKds9Op7DMoHMpzEm6Iau4ByzKKc7/BMpvmzrLnCDlx6tsUAh4dh?=
 =?us-ascii?Q?n5lJcEtrNSoZVY5AO+N8TqvjYt7iQrvPt8/P18EWyUkhRqPbW3+OYpxn9bsX?=
 =?us-ascii?Q?eyMK1xrQuptxFOs8QUy2PwNYGSlddT1C6iPARsC/cYGF4fNxV95E4Hu0C8qt?=
 =?us-ascii?Q?egcOr5GhOHODtRIf/Lasr630H1HFnBjzn4pjV+DxVdRSxHrr+JSpozBhzHZx?=
 =?us-ascii?Q?+SAejAldyzHed0dtTX+NcRRnrIwsqUptz1cZJuUPMBEUWQkfawNeqQxN+JAy?=
 =?us-ascii?Q?/M4NbNRmHoB2+/0hJ74E6L0mlFwiGmfofGUR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h7IyylTISbvAZ32v4M5pMPZAAWoXa8sI+fpm12fmwROpd5FRz9py4w6qkKgb?=
 =?us-ascii?Q?dNaW7S1u3iNwP89OVZV+DLLAHfOr64aeHyqYy+nYQxyZuKRRxROyW+eUr/ut?=
 =?us-ascii?Q?KvM3Lv0x40xZQt7Ieo6fkI2qf+7y81K3jqcV89KHke/of0bCfazUhb5zfqCm?=
 =?us-ascii?Q?9hUo5T7h0s79wk4tExFlKBMcVskbxDKeUejBVJBxhDn0O23d9NXURSf6ao+U?=
 =?us-ascii?Q?hzIQYAmiNiysfY8i79V0jdw3ZvCzciayU3+B+CQQAqN/bb6ay998zQyLRU4Z?=
 =?us-ascii?Q?JbeDiaOqWLwVyRQLcIcRpxlo2ZqBTUvKQZ953tQUUXfNdHlXgQpnmK0j0j7d?=
 =?us-ascii?Q?ZGQ/va3NnBN1N6AfW6mL+1xMV/jvUaQ8J7u+X3s465GkqOeqN7iOghBo0Mp2?=
 =?us-ascii?Q?zhibmTPFzcJO+vcxcF2MwrjFcrCCm1UHmkfXWTXtBkcNNgryFbYWjtbu2Zhq?=
 =?us-ascii?Q?0ELHmyhObBNw5LPE90+usH+DSdesW+69No2TV1ZB5ndgJxTjG/VyL8j/HN5C?=
 =?us-ascii?Q?MfMgF6LHTlgdlSqoBTG+SGbKOWbx0tIDwSmcmjpg4UToLNyfBYEZKTD9/qgw?=
 =?us-ascii?Q?4yhUsZhC70OcTA9QptNCrnL18GOt0/K62MSMUrJ8NDJeW1Itp/2D8zhiWrNy?=
 =?us-ascii?Q?EOHsr+jbcMFl2biZTs63Ao5JiTqmmuwkz6a/ij74C7nG0R3cP/7KEp1E4l8p?=
 =?us-ascii?Q?rtWsGpKUNnUFTOOCfG2V11MOQmfPGTPL6w6uGc7Z7rfb0Nv0E2ZqXQtMtWAf?=
 =?us-ascii?Q?iye4958++q7lswMSw1gAnp7laL1B26F1SlWrdyEVYk/rc2PQdwXONABN/a6+?=
 =?us-ascii?Q?hoAoNLDa1358HS/8NnspDBvKN1Tbqdvm+6oqxjctB2FX3kprwkhXnX7zzqaj?=
 =?us-ascii?Q?4uQJSkojXjZomS19apEH9NxTwWX+eNr55NJ3VI/9mwlD/GHPF+COoC/UN5a1?=
 =?us-ascii?Q?sGAXNciiIQgS4LgMzw+8PtCRfVtNkbOXBmOLh4DcuLus4WkS3m3R6aZztkq8?=
 =?us-ascii?Q?7vbGQoYhK4G5cOxjBfA6sqcICyeeQ1MsPJEUFYaEuiw2JNEY7ZjnnUYVuBGm?=
 =?us-ascii?Q?J4MBLO8+dlF5khD5glvNQr4Ir8SXcc7vYGFgegOui8OAu2zbrG+c6E/TyJ2J?=
 =?us-ascii?Q?ZZE6fb/psw07TUAalcvGJGFVhiXDWgoJwItCYkRagh/FUPI6+ovOokatHTc1?=
 =?us-ascii?Q?Cnh6IvDR966fSod/p8PYLsP8NIIkK/t0tsFcvrmlflct7vh1lVHRF4ktu7rZ?=
 =?us-ascii?Q?UfW7qv5GQUmvJXOUk+U3MP45i/7okoy5FLU1gUt5QCRBpdH3zDM+WrIsLPeI?=
 =?us-ascii?Q?6Pd5vMFWwHawqdw5RNxjvX+3ZfC5eyipqhc8m8a8N20uHS5bmDcJD5Crr6BG?=
 =?us-ascii?Q?sDCm5HIWkOm/l6yHOEkAoLdFW0sdPngHGlgGPNV3JV+ojBopt7QWVEWKeK/t?=
 =?us-ascii?Q?GfJWIZloQ1dsAwYsoyiStHozCtqZ5vh0Al4FGuhNm+2xtDCOfxyX9liiBvao?=
 =?us-ascii?Q?brnb63YxsOYFRQOKfPsehK9V1eIhvRbQcAq7xrOcQQgXPG8cKdULiSS8NiBu?=
 =?us-ascii?Q?AkxTogPD2tGL2THcor1TQxdGbgyWYIXbV/VYojN2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b4ec81-9b87-449e-a463-08de18ad9be9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:45:05.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jl+EmNaYzHLMGpv99VOampLu7678YzUyFabHFHhiEa2yJQfoIOcb2mlM5qrTXCtqYSvINVAFVHLoAdHG5WVNXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_114510_741090_E10BD947 
X-CRM114-Status: GOOD (  15.94  )
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

On Fri, Oct 31, 2025 at 05:05:57PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Add the "altr,agilex5-dw-i3c-master" compatible string to the
> I3C controller nodes on the Agilex5 SoCFPGA platform.

Suppose this should be enough. the below context is common sense.

> This allows
> the platform to use the generic Synopsys DW I3C master driver while
> enabling platform-specific quirks or configurations associated with
> Altera SoCFPGA devices.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 04e99cd7e74b..c494b3bbb5e9 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -203,7 +203,8 @@ i2c4: i2c@10c02c00 {
>  		};
>
>  		i3c0: i3c@10da0000 {
> -			compatible = "snps,dw-i3c-master-1.00a";
> +			compatible = "altr,agilex5-dw-i3c-master",
> +						"snps,dw-i3c-master-1.00a";

Need align to previous line

Frank

>  			reg = <0x10da0000 0x1000>;
>  			#address-cells = <3>;
>  			#size-cells = <0>;
> @@ -213,7 +214,8 @@ i3c0: i3c@10da0000 {
>  		};
>
>  		i3c1: i3c@10da1000 {
> -			compatible = "snps,dw-i3c-master-1.00a";
> +			compatible = "altr,agilex5-dw-i3c-master",
> +						"snps,dw-i3c-master-1.00a";
>  			reg = <0x10da1000 0x1000>;
>  			#address-cells = <3>;
>  			#size-cells = <0>;
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
