Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB34C79FA1
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Sep 2026 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMxm+JjiINL2zagT6ZzMgO5OXA5y2UqSGpPRhL/Mgvs=; b=EPyXvO12mzVJRr
	uxBcPMMC2QMrzfz4pCo8dgTApNqylBaqVLxrly4UKMYuS2S96VdOI5M1q+a/+VHSEMhYZXDM9zkgz
	UWUwccTprN+Rhep4fFD/D6BsaXUN4GyZrYMCyTUDH5wp/ByGPAI/ODpmwyVTUKTlgW3rpbF9Qy7ba
	34rGNDGR9VrRUnDVx8uB4hUxPbNmMmsICN2fqmyBnh1edVhK9tZwSndrrYNhLDsFcNqslGKWczESm
	ES60hoyhjdV0BngpV+/KzrvGAV37cjKH2iGyS7hnlSD1m6akZlIDgJ7I4pgi5qb1U1QzSJJqB8qU0
	y/D002RrIRcmmTu90LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sML-00000008eCZ-3vuJ;
	Tue, 08 Sep 2026 09:43:21 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sMI-00000008eBn-3Yd3
	for linux-i3c@lists.infradead.org;
	Tue, 08 Sep 2026 09:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h00ck9J4RCNDKOHiF8RFFt3r+swYDUYErh8wBnFcXzLWYbte1G6KIAUlNbz+rzt4KFzTOTu5iTu70NW+hKqPscqHFlf8/FLP0LK4lGjstwSJ1pt3Jv0CW4d+2lXaGZOJXldvKLNaSkgiPF7EIcEjMNkDMxcEPtOP5WoqHYA6mcimkO50woXYsmOelIyOqvcpin94BUjTFdM4/ZG6H7/9SlslPPNZXtrlVJEf5tNz5aQBbY0cn9V5fNvroneNxLcBOj2yvvgiFrtFQkpg8n1gjxIvSrpQXQKJZOtzU2P9FKb/S1l5JpR94GHvLICuD7h1+zqZXK6OBjkoDAWpXTr4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlz9KcK1c0it4qe9WKLr69Lb7FPzxnI35UAkdDq59YI=;
 b=gI2m8kgSBeY8Sn7RHSJ7Svx4VwRo8t2z9b2N/sbQf5fSviYsJq71181NDN5PMq67hpPtlgvR4bcSnGebedAdq7Ok1RLOOWQSAirGrB207aWbJ0srOMZoPuQH1CfXQgAOrfxPWeFcQF/uS64DNBjULfz4zUrWqj8mK/AERX3Ah+UECrrQyVFdVmT8muOwCIkbO/h+PLNYCrtmyMsX2GArehyOt+7LLqjUDmUpiclN29RfdmnRV9ZmLFHinlYff2OVgzkaca4SqxVQBHYhCkPpM4creA6pR4LmYwmW6PwlLCONxHyHfMIqm+FuNMXsLcSZcLCZEBz5pfXyFnKtTcbWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlz9KcK1c0it4qe9WKLr69Lb7FPzxnI35UAkdDq59YI=;
 b=ftYSizYJxbIUHdzcVym8616vm8iteShVrsOPKxZDEAYYYry4oT2IMvXtNCC/nSDkOPFyE0SyrswlCmvE7o/PP/bua0iEgiV60p+OfscTz5YmnXY/wSPglpicr3JsBAKg1g6t6b0EZz40WiIHsGOJHVTP1mpxivYHony2GFMj96w=
Received: from BYAPR21CA0030.namprd21.prod.outlook.com (2603:10b6:a03:114::40)
 by DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:43:09 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::ac) by BYAPR21CA0030.outlook.office365.com
 (2603:10b6:a03:114::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Tue, 8
 Sep 2026 09:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 09:43:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 04:43:04 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 04:43:01 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Tue, 8 Sep 2026 15:12:54 +0530
Message-ID: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DSWPR12MB999151:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8605f7-33bf-4f51-727f-08df0d8d96ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|13003099007|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: OR1Y3eFFbSJlSEMOCFNrOdijQIwyq6VzbAaCGYBmZEMYAg2ak6eRBF1WW1nZu6qEzW2OTMXic6pDwztoZxj8WmNg7KuhDbiJ5NiTg0md+noa99DJ0j15sC13Z6f5BufAGTyHL+ca7K3eNjOCUWCwbI60U3SX9gmejg1N3d5igTFfJhBkpjqIhKpZCPck57eoGHWCOolPqsPjJWVRUy1YysRP7wZuBuvuPHrg22gZgAmsXPTjWihrOCHh1xxU+DHgjImhEgRSFdQVXTQsiJxn/dHeARWuJiV75v1fyYJLCJTuSX7bRYqBEyiGgbspAIdjusGe8yrqD6kfd0fcX943WIl6kWFMvBlBj/TX6tuaH4Zhyjv9JXAFfLv/FA3g7SG6XGYRipiuxLjhP8krFR/xHb/5cPT8emyr+AWeMGfrtUrZs+n5ZuW6actMWRT80SXBwk4VxTvN73NHQl5DLCNJVqiWojyF5rSyBG62C8MB7na8L7ry7kw7d5hNM7hzOwlEaWsxLXLmB2cR5udQUdQtDxfZ8CSTxvY5qBOd8PY4ZBTuVrEtSSFtu5276p5wr8GGpAbdEHVzYQXg3RS0zPaODWeYJcQYg7+HVaXFmQDjJtODRt2bSobyt98Y0LZm1camuc5BEzhA6Aj5UPkVWXqlyKi5uamGrlm0pNi9Tkl2djDL0+TusyI4c+KRTkzxBF+rzJM2pUHOqbTZZDWwTSjv6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S3fzBiP1FMPK0Er+g2W6GeEiiqfwEF6WhkL1bTEK1t4Dyl0XxTTCqMthKywfwDM2OzkrKlbt+hK/LeFZfaYPrJpLT27jGthPd9TpBH2g4QXKc2FdEQ3oSQVPVFmTRznrSC7rjn9yB3ZOifJlIiff4COV1EGtKRGVs22wr7OBuSZ2Qv78yxxm+eOgYYKCiZDeGAdSNOHybgx7fGWPxSkRxQYhODWHNW/OZH+eY6IwKEhBC7Maqb/7hS5uJ68I+X5U3Bd2DbJOrziufwQF39yf3lEcWG3huo704cBc0BE1SiN9z6uH09M0qZ2B83+SyjJGcBnqqZwE+lrC61pNiPuWXq4uK5Slj/QevD1KYCSRvXat3LEM4uSApqdFKYA+xyIsuOgcbLRrUUcLX8RTv1JFW2TrkiznKSk+PMKYiNO8Oh6EBMy4ADpflWi8JKO7dGXj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:43:08.2711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8605f7-33bf-4f51-727f-08df0d8d96ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024318_892261_1FD1AEB8 
X-CRM114-Status: GOOD (  16.60  )
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
IG9mIGEKcGFydGljdWxhciBpbnN0YW5jZS4KClBhdGNoIDEgYWRkcyB0d28gYm9vbGVhbiBwcm9w
ZXJ0aWVzLCBpbi1iYW5kLWludGVycnVwdC1jYXBhYmxlIGFuZApob3Qtam9pbi1jYXBhYmxlLCBp
biB0aGUgY29tbW9uIGkzYy55YW1sIHNjaGVtYS4gSG90LUpvaW4gcmVxdWVzdHMgYXJlCkFDS2Vk
IGJ5IHRoZSBJQkkgbWFjaGluZXJ5LCBzbyBob3Qtam9pbi1jYXBhYmxlIGRlcGVuZHMgb24KaW4t
YmFuZC1pbnRlcnJ1cHQtY2FwYWJsZS4gVGhlIEFNRCBiaW5kaW5nIHN0aWxsIHJlcXVpcmVzIGlu
dGVycnVwdHMgd2hlbgpJQkkgaXMgcHJlc2VudC4gVGhlIGRyaXZlciBhc3NlbWJsZXMgaXRzIG9w
cyBhdCBwcm9iZSBmcm9tIHRoZXNlIGZsYWdzLgoKUGF0Y2ggMiBhZGRzIElCSSBzdXBwb3J0LiBU
aGUgSUJJIEFDSyBlbmFibGUgYW5kIGl0cyBpbnRlcnJ1cHQgbWFzayBhcmUKY29udHJvbGxlci13
aWRlIHJhdGhlciB0aGFuIHBlci10YXJnZXQsIHNvIHRoZXkgYXJlIGFybWVkIG9uIHRoZSBmaXJz
dAp0YXJnZXQgdG8gZW5hYmxlIElCSXMgYW5kIGRpc2FybWVkIG9uIHRoZSBsYXN0IHRvIGRpc2Fi
bGUgdGhlbSwgd2l0aApwZXItdGFyZ2V0IGNvbnRyb2wgbGVmdCBvbiB0aGUgYnVzIHZpYSBFTkVD
L0RJU0VDLiBJQklzIGFsc28gc2hhcmUgdGhlCnJlc3BvbnNlIGFuZCByZWFkIEZJRk9zIHdpdGgg
bm9ybWFsIHRyYW5zZmVycyBhbmQgYXJlIGRpc3Rpbmd1aXNoZWQgb25seQpieSB0aGUgcmVzZXJ2
ZWQgVElEIDB4MEYsIHNvIHRoZSBjb250cm9sbGVyIHN0b3BzIEFDS2luZyBJQklzIGZvciB0aGUK
ZHVyYXRpb24gb2YgYSB0cmFuc2ZlciBhbmQgYSB0YXJnZXQgcmV0cmllcyBpbnN0ZWFkLiBPbmUg
QUNLZWQganVzdApiZWZvcmUgdGhhdCB0YWtlcyBlZmZlY3QgaXMgZm91bmQgYnkgVElEIHdoaWxl
IHRoZSB0cmFuc2ZlciB3YWl0cyBmb3IKaXRzIG93biByZXNwb25zZSwgYW5kIGlzIGRlbGl2ZXJl
ZCB0aHJvdWdoIHRoZSBub3JtYWwgSUJJIHBhdGguCgpQYXRjaCAzIGFkZHMgSG90LUpvaW4uIEVO
VERBQSBuZWVkcyBidXMgdHJhZmZpYyBhbmQgY2FuIHNsZWVwLCBzbyBpdApjYW5ub3QgcnVuIGlu
IHRoZSBoYXJkIElSUSBoYW5kbGVyOyB0aGUgSG90LUpvaW4gZXZlbnQgaXMgaGFuZGVkIHRvIHRo
ZQppM2MgY29yZSB3aXRoIGkzY19tYXN0ZXJfcXVldWVfaG90am9pbigpLCB3aGljaCBydW5zIHRo
ZSByZS1lbnVtZXJhdGlvbgpmcm9tIHRoZSBjb3JlIHdvcmtxdWV1ZS4KCkNoYW5nZXMgaW4gdjM6
CiAtIFBhdGNoIDE6IE1vdmUgaW4tYmFuZC1pbnRlcnJ1cHQtY2FwYWJsZSBhbmQgaG90LWpvaW4t
Y2FwYWJsZSBpbnRvCiAgIGkzYy55YW1sIGFuZCBkcm9wIHRoZSB4bG54LCBwcmVmaXguIEtlZXAg
dGhlIEhKLWRlcGVuZHMtb24tSUJJIGFuZAogICBJQkktcmVxdWlyZXMtaW50ZXJydXB0cyBjb25z
dHJhaW50cyBpbiB0aGUgQU1EIGJpbmRpbmcuIAogLSBQYXRjaCAyOiBJbiB4aTNjX3hmZXJfcmVz
cF9hdmFpbGFibGUoKSwgcmVhZCBJQklfVEFSR0VUX0FERFIgYmVmb3JlCiAgIHBvcHBpbmcgUkVT
UF9TVEFUVVNfRklGTyBzbyBhIHJhY2VkIElCSSBpcyBub3QgcGFpcmVkIHdpdGggdGhlIG5leHQK
ICAgYWRkcmVzcy4gQ2FsbCBpM2NfZGV2X3NldF9tYXN0ZXJfZGF0YSgpIGJlZm9yZSBwdWJsaXNo
aW5nIHRoZSBJQkkuCiAtIFBhdGNoIDM6IFByb2JlIHRoZSBnZW5lcmljIGhvdC1qb2luLWNhcGFi
bGUgcHJvcGVydHkuCgpDaGFuZ2VzIGluIHYyOgogLSBQYXRjaCAxOiBSZW5hbWVkIHRoZSBwcm9w
ZXJ0aWVzIHRvICJ4bG54LGluLWJhbmQtaW50ZXJydXB0LWNhcGFibGUiCiAgIGFuZCAieGxueCxo
b3Qtam9pbi1jYXBhYmxlIiBhbmQgZXhwYW5kZWQgdGhlaXIgZGVzY3JpcHRpb25zOyBleHByZXNz
ZWQKICAgdGhlIGludGVycnVwdCByZXF1aXJlbWVudCB3aXRoIGRlcGVuZGVuY2llczogaW5zdGVh
ZCBvZiBhbgogICBhbGxPZi9pZi10aGVuIGNsYXVzZS4KIC0gUGF0Y2ggMjogRG8gbm90IGxvc2Ug
YW4gSUJJIHJhY2VkIHdpdGggYSB0cmFuc2ZlciAtIHRoZSBJQkkgQUNLIGlzIG5vdwogICBoZWxk
IG9mZiBmb3IgdGhlIGR1cmF0aW9uIG9mIGEgdHJhbnNmZXIgc28gdGhlIHRhcmdldCByZXRyaWVz
LCBhbmQgb25lCiAgIGFjY2VwdGVkIGp1c3QgYmVmb3JlIHRoYXQgaXMgZGVsaXZlcmVkIHRocm91
Z2ggdGhlIG5vcm1hbCBJQkkgcGF0aAogICBpbnN0ZWFkIG9mIGJlaW5nIGRyYWluZWQsIHdoaWNo
IGNvdWxkIGFsc28gY29uc3VtZSB0aGUgdHJhbnNmZXIncyByZWFkCiAgIGRhdGEuIGRpc2FibGVf
aWJpKCkgcmV0dXJucyBlYXJseSBvbiBESVNFQyBmYWlsdXJlIGluc3RlYWQgb2YKICAgZGlzYXJt
aW5nIGFuZCBkZXN5bmNpbmcgaWJpLmVuYWJsZWRfY291bnQgZnJvbSB0aGUgY29yZS4gQWRkZWQK
ICAgc3luY2hyb25pemVfaXJxKCkgYmVmb3JlIGRpc2FibGVfaWJpKCkgcmV0dXJucyBhbmQgYmVm
b3JlIGZyZWVfaWJpKCkKICAgZnJlZXMgdGhlIHBvb2wuIFJld29yZGVkIGNvbW1pdCBtZXNzYWdl
IGFjY29yZGluZ2x5LgogLSBQYXRjaCAzOiBVc2UgdGhlIGNvcmUncyBpM2NfbWFzdGVyX3F1ZXVl
X2hvdGpvaW4oKSBpbnN0ZWFkIG9mIGEKICAgcHJpdmF0ZSB3b3JrIGl0ZW0sIGFuZCBvbmx5IHF1
ZXVlIHdoZW4gdGhlIGRlc2lnbiBpcyBob3Qtam9pbiBjYXBhYmxlOwogICB0aGUgY29yZSBvd25z
IHRoZSB3b3JrIGFuZCBjYW5jZWxzIGl0IG9uIHVucmVnaXN0ZXIuIFJld29yZGVkIGNvbW1pdAog
ICBtZXNzYWdlIGFjY29yZGluZ2x5LgoKdjE6CiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwODE0MTE1MTU1LjM5NzQ5ODgtMS0KICBzaHViaGFtc2FuamF5LnBhdGlsQGFtZC5jb20v
CnYyOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDgyNDA0NDgzNS4yOTI0MTQx
LTEtCiAgc2h1YmhhbXNhbmpheS5wYXRpbEBhbWQuY29tLwoKU2h1YmhhbSBQYXRpbCAoMyk6CiAg
ZHQtYmluZGluZ3M6IGkzYzogeGxueDogQWRkIElCSSBhbmQgaG90LWpvaW4gY2FwYWJpbGl0eSBw
cm9wZXJ0aWVzCiAgaTNjOiBtYXN0ZXI6IGFtZDogQWRkIHN1cHBvcnQgZm9yIGluLWJhbmQgaW50
ZXJydXB0cwogIGkzYzogbWFzdGVyOiBhbWQ6IEFkZCBob3Qtam9pbiBzdXBwb3J0CgogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTNjL2kzYy55YW1sICAgICAgICAgIHwgIDE1ICsKIC4uLi9iaW5k
aW5ncy9pM2MveGxueCxheGktaTNjLTEuMC55YW1sICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2kz
Yy9tYXN0ZXIvYW1kLWkzYy1tYXN0ZXIuYyAgICAgICAgICAgfCA2NTYgKysrKysrKysrKysrKysr
KystCiAzIGZpbGVzIGNoYW5nZWQsIDY1NyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkK
Ci0tIAoyLjM0LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
