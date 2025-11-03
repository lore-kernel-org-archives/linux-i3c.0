Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BC9CCFA06
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Nov 2025 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCcygpJiRFU4XnFzA9i53rE9A4u2hTzCnZw09n33ESE=; b=T5zsR/ZWs4yFJA
	k9fEBUrhL1Ek0frXN01qzhVMCzaHhJCVaK/UW476+X2JromQXlzDc/PHDeRFU0JscJDhDFTAtfFkF
	ed2RkcPWUUgutxOfrkYSOrzFA+LPyiEq4zQeDOuyM6OTsZ/vPZYTnU5ehV0143/Hgm4mZGITm4kFx
	Ufi5ZE84B8ODTz3gfhpYQJzquj+L+yQ808vqLJbrIiQh6wp8imNflGQvyIo1S4wuHsWF2DHJ2KIcy
	UZvhLxfYCqsu7R4yGM72Qz6DC9NT/7M+Cn0Vf8oTeqbvZien1CdfI3VlOhF7czT/l6zPWHStyzBRK
	XbjNFtVM3E6x77HAGwJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqqA-00000009Vhp-3QS7;
	Mon, 03 Nov 2025 09:27:06 +0000
Received: from mail-southcentralusazon11012026.outbound.protection.outlook.com ([40.93.195.26] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqq7-00000009Vgf-3uyp
	for linux-i3c@lists.infradead.org;
	Mon, 03 Nov 2025 09:27:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJXP8Bu60SnKABDNsXAujHLIC5gbihiFLszESt1moUeQIsCxt6QQMMy+pWSD+BCfGg56n4wHhwOf3c5BC+kLfZFFf0fuuwA2+sju7POE+xkmxjziQSuQ8VJ+SeVQN3L5QEi4kKD9EHU+drkx9+KQnP184q/DfqhAQrI73ia0BGx1cecqMuoxHndSkLr9DOVE6sA9rimmoeSQuTr7Q8ER4RdE4E9UzSq+2mBpLn2eWNEdtfpG86tmYK4CzKSyvqzU9S35VWG56+exN8QVmPTcmh224ZpQgxt/pZEL3v72SpykXzD8ybSC1AvWCacVfTV9ja+jC3mdZwRNVPT20zCtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNfMardElU+0P3OGtVBYUUGD6b/KYDkCGzkXSzCdkDM=;
 b=uZGkghxYwrLo1kCCUeIxNcv3tlKpd0UwrFx5h08fR4/hhORAymscmvdI8AcP+obP/HqlvBLBK7tIryjtyETGnfPOtkAd1uTU/k2vVx+mbpB05A4l9Axkg8iLVgGJEciEUZDb6XZa+21UkKhEMXqoHNju3uGtjU9fIz881q4Q31rWijteMawq2uJ4Xub8tC4iD2Ms7BeSdTxJGpss0gX57tXlhhfpG/b9GLLZtOPrht+KvYca33G4S40Fa25UyS12xwcJGwKcNrn3Lv96PqoDcz+IvNvPoBvixL3sXHxVS78B1phHRvsCTiN7r8fNwmIweuNTZbvHSBhgoLHNiCJlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNfMardElU+0P3OGtVBYUUGD6b/KYDkCGzkXSzCdkDM=;
 b=poNBeJlE2Ud5xl1jdFFXC81Oi4eK0b5DXZv6DiADqtJRladWU85fwo0E9Tn78jBmWX6LIBzsLZ4PhL1mdh6eA27y5OuVJvSoGHPo4HwMjCYs/SBKSczkOoFbXaxLrO2jZBXavVGioLaSByRgeInnG731kRvbJBdbcnmZB6cvQIXXNyKGSPSRJyyEIjbJUpV/9X59P/11HMwCMxvuZo8BlvfeMK211aBgj8gbm36JqOMAW0GjXtWfQYaObeVe3fDpqI7y0gtQLVeWxcIuRu6zWGlky6QOeXsW8jCijZietqVvJl7Y6ocbJVDkpPKNF3f7ZdhOovb8x7RhQdXkZuuFwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS0PR03MB7252.namprd03.prod.outlook.com (2603:10b6:8:117::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 09:26:58 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 09:26:58 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 0/3] i3c: dw: Add Altera Agilex5 runtime PM disable quirk
Date: Mon,  3 Nov 2025 17:24:25 +0800
Message-ID: <cover.1762161408.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU2P306CA0002.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::9) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS0PR03MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 542ef69f-5ded-474c-d9fa-08de1abb233a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?roSn0rPYOU/9sneC0hpbcaJhgagOyRj4gi0m4O++puynbNH8pzlM490fR+lS?=
 =?us-ascii?Q?KRLIZwnodSHCMYHU+CvuV6voM+x3IKvMpIbW8P/eBZ3KcI2+fVPcGINeGnNq?=
 =?us-ascii?Q?tKCYtiQKKtIJ7sDmw84i1fM766iEq6kqCtOlp+UAT/+Cjaf2v39P230IxZY4?=
 =?us-ascii?Q?Uma7QYtTnhg1h1fHWBJ7WgghXHnnYR5W93bCv9UafMBgPd8k6dsJcS/mwY1P?=
 =?us-ascii?Q?m8gnvk2+jmnzXQY/xYt0KxKLcBU1RfvsNFL/M3VbDBQVjLJgV1To9yzyFkUd?=
 =?us-ascii?Q?IM/vJwBYg94odDhZQOjLJ2tlu05l7GKNFaTMnuCTREY8dLeSHZUZ8o+vjclZ?=
 =?us-ascii?Q?PcV5mF6AfFhevhngp5seo5PxYYMFodCw2rvt1TwuwlVf77rXrb30lxxAGfwZ?=
 =?us-ascii?Q?FUoAPtj+mIoF7B6WYBCR6uEV8zHXYfXt2fByhEago/hbKZ6SnmBNlt2AqVYq?=
 =?us-ascii?Q?runFtcwoeJrgC+05VtEaxxV1TSV4e/Us+JvJF6sGOj66dm8VCpME2sFv4rFt?=
 =?us-ascii?Q?+51618nsFfQs5OIFhK+P5WCi/rJhP4t/vgPZopNeOHVwIoFvAP14/StKMEEz?=
 =?us-ascii?Q?/CHqq1jQpS4QdZxLj0Q6CbeeqGnVFg8z7Usvfak3d6DMylRYbqEH59EWlOsK?=
 =?us-ascii?Q?F9sT4Nz0NQuT99gthI2EodzLSB4PBSw0l+O0h82EVE6eOfOITcSjjht8IAFu?=
 =?us-ascii?Q?ccbmRcUg48eF/BC/6iPkYINaeBdwxYOYQeAkfP/Mwo/Xikb+m8uUDdh1jjIW?=
 =?us-ascii?Q?lLRudV2jbojYKizOh2CTCoO51yvRL9CBujC58pPtiotTM8hzDioaG43vdkh4?=
 =?us-ascii?Q?sgdsZJ/AVdDp1yjIGEkx89bEDcXaUEC1/y24m1mx2tR2nF/OQ4BuxvuCbolX?=
 =?us-ascii?Q?Gn/faAtgeYUHLpLsx/LG0urVD71DTjSOcIfd7QfdxtsiihsPGFP/hnbLC2U8?=
 =?us-ascii?Q?uKxSwdDmd2pZzIAFe/EvprNJ5FoaO8MImnKC8QI/Sz7adU2Er2i6PyFIqtpF?=
 =?us-ascii?Q?rI3plZOmHjN+rzy/3RWhIMDCI4FU5hIqPC7awCKJTn2jj7uVAuIHosF6Rxec?=
 =?us-ascii?Q?Yp0+4EjLhmW1OlX78ubzkjBgHDF7WvWZIzf6I44f9mvGDNKmqvUg1VPMdzRl?=
 =?us-ascii?Q?oyQKJ/DON9WuFnDhspJ8eCpzHN8YIfITCsZGKcMDOLNbtk8oEHan9x5KHvU8?=
 =?us-ascii?Q?Mhie/urOicv7smBBYv4HRRhB8zG8aTMif1RBfYKKUSivRC/aYL/YAjCBBOZ6?=
 =?us-ascii?Q?XqoIa532Y+S+4y0Ty+Bf3XUMJ2HbB0FUAhEaBfE9+ccM80uRli+jP2dVcuAa?=
 =?us-ascii?Q?5R90LZSpoYdoMETsQGrfrRL9fsZNtivqoG0SIEnxEq8ufzm8LnDVVR5nlLBS?=
 =?us-ascii?Q?AkoMrZbuVdOcgYHwvXKguxCG0oiRnjHtLU1jhdg0WPT1ZpywSdWlZ1g/zBep?=
 =?us-ascii?Q?gSpmRuBhIaLvM80OiuOLAWFeKS+uRPxs02dGC/aOhlJ0diHDuXSOv7PnFsOQ?=
 =?us-ascii?Q?q+a/lTVq00OBf3J/dhdqaGJXbvZiDMzed2B/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YsfJ8Qk7FG3RTrCreUEwYHADMqVPE53ao973Ms9aakNgVyYb8UYvmS8aDb4G?=
 =?us-ascii?Q?lh7VP9bIlrwe0iE/nL75ivU0ozmIwrPXw9sI0IZco8k2zUxrKUB2xjYHNNzo?=
 =?us-ascii?Q?Kuf9svaU3avRC9R4rQ9Uw75+YwKSx3vbAtbaznDD19Df2IVa7olx0kmHaUaI?=
 =?us-ascii?Q?zycJKzstFC7/PAcyCS7+VPWKGpDGww4QhNjkGSoSdptXlsVl9p564ZaGuUmV?=
 =?us-ascii?Q?EvQG1tERdkaGPR326NfYEHWxfI2qgeXD2NbKjscC53EhNGf8JML8RCZHfx2u?=
 =?us-ascii?Q?1WrEX1MZCFXFhSW3LS7duoReYm+95aBoFLrUOE+dhOvE13Sx23F/vPaMEF5S?=
 =?us-ascii?Q?f2qBT3hvU5FpWmye0w2EaPPJU25oM+Xiee7bQB/aLIUnRWfwOu6QR/5XubR6?=
 =?us-ascii?Q?FFRK4tyK4K+XpPmbaNObYr6ZpBPgL9mN34ToKX6zwEpgsZOJ6Hrl8dxddj41?=
 =?us-ascii?Q?jNlNt0ok8BSip6n01DCvJ/DJXUuPeppeVUjR6KMjG87c/xDCzbXj5QQrhuUd?=
 =?us-ascii?Q?k8sDNCFkzteZwePUPtV8G3y2/xNdaEFbq+kjLj257QvCIA/8S8M4lbw70/x8?=
 =?us-ascii?Q?lbveJyRglCzsma31w82QyMUN/MInq2FGzhS1FKayPzVacVscx2LfdfUic2JQ?=
 =?us-ascii?Q?dm/hnjvu0AUr6HKBMj/V7SHHRzjNVHg1hZsx4LHVvEhoDAAKIHA3gButZXpa?=
 =?us-ascii?Q?h9EChrUpMgsrMBO3x4EucYiJCP4wRQAEuqZUamtIa0pYKz/Rn3mGy4P6I5ne?=
 =?us-ascii?Q?5W4Pc1+H6EMYAksRW/QYzk3MgcgLYzpyXvxlBhb/3MP0LVhhKgSMLvYExCvs?=
 =?us-ascii?Q?s4w/luWJ70T2IJxWvyiCoiEDzcCcIL4kq/HJQZ+ve2zo1yS9mBtBRYUSXsUG?=
 =?us-ascii?Q?Yr6sz/0U+/RiC/XnVX3tbZXn+07nOeVoc46sQrzGGeAoIyvzebE6bbrmHxV7?=
 =?us-ascii?Q?zxlMzA7sCFHPMMBedTS6mYNQnz8OcFQh+FZLvWgCNPq/ORb33cGQkqc6RNqo?=
 =?us-ascii?Q?+X9l2WtMBhKvcOuLTpjgRtyy8B8sdJRPcVPLLonx8BSLNOOj7oq3sKk9SPiY?=
 =?us-ascii?Q?qGzz6tNBDszFRSy2cDXHebspBAFmYSkQElMciPNtURXtsMvz+bvjgswHCJX0?=
 =?us-ascii?Q?VbQ03BeS0LxXExB2VK/3Bal5DKyyBgs+qcddV2ZQx/j0sHYfAZQS4aKNWlx0?=
 =?us-ascii?Q?k3pLuycyZzLgqB6fceW+IBQVvekMEeJ971kcVL4YQgSCWiDS5tdiHVqS60Q6?=
 =?us-ascii?Q?SNXkFvd+xzAz9zVjRhWj/ydiyiiJ7EYbLZ+BTm+AX5QBnn25+SwTT4hSCilh?=
 =?us-ascii?Q?6+nlQCrdzXd9AtwfZTbut9h1KMLWhvt1jbPsZQr9Wp/2gXFYTXq5kzkgL1rV?=
 =?us-ascii?Q?1B7YWCxn5WzCsoAvsFGZKWevNZinLKinEUvFnTOe8BWFj2beOkjLjUsi1PhI?=
 =?us-ascii?Q?8Sa2guOBj+WLbqB26He/LSifPG+zrO0/0+nXwfMo604IDTf+r8/tOgl/zAsb?=
 =?us-ascii?Q?4lqGRxh01cqg+p6Ec9n8RmysCAAfg+Vz+rYarhDGOcaabvXY6G/WpTQJ5ynv?=
 =?us-ascii?Q?73mk6t8wGLfvLmVenTLRpLVdI9XCMoGpamS3dyKJFj00uwuBtjIVbDR95ccP?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542ef69f-5ded-474c-d9fa-08de1abb233a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 09:26:58.6565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIS7g4cbZVQiHfqscZgGXh92SMiz2XjT+5j46I1WqwDQktSqk2zb8ZDSjA6Kd/LCG4eui9AjwistiYvb7jtQgnwDcHy+LhO9eELsBp4wP0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_012704_014350_170977BE 
X-CRM114-Status: GOOD (  10.02  )
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

This patchset adds support for an Altera SoCFPGA-specific quirk
in the Synopsys DesignWare I3C master driver.

While running the I3C compliance test suite on the Altera Agilex5 SoCFPGA,
the I3C bus was observed to hang when a slave device issued an IBI after
the Dynamic Address Assignment (DAA) process completed.

This issue occurs because the controller enters a suspended state after
DAA due to runtime PM being enabled. When suspended, the controller stops
driving the SCL line. As a result, an IBI transfer cannot complete, leaving
the SDA line stuck low and the bus in a hung state.

To address this issue, a new compatible string,
"altr,agilex5-dw-i3c-master", is introduced to identify the
SoC variant. When this compatible string is matched, a new
quirk (DW_I3C_DISABLE_RUNTIME_PM_QUIRK) is applied to keep the
controller enabled by incrementing the runtime PM reference counter
during probe. This ensures the controller remains active to reliably
handle IBI transactions without requiring runtime PM checks throughout
the driver.

---
changelog:
v3->v4:
*Add reviewed by tag for dt binding.
*Aligned compatible string in dtsi with previous line.
*Update commit message for better clarity.
*Updated implementation to increment the PM reference counter during
probe instead of conditionally bypassing runtime PM APIs. This simplifies
the logic and ensures consistent behavior when the disable-runtime-PM
quirk is applied.
v2->v3:
*Dropped RFC tag.
*Update compatible string to "altr,agilex5-dw-i3c-master" to match actual SoC.
*Update commit message to describe changes correctly.
v1->v2:
*Add new compatible string in dw i3c dt binding to validate against
newly added compatible string.
*Added new compatible string for altr socfpga platform.
*Remove Kconfig that disables runtime PM added in v1.
*Update implementation to disable runtime PM via compatible string
match so that the implementation can be tied to a specific compatible
string so that it does impact the existing behavior for other users.

See previous patch series at:
https://lore.kernel.org/all/22286d459959f2a153ac59d7da46794c0f495c77.1760579799.git.adrianhoyin.ng@altera.com/ 
---

Adrian Ng Ho Yin (3):
  dt-bindings: i3c: snps: Add Altera SoCFPGA compatible
  arm64: dts: intel: agilex5: Add Altera compatible for I3C controllers
  i3c: dw: Add runtime PM disable quirk for Altera Agilex5

 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml  |  6 +++++-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi       |  6 ++++--
 drivers/i3c/master/dw-i3c-master.c                   | 12 ++++++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
