Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA4D1088E46
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Mar 2026 04:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6s/fr6u56wDyXWp0sgsIFGICU67nd76FDKNv9dQh7E=; b=3PxKei3pSBbc6e
	AFGRY0mNF8ei/5otO0QUIb9HaLnIpvw0Yi8Fw/nkKTObct8x9OHpwrAVnWTCvNeguRGIbaJ4H0EcA
	QSH+l6O1kEf5w3Zi8kYd85xGiZTXksKwCfAD7pv5cMhfg/S6PhMigei/azefVXMxLIGrmzBxx2n0u
	m2lD43vOI1EMqtX0wAeZ5z+Uz9ve/8AHy3EWA3Z3KtHdSjMN5NpdkAbsPGnSafHMq705KjILY34KV
	GmShxrrU504KctTiB+5N7TsSGevUVO5JBEiYZZ17W31oVjGirUG5Xz8KR040UiwejSGBCuKHj5EAy
	CL9yZZP8TfpdZ4NWTnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w357J-00000009uCH-0wx6;
	Thu, 19 Mar 2026 04:36:17 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w357B-00000009uBp-40oS
	for linux-i3c@lists.infradead.org;
	Thu, 19 Mar 2026 04:36:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xvo3zMbw/bWZ2LIs4iV+CEtkGBmnd4B1hTixhRdzZO8Zcl89R8AQgAwf+PmdjSCCru/upXsRWsh1pA72+f0QlbeorXj6aLJhgshQuIPUXmhlm3zXOfVLfUHdiLuqHNMEKLP9WhCJc7dUY5FOM1Ni/83u6Pdv3Xfq22qt5k7mT6Mmfe8jZtB8vl5Z5q+ntN/BWnxbq1KrODi4zkj4mJCzh7LOGEsQL4mN4lXoLj4WzMgsf2W5SIJ30LQW17RaU2jBwXAJbd67hgv7XNTI9ABWBClkfWOPac0JGlB4wHoUeWjZR2pAOQ7RgKY0Y15Nxo94az1aUi9evFZ/tjHNgyBuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNE6NY5Xhus889svthFz8/HqstUbR3i4p9lK6t1F6N8=;
 b=ZAHeYNEu1K0vibmpKMYciXF6/qM7kixmFNxrt6wu96UYSYL0Iz0FfKfMQvCuz+l0KWz4jTqtAYlLp1Z3CKVwDotxf8cd08uqbAaPUKG/rGuHauKHv6XhFI+PGORBlgmDEdQsyuyiRSyI4R7lDwXDVfNPSHNckvZZbbPoY+vY1S+Ew1y91NNkKc1LhvMFXCCgWX4iC02fr3EeaeOrb+6/oZVpr2UeYolaI/AeuHN5fTwi2rSyKeBu8l0I7XX1HHUhlsbONf56jxWb7oYsPcpge2LJ++OxApkPqL6b/JQJXr2rqps7jJxq6WMvMEgg6LnQqkc2qALZGmMDGH//KTVcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNE6NY5Xhus889svthFz8/HqstUbR3i4p9lK6t1F6N8=;
 b=biYa/zaPivADa91/EGN36m4o9qk7aDKiNeg5AIc59mU5Oyqw/auEnn3H+u5cB3fcoVRq4blVNxCfVI6wbY00Jp+4Vx/yTjjDzOdcjZiWqyt+rM3SnC540zth4TH/VLk5A95iXSE7qIwmoEoar07g9nUBooSIZgM1wt++2gXfEFZQrehocLDtulfP+jyqg+QyaZJttHM5xmTfMwIiocmQQ3yIsJItmcMnKNucne1wWIaIiod5YzSPPe2skdGKED155my0wbGQ/3by8G3TWOzlCSTg0lBX7LDTMlF/f+Zow259/ImBzn274b56VksXqLg6+0FAcsUqjf0J/wueir+viw==
Received: from BN9PR03CA0515.namprd03.prod.outlook.com (2603:10b6:408:131::10)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 04:35:59 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::82) by BN9PR03CA0515.outlook.office365.com
 (2603:10b6:408:131::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 04:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 04:35:59 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 21:35:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 21:35:48 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 21:35:41 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <linux@roeck-us.net>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robert.moore@intel.com>, <robh@kernel.org>, <smangipudi@nvidia.com>,
	<thierry.reding@kernel.org>
Subject: Re: [PATCH 11/12] hwmon: spd5118: Add I3C support
Date: Thu, 19 Mar 2026 10:05:27 +0530
Message-ID: <20260319043541.39291-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <df8086b1-8834-4bf2-ac4b-cb921beb8471@roeck-us.net>
References: <df8086b1-8834-4bf2-ac4b-cb921beb8471@roeck-us.net>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: a20db97d-8e90-4193-26bc-08de85710500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|13003099007|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: O2miK5d4BXvnZnO+WFdUieFdOlcwPJlkGfkrdEbY8qVw7HCCJ07yqFABWX3Rl6s8j/8gbsSZFGt74k9Yrg70FP4UNB4ZppE9qns5Q55zcTe3nM/I89EHT+qcDB/yLe5dt/9PMzb2ZZBuOxzy5idDIQlIIstbkrxObDTgFw2Esxik5ipNoboLeCB4TSbZVcu4JjxuvnAJCAJ2fJl4U8POnrA8o4WP01ZquikO6tsF6d40BtJgkQINyowfEzYGNjg70dz7jVmHpUKTKGYP0eIEUljDRW90t6TEIAv2DJHJz8Dr2QmUhhKYVzckrOQQiFwWBJN53FRJw5f8f8S/k5rikHi/5VwCoyZkXzObMYVkxj2WcvRn8BuPV3kIG2D72oLuINpvOC12pa74+C5r12npErHDHZlqa4E+VUHCK79X3szyP0i7J/k42MsreJHG57GX1fyhaPmktMLyHqfcr9RYqtAlIGMcuSwvkAT4YdBF0grQB1BQxL5Uhm9atvjuXRclZKEdD+Fe+ghkoSYBHuLsxgdUS5NCG0yr03uMToDfB+gKLwWajYqC0Jf7nHicRrx2RQ8pe+VAU6vwbgFbQGoYVXeFhcJIP08Tr2EHqJfCUpEC9Oea0WNrgiP9A/Lcz3QAPwNr823QzMFH6LB47+8QjQYciCCqYjTWF4I99in8giFrqzOACLPcGXNyYw/xP5Q0IZz7kjp7cXA0VgcJzxChNVjvFqoVI9nm8ozCVfz/u1oUmx0zF22nNQ9KH7mCRAhxpU2psSL4XKMYcEo6vdrdBw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(13003099007)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wNVoqq8FTK406k2TomdP2svlmuWYNAN+YBfmOfG/WvOfN+kDTJiILlCYjqWe0aZOH1uvWq49Et+iNpGKVWgR0RT6UUiWFUfiUDZseBjwH+voZ3x3bIjBRQ9fVMjCmjE4IC22u4HFMRsF6ZnJYmvwvyJsrRBIIlo9xOX1s/g2VljHtKJJ/hCKDc4i6Co8jar1vyQsexjEUnwd3nwg+WDd73WhzFkQC2ctnPzcyxinu5X8bBHNyKRsCMw7uSJbKAkWL6JIueBxNJwxFsdLaAFa+m2V9XgNhQiUyN7LuaX610CqXkrt/UdHtrVfdoZzu8ppSf3rUMurAuSOBF/3p2vMhszJwcaE/Ky4L57hAuRvyjuWlgCexhTQmgVnC2EUnxm5RNN3a4yvZk9wb0LjqyjIRSIWjGYrR47TluK8K1gvhnyboVUoHDX5sUyF97625USp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 04:35:59.2993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20db97d-8e90-4193-26bc-08de85710500
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_213610_021684_946F788A 
X-CRM114-Status: GOOD (  32.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxOCBNYXIgMjAyNiAxMTo1Mzo0OSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToK
PiBPbiAzLzE4LzI2IDEwOjI3LCBBa2hpbCBSIHdyb3RlOgo+PiBBZGQgYSByZWdtYXAgY29uZmln
IGFuZCBhIHByb2JlIGZ1bmN0aW9uIHRvIHN1cHBvcnQgZm9yIEkzQyBiYXNlZAo+PiBjb21tdW5p
Y2F0aW9uIHRvIFNQRDUxMTggZGV2aWNlcy4KPj4gCj4+IE9uIGFuIEkzQyBidXMsIFNQRDUxMTgg
YXJlIGVudW1lcmF0ZWQgdmlhIFNFVEFBU0EgYW5kIGFsd2F5cyByZXF1aXJlIGFuCj4+IEFDUEkg
b3IgZGV2aWNlIHRyZWUgZW50cnkuIFRoZSBkZXZpY2UgbWF0Y2hpbmcgaXMgaGVuY2UgdGhyb3Vn
aCB0aGUgT0YKPj4gbWF0Y2ggdGFibGVzIG9ubHkgYW5kIGRvIG5vdCBuZWVkIGFuIEkzQyBjbGFz
cyBtYXRjaCB0YWJsZS4gVGhlIGRldmljZQo+PiBpZGVudGl0eSBpcyB2ZXJpZmllZCBpbiB0aGUg
dHlwZSByZWdpc3RlcnMgYmVmb3JlIHByb2NlZWRpbmcgdG8gdGhlCj4+IGNvbW1vbiBwcm9iZSBm
dW5jdGlvbi4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2QG52aWRp
YS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvaHdtb24vS2NvbmZpZyAgIHwgIDcgKysrLS0KPj4g
ICBkcml2ZXJzL2h3bW9uL3NwZDUxMTguYyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZyBi
L2RyaXZlcnMvaHdtb24vS2NvbmZpZwo+PiBpbmRleCA4YWY4MGUxN2QyNWUuLjIzNjA0YzA1YWQy
MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9od21vbi9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMv
aHdtb24vS2NvbmZpZwo+PiBAQCAtMjMwMCwxMCArMjMwMCwxMyBAQCBjb25maWcgU0VOU09SU19T
UEQ1MTE4Cj4+ICAgCXRyaXN0YXRlICJTUEQ1MTE4IENvbXBsaWFudCBUZW1wZXJhdHVyZSBTZW5z
b3JzIgo+PiAgIAlkZXBlbmRzIG9uIEkyQwo+PiAgIAlzZWxlY3QgUkVHTUFQX0kyQwo+IAo+IEkg
YWxzbyBoYWQKPiAJZGVwZW5kcyBvbiBJM0MgfHwgSTNDPW4KPiBpbiBteSB2ZXJzaW9uIGF0Cj4g
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWh3bW9uL3BhdGNo
LzIwMjUwNDE5MTYxMzU2LjI1Mjg5ODYtNi1saW51eEByb2Vjay11cy5uZXQvCj4gCj4gd2hpY2gg
SSBndWVzcyBtYXRjaGVzIHRoZSBtb3JlIHJlY2VudCAiZGVwZW5kcyBvbiBJM0NfT1JfSTJDIi4K
CkFjay4gV2lsbCB1cGRhdGUuCgo+IAo+PiArCXNlbGVjdCBSRUdNQVBfSTNDIGlmIEkzQwo+PiAg
IAloZWxwCj4+ICAgCSAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IHN1cHBvcnQgZm9yIFNQ
RDUxMTggKEpFREVDIEpFU0QzMDApCj4+IC0JICBjb21wbGlhbnQgdGVtcGVyYXR1cmUgc2Vuc29y
cy4gU3VjaCBzZW5zb3JzIGFyZSBmb3VuZCBvbiBERFI1IG1lbW9yeQo+PiAtCSAgbW9kdWxlcy4K
Pj4gKwkgIGNvbXBsaWFudCB0ZW1wZXJhdHVyZSBzZW5zb3JzIHVzaW5nIEkyQyBvciBJM0MgYnVz
IGludGVyZmFjZS4KPj4gKwkgIFN1Y2ggc2Vuc29ycyBhcmUgZm91bmQgb24gRERSNSBtZW1vcnkg
bW9kdWxlcy4KPj4gKwo+PiArCSAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgYm90aCBJMkMgYW5kIEkz
QyBpbnRlcmZhY2VzLgo+PiAgIAo+PiAgIAkgIFRoaXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0
IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhlIG1vZHVsZQo+PiAgIAkgIHdpbGwgYmUgY2FsbGVkIHNw
ZDUxMTguCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYyBiL2RyaXZlcnMv
aHdtb24vc3BkNTExOC5jCj4+IGluZGV4IDVkYTQ0NTcxYjZhMC4uZDcwMTIzZTEwNjE2IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYwo+PiArKysgYi9kcml2ZXJzL2h3bW9u
L3NwZDUxMTguYwo+PiBAQCAtMTgsNiArMTgsNyBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9iaXRz
Lmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9pMmMu
aD4KPj4gKyNpbmNsdWRlIDxsaW51eC9pM2MvZGV2aWNlLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4
L2h3bW9uLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiAgICNpbmNsdWRlIDxs
aW51eC9tdXRleC5oPgo+PiBAQCAtNDgyLDYgKzQ4MywyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHJlZ21hcF9jb25maWcgc3BkNTExOF9yZWdtYXAxNl9jb25maWcgPSB7Cj4+ICAgCS5jYWNoZV90
eXBlID0gUkVHQ0FDSEVfTUFQTEUsCj4+ICAgfTsKPj4gICAKPj4gKy8qCj4+ICsgKiBJM0MgdXNl
cyAyLWJ5dGUgcmVnaXN0ZXIgYWRkcmVzc2luZyAtCj4+ICsgKiAgIEJ5dGUgMTogTWVtUmVnIHwg
QmxrQWRkclswXSB8IEFkZHJlc3NbNTowXQo+PiArICogICBCeXRlIDI6IDAwMDAgICB8IEJsa0Fk
ZHJbNDoxXQo+PiArICoKPj4gKyAqIFRoZSBsb3cgYnl0ZSBjYXJyaWVzIHRoZSByZWdpc3Rlci9O
Vk0gYWRkcmVzcyBhbmQgdGhlIGhpZ2ggYnl0ZSBjYXJyaWVzIHRoZQo+PiArICogdXBwZXIgYmxv
Y2sgYWRkcmVzcyBiaXRzLCBzbyBsaXR0bGUtZW5kaWFuIGZvcm1hdCBpcyByZXF1aXJlZC4gTm8g
cmFuZ2UKPj4gKyAqIGNvbmZpZyBpcyBuZWVkZWQgc2luY2UgSTNDIGRvZXMgbm90IHVzZSBNUjEx
IHBhZ2Ugc3dpdGNoaW5nLgo+PiArICovCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9j
b25maWcgc3BkNTExOF9yZWdtYXBfaTNjX2NvbmZpZyA9IHsKPj4gKwkucmVnX2JpdHMgPSAxNiwK
Pj4gKwkudmFsX2JpdHMgPSA4LAo+PiArCS5tYXhfcmVnaXN0ZXIgPSAweDdmZiwKPj4gKwkucmVn
X2Zvcm1hdF9lbmRpYW4gPSBSRUdNQVBfRU5ESUFOX0xJVFRMRSwKPiAKPiBTaG91bGQgdGhpcyBi
ZSBhZGRlZCB0byBzcGQ1MTE4X3JlZ21hcDE2X2NvbmZpZyBpbnN0ZWFkLCBvciBpcyB0aGVyZSBy
ZWFzb24KPiB0byBhc3N1bWUgdGhhdCBJMkMgMTYtYml0IGFkZHJlc3NpbmcgZGlmZmVycyBmcm9t
IEkzQyBhZGRyZXNzaW5nID8KCkkgZGlkIG5vdCBzZWUgYW55IGRpZmZlcmVuY2UgZm9yIEkyQyBp
biB0aGUgc3BlY2lmaWNhdGlvbiwgYnV0IEkgYXNzdW1lZCB0aGUKZXhpc3RpbmcgZm9ybWF0IHdv
dWxkIGhhdmUgYmVlbiB3b3JraW5nIGFuZCBJIHRob3VnaHQgbm90IHRvIGNoYW5nZSB0aGVtLgpD
aGFuZ2luZyB0aGUgSTJDIGZvcm1hdCB3b3VsZCBhbHNvIHJlcXVpcmUgYSBjaGFuZ2UgaW4gdGhl
IGlzXzE2Yml0IG52bWVtX3JlYWQKZm9ybXVsYS4KCj4gCj4+ICsJLndyaXRlYWJsZV9yZWcgPSBz
cGQ1MTE4X3dyaXRlYWJsZV9yZWcsCj4+ICsJLnZvbGF0aWxlX3JlZyA9IHNwZDUxMThfdm9sYXRp
bGVfcmVnLAo+PiArCS5jYWNoZV90eXBlID0gUkVHQ0FDSEVfTUFQTEUsCj4+ICt9Owo+PiArCj4+
ICAgc3RhdGljIGludCBzcGQ1MTE4X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiAgIHsK
Pj4gICAJc3RydWN0IHNwZDUxMThfZGF0YSAqZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+
PiBAQCAtNzcwLDcgKzc5MCw1MSBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgc3BkNTExOF9p
MmNfZHJpdmVyID0gewo+PiAgIAkuYWRkcmVzc19saXN0CT0gSVNfRU5BQkxFRChDT05GSUdfU0VO
U09SU19TUEQ1MTE4X0RFVEVDVCkgPyBub3JtYWxfaTJjIDogTlVMTCwKPj4gICB9Owo+PiAgIAo+
PiAtbW9kdWxlX2kyY19kcml2ZXIoc3BkNTExOF9pMmNfZHJpdmVyKTsKPj4gKy8qIEkzQyAqLwo+
PiArCj4+ICtzdGF0aWMgaW50IHNwZDUxMThfaTNjX3Byb2JlKHN0cnVjdCBpM2NfZGV2aWNlICpp
M2NkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gaTNjZGV2X3RvX2RldihpM2Nk
ZXYpOwo+PiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gKwl1bnNpZ25lZCBpbnQgcmVndmFs
Owo+PiArCWludCBlcnI7Cj4+ICsKPj4gKwlyZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X2kzYyhp
M2NkZXYsICZzcGQ1MTE4X3JlZ21hcF9pM2NfY29uZmlnKTsKPj4gKwlpZiAoSVNfRVJSKHJlZ21h
cCkpCj4+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyZWdtYXApLCAicmVn
bWFwIGluaXQgZmFpbGVkXG4iKTsKPj4gKwo+PiArCS8qIFZlcmlmeSB0aGlzIGlzIGEgU1BENTEx
OCBkZXZpY2UgKi8KPj4gKwllcnIgPSByZWdtYXBfcmVhZChyZWdtYXAsIFNQRDUxMThfUkVHX1RZ
UEUsICZyZWd2YWwpOwo+PiArCWlmIChlcnIpCj4+ICsJCXJldHVybiBlcnI7Cj4+ICsKPj4gKwlp
ZiAocmVndmFsICE9IDB4NTEpIHsKPj4gKwkJZGV2X2VycihkZXYsICJ1bmV4cGVjdGVkIGRldmlj
ZSB0eXBlIDB4JTAyeCwgZXhwZWN0ZWQgMHg1MVxuIiwgcmVndmFsKTsKPj4gKwkJcmV0dXJuIC1F
Tk9ERVY7Cj4+ICsJfQo+PiArCj4+ICsJZXJyID0gcmVnbWFwX3JlYWQocmVnbWFwLCBTUEQ1MTE4
X1JFR19UWVBFICsgMSwgJnJlZ3ZhbCk7Cj4+ICsJaWYgKGVycikKPj4gKwkJcmV0dXJuIGVycjsK
Pj4gKwo+PiArCWlmIChyZWd2YWwgIT0gMHgxOCkgewo+PiArCQlkZXZfZXJyKGRldiwgInVuZXhw
ZWN0ZWQgZGV2aWNlIHR5cGUgMHglMDJ4LCBleHBlY3RlZCAweDE4XG4iLCByZWd2YWwpOwo+PiAr
CQlyZXR1cm4gLUVOT0RFVjsKPj4gKwl9Cj4+ICsKPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgc2hv
dWxkIGR1bXAgZXJyb3IgbWVzc2FnZXMuIEFsc28sIGl0IG1pZ2h0IGJlIGRlc2lyYWJsZQo+IHRv
IHVzZSBhIHNpbmdsZSByZWdtYXAgb3BlcmF0aW9uIHRvIHJlYWQgYm90aCB2YWx1ZXMuCgpBY2su
IFdpbGwgdXNlIHJlZ21hcF9idWxrX3JlYWQoKSBhbmQgd2lsbCByZW1vdmUgdGhlIGVycm9yIGR1
bXAuCgo+IAo+PiArCXJldHVybiBzcGQ1MTE4X2NvbW1vbl9wcm9iZShkZXYsIHJlZ21hcCwgZmFs
c2UpOwo+IAo+IFdoeSBpc18xNmJpdD1mYWxzZSA/CgpXZSBkb24ndCBuZWVkIHRoZSBlbmNvZGlu
ZyBmb3JtdWxhIGZvciB0aGUgbnZtZW0gYWRkcmVzcyB3aXRoIEkzQy4gU2luY2UgaXQKdXNlcyBs
aXR0bGUtZW5kaWFuLCAocGFnZSAqIDB4MTAwICsgU1BENTExOF9FRVBST01fQkFTRSkgdHJhbnNs
YXRlcyB0byB0aGUKY29ycmVjdCBhZGRyZXNzLiBPciBkaWQgSSBvdmVybG9vayBzb21ldGhpbmc/
Cgo+IAo+PiArfQo+PiArCj4+ICtzdGF0aWMgc3RydWN0IGkzY19kcml2ZXIgc3BkNTExOF9pM2Nf
ZHJpdmVyID0gewo+PiArCS5kcml2ZXIgPSB7Cj4+ICsJCS5uYW1lCT0gInNwZDUxMThfaTNjIiwK
Pj4gKwkJLm9mX21hdGNoX3RhYmxlID0gc3BkNTExOF9vZl9pZHMsCj4+ICsJCS5wbSA9IHBtX3Ns
ZWVwX3B0cigmc3BkNTExOF9wbV9vcHMpLAo+PiArCX0sCj4+ICsJLnByb2JlCQk9IHNwZDUxMThf
aTNjX3Byb2JlLAo+PiArfTsKPj4gKwo+PiArbW9kdWxlX2kzY19pMmNfZHJpdmVyKHNwZDUxMThf
aTNjX2RyaXZlciwgJnNwZDUxMThfaTJjX2RyaXZlcik7Cj4+ICAgCj4+ICAgTU9EVUxFX0FVVEhP
UigiUmVuw6kgUmViZSA8cmVuZUBleGFjdGNvZGUuZGU+Iik7Cj4+ICAgTU9EVUxFX0FVVEhPUigi
R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiIpOwoKQmVzdCBSZWdhcmRzLApBa2hp
bAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
