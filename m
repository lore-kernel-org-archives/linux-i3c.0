Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9786AC54F54
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jul 2026 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LVM8Y+3bnc5okKmnsvMGHCQUk1snh+NCubxdLBhyVqA=; b=J+TvcVORDTmv/U
	cKmFyVL57+jZR+019YYq7QwuQ2d3ZIS706Vpq0tPXigh3XLybpfdKMjZXJok83pcu5qt0ao08J/cn
	70jV/NkOaFgjMN0tMCyheUzvZC9eUJWOwLWEI5XFtVXonQTWZhXuA2DuJLlwLW4K9+2FQAtdarP4O
	f/+MF8M7P+oeECXTHuzec0EwfxpbohnHjTJ58Bgo0fIe7Id9YJLE7Y3Mx49E9JKJqgQyA6WxZYytD
	D+YUTqrw6rpWdxnERJZWXUsQYaSA+oZo3o5MIKUs30V/8JTc+YKDA/1RvCn7a9DpaffssqLP+KEjw
	aq70D+MwzbShzzViDP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiBj-0000000C0U5-19tl;
	Fri, 31 Jul 2026 08:01:51 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiBg-0000000C0TT-3tA9
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jul 2026 08:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6+6HiqnrBzXhWHlqMgabOVwJCU+6/+LvDTVoxDuBoyUvut0KHdrurWlXQ/Y+2/XPMI7odCVbNlXJ5eTfbrSOyKqUnCbTO6tZWRQ6hn0tdc3Nsy9xVpUB/w0Sgpi6jejRYm5/jraHk81PQtuoQl1vkOFxoAOCfkvlWSwk4yLsZHBcP3GXyRAM6psuLNzL/mvXLfKDdvKYzIILwbMnzG/6tHlzlogyR7BcvK1byPbj6XRdVowC7AurSmU9KRucDDPcvHvrwTd4g8xHVCW/MywxOhSjy2V8ebBmka3A2Fj7a+WoX3BN57CTqF4ZvnUc8Gfo7hOav/iosCFzJI6KSlSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F2SIWCUnydmVKaWM2JPoYikOQn16K+tXZTcVuPp6RI=;
 b=UkAjB/uQiJF3L6UD2E7EY67yLkIbgpRl5BBgS21paoJmK5z9iji7hVpNPta/sWdhz7O25kzL8Lz3TwEQ7XSi1chRhmDewKxEauKOVOkAukDELAYBb4cuaznFkPlzTuF2mUgbDFYHZVrg29PCorLPdIaLWWPrxVjcHdGYkJWCFcNyazBWWJ0vCeUyCksq5uNTMEQMxPjzg6xw4YW8rmgW9QDEWxxA9IbaW5l//T2cXz61hvsvTuzSKCDgez5P2jDZwrYWz5gtTYo6BG1/9Z0KTZmx02swc+ikI6BaQq8fBprsq5RM7GRPtAi/YzdjUfPV6MgvPPGSarrYEYCpOF0uDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F2SIWCUnydmVKaWM2JPoYikOQn16K+tXZTcVuPp6RI=;
 b=wxAJTR7xnY5WITWrpmjiojoj3MUYWYnf8RyIIL1UGvOfBnwRe0TedxR2NGhO/3wjgC0/39ff/0RG46SqmID9sNG79XTUXKa4b7SyO/kgdeaYcDLc+vYKZBWutfp+5wHkWCcXhClZbgheAO0RoWZlY2RkC3owdAHYRk2dtyJCYTQwaZrYMrTKUYEMA+ryZOnGOoNb0gCdM5uNFIdpdnagfM7q/UC2e8jkG72MbRvYFRnm2PCTcZpNjOCorPzE/D4uzwxjtphB4baYE2KYufj38uHE7/I8uLPDZJLfkMxwMFISYe6/7MRUWlS5VRwPTzhjk1yardpUwN64M8U9Gv9/GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SN4PR03MB989351.namprd03.prod.outlook.com (2603:10b6:806:1ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:01:44 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:01:44 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] i3c: master: dw-i3c-master: fix OD timing for first broadcast
Date: Fri, 31 Jul 2026 01:01:39 -0700
Message-ID: <d789219ca0418898a1ef2bf9295b4f96ca7b4209.1785484707.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SN4PR03MB989351:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fc48cb-2252-47aa-3fe9-08deeed9f570
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|921020|6133799003|18002099003|55112099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 13lqJqYsNDdYhT3XDaGW2laRerOF23vLp1o5AO53cffvTeYwfEXbcB0hRSIoTTGznrHcroYhNeDlWeytzjQSdNWNjaWxfEOUFSn7v12RH81E+AyhIm+Ru9Nk3C9ZSfwc/8+N5vszgckQQFwXs/bSAfDEA6caoG27k7jOchJnlIfV1Iv50L3bu6uSc9uwlyqD0PctO+vBPbDITYthaWmGRk48vRc9zrG3GLLG9rLI61YXR3INCNQ0+qfp/enxwDyEy7h9ZxUdgZjj5PCbOOH6Cd8MsxkEk7/BXmZLzf2//j4/3HbVdLI54nptwZhpcaDjSdvbtCFzLhoPrKZNcUImpEFifuW5sw2qB25xUzE6J1DoBznzxjZHBMQYcfO5Ul3YwCv+YvfxU93uHVQ/ZMnSpB8EdZibfBfeUqWRbDZ/FgAFKdXKC4wbifYxtN90G4In9UpRgd17HSqRMjfICa8eLlDTiIxD4knprK0cif5qLHn9wBmyXK1P4e3iSUnOTNUEPWnA3Cr5nDHPGh+N+aE8rRe6p3Tr0HSsBErdaQTC3K3+VTaQpvZiXKnY1uFGpqn8gyQE6DwRqUtCj1jDDlMXlhmZheIEkhPdPDNbDATqKIRpUKoPwZJQ6XPXh6/GPf/ucFpDnnm7lb2WEaoC191RTyydZt6X+b3H0jir5sG7y3+Wk0PYMRAVoHPIMPbzDn9R1P3+xcTxDHVmYXt2P94XdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(921020)(6133799003)(18002099003)(55112099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbYgGuAzvENVf6ZVIMCbihu9Y6xxsDLUF7DjbL1+MlDKr6+re6S26DTrwUhn?=
 =?us-ascii?Q?QZrg2p2YfBsb3+yZdbMAc9wBLXDsxax8tVS6n/tjpA5fquMem25GkSVia2Yc?=
 =?us-ascii?Q?zQ1KWJFOW5Kib0UaMM/JpoXgSu1FAZg+QngR/TQMqqh9vUv+lyBlDcZwDWHp?=
 =?us-ascii?Q?H8qf1mWJdg43t5gUMoHst4TM99XMWM9UFtQBNBfDbJRVE+xrwkT2ABWn0PZu?=
 =?us-ascii?Q?F9lLcwpUqxicMsb9spBaAo27SGOp9cjQr4egMREymj9RdtZKG6JwnviJkqCq?=
 =?us-ascii?Q?Nmi6ZuZM8NIo0OBioMdfPWmUO/ZRhi9wCVIfU9juLCS5UR+WSBrYc1LkPyzH?=
 =?us-ascii?Q?guIPAOlaEEdf9m6xsRgHK35aenNnayjkxIEH0gzCjEW5vB2z49SB9JPSmppT?=
 =?us-ascii?Q?qb4VSvdCLzSg3DF/UOH4+4we+67dK2FCpdKn4fSA6GBF2/hloqjhE1B1CLDc?=
 =?us-ascii?Q?RTnwH+HAs3S++Y0HajFJwkKld3FaW2O71lbPO9qivmPnfodO30ze+doSd0vX?=
 =?us-ascii?Q?WgatPXr3j6cGKT2Bw+5HfIFsdp/apcCeJjNgL0sDs//PFfzusXjZJrN//1uZ?=
 =?us-ascii?Q?Xv2R8FiWvgDtBUdPG45nYxXeOEyAbZs8Xs6QAGn1oNe0WRislqteGFx4bNOP?=
 =?us-ascii?Q?u5osYeFYkQaoJTUk8z6lFnIeaR6tltYRBmBvN8syz1QFLNwFO5XsPunixV7X?=
 =?us-ascii?Q?m+iQantoNToYwVNsfpogyjg39fzIHUV2urq2Ukl3IlA5ESsWzrNXS48IJVNz?=
 =?us-ascii?Q?eHSJrZwH9FuUi582ACBfSHOu+TIgvRuHLkT4RBbCmIHkYGG7HGW8g5UXqB6D?=
 =?us-ascii?Q?MxazYf9KJQUE1kZ8SqVGHThas+gu54mxC3eH3h+OGvL8k9Eg80IdYASmBSgp?=
 =?us-ascii?Q?QZeBLmNtz8EfVulShPZ1oEiIXoM8DjKEWnjYylawbFzJyrGfoGcCPx55Etbo?=
 =?us-ascii?Q?5Hnc89yHP2EtPKlPbZ3XBEkIT+ZvddYmi80P5g0FrVjLKvzyfNQm0omaATj4?=
 =?us-ascii?Q?yXxKwZLJYxIPZkftQjm78Pj6qzCFAPgZUruPQjCf6/4+A8gJ7RHw1j8avGBY?=
 =?us-ascii?Q?pJlMrSmDw/wOvLJQdFx+vtTGXd/dFvmvDj0GRPAceMkWRHgMgLfdnzHT7LWr?=
 =?us-ascii?Q?/s0EfVs5d9PJcftyhMhz5KhM9TBkL12Z1funMXgqXl5h4FnrDMFT0ueSekxD?=
 =?us-ascii?Q?w5xFrxC3eu/cxXE30SCaJsZcHDvdMPzzoC+QbZusvo8DuSTA7kKiEEkENIQN?=
 =?us-ascii?Q?UqhwOgEInOEN4+tE9k0o3CrEqSaSbe6bCO9Sv1mwp9reoSYXct7Xwsgyk4LD?=
 =?us-ascii?Q?msf1VCBDJhex2luYRWZx12jlXCdCcY69JRuzcXGTxQXu++CfQbZUKewLXxQ1?=
 =?us-ascii?Q?wbsuhv6EIYF5Q7Q2nTby5q8baRrqNv4VzXWlAyzT5zdTUAW2yWBYAgEOYLdj?=
 =?us-ascii?Q?6WUR4iDhkK7TMlka0SGd2czJoo6UaEnMrBnMhJe9phPmCD0tfH1+DUVqJ2iT?=
 =?us-ascii?Q?ml4UjwTxlPnj/lXquJUy3avPfY4XszGl//o3lMMFBps3NiQbyqIvwfo0oPID?=
 =?us-ascii?Q?PyMrbX7I3d+iCSlTZx15wRQxhhRxraX01UZT5NeAN57HiTPFb+GfEnmDq+QS?=
 =?us-ascii?Q?0ViRnagk4z5K+yW9AaG86YSdaIA8kdWw2C3XVMKQ4NwkbA8CdwRvG6PgiMOd?=
 =?us-ascii?Q?vTYAsNqlTh7cxOzfkCq6gEVUNlVD/eraC+6goE8UTTf2412R1MKXpb2LSea8?=
 =?us-ascii?Q?QstR5dGDSw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fc48cb-2252-47aa-3fe9-08deeed9f570
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:01:43.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPVSSxeUpkSsatZgpSaTZmbSV+CnSGg6VxfaWfy/DP97GHa1BABcsMsFPhdngSQUNPavRdxJIR9slVZZwjzRsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_010149_018395_8C0DC5B5 
X-CRM114-Status: GOOD (  18.90  )
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

Implement ->set_speed() so the I3C core can switch open-drain timing for
the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
normal OD timing afterward. Cache the normal OD register value during bus
init and use a separate od_hcnt for the slow path so SDR extended timing
remains derived from the normal PP hcnt.

For AMD_I3C_OD_PP_TIMING, cache AMD_I3C_OD_TIMING as the normal OD
baseline and stop rewriting OD timing in send_ccc_cmd()/runtime resume so
I3C_OPEN_DRAIN_SLOW_SPEED is preserved through RSTDAA.

Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in set_speed(). Compute od_hcnt with
DIV_ROUND_UP_ULL() for 32-bit safety and clamp it to U8_MAX to match the
8-bit I3C_OD_HCNT field.

Fixes I2C devices with spike filters not being detected on mixed buses.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Switch set_speed() to use dw_i3c_master_get_core_rate() (Sashiko)

Changes in v4:
- Rebase on i3c/next.
- No functional changes.

Changes in v3:
- Use DIV_ROUND_UP_ULL(..., NSEC_PER_SEC) for od_hcnt to avoid
  __udivdi3 linker failures on 32-bit platforms (Sashiko/Frank)
- Compute od_hcnt as u32 and clamp to U8_MAX to match the 8-bit
  I3C_OD_HCNT field and avoid silent truncation (Sashiko/Frank)

Changes in v2:
- Recalculate od_hcnt with Zephyr-style formula (Sashiko)
- Fix AMD_I3C_OD_PP_TIMING interaction with set_speed() (Sashiko)
- Switch set_speed() to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() (Frank)
---
 drivers/i3c/master/dw-i3c-master.c | 82 +++++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.h |  1 +
 include/linux/i3c/master.h         |  1 +
 3 files changed, 67 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 3816a50a52cc..405089f181c4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -572,6 +572,13 @@ static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
 	return core_rate_prop;
 }
 
+static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
+{
+	master->i3c_od_timing = AMD_I3C_OD_TIMING;
+	master->i3c_od_timing_normal = AMD_I3C_OD_TIMING;
+	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
@@ -610,6 +617,18 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 	master->i3c_od_timing = scl_timing;
+	master->i3c_od_timing_normal = scl_timing;
+
+	/*
+	 * AMD legacy platforms need fixed OD/PP timings. Cache them as the
+	 * normal OD baseline so set_speed(NORMAL) restores AMD values, and
+	 * set_speed(SLOW) can stretch HCNT while keeping the AMD LCNT.
+	 */
+	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
+		amd_configure_od_pp_quirk(master);
+		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
+		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
+	}
 
 	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
@@ -825,12 +844,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	return ret;
 }
 
-static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
-{
-	master->i3c_od_timing = AMD_I3C_OD_TIMING;
-	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
-}
-
 static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 				      struct i3c_ccc_cmd *ccc)
 {
@@ -840,13 +853,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	if (ccc->id == I3C_CCC_ENTDAA)
 		return -EINVAL;
 
-	/* AMD platform specific OD and PP timings */
-	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
-		amd_configure_od_pp_quirk(master);
-		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
-		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
-	}
-
 	ret = pm_runtime_resume_and_get(master->dev);
 	if (ret < 0) {
 		dev_err(master->dev,
@@ -1531,6 +1537,50 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
+				   enum i3c_open_drain_speed speed)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long core_rate;
+	u32 scl_timing, od_hcnt;
+	u8 lcnt;
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
+
+	switch (speed) {
+	case I3C_OPEN_DRAIN_SLOW_SPEED:
+		core_rate = dw_i3c_master_get_core_rate(master);
+		if (!core_rate)
+			return -EINVAL;
+
+		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
+		od_hcnt = DIV_ROUND_UP_ULL((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS *
+					  core_rate, NSEC_PER_SEC) - 1;
+		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
+			od_hcnt = SCL_I3C_TIMING_CNT_MIN;
+		else if (od_hcnt > U8_MAX)
+			od_hcnt = U8_MAX;
+		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
+			     SCL_I3C_TIMING_LCNT(lcnt);
+		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
+		master->i3c_od_timing = scl_timing;
+		break;
+
+	case I3C_OPEN_DRAIN_NORMAL_SPEED:
+		writel(master->i3c_od_timing_normal,
+		       master->regs + SCL_I3C_OD_TIMING);
+		master->i3c_od_timing = master->i3c_od_timing_normal;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
 					    unsigned int dev_nack_retry_cnt)
 {
@@ -1585,6 +1635,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_speed = dw_i3c_master_set_speed,
 	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
@@ -1780,10 +1831,7 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 
 static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
 {
-	/* AMD platform specific OD and PP timings */
-	if (master->quirks & AMD_I3C_OD_PP_TIMING)
-		amd_configure_od_pp_quirk(master);
-
+	/* Preserve cached OD timing; it may be the SLOW setting from set_speed(). */
 	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
 	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
 	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 28e9348f2153..17ad817d1f8e 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -46,6 +46,7 @@ struct dw_i3c_master {
 	u32 dev_addr;
 	u32 i3c_pp_timing;
 	u32 i3c_od_timing;
+	u32 i3c_od_timing_normal;
 	u32 ext_lcnt_timing;
 	u32 bus_free_timing;
 	u32 i2c_fm_timing;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 2dc139a217bf..c3df1c187050 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -269,6 +269,7 @@ struct i3c_device {
 #define I3C_BUS_THIGH_MIXED_MAX_NS	41
 #define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
+#define I3C_BUS_THIGH_INIT_OD_MIN_NS	200
 
 /**
  * enum i3c_bus_mode - I3C bus mode
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
