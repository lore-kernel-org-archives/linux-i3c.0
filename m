Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5C9C88E4B
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 05:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zS0eGLDhUWNFodClG6IFrCcqmLyf05irYO52EDh9sQ=; b=ulDCtJxqvwXvuq
	S2W3qnCjpegb3S6EBvPpqQs41rNrm6grj4o4kkbTg5QoPOyYeQqobuMGhj0+P/dxy0e+XK6UHVNh7
	k268Yfjo/e5bMakQSng2ttzspgBUTfAhJ6Nt4i2CtAOnXe9fZ9/eCqPNW4BlaZ9uYn5EBQVHfj0oT
	GY8g6uxkquthY8QA6My0Sidn6rqWvtJrjj02RLVAtclan6GgZdW4KBNHMTY+Q7KN6TTdgfg/fMit/
	CYx55bzLpV2+eRclthYuFioeM0ZLl+wCQFXrNBkzLwzwV71p/mp9/IohsfgU4SHsY2kjsSKXNX5Yd
	MkGmq0pWO3xAAXxfaU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPq-0000000BwoL-3Ysn;
	Mon, 26 Jan 2026 05:45:34 +0000
Received: from mail-westusazon11010055.outbound.protection.outlook.com ([52.101.85.55] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPn-0000000BwmF-1eFd
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 05:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpIUqcreaReaoSg0RqPsVE/togd0m3NL2YAJk5xNqKYOYvXMABFPdKcA+qh353rsi4VQeerhcQtaaDGil8FQ3eyk5ULYPr/2ptn4o+9Z5cHcctB+zFhHtrgyabAzsu+7xSfmdFqY2/YwZCQOjeGYSa6X4w/32X7vuPMy25mrMZKlHgD3B/hyKDMCwYtImZ5MOt+xLS/9NDFwXob1oVIG7XxZ64t4iif6K0fJRMv2QOLBQ3D9094tiehrQGF58abDONQWQ3t+IJQtRWVc4KijZoUyMYtXeIsggS3GokgjcDGKyXU1Gv+bDaNlSoAF7bvT6E4EsbNPCf4600s0M76W4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXdKCQHCd0xSeidlO2sA99WdfqFDrAICotNReMYIp6A=;
 b=JtJL73+m0c3QniPxujPrkC0Y+YKqfVnQtzB5UnQfDHiSjFerpJbEeuuLFxlFOVKUZpTLdVfGQ1lGq0wYn7+oDDAmIGSNPbaetsbNWNEWPWHn03xepe28l3MuDqs+KRdwg0grfyb0DPB5qNW4xeFKrZWzaDaYqNNiL5kW4ybu+16Yd9UEiDT+IEH6dS5AwE3UGlWhGEqd5CmvERex/rHuhdayCzt+Pty8Zgo8DZ64rssVLfQ+YQvKdtGWLsFuq6SWdIsUtwh2rz8FfPTFci9dg1tXSqiQlHOBbSQzHpGDoGmkrihdg1mKqwriOyDnaGIyvelN9OctmUYpP2oulVy22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXdKCQHCd0xSeidlO2sA99WdfqFDrAICotNReMYIp6A=;
 b=Y5qcCVydLAI4J6MZxWTLfGAp+W7I/wyr9NktZqtknR/3dx6N0eAZm9ms+9qmcVGFDq+AP6ygR9sZt0iylhBo/DBqrmF7zF+3kwrtSmOKkIUmQnihEDrU0mKmQdA6wmmhOG+JNpAQs/697n4bUYPLk75kr0J3LbdE6E/3+55/4WR9CicgDzKDPZIRmRpm61/cBOVUWGgr9DFJaLqAS8xbENXwHKdAA5F7avQaoi9EW8TIZUspnlzl/wTGebk2uReSqea3wu8ycXDEcufIYwnl6AbrZxqBTYYubV4Hch8dIYO+oTl2aBoCDVz4c5VAPH5xIvMnsZP8RmKlLqOfkwuoMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV9PR03MB8415.namprd03.prod.outlook.com (2603:10b6:408:365::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 05:45:24 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 05:45:23 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 2/2] i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses
Date: Mon, 26 Jan 2026 13:42:23 +0800
Message-ID: <ec490708aee15c2a195849c420c65185656df6f6.1769404925.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1769404925.git.adrianhoyin.ng@altera.com>
References: <cover.1769404925.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV9PR03MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: be93bcb0-d510-4943-f1f4-08de5c9e198e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1aUYH6X7mIbAVwaBFyPyMcqIPdry+L3BXjuevSq/Olzn9PiEHQ6p7ahxNU4O?=
 =?us-ascii?Q?tDmoFbQCEANm8rigrf82SCAfj43OQdCK3MtYv7PTZjuXx5GnqUvuizOsMMus?=
 =?us-ascii?Q?4p9X/FG3RFPSFI8it9GunM/W8ZZo+pmhEZzh+Ndig+M+5sxGwu+K6r+VCW3Z?=
 =?us-ascii?Q?4RXa9aUzre6v3ZvumKF+Fmh5xiNB7Uqw4LdWyMLdMkwYi/EsKYfR0UFnseC/?=
 =?us-ascii?Q?YdT159ooREVf+fV+e4WwEIDdMjikezwVojNOppyjWAS24Jyg9A5Kg4MpzGdm?=
 =?us-ascii?Q?Y8K4AGyI4ZlqTrj28z5OhCcABHMGIbJwFrp2dtEpexjg4D2DBwbRCYk5p1Fy?=
 =?us-ascii?Q?QKfWEiF9pSU8Z9IZGPlFnyTuXWTqNTKOc0kV3IqDUKuG+EdJGU9SGSGskj84?=
 =?us-ascii?Q?cX6102RbTiIF4o5bmdZKqVIasuep/+8dBWWw1vJkmDpvwpUJ2Z0bHhSiQUvK?=
 =?us-ascii?Q?79BAaktLW7kKka3MvGCu7fjUSy/dGLhHP3DDbsDlTL7Hia+G46P/pA4tA2Sp?=
 =?us-ascii?Q?1XSUJ+oRw8VXWcj1np55LcAqpYdq1ux1OfT7ePIAhdieb8wFrsFDXsHca1+U?=
 =?us-ascii?Q?Sv8CIrJa3i8c6pohtzvFD3hcf6jN0S8yLAGekKqhHhhPpiVJkT29YuY6ZvWg?=
 =?us-ascii?Q?cPEoZSfy7F5sjpOUgGWg6WwRCODvuZvKX2lbssuazoJcI0PB8j7hql3yrUdS?=
 =?us-ascii?Q?Eq44oty+sKfDqusVsusA5XeDM70dLQgEC/2lISazofGNbtQuxyaR+6Tjr5IY?=
 =?us-ascii?Q?PToZp5Kj4qiEe2htRVGc09HICSmSxw2m9Vq7LYO7LMw+O0gW49kPYhiwVvry?=
 =?us-ascii?Q?Gtn6k79XRibsFaOWq6GeE3iZXdDdguZcSPTi+jVsq5Az4/f6vjLF0tcZ9aeS?=
 =?us-ascii?Q?0zgYujoRmVCIa2lRIaJIHu3cXryOTNcptqU1U/+9wGucK1W6Lc0+Wrtz7Gzg?=
 =?us-ascii?Q?h0jksdKvuW2vRa9LH0or/HTc13YBNVX4isuAddArkpDY409lRrTkcvvkxFdy?=
 =?us-ascii?Q?DI80aFIHnMQZuGwD5gliIWw7vGwqFQqr6vmMSzoKrTbJ5ghh9O8hqmTcoQJY?=
 =?us-ascii?Q?OL1n4QJaRIfavAR8j1u3sVwlHOgcapMLKL6UaPLViqwOVTofgjO7WPmJ9vZ5?=
 =?us-ascii?Q?iEhirjio8z5vk9WReTnNdO3REh+K2jiLxU4OkFjlH/XI1fbyuH2rzp73sgEy?=
 =?us-ascii?Q?cm0SB8b+14jnixhzmBnKGJJgUm9h5wKYksz50Z3iO0z0Lz9Oi0+KlKLGMWlu?=
 =?us-ascii?Q?zCkkqq0Xp5iyRQOQGxmf0sIbFsSJvDZOrUwo4A0YQl5vtetGVU3UHDMOWA1N?=
 =?us-ascii?Q?vrNV8JI92U8WVmK03k/BTaSSgrQ4SitGsDxrwmY0SAOhS3Kfyv2NgecV/U09?=
 =?us-ascii?Q?wFGDXrVOTbPRxC1ZQncJXjNJ5NBge0T4uA0rwhp94mHaYo+HVvHmR2qxFzoH?=
 =?us-ascii?Q?Sx+EKaz+YMPoJeE6xkvCZ4zT1xGsERCoZFVdXXxBbLZCKfOonP5SAPqw+Evb?=
 =?us-ascii?Q?FekpEXSyFH/rhrpNFi8sE/dde00sD/KWLuOU8Sx7sInQ+X28I7/uHBDULSfa?=
 =?us-ascii?Q?fNbyZTBfHyYhp0sV5UI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xSv8pUYgtZupXI+RTTEbCLFbsk1Cc/5o7WfwX5Oydib1acbrNEQO+PzSe0xx?=
 =?us-ascii?Q?55GfwJWdLoomFVM14jM0GllBA6FnwXt35ZYwc+Sul8udvRFWJeEIGvyhKLes?=
 =?us-ascii?Q?F1RtsRHmTEvOPIChKPxGzSH2rNzoWtz/+edXnmBjZmORuR7JDWP1EJmSFKcm?=
 =?us-ascii?Q?pil8kr5bgzTrDnHjj9fxUHUYboLPaiH3W3n8D17Y22BqATN7TwUm8OiZo4P/?=
 =?us-ascii?Q?phSBdZmqcLwyHSf5dv92on4fURpn2p6SAc5ZU1dyWUZYxH55mE/hRK+9tvto?=
 =?us-ascii?Q?HDZywUTdFirRYtlAyYBugWzka3I2VP6bkyIE3rWhNEl+SxROyg4WPFAC/1dH?=
 =?us-ascii?Q?k3n3YfKqzvjeOzt8+Vm7CbenIXbv2Xxh4OuYCoqsHDXTo+Cl+pAIVagF5JC+?=
 =?us-ascii?Q?X+VZvhBXGZnHTn1TRDoPmk33XnxXM18mR3kYcm3t43H7UafLAQbvW1LBfuF4?=
 =?us-ascii?Q?Mdb25Z/WEkI9AsHsvktmxz6v6ACwu3fV8vkMowmOnQ04dmJYn3JVko4Solbj?=
 =?us-ascii?Q?VHP8zPthLU3dzuQHlYbNGz+TVoRq8paEsayxmPO4Nd9qdnTWiy439oGvNcc3?=
 =?us-ascii?Q?3rVLc+wTa6WODEDBu8e46ZyAG5Yp+/ck9ByXaKKvuxxR//VeNxsiWKdyzeRX?=
 =?us-ascii?Q?fdIrki1S96YdBu+spNIb84/0iXAkFvL9JZHCR2YFgQDezJt/F6StuqlemqDv?=
 =?us-ascii?Q?XmL1bdcbXwLwjoQqHj6lr2WoMw/vYOFdiE2esdhAyrHo5WoyTyqrLM+ksUrq?=
 =?us-ascii?Q?eqNT3Ubh7dLF+3UpxpFZD/06X03DKz9oSU3EkR3285AzOEHMuVBHqhaeGAam?=
 =?us-ascii?Q?CS8qNXDJK4W3jxS8nuazSVawU8u3Tf3f1vdEQ18oGIBN2BF0UlZ0taTkOcvg?=
 =?us-ascii?Q?ZT1Zy/xNXSx2dHwk4JP3I5FBX86mNpUrYAIMieMJBkJWH4mzQfgmXzjJrbaz?=
 =?us-ascii?Q?yKPcIVABOfWjg6WNA0IjgsNzOZxVBIDW5QfsAdD2xOvgXec9dWdlQ9ZTpVYC?=
 =?us-ascii?Q?pjzg90SrPtzq6oC01bMr2lmpFez9cezrTTE4bO2sA4P7Kd9BrEJ2y28GTS/W?=
 =?us-ascii?Q?8OY4/Y34l9VfIMDlNHwXfmEaUQGpCEq4T2sDNPgd30LSuEtmxW78wRAhYiBF?=
 =?us-ascii?Q?vsJiIkjlu2hRbMVlx4VoXOKRPoSo4Ff5bv39wcKDFo5tL99x7Omy+KRiQxSx?=
 =?us-ascii?Q?elldG2mzSCL5hhCAMTc6sJKM+01qc0UvXb4WuZXr+kGpTdEyc14A5cnwV1g8?=
 =?us-ascii?Q?6tu2nfTjRfnd1kxLrUolv0Kpgun07BiWUV0rz7Ce6g/y2XNRhY2Pc707PygP?=
 =?us-ascii?Q?sGuxQTBXurIzHyCql2LHq4OiavZlXy9gDQerA9ujeZldd0Srg1Q0xVfp1/WR?=
 =?us-ascii?Q?XRVAiSZg2BrQ99Ke+gsioTAn36whEsJXR0+XQdFbQY3pyl6+k3H+UAkhn9gA?=
 =?us-ascii?Q?VSweDeYDEg4qgk9p6G6e2FkVZJVYxrxaFFeQ39KisrJdC0x8Yoa1Xnt426EU?=
 =?us-ascii?Q?Kxg+v4L3/t/9NozXrhFGAdRbvAP0TV9B9qkwyXzuVC/yflW02hp25/GE7d/u?=
 =?us-ascii?Q?jG7BQ6fs2wqQ4KqVonjjT8dm+uwaqDDUJgfrKOcunrnV5mkHlztLLJH+wUvc?=
 =?us-ascii?Q?Yw/UaB5uiI5eMyi+2Dxr19GAgUdlYow8k5DByqLPq+ul9l9CdcotcVxZ51+r?=
 =?us-ascii?Q?BySi5aDIDcv3lq2L6DYiEWlaw0GbFYGIvYmfYFqDQ+5pyrONaLjncwdWrgan?=
 =?us-ascii?Q?fKYvK2pBcIpdsY3dVNGPlie0+Y5hc2I=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be93bcb0-d510-4943-f1f4-08de5c9e198e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 05:45:23.9399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqtJPNWtZqb/dwpAzymFU1ry/GBOAf4jQD/xM45lWr+z6KYjRJHNqD1qyEouXeosMk+FOAwsWof4YyRg9raIKNh43e1De4P4vQbxTM59JW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_214531_444726_8D693CE0 
X-CRM114-Status: GOOD (  13.28  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
dynamic address of each I3C slave. The DesignWare controller derives
the bit index by folding the 7-bit dynamic address into a 5-bit value,
using the sum of the lower 5 bits and the upper 2 bits, modulo 32.

The current implementation incorrectly uses the device table index
when updating the SIR reject mask, which can result in rejecting or
accepting IBIs for the wrong device.

Compute the SIR reject bit index directly from the dynamic address,
as defined by the controller specification, and use it consistently
when updating the reject mask.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index ef8a38620e0e..77e0edd1c660 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -205,6 +205,11 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DYN_ADDR_LO_BITS		5
+#define DYN_ADDR_LO_MASK GENMASK(4, 0)
+#define DYN_ADDR_HI_MASK GENMASK(6, 5)
+#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
+
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
 #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
@@ -217,6 +222,7 @@
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
+#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
@@ -264,6 +270,14 @@ struct dw_i3c_drvdata {
 	u32 flags;
 };
 
+static inline u32 get_ibi_sir_bit_index(u8 addr)
+{
+	u32 lo = FIELD_GET(DYN_ADDR_LO_MASK, addr);
+	u32 hi = FIELD_GET(DYN_ADDR_HI_MASK, addr);
+
+	return (lo + hi) % IBI_SIR_BIT_MOD;
+}
+
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -1236,11 +1250,19 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 {
 	u32 dat_entry, reg;
 	bool global;
+	u8 dynamic_addr;
 
 	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
 
 	guard(spinlock_irqsave)(&master->devs_lock);
 	reg = readl(master->regs + dat_entry);
+	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
+
+	if (!dynamic_addr)
+		dev_warn(master->dev,
+			 "<%s> unassigned slave device, dynamic addr:%x\n",
+			 __func__, dynamic_addr);
+
 	if (enable) {
 		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
 		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
@@ -1253,11 +1275,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (enable) {
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
-		master->sir_rej_mask &= ~BIT(idx);
+		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
 	} else {
 		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
 
-		master->sir_rej_mask |= BIT(idx);
+		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
 	}
 	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
