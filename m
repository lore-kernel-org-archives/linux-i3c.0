Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112CEC79F8C
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Sep 2026 07:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dJIxgA9xErSGsJMesws0WSHisiFk7g2JHgnU5FzGTYA=; b=18s+hH/q1nMub8
	zQxrPLFE4g7cPsT4OYzvcJPWjjHgRY3xe7psdAvGnSEPyvqMKXhW+EMB7i6dEXOCVk3V+VY9p+cV2
	n7a+FJ53Jcmw7cmYec1+7RTB+iFwSj4wWEaS+m2vIXwyW3UotJ6yA8D/HF0h/mi1scsrboeHpM89Q
	36t797k2CcckchnVd8OaPWB6C+ijzm3pgXLci/1xPG47LX6xW17zQMxTJ8RIQPoN2zDXahXbb91t4
	aXuOdINfVC9JLQHCzjxJRCBRSaEIThqE0z0CMbpuoeJyGXZWxkCKoJ/8l0Xe8NPWb2N2WRgxAA+co
	+9r32wLSncDVU4E43ohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CVI-0000000AxCf-3850;
	Wed, 09 Sep 2026 07:13:56 +0000
Received: from mail-centralusazon11010039.outbound.protection.outlook.com ([52.101.61.39] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CVG-0000000AxBv-1FnO
	for linux-i3c@lists.infradead.org;
	Wed, 09 Sep 2026 07:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQBdxQkIH2b1I6yM1ULL/9sKIf0G1eW39SSW9VfcOkTfsWz3MSCN4qkYTY3E8JYzSEbfOGqRmC8g6YC2JwusYK5+8VjSCpV3awwvDIQ24fC/ITEU0mHQ1k6sFOuq9VxR6IzaFzaNRQV0FmftMnlHfOjVNPjvP9u1WFH6+6Y/IIzvy3N1DpK5CWTSKk7NLZ9BbfYbNLJJ87kTAd6Q4pgIzJtODi7PeMfI+77dYnYu8lurpwtigYE1Bivu2+02wdW78Rq596b5zSj0qY9ol5PnSI+IZczZynxe/V77P1SzSx55EcW3DK+3L7TCH4b8cJASiySA6bg2J9wnW/pu5mRSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VQu9mJKVTeqdHyw3WQWZLhrmsZnhsfL+ZASoh/JPag=;
 b=j8BBbjnI9jBn5kgR8/MmnXcvH0YeqjQDsbr3xjqGwBQo/qVigVJjhy8BQB2upWqMnRS1nmutdiGNc9f1HpYNenuE7XolMGJ2IoEcIWmsknDnTpDHUeAmGvTBgYY+sjs3nSvZAT+TTxeTUONcFzcVyeHeMrNq+LUx0Q16aRDnJPcG1/o48Z8Zbxt6w4aFCCjTldtSIZwhUx7LmXJcpCEQVqMllHHxfS8vGozTOTeMN5K2N2QdKcmSXfeXmVXoSJshRn9Q6ovmrSltLRFWzBS1qhLKT3p+QPkPLD8x+EhH79N6RUL/Sv3cZWQ8l4WgALfJUx3jnpHEu9blOU8fpv1Knw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQu9mJKVTeqdHyw3WQWZLhrmsZnhsfL+ZASoh/JPag=;
 b=2uv1xgTQLRP8OSd9kvsPcfDAroNT01e8tD1aG5OycPSJsCug0HkvjpcLhSEdksfJj28IYUZ8Kke0ME039EkB91tvoSBYR47JcTeNmRnQsUMbCB/EBZNsvR7B+KnFrqPrBXnP1M2anzSlVJn5bp024zztb251GhnjsWQ4SwSdx74=
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:13:47 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::74) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 07:13:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 07:13:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:45 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 02:13:42 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v4 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Wed, 9 Sep 2026 12:43:37 +0530
Message-ID: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 193a483d-28b8-4e41-b11c-08df0e41e3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|6133799003|3023799007|18002099003|5023799004|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: hRMRrn3xelo+dOEfSiMhEbV+GwsuNL8A+Xb5RzkapFm8T+uvpvmB+RRVhxx4Cd3GzQdQJObAVOiqEfcIELJBdJCfN3azgT58OLV2L1SbVppSP5oGyGenZvFlohQy1z8gA4aJC791bE84tiZaDf9+sWoFAyyLOOxYo8qY9UkXJ+7UWMzQfLVQwipPd17eAtYRbSJDxPIl+Xe4HNQ2rOLwJwOdw8yoSsBK5yVbVNBpsCkdEeo08caFVGS1YX4lLYbSpjRX8Whav4z2j+K6f+wTtmtBcI+uefaQUymNtTjjMIRCVlLdT/Hob5dnu+7IIlYQp/6WV+FWkKaO6njPWYcheLtgKMqbU2LnSKTUlcMOf5wKXUIWSmKC0eXuNFf4Uv8duG4AY01F+TsAQzpWn7DcgJU0ROaMVDn9RFHTzNc69p+rLC/TsU5o92mvHHZNyU946Oqw0tx1ma+BAngfnxD0AdY26neNPOhupvnxUdUKcIqRW02u/Wl//jtkBMfDOJ671jUt9c8H8poVLZJYYXd/FJo02lSMxvy9lLMsfY7L3nEGEKN1m8ZSe5lVPESFfzWldyl2n0Tp2xTn0ulLNbG0sosGILDfRdOSQpYknbqshfCEQUh7qEddXjWwI1JPuAXJIfSKC539YvxtH2iESHnIRVU6FPoZbun8crxgO/Yr2l54apa7GKmzl8CbUKSZy5wJrWI2N2bkn5rjNCPFdS94sA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(5023799004)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a8MGNyJAakGTISsgx8kDXyKRk66cpSfHACr2XQHNg6KsKPOuDsFK8Ee2q+X2vf6TfBU0rsXBZZViGyI8wsFWUIpxTqs9uI5hN/jggHQIsMZbmrg6DufE8PU9BoYS95cJ+rIjcycaMNL5WlW7/n750Cw9xcgVEppx3R/sDMvo6+1g+WmAYrZDY0dgWS9f1ErmRuhcEP7aSFz4r1n3yxCuBTD3ZDSF5BR2YYp+ZfndR/8MQadTZAWc7E28A8gnkXkwazLEHMLyH6DZ6XIDke4nLPY6fpUwZzhOHXvJZ8ttfzlcVU+0GrLjIIOmAcEOZIDHZeaG293xkZaFfIbVzJgShMen8E9/W/Zqvpsm+1KabUzUCYdMFPYuvmH7kSFOGUSHQMF+8OgEMldXLSD0+sNj9ZfuVNGhsUc8EvsN5yM1LvRLVIRX81rZ+SS/e5Bd4lzX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:13:46.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 193a483d-28b8-4e41-b11c-08df0e41e3ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_001354_344396_BC110A5A 
X-CRM114-Status: GOOD (  17.29  )
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
bWVyYXRpb24KZnJvbSB0aGUgY29yZSB3b3JrcXVldWUuCgpDaGFuZ2VzIGluIHY0OgogLSBQYXRj
aCAxOiBSZXN0b3JlIHYyIERULiBLZWVwIHhsbngsaW4tYmFuZC1pbnRlcnJ1cHQtY2FwYWJsZSBh
bmQKICAgeGxueCxob3Qtam9pbi1jYXBhYmxlIGluIHRoZSBBTUQgYmluZGluZzsgZG8gbm90IG1v
dmUgdGhlbSBpbnRvCiAgIGkzYy55YW1sLgogICBBZGRlZCBBY2tlZC1ieTogQ29ub3IgRG9vbGV5
IHRhZy4KIC0gUGF0Y2ggMjogUHJvYmUgInhsbngsaW4tYmFuZC1pbnRlcnJ1cHQtY2FwYWJsZSIg
YWdhaW4uCiAtIFBhdGNoIDM6IFByb2JlICJ4bG54LGhvdC1qb2luLWNhcGFibGUiIGFnYWluLgoK
Q2hhbmdlcyBpbiB2MzoKIC0gUGF0Y2ggMTogTW92ZSBpbi1iYW5kLWludGVycnVwdC1jYXBhYmxl
IGFuZCBob3Qtam9pbi1jYXBhYmxlIGludG8KICAgaTNjLnlhbWwgYW5kIGRyb3AgdGhlIHhsbngs
IHByZWZpeC4gS2VlcCB0aGUgSEotZGVwZW5kcy1vbi1JQkkgYW5kCiAgIElCSS1yZXF1aXJlcy1p
bnRlcnJ1cHRzIGNvbnN0cmFpbnRzIGluIHRoZSBBTUQgYmluZGluZy4KIC0gUGF0Y2ggMjogSW4g
eGkzY194ZmVyX3Jlc3BfYXZhaWxhYmxlKCksIHJlYWQgSUJJX1RBUkdFVF9BRERSIGJlZm9yZQog
ICBwb3BwaW5nIFJFU1BfU1RBVFVTX0ZJRk8gc28gYSByYWNlZCBJQkkgaXMgbm90IHBhaXJlZCB3
aXRoIHRoZSBuZXh0CiAgIGFkZHJlc3MuIENhbGwgaTNjX2Rldl9zZXRfbWFzdGVyX2RhdGEoKSBi
ZWZvcmUgcHVibGlzaGluZyB0aGUgSUJJLgogLSBQYXRjaCAzOiBQcm9iZSB0aGUgZ2VuZXJpYyBo
b3Qtam9pbi1jYXBhYmxlIHByb3BlcnR5LgoKQ2hhbmdlcyBpbiB2MjoKIC0gUGF0Y2ggMTogUmVu
YW1lZCB0aGUgcHJvcGVydGllcyB0byAieGxueCxpbi1iYW5kLWludGVycnVwdC1jYXBhYmxlIgog
ICBhbmQgInhsbngsaG90LWpvaW4tY2FwYWJsZSIgYW5kIGV4cGFuZGVkIHRoZWlyIGRlc2NyaXB0
aW9uczsgZXhwcmVzc2VkCiAgIHRoZSBpbnRlcnJ1cHQgcmVxdWlyZW1lbnQgd2l0aCBkZXBlbmRl
bmNpZXM6IGluc3RlYWQgb2YgYW4KICAgYWxsT2YvaWYtdGhlbiBjbGF1c2UuCiAtIFBhdGNoIDI6
IERvIG5vdCBsb3NlIGFuIElCSSByYWNlZCB3aXRoIGEgdHJhbnNmZXIgLSB0aGUgSUJJIEFDSyBp
cyBub3cKICAgaGVsZCBvZmYgZm9yIHRoZSBkdXJhdGlvbiBvZiBhIHRyYW5zZmVyIHNvIHRoZSB0
YXJnZXQgcmV0cmllcywgYW5kIG9uZQogICBhY2NlcHRlZCBqdXN0IGJlZm9yZSB0aGF0IGlzIGRl
bGl2ZXJlZCB0aHJvdWdoIHRoZSBub3JtYWwgSUJJIHBhdGgKICAgaW5zdGVhZCBvZiBiZWluZyBk
cmFpbmVkLCB3aGljaCBjb3VsZCBhbHNvIGNvbnN1bWUgdGhlIHRyYW5zZmVyJ3MgcmVhZAogICBk
YXRhLiBkaXNhYmxlX2liaSgpIHJldHVybnMgZWFybHkgb24gRElTRUMgZmFpbHVyZSBpbnN0ZWFk
IG9mCiAgIGRpc2FybWluZyBhbmQgZGVzeW5jaW5nIGliaS5lbmFibGVkX2NvdW50IGZyb20gdGhl
IGNvcmUuIEFkZGVkCiAgIHN5bmNocm9uaXplX2lycSgpIGJlZm9yZSBkaXNhYmxlX2liaSgpIHJl
dHVybnMgYW5kIGJlZm9yZSBmcmVlX2liaSgpCiAgIGZyZWVzIHRoZSBwb29sLiBSZXdvcmRlZCBj
b21taXQgbWVzc2FnZSBhY2NvcmRpbmdseS4KIC0gUGF0Y2ggMzogVXNlIHRoZSBjb3JlJ3MgaTNj
X21hc3Rlcl9xdWV1ZV9ob3Rqb2luKCkgaW5zdGVhZCBvZiBhCiAgIHByaXZhdGUgd29yayBpdGVt
LCBhbmQgb25seSBxdWV1ZSB3aGVuIHRoZSBkZXNpZ24gaXMgaG90LWpvaW4gY2FwYWJsZTsKICAg
dGhlIGNvcmUgb3ducyB0aGUgd29yayBhbmQgY2FuY2VscyBpdCBvbiB1bnJlZ2lzdGVyLiBSZXdv
cmRlZCBjb21taXQKICAgbWVzc2FnZSBhY2NvcmRpbmdseS4KCnYxOgogIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI2MDgxNDExNTE1NS4zOTc0OTg4LTEtCiAgc2h1YmhhbXNhbmpheS5w
YXRpbEBhbWQuY29tLwp2MjoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA4MjQw
NDQ4MzUuMjkyNDE0MS0xLQogIHNodWJoYW1zYW5qYXkucGF0aWxAYW1kLmNvbS8KdjM6CiAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTA4MDk0MjU3LjMxOTYxMjAtNC0KICBzaHVi
aGFtc2FuamF5LnBhdGlsQGFtZC5jb20vCgpTaHViaGFtIFBhdGlsICgzKToKICBkdC1iaW5kaW5n
czogaTNjOiB4bG54OiBBZGQgSUJJIGFuZCBob3Qtam9pbiBjYXBhYmlsaXR5IHByb3BlcnRpZXMK
ICBpM2M6IG1hc3RlcjogYW1kOiBBZGQgc3VwcG9ydCBmb3IgaW4tYmFuZCBpbnRlcnJ1cHRzCiAg
aTNjOiBtYXN0ZXI6IGFtZDogQWRkIGhvdC1qb2luIHN1cHBvcnQKCiAuLi4vYmluZGluZ3MvaTNj
L3hsbngsYXhpLWkzYy0xLjAueWFtbCAgICAgICAgfCAgMjQgKwogZHJpdmVycy9pM2MvbWFzdGVy
L2FtZC1pM2MtbWFzdGVyLmMgICAgICAgICAgIHwgNjU2ICsrKysrKysrKysrKysrKysrLQogMiBm
aWxlcyBjaGFuZ2VkLCA2NjAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgotLSAKMi4z
NC4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
