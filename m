Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0E5C5DF8C
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2026 04:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fyaw86+jzARh/aw+IlPsR/M5RhsZla58Pd0zQmrk0bE=; b=ILpkWeDOWb39my
	rXOAp67all20VN/yt/5UiaUFQyHNjB3R7jCcXz07f94CxYMBJ3GULu2xLBxQYKnx8VDpBci4QUqEu
	8Oa5CVoYTLmRDgeL41vnQEk9aBTXX2IJd++NQTwlOtNhcRnsHnzNq6swGgYCdrSniGFGZWg0oT/E8
	vLM6ufsDmJ3hKArfBotEbk8aKUYqXKbj8ea5yirhRN1CPi+g4MPQzonMytHDGTecZul1Klj4ImP6j
	zcsoxWD7Clh2hKCqO+dyBWKrKLi1dgF9XWU/2YeXt/2GeBIxbQQypLF98TviKAHCBTCaxHtVZNuPn
	cvPoy8mxzJ7Z7VEdvI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyMc8-0000000Fv0X-3ey7;
	Mon, 24 Aug 2026 04:48:52 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyMc6-0000000Fv0B-2CQP
	for linux-i3c@lists.infradead.org;
	Mon, 24 Aug 2026 04:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuAM39YaLl4Sr0GJSSTy6zqP2hQEnvRXDuRSehCcI2sNKmFWnbxeGQyBDcep7Pil25PhslNIkkh0rXh771IQkm+wR4njux33bj5QLMqS6do26ZXy/F3NSmmRdzuMq5MdWCfW145p9lhAvryjGpiuAoZo9AgF8ZSbgHe+zSq/54xLKNXjqd5y/uFq6fWmMqM/x5fHCc1kXfGb36xfIMqyy9x5XV9kaezu5H+5UD1jUEysMljcZqS+teR8Z+cK0aAWNDaSamNAuDoTG5s2ISLKraYIe4/IudC1JLsH94fOT0l3a4NxNAJFS7PulAQ0MjHPf81QoJ4eENCFS/y/fBhtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz7/wsoglCCT4IyjyDDN0P5XDGkDqmp00irG5b1HSHE=;
 b=qiP/BVhiuvGcWCEr76nNbiJBqJGg0tU0vsserVJVbN1tYHIP0YM/JE9H6ATwCbgmYAyBw0twoyCkD0d3RXu6xVcbuEEQGCy1CUUypv7HOmae+Z97rUmAdzhn/coKtKMNXJJ7F0FuPxSr9QspIUSehT65sqg2FdIKRHMbOToYMp+reVP4kzOT3rDrMj3j3c7efVo+o5+cza9RVoUbog9TrCEePPMznCPpPdE87WCrHWAULXlOQOeOtrektPVg/lIHswQVfhwC6mO8GRoqfGKwo/LquajFCvg587VOAqabgTtL2vDSKBcFW+O8VhpL/r8dhqDjg/Tf75e+XU2mtoSKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz7/wsoglCCT4IyjyDDN0P5XDGkDqmp00irG5b1HSHE=;
 b=n4ze5wJb0CYYBVYwiLoXqtiVi3yMwnEfNDIhFHNFX9qwtNZZ8ZEHMCQw/P1AvDX5gSdwF9alqfr6MWJzU07RpLTfGqAIdaCI0T2Gl/Do5x7aURWO/oY0VFgTYI5twsZjFCFQUQyTUY1eDA2j6ym+RiIUvW+PdfZF48havxBkf78=
Received: from BN0PR04CA0146.namprd04.prod.outlook.com (2603:10b6:408:ed::31)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 04:48:43 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::18) by BN0PR04CA0146.outlook.office365.com
 (2603:10b6:408:ed::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 04:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 04:48:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 23 Aug
 2026 23:48:42 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Sun, 23 Aug 2026 23:48:39 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Mon, 24 Aug 2026 10:18:32 +0530
Message-ID: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: c763cb37-af97-414b-6bd7-08df019af970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|10067099003|5023799004|11063799006|56012099006|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: c3/FYw/LWvOnSPZJ5PgtSbwZ8tlYdzTO0BrViw52n5YcnucQ5uZzWN/FmNaBfwZDgK73Ay4EiQ9Rsl0KUXOoWV0YZousqg219V6RHkHY90xCvpCRpZaN4c3pYz+673wQaNkm6GJ7U9bqBkYIREZ+rTCJkvl2YnrM+kmuDDjVorDBhFpns0rfJ9JoCM3mtoPgBcWVK6I4RIk/zWaePx1jTKcGHlFjV10R/uT8fUuLeGsjQPwVgbO58FaVUEKqWq/C1Qh472rq/jsSyhOqTYdSeqbIIVvEwqKOKA6L/3voZFfsbjavdC1ECt/Gst2X5VsktC2293oXa8/QRkE9HJbEQU/3A4qiybJRMw7X6BRdjw31eyM4Crkh7HcrQUlIN2fvt8WGWWxhisCx8zhSD3E44tS4asLXRLh/eaCtW3S/753zIBcyPVQCXiQagVejx3lmTIBDcBctLAwZZTa0gm3dgSTz3s1UTGBKkOYbCMbitKPZ9bwWPz+Jady5XSBRFeG64PyGziw2GkGYJVRa97iXstMYkb3WAvzwCE8Krq3hgczVV+A5ePrCUFIXXykVfB7TOUme0oXUGWCJikguoyVFEAfNfkZ/4218Feo3EMzx2CVOF6vq8H0I9PvP5tQ3MMzbBGp05Co4+mdtF4JSFbQJkE5FQOR/aHUkfgdLmreMWKebQejDqZ+/ep3MdcEkX8WA2tQNQJeUMjdu2sA1GA13Sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 13n9CsV7pn+Mv5kOGcPDsgZRUhig9jwX1hOyCvnz2wKf+10/5qTJvpooGHZwmPmSqKeNUUXi3CgpyWxr+6+2Myhz12UVo1WWOYuWu0wJiqstO28j/Px8Le5lZZcnYnduBwyhltmBUq0dbOkG+WeenlfKyhAqJjJE9t12EPrLdjDgVtYYX0gxB/M/rBgAbQtz+S4FSaHijO5z7VWcaIhx6R7FfypwLINacL+VIMpmLIiAvIZoiAYF9nYAQIw6hqbSK/O9132bqbr3/wLimH+/WZ4DhSqHZl+dC5Ebk2lhsnN1hKHJX03bPpmp/13e2w6R4DCuPFeDN1DdeSg9tL4ai0WrNUDWwEXNEai9BwSdNLbeXbgaS3tEdNBsPL22JYgSr6g/M/Lb6hdGj0yyZ7/vgKuFib8dSYS0omHU9OJCXcZmO0kvHK28GEjYufyBEQh5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 04:48:43.0971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c763cb37-af97-414b-6bd7-08df019af970
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_214850_713377_D5D78416 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYWRkcyBJbi1CYW5kIEludGVycnVwdCAoSUJJKSBhbmQgSG90LUpvaW4gc3Vw
cG9ydCB0byB0aGUgQU1ECkFYSSBJM0MgbWFzdGVyIGNvbnRyb2xsZXIgZHJpdmVyLgoKQW4gSW4t
QmFuZCBJbnRlcnJ1cHQgKElCSSkgcmVwbGFjZXMgdGhlIGRlZGljYXRlZCBpbnRlcnJ1cHQgcGlu
IGFuIEkyQwpzbGF2ZSB3b3VsZCBvdGhlcndpc2UgbmVlZC4gV2hlbiB0aGUgYnVzIGlzIGlkbGUs
IGEgdGFyZ2V0IHdhbnRpbmcKYXR0ZW50aW9uIHB1bGxzIFNEQSBsb3cgdG8gZ2VuZXJhdGUgYSBT
VEFSVCwgdGhlbiBkcml2ZXMgaXRzIG93biBkeW5hbWljCmFkZHJlc3Mgd2l0aCBSblc9MSBkdXJp
bmcgdGhlIGFyYml0cmF0ZWQgYWRkcmVzcyBoZWFkZXIuIFRoZSBjb250cm9sbGVyCmVpdGhlciBB
Q0tzIHRoZSByZXF1ZXN0LCBhY2NlcHRpbmcgdGhlIGludGVycnVwdCBhbmQgb3B0aW9uYWxseSBy
ZWFkaW5nIGEKTWFuZGF0b3J5IERhdGEgQnl0ZSBhbmQgcGF5bG9hZCwgb3IgTkFDS3MgaXQuIFRo
ZSBpbnRlcnJ1cHQgdGhlcmVmb3JlCnRyYXZlbHMgaW4gYmFuZCBvbiBTREEvU0NMLCBzYXZpbmcg
YSB3aXJlIHBlciBkZXZpY2UuCgpIb3QtSm9pbiAoSEopIGxldHMgYSB0YXJnZXQgdGhhdCB3YXMg
bm90IHByZXNlbnQgYXQgYm9vdCBqb2luIGEgcnVubmluZwpidXMsIGFmdGVyIGJlaW5nIHBvd2Vy
ZWQgdXAgbGF0ZXIgb3IgcGh5c2ljYWxseSBhdHRhY2hlZC4gSGF2aW5nIG5vCmR5bmFtaWMgYWRk
cmVzcyB5ZXQsIGl0IGFyYml0cmF0ZXMgdXNpbmcgdGhlIHJlc2VydmVkIEhvdC1Kb2luIGFkZHJl
c3M7CnRoZSBjb250cm9sbGVyIEFDS3MgdGhhdCBhbmQgcnVucyBkeW5hbWljIGFkZHJlc3MgYXNz
aWdubWVudCB0byBlbnVtZXJhdGUKaXQuIFRoZSBzYW1lIGhhcmR3YXJlIGFyYml0cmF0ZXMgYW5k
IEFDS3MgaXQgYXMgYW4gSUJJLgoKVGhpcyBzZXJpZXMgYWRkcyBvcHRpb25hbCBJbi1CYW5kIElu
dGVycnVwdCAoSUJJKSBhbmQgSG90LUpvaW4gc3VwcG9ydAp0byB0aGUgWGlsaW54IEFYSSBJM0Mg
bWFzdGVyIGRyaXZlci4gVGhlIGNvbnRyb2xsZXIgaXMgc29mdCBJUApzeW50aGVzaXplZCBpbnRv
IEZQR0EgZmFicmljLCBub3QgZml4ZWQgU29DIGhhcmR3YXJlLiBJQkkgYW5kIEhvdC1Kb2luCmFy
ZSBWaXZhZG8gc3ludGhlc2lzLXRpbWUgb3B0aW9ucywgc28gdHdvIGJpdHN0cmVhbXMg4oCUIG9y
IHR3byBpbnN0YW5jZXMKaW4gdGhlIHNhbWUgZGVzaWduIOKAlCBjYW4gc2hhcmUgdGhlIHNhbWUg
SVAgdmVyc2lvbiBhbmQgY29tcGF0aWJsZQpzdHJpbmcgeWV0IGRpZmZlciBpbiB3aGljaCBmZWF0
dXJlcyBhcmUgZW5hYmxlZC4gQSBzaW5nbGUgZGV2aWNlIG1heQpjb250YWluIG11bHRpcGxlIGlu
c3RhbmNlcyBpbiBtaXhlZCBjb25maWd1cmF0aW9ucy4gVGhlIGNvbXBhdGlibGUKc3RyaW5nIGlk
ZW50aWZpZXMgdGhlIElQIGFuZCBpdHMgdmVyc2lvbiwgYnV0IG5vdCB0aGUgY2FwYWJpbGl0aWVz
IG9mIGEKcGFydGljdWxhciBpbnN0YW5jZS4KClBhdGNoIDEgYWRkcyB0d28gYm9vbGVhbiBkZXZp
Y2UgdHJlZSBwcm9wZXJ0aWVzLAp4bG54LGluLWJhbmQtaW50ZXJydXB0LWNhcGFibGUgYW5kIHhs
bngsaG90LWpvaW4tY2FwYWJsZSwgdG8gZGVzY3JpYmUKd2hhdCBlYWNoIGluc3RhbmNlIGltcGxl
bWVudHMuIEhvdC1Kb2luIHJlcXVlc3RzIGFyZSBBQ0tlZCBieSB0aGUgSUJJCm1hY2hpbmVyeSwg
c28geGxueCxob3Qtam9pbi1jYXBhYmxlIGRlcGVuZHMgb24KeGxueCxpbi1iYW5kLWludGVycnVw
dC1jYXBhYmxlIGFuZCB0aGUgYmluZGluZyBlbmZvcmNlcyB0aGF0CmRlcGVuZGVuY3kuIFRoZSBj
b250cm9sbGVyIGludGVycnVwdCBjYXJyaWVzIG9ubHkgSUJJIGFuZCBIb3QtSm9pbgpldmVudHMs
IHNvIGl0IGlzIHJlcXVpcmVkIG9ubHkgZm9yIGluLWJhbmQtaW50ZXJydXB0LWNhcGFibGUgZGVz
aWducy4KVGhlIGRyaXZlciBhc3NlbWJsZXMgaXRzIG9wcyBhdCBwcm9iZSB0aW1lIGZyb20gdGhl
c2UgY2FwYWJpbGl0eSBmbGFncy4KClBhdGNoIDIgYWRkcyBJQkkgc3VwcG9ydC4gVGhlIElCSSBB
Q0sgZW5hYmxlIGFuZCBpdHMgaW50ZXJydXB0IG1hc2sgYXJlCmNvbnRyb2xsZXItd2lkZSByYXRo
ZXIgdGhhbiBwZXItdGFyZ2V0LCBzbyB0aGV5IGFyZSBhcm1lZCBvbiB0aGUgZmlyc3QKdGFyZ2V0
IHRvIGVuYWJsZSBJQklzIGFuZCBkaXNhcm1lZCBvbiB0aGUgbGFzdCB0byBkaXNhYmxlIHRoZW0s
IHdpdGgKcGVyLXRhcmdldCBjb250cm9sIGxlZnQgb24gdGhlIGJ1cyB2aWEgRU5FQy9ESVNFQy4g
SUJJcyBhbHNvIHNoYXJlIHRoZQpyZXNwb25zZSBhbmQgcmVhZCBGSUZPcyB3aXRoIG5vcm1hbCB0
cmFuc2ZlcnMgYW5kIGFyZSBkaXN0aW5ndWlzaGVkIG9ubHkKYnkgdGhlIHJlc2VydmVkIFRJRCAw
eDBGLCBzbyB0aGUgY29udHJvbGxlciBzdG9wcyBBQ0tpbmcgSUJJcyBmb3IgdGhlCmR1cmF0aW9u
IG9mIGEgdHJhbnNmZXIgYW5kIGEgdGFyZ2V0IHJldHJpZXMgaW5zdGVhZC4gT25lIEFDS2VkIGp1
c3QKYmVmb3JlIHRoYXQgdGFrZXMgZWZmZWN0IGlzIGZvdW5kIGJ5IFRJRCB3aGlsZSB0aGUgdHJh
bnNmZXIgd2FpdHMgZm9yIGl0cwpvd24gcmVzcG9uc2UsIGFuZCBpcyBkZWxpdmVyZWQgdGhyb3Vn
aCB0aGUgbm9ybWFsIElCSSBwYXRoLgoKUGF0Y2ggMyBhZGRzIEhvdC1Kb2luLiBFTlREQUEgbmVl
ZHMgYnVzIHRyYWZmaWMgYW5kIGNhbiBzbGVlcCwgc28gaXQKY2Fubm90IHJ1biBpbiB0aGUgaGFy
ZCBJUlEgaGFuZGxlcjsgdGhlIEhvdC1Kb2luIGV2ZW50IGlzIGhhbmRlZCB0byB0aGUKaTNjIGNv
cmUgd2l0aCBpM2NfbWFzdGVyX3F1ZXVlX2hvdGpvaW4oKSwgd2hpY2ggcnVucyB0aGUgcmUtZW51
bWVyYXRpb24KZnJvbSB0aGUgY29yZSB3b3JrcXVldWUuCgpDaGFuZ2VzIGluIHYyOgogLSBQYXRj
aCAxOiBSZW5hbWVkIHRoZSBwcm9wZXJ0aWVzIHRvICJ4bG54LGluLWJhbmQtaW50ZXJydXB0LWNh
cGFibGUiCiAgIGFuZCAieGxueCxob3Qtam9pbi1jYXBhYmxlIiBhbmQgZXhwYW5kZWQgdGhlaXIg
ZGVzY3JpcHRpb25zOyBleHByZXNzZWQKICAgdGhlIGludGVycnVwdCByZXF1aXJlbWVudCB3aXRo
IGRlcGVuZGVuY2llczogaW5zdGVhZCBvZiBhbgogICBhbGxPZi9pZi10aGVuIGNsYXVzZS4KIC0g
UGF0Y2ggMjogRG8gbm90IGxvc2UgYW4gSUJJIHJhY2VkIHdpdGggYSB0cmFuc2ZlciAtIHRoZSBJ
QkkgQUNLIGlzIG5vdwogICBoZWxkIG9mZiBmb3IgdGhlIGR1cmF0aW9uIG9mIGEgdHJhbnNmZXIg
c28gdGhlIHRhcmdldCByZXRyaWVzLCBhbmQgb25lCiAgIGFjY2VwdGVkIGp1c3QgYmVmb3JlIHRo
YXQgaXMgZGVsaXZlcmVkIHRocm91Z2ggdGhlIG5vcm1hbCBJQkkgcGF0aAogICBpbnN0ZWFkIG9m
IGJlaW5nIGRyYWluZWQsIHdoaWNoIGNvdWxkIGFsc28gY29uc3VtZSB0aGUgdHJhbnNmZXIncyBy
ZWFkCiAgIGRhdGEuIGRpc2FibGVfaWJpKCkgcmV0dXJucyBlYXJseSBvbiBESVNFQyBmYWlsdXJl
IGluc3RlYWQgb2YKICAgZGlzYXJtaW5nIGFuZCBkZXN5bmNpbmcgaWJpLmVuYWJsZWRfY291bnQg
ZnJvbSB0aGUgY29yZS4gQWRkZWQKICAgc3luY2hyb25pemVfaXJxKCkgYmVmb3JlIGRpc2FibGVf
aWJpKCkgcmV0dXJucyBhbmQgYmVmb3JlIGZyZWVfaWJpKCkKICAgZnJlZXMgdGhlIHBvb2wuIFJl
d29yZGVkIGNvbW1pdCBtZXNzYWdlIGFjY29yZGluZ2x5LgogLSBQYXRjaCAzOiBVc2UgdGhlIGNv
cmUncyBpM2NfbWFzdGVyX3F1ZXVlX2hvdGpvaW4oKSBpbnN0ZWFkIG9mIGEKICAgcHJpdmF0ZSB3
b3JrIGl0ZW0sIGFuZCBvbmx5IHF1ZXVlIHdoZW4gdGhlIGRlc2lnbiBpcyBob3Qtam9pbiBjYXBh
YmxlOwogICB0aGUgY29yZSBvd25zIHRoZSB3b3JrIGFuZCBjYW5jZWxzIGl0IG9uIHVucmVnaXN0
ZXIuIFJld29yZGVkIGNvbW1pdAogICBtZXNzYWdlIGFjY29yZGluZ2x5LgoKdjEgOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA4MTQxMTUxNTUuMzk3NDk4OC0xLXNodWJoYW1zYW5q
YXkucGF0aWxAYW1kLmNvbS8KClNodWJoYW0gUGF0aWwgKDMpOgogIGR0LWJpbmRpbmdzOiBpM2M6
IHhsbng6IEFkZCBJQkkgYW5kIGhvdC1qb2luIGNhcGFiaWxpdHkgcHJvcGVydGllcwogIGkzYzog
bWFzdGVyOiBhbWQ6IEFkZCBzdXBwb3J0IGZvciBpbi1iYW5kIGludGVycnVwdHMKICBpM2M6IG1h
c3RlcjogYW1kOiBBZGQgaG90LWpvaW4gc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9pM2MveGxueCxh
eGktaTNjLTEuMC55YW1sICAgICAgICB8ICAyNCArCiBkcml2ZXJzL2kzYy9tYXN0ZXIvYW1kLWkz
Yy1tYXN0ZXIuYyAgICAgICAgICAgfCA2NTQgKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNo
YW5nZWQsIDY1OCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
