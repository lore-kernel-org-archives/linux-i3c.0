Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEEEECD983
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Feb 2026 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jfDx8Qc9XbWZqFeCRWjqhNxO5yZ5oz8Ucda0e/uItY=; b=CFkTASbed7SwJY
	gZxQfIslhsAPnWFwmafd/u4oCXmr2Ivjz25XoZmfBM6sFblVNBO4MeKxkr4bSdfbKOys0OV2oejLC
	d972KFDhI0MlT5OvZJMxbYhT8faf4O+mm43jBPvQNAcy3wciLMcW2tHQIN3VYf9Zf38LPxznFXbLb
	SvD+jejRX3hqOj+i6fIVMhO21dqUwOcyqU/8XGlYWGgbVRCY9G0/mXxWZrBjBejdrSm6sbZWi55tC
	ZIQgm2ihKJc1QK7dPQwm+iJIFEWwhAENJ6NLAB7uVB0fRlj7cDQxK9EGPDlumwfkFlubo1IGHAKw7
	V1R/lRhOfCFYrdiGbwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo24L-0000000ADjF-1hIs;
	Thu, 05 Feb 2026 16:19:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo24I-0000000ADik-17TJ
	for linux-i3c@lists.infradead.org;
	Thu, 05 Feb 2026 16:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdBKjKOHTC1HS3cGiZqxcduaw14wNN8eM6B7sTdyTNWdiVA6b0IPIBI4aoRv9hS/+hVZ5RoSTVHDvUUq79WI8M2JRco/VL0g1DOtUxVUek+HYHJIPmEUDws2LZ7UwSdTFXfrTuHpXDA4mWv1jUH6Domur6Oqaj4XSJf4/ejsGLOs3Sd4AfJlRPcmpjQ75LeyPxYU+HFdQSySPulL+e54msP24YefWWBx7l+F+VNSnt+jIB9d0I3BCUWCJklMSf2yeDQ+Jmydgxx0Ib9uXMRNxpx9uMvMaXsFcaIz5zlbCHvMBEj0asQZSBex8lFPqu6X8yz/eugpkDWDPnfKlWlEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf6Cqxi7+pB2fKu40+TRzv3T8s29FahRU74xrrLAwhs=;
 b=S0iJ0hceNANzyQisOTSnN8ChWmqfzCI129JXhCjqroknY2lDu4AJPjxBHlvlhI2YQEv04oBZ2iqFTsnZiv+azAwRefhJeIRgtJ2rSmlycMVCW7PbGmQrNvEAEqS/VxNCnO4TFG6Br69qW+81uRTm9scoolfRBqVTGOf5ukSw9J0b3YqMMfSvJzTi4WpTgG5WbrTmFijZcSzQPK+F0tY50kwh+71G2mVdR4VJcFDZU+BD8HELhOFKBLUDpdOftTzDPjQtav7z/Q2oLnMS+8xtOolOIlqEL8Y/6RtdRl+w0mgmdJ4NdpOQmtoGtLb9y5cCqHHXYwcjgQGPN3EmjJuT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf6Cqxi7+pB2fKu40+TRzv3T8s29FahRU74xrrLAwhs=;
 b=clqD/qVo/C8xNYq12sp/jIjGF1ghSdukkP5VtsugB28EG9q3EjCGnRMVb73gGc1XUqQImhd0YoUAeGTPAgXeuy6tmeJTEuFE9zfyGIdzC2UeoBIa6KnYSxLD39wdK9SZu3jp28zHOG+xwltnLoDjrQpUUKIxzaWBDQCd9nmrvCZYHCrGUOII2WHo/PkNevEsbQfLMvl8mYQzoiqcXU/c4IWJShVqEj+xi7AOHSInfZpMT8ImRQyltdIlTi/i/my8BadXaZUmMr4VSzOWavoJs+6VjpL7MSozghmFee9tY2Q8QV5oxvT/Jdf1r/oJlIWVhoQptFniqCMWE2fc9bAfaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB11809.eurprd04.prod.outlook.com (2603:10a6:20b:6ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 16:18:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 16:18:53 +0000
Date: Thu, 5 Feb 2026 11:18:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH v4] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <aYTC5uZ8U-BbkPpS@lizhi-Precision-Tower-5810>
References: <20260126-i3c_rescan-v4-1-6b3559d82abc@est.tech>
 <aXeh9ORxy0qxKPBj@lizhi-Precision-Tower-5810>
 <149b630d-ba89-453d-aad1-a0d96b0c26b6@linux.microsoft.com>
 <8484bb1a-3b74-4911-aa22-15a6f48cc844@linux.microsoft.com>
Content-Disposition: inline
In-Reply-To: <8484bb1a-3b74-4911-aa22-15a6f48cc844@linux.microsoft.com>
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB11809:EE_
X-MS-Office365-Filtering-Correlation-Id: d708057f-92cb-4345-d757-08de64d24150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7LZ/IHfFmgOl6ZyM0UPWou7JtZmMSOmZd+SNA0L2yv1DFsGGuJuZXNZrpT?=
 =?iso-8859-1?Q?2ryzrzTSvUqerL2uTPd+S3XEwlB1iOzKdMCYFxZyRn77c4NuwBrAKBm3nM?=
 =?iso-8859-1?Q?+dZKB03Iuq3GcXSyE33TGe4eR1FASpV2ioiEvUNK6bTHX4ob2ZDJy1fllO?=
 =?iso-8859-1?Q?2xGqfTSZejiwfapt6nc3oRywdABXm7xM9EiZrS84lJbF5xilGDDhyUXk2N?=
 =?iso-8859-1?Q?khOn9wm2KLkeGwsEFoECIHThwsUyQPpw6s9bhKiQ2O5y1Xq2ZurE3uHiIs?=
 =?iso-8859-1?Q?HEH0AVpn2ACwGSTu2dyeQ2aSBgxhiuaWOsYJAAWXvEJm/unEIa33QHjAiB?=
 =?iso-8859-1?Q?hMBqt96EjSpkTON0CXso71X47jCkROFuuavPge6RzUwwj6pWClQuh0b6VQ?=
 =?iso-8859-1?Q?sTql8rDRe6ojYRurTCq3dB1DQsOdCt2Ww9tQQuEg5mQ1h9zXn31L1CAXt0?=
 =?iso-8859-1?Q?7GbuSTEtF2arJO53xYNAhZrk8AIiKaj9u0mW0MNyuR+5vshtHMXtA4KvOd?=
 =?iso-8859-1?Q?fpGpkF/ggrP4/HX8JMGQUcjcPT2ixMTw1e/fp6k6GOLkMrUgsc2sBEBJ21?=
 =?iso-8859-1?Q?BjHgSibAR6+4Y1fuN2GDHqxFW/XqYz4uE4d7Jx79XsAQM/oFMrgdiDrw6W?=
 =?iso-8859-1?Q?jHrf3w5quM4tSz5aZROPAiufLhvwW5SXpEgchgCVwwns+rPT93N+xaeqKk?=
 =?iso-8859-1?Q?yp5OxHZWApy1IsfC4MAFjChJyn1xtWAivVESgdkH7oZzxvdRrz6pgJJfaA?=
 =?iso-8859-1?Q?NrA6SaB1Q59111V0XViIyoBSRYRNCpaRUoaZPflkkuNG4n0s2RkQvQJOEW?=
 =?iso-8859-1?Q?2isrsMDSKLjS6EkfQvgBxHEdR61O/6440og9/1q3DDqVIa+6AEx4SC00vj?=
 =?iso-8859-1?Q?zrLE2yDX338K53tXXzCZpHuk3Tgad1ZVmun/nTGBXstWELO2gLzqH47P6G?=
 =?iso-8859-1?Q?SSPzgQ0voN6n0M22sPf+TEZvLliS+w6LWNRPRMl2RkGTP9/ibQx43HxPUi?=
 =?iso-8859-1?Q?yVvYq98JNJJPT4xNRvuu9sIpmX76wQiEuA8i6UVi/WWFdt/W9otJohoKHO?=
 =?iso-8859-1?Q?68oZvIbvfELM8M4xMZhVxTfiCkGEGsQFXlJbIJJxy8cwsfQurlHIdw1nec?=
 =?iso-8859-1?Q?bWbrnJLTzJ1/JzwAb1A70YKXtDSPmPtZm2TqfDFwr7sH8ildkf0x2zH3Yn?=
 =?iso-8859-1?Q?BaOCOb+Yky9PNrIRR5r/1w3oEubJpIcasEcP0fcVaxo+5ZyXyqzF85Hk/e?=
 =?iso-8859-1?Q?/8oYwNQOr7cNP7nAZBfpsiAb2EBUYd5y6lv1xqOy35E2GSg0QLN7efqoR+?=
 =?iso-8859-1?Q?fNbNqD0xYBd/XcK/D7X1aG+OvELAJIdLD2AzBXcpnYbjMI0zRh/z7XT2lr?=
 =?iso-8859-1?Q?9T0D7vN+rrbAWNw37eGn2VR1fsy9Oam/U7R5Ds2YreBUBRreFmw8Zi1/Sp?=
 =?iso-8859-1?Q?DEX9rqGQSs55cVezMSaX73uoaYdqhIGnBmUHXcohub6zFEVvg7bexuW3Hq?=
 =?iso-8859-1?Q?xuNAQTLsrzzxYFzRV6K6DTgpmEPeXXCB/B5TohjeGyLp/7mYPvc+3fGnD1?=
 =?iso-8859-1?Q?uhFEjwN182vO/d9+hsnV+FvZNskyzuoszfvIMq8jjRDExdgfLK3cKqjWnJ?=
 =?iso-8859-1?Q?yTDo9q2qMcEzsEl35/OFnugtB+kBcgKtRH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DJJCRlXb9FXfiR/Fruw9921jLi2170XFikhPfH2tR0FIlZEpuLxwHmyhuv?=
 =?iso-8859-1?Q?kqpFIRtvn8HI9TT+B4XVr82XXPIGhmMx8sS2H6sSaJAQMO9XSp/WJt6922?=
 =?iso-8859-1?Q?gDCQTcL+Lqud42Y48cccpsjygGqitC5CvoJ6WJWSGUzTsbL46MnYwAeqCO?=
 =?iso-8859-1?Q?p+J9Kh7LS2qSZlNxXOk8EWk82X2+ZF+eUb7xN+wFVyjrFoBQlQ+OK/uo1f?=
 =?iso-8859-1?Q?EBJa9U6sSh6INfNaHOWJs/YYK46Pufp2Q23/2mIiNpykS1xbCQdX5YVwgo?=
 =?iso-8859-1?Q?bNESr6Yci1XY/rkous77KPDznqFd7e3hW6aI7JLC9e3xQTlEhfquMkWm4q?=
 =?iso-8859-1?Q?AM+cZzC9xyYWtQGqlNS2fvXjZa4mtm+WD0nuloEhWg3ZvhOOcq7NS8socq?=
 =?iso-8859-1?Q?U3za0sb9TrpvIBlYdF2fw5pRRS6oHhyvyV/yZJEJH0V9fOjkqqkRRBWiX+?=
 =?iso-8859-1?Q?fUHCXr3ON6NWIlZXhtZlDbQmmy8c3pYUm3hRPRmjYpjXtZKwIXIOyEHXe8?=
 =?iso-8859-1?Q?gBatUm1dQrpFnJXh13GLf3HxbuQxb1Yq/ivuSktUofW6b5Ca/zYGQ23CLj?=
 =?iso-8859-1?Q?tezggUEJ3uSbBZy2z/9ZbTci3LVH5tV0Na+n7UKzPYaEk+paB+W+wQoIKO?=
 =?iso-8859-1?Q?E7Miv/qJf96fgCbK4H5+AnZjdf225Ho2EoffhqD+k+35cK+VDLHlqVY98/?=
 =?iso-8859-1?Q?eor7BcwRi++3YhEXj+czy7ob0RSFGZLSom7NjWgxNTewpg4NtNoEUsWcaM?=
 =?iso-8859-1?Q?n66aV8cuoanrRROIhN4Jwy4+sEaZp+tl+vcdDgbetiUxXr3sv2K/rIdFHg?=
 =?iso-8859-1?Q?o5Wg4BA5r/Byf83G+ReHMs4XiE+QSuyxVyc/UKNehNLnecN/oa6Nc2GstG?=
 =?iso-8859-1?Q?el15x20iNo2ajiCbMB1+f1L6hZZcOVT9IgP5pSEfTESJylUggfpL8Ze2ZY?=
 =?iso-8859-1?Q?oCHMDoBX16ibcgimF5gRsb1MVNouhGkM/YbAoL9LO38Uw/C1G7UvZfTQwU?=
 =?iso-8859-1?Q?OejcZOfynqcL1cCI2a4HDi4zxdCAXEn1McQwJnOZhHVJ1qvZPiXB2N8pzd?=
 =?iso-8859-1?Q?7/sPelZC6V+lY0KjmqkezQBeNTj6Jgdyln9YdO8hWt365Nq9odyRG+BjCa?=
 =?iso-8859-1?Q?G5kSaizXsuuqGGkPoPW/a+jTyQm4fizxIlQ48NAHcZK8XRKOGbfU1DRhxn?=
 =?iso-8859-1?Q?a5i1rZsn9ZLzZCYZjpG2dXsalacZt55yb+BBIcJk6LE81dXZw5Z7Xk2SeE?=
 =?iso-8859-1?Q?7rg1ouKyeKPZ1FgwaAg2tscD2LQJmcdehoj5/shjqKAasQjJqnDwOZOVEr?=
 =?iso-8859-1?Q?RAEzNc//g8svmwKT1Uy12lzwybPgzEcXQPQqW5w6lVHJwZcYD+xO0WmfiY?=
 =?iso-8859-1?Q?Ha6ItjzVlvKzIvE/UCd1AwbrqKH0HKOdjpKgAm/Zx2X/Pu7ZeHfH6zeTrb?=
 =?iso-8859-1?Q?NdfyjSfr2hQ0CCq6gl73o6Y3CL+YvaWIUBydv0tTTPzMEHohrpF53MUGhW?=
 =?iso-8859-1?Q?/bnrEg5DE+ZIA2mc5Yd8so9JtObJB8FxBXp78Wa92OQIyazRumOU35lXoQ?=
 =?iso-8859-1?Q?0GWHB65ykBFF+JKn++5MjZuctdM1hda22Sc/QPuXIdP6Y47j7EWCXXr8cl?=
 =?iso-8859-1?Q?VFsV1cLgQRnwDH0Z37bhw6CoOCROMmcFPwNXrmTt7Kx4vLo1ohBVYa0E2Z?=
 =?iso-8859-1?Q?5yxrfbjS69lyhOAsRamz8hUdkOpLOiyDCQKHD9uL4i+gbAGRSEHwzjoUZp?=
 =?iso-8859-1?Q?Z5qi4eKyupEzJrR0MmuYjzHl4VWYhU7CTurE7Rx/hPmhD/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d708057f-92cb-4345-d757-08de64d24150
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:18:53.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqexeSsmoxbDpgEQUricNqc7Mp2++7hBt7fP3i5Bx2rFVmyzak4BlLt3S8ptrOcm1tQUCKwQt1yQa9Pg5fIX0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_081858_462162_969D7B30 
X-CRM114-Status: GOOD (  29.19  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Feb 04, 2026 at 03:49:35PM -0800, Meagan Lloyd wrote:
>
> On 1/26/2026 6:50 PM, Meagan Lloyd wrote:
> > On 1/26/2026 9:18 AM, Frank Li wrote:
> >> On Mon, Jan 26, 2026 at 09:37:01AM +0100, David Nystr=F6m wrote:
> >>> Allow userspace to request dynamic address assignment, which is
> >>> useful for i3cdev devices with broken hot-join support.
> >>> This will assign dynamic addresses to all devices on the I3C bus
> >>> which are currently unassigned.
> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >>> Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> >>> ---
> >>> Changes in v4:
> >>> - Improved commit message, once more. Comment: Frank Li
> >>> - Added required documentation for sysfs addition. Comment: Frank Li
> >>> - Link to v3: https://patch.msgid.link/20260123-i3c_rescan-v3-1-02642=
9fa0c65@est.tech
> >>>
> >>> Changes in v3:
> >>> - Rename sysfs entry from rescan to entdda, Comment: Joshua Yeong
> >>> - Link to v2: https://patch.msgid.link/20260122-i3c_rescan-v2-1-84c74=
a483f03@est.tech
> >>>
> >>> Changes in v2:
> >>> - Improved the commit message with "why".
> >>> - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c170=
71e232b@est.tech
> >>> ---
> >>>  Documentation/ABI/testing/sysfs-bus-i3c | 19 +++++++++++++++++++
> >>>  drivers/i3c/master.c                    | 24 ++++++++++++++++++++++++
> >>>  2 files changed, 43 insertions(+)
> >>>
> >>> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/=
ABI/testing/sysfs-bus-i3c
> >>> index c1e048957a01..040824ac7401 100644
> >>> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> >>> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> >>> @@ -172,3 +172,22 @@ Description:
> >>>  		the automatic retries. Exist only when I3C constroller supports
> >>>  		this retry on nack feature.
> >>>
> >>> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/entdaa
> >>> +KernelVersion:  6.20
> >>> +Contact:	linux-i3c@vger.kernel.org
> >>> +Description:
> >>> +		Write-only attribute that triggers a Dynamic Address Assignment
> >>> +		(DAA) procedure which discovers new I3C devices on the bus.
> >>> +		Writing any non-zero value to this attribute
> >>> +		causes the master controller to broadcast an ENTDAA
> >>> +		(Enter Dynamic Address Assignment) Common Command Code(CCC) on
> >>> +		the bus.
> >>> +
> >>> +		This is useful for discovering I3C devices that were not present
> >>> +		during initial bus initialization and are unable to issue
> >>> +		Hot-Join. Only devices without a currently assigned dynamic address
> >>> +		will respond to the ENTDAA broadcast and be assigned addresses.
> >>> +
> >>> +		Note that this mechanism is distinct from Hot-Join, since this is
> >>> +		controller-initiated discovery, while Hot-Join is device-initiated
> >>> +		method to provoke controller discovery procedure.
> >>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >>> index 80dda0e85558..a1d816634a25 100644
> >>> --- a/drivers/i3c/master.c
> >>> +++ b/drivers/i3c/master.c
> >>> @@ -758,6 +758,29 @@ static ssize_t dev_nack_retry_count_store(struct=
 device *dev,
> >>>
> >>>  static DEVICE_ATTR_RW(dev_nack_retry_count);
> >>>
> >>> +static ssize_t entdaa_store(struct device *dev,
> >>> +			    struct device_attribute *attr,
> >>> +			    const char *buf, size_t count)
> >>> +{
> >>> +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> >>> +	unsigned long val;
> >>> +	int ret;
> >>> +
> >>> +	ret =3D kstrtoul(buf, 0, &val);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	if (val) {
> >>> +		ret =3D i3c_master_do_daa(master);
> >>> +		if (ret)
> >>> +			return ret;
> >>> +	}
> >>> +
> > Why not use kstrtobool and return -EINVAL for inputs that evaluate to f=
alse?
> >
> >>> +	return count;
> >>> +}
> >>> +
> >>> +static DEVICE_ATTR_WO(entdaa);
> >>> +
> >>>  static struct attribute *i3c_masterdev_attrs[] =3D {
> >>>  	&dev_attr_mode.attr,
> >>>  	&dev_attr_current_master.attr,
> >>> @@ -769,6 +792,7 @@ static struct attribute *i3c_masterdev_attrs[] =
=3D {
> >>>  	&dev_attr_dynamic_address.attr,
> >>>  	&dev_attr_hdrcap.attr,
> >>>  	&dev_attr_hotjoin.attr,
> >>> +	&dev_attr_entdaa.attr,
> > Is 'entdaa' the best naming here? Keeping it general i.e. 'daa' or 'tri=
gger_daa' would be more flexible/extensible in my opinion.
>
> On second thought, I guess this sysfs attribute doesn't need to be extens=
ible. For example, if a need arises to issue SETDASA or SETAASA before ENTD=
AA is issued, we'd create separate sysfs attributes for those & they could =
be used beforehand.
>
> Indeed, it does seem that .do_daa is intended for the ENTDAA mechanism in=
 Dynamic Address Assignment.=A0My suggestion would still be for a generic n=
aming like 'daa' rather than a direct reference to the ENTDAA=A0CCC since o=
ther CCCs can still happen on the code path depending on the controller dri=
ver's implementation. For example, other CCCs on the path currently include=
 SETNEWDA, DEFSLVS, ENEC. What are your thoughts?

I vote do_daa, which is easy to understand by user who has less i3c backgro=
und
knowledge.

Please wrap your reply.

Frank
>
> Meagan
>
> >>>  	NULL,
> >>>  };
> >>>  ATTRIBUTE_GROUPS(i3c_masterdev);
> >>>
> >>> ---
> >>> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> >>> change-id: 20260116-i3c_rescan-4921d0b41a00
> >>>
> >>> Best regards,
> >>> --
> >>> David Nystr=F6m <david.nystrom@est.tech>
> >>>
> >>>
> >>> --
> >>> linux-i3c mailing list
> >>> linux-i3c@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
