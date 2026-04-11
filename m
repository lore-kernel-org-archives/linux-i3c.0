Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA835F45A1F
	for <linux-i3c@archiver.kernel.org>; Sat, 11 Apr 2026 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06s+ZZcfBYyUkly73OpdYsknycVdHDSt6WxcwDqXN/k=; b=ssUEhUepghAMSD
	cA7GPD+Ci/uidTuSYLL7jaI6QH1bdgWYQGD6afAjp0w7lJCWoj6MbtVGp7omsfXupGqwG8ZfGfVQS
	b9R/ezXVRPZ6ytW70gzzlw9y71WhV7I/jZe0++2zQtC8J7X3dUp5rduS5sYNHtQot/CECH4lK1yNX
	Nan9Efe0iscYT8izunSxbRr+8HF/6U2ltrMFyQlcIi/mzvqAK2GcXa8B2tzp0KeDSKp0jNu/4zV3m
	N4dc/aPP4rAbxQyumYm5N1HELCEtfbZPsIyDLPcUPiHBd3sPuTM524SZjx9tlcDwWAIfgVm2DpFdB
	KZ1BoEdA/24v1Px1xfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBR64-0000000DAmi-2XuO;
	Sat, 11 Apr 2026 05:41:32 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBR61-0000000DAmL-2yyZ
	for linux-i3c@lists.infradead.org;
	Sat, 11 Apr 2026 05:41:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klh8csoBwx+q1yCpLdWUY6IA1PPVLnotYZI7cBifKkPtNw0GSz3S2Js8IqV3ItPGlb5PuXOhVYmZxcoJ053kXsSt7n/XANGb8gXcH/iw5AmNuorWsDfpk/NBaRx+08vAJn5GcgR8wskTLI7n8J2VxpESuIR+E29iaHkh6zyFUPD4uQa03oSwZenDSzDqr7qArnya4MdC/OHDpjlMOywoDJtIqDSp9Dp6MDurO6bDIHBKkEX0YhG62oFlr3q1kqwgTWuPb7F5g40LeuljWRce6taP//JDfAD5NCcQPSqieOeyAQoxX8Ak0zobxhUNzF0atIpP+QWO/CuDoah07MafFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK+vOWvDBFMpLXYOmQRle+HbReR4882LXreDCWONZFU=;
 b=vLRhzz/qKVmpHEcqhym0sy3lWgXH3MLX160zOBkquBa8wanFKahxoEctr/OTA7lAgiC2bOljPjGDx5UXZFgq5XAI0aV3D8sMTw/WT+79ka5VlO+gxJPdjqOO1TOTGOWZhFQgwL56oEjyY1JzUPnnUOr0jZsd2fEF36MZ/tN7sOBcjMtn4exbkkbhA5sZylIRDvH9UDShwXInd76wNS8poD3BdkZlebYFabRcYToOZg/5pyKyn09nTuy//gD/bpNjJakl/WIjOlmI4hR/DQiwkd0rE86DaHuD0Z+3UR4jpwE82dXzZ82tsbiYphgxT+BInVz24fmTx2hHEaO0oJErVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK+vOWvDBFMpLXYOmQRle+HbReR4882LXreDCWONZFU=;
 b=Pis9ojEK1o4fI7Zvvsgy7Edd2a2KXMcrFKBHDy9xQysBwSKBQPwmLebtNUU39p3qilIV39FL5OSRuAonuOCmAzMfhbMIxsSJgXVaIUXFqBPFt6fpe/a0cihUJUYwk+95uP7yZx9krXJDUmSUnovxshGSrmHOKLLuIn395tzF+bQ1AiXuygb61k35eXFqIETPkIPOMtSCLdnq2HzK7v18x6VkJ7YZPXONsXz/mZ+bQOgMf2IZylBJ/GftWI4p7mseAFVerP9tXEfSX1A3dvHGy/rXQb2bBwXdZrICLVDbwD34/0eF7Xo8EUnofAA3Y/ly2WY3JF/Tzhx+kfV1Niojlg==
Received: from BYAPR11CA0076.namprd11.prod.outlook.com (2603:10b6:a03:f4::17)
 by CH3PR12MB9218.namprd12.prod.outlook.com (2603:10b6:610:19f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Sat, 11 Apr
 2026 05:41:22 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::22) by BYAPR11CA0076.outlook.office365.com
 (2603:10b6:a03:f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Sat,
 11 Apr 2026 05:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 11 Apr 2026 05:41:21 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 22:41:11 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 22:41:09 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 22:41:02 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <rafael@kernel.org>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>, <frank.li@nxp.com>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<sakari.ailus@linux.intel.com>, <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
Date: Sat, 11 Apr 2026 11:11:00 +0530
Message-ID: <20260411054101.50827-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
References: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|CH3PR12MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e908d6-04b0-410b-0e0f-08de978cf638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kpnPbVQy24QbgoaOT+RD0UGnuw2Hue+UmUShh15nA7LimZ4+kqfIJM7xU4PbWhOu1cjZkmtXlvD21qPgF/TqMzKm2q2zv855z3I+uAb51gGGMLgSzvQQv87U6FREs18sUkAV9nRnQ0CugBO7ISfrj05QYNtQ+LhV6J7KEtOgt6xqLzVKp+mNqkCwsbU0kxB102rmR3PQ9T7zBnARjs6ar2aD/Fq+w4nYT/fIFAl66xwAJKUH+3ds3V0tnhQw1Aqwgaaz6/UaSSN4D9C8gm7iALmnH8yzHncOnpdWrs91E/HFq6TQjgHM5p7pVS6AkZpYfc3HfSij2bp9FW5hQiOnjfXBMP0nVnWaI3HG21rvH/O2rLGtVw6CejSNmy3yhGFbZY/Df5fARIqMaU7l96co0Y1GnFNdf5drjAAcTwvWWd5qwe2x5Ibs+oS7VExjEcNXAGdcIeEC+rZmSPZ+9fbBLM6lKYHLmeZC/tuFbKTaFHeXyFY9b8RN4LRoZszTocmFhP8kT4uHzQflVZkv52DwxVw0hFkM8jznnRh0WsMvFf/XdvNhPVwp/fYRm6RsqyVJz0uqr7Bgpg6ZtorjQmX1aFG6YqOS3YMrtI0jSwfo5OhsIoysbzmKOPK9kAkWsBajSAIsExEzCWh85uGd5roceAUxSD0qqHl+pXSJbtrEFZUDFy0n/EO4DM72PuNt0/a+SCPH514hz+8ELO+TrR/MlgqJYitGP+K1TXVIZwuV/l4+pe4mIbQaY6up1zFd4sIPVx1QH1oKRctd1NJ+untqWQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D07tL7Gu7xXvNdbJBzKsooKMlLx7fvoOr8PmltRzUkCpbzJS7hE63CgEjeduA/tArKPMg7XoMGvcmCdA3OI5r0vl/cPzQ9RDDNL/CgQuSrmcI4t/SZFpudlBnhBbaQ7xaHNlawts8Sv6mPWk/QL7oO4rvo/yjFxjNiTzPSGTyybD//mX32Osi5kmF+ub2NLRAN30Fcm8DrMZ6/IWttGSNcjAMof2S5gGsNYbJTdZo93lR5FG7WieLGH3K95nDdVz/pGbqSXtl0mJzsJSTS0yF/IXgXo/BOLJrctF3LLqgaYOJYtceVvjzQHfPaQhz4XyHK080GGoFTInUMN0HF7i0Fi9Ewfl1P/u/FfI0LAvJzd1K8udnIWHhzSRtGgm6Q6+TDi4LZES1hcjvmLOdZBy6VqjYXjElNNVKQx+gx7A8dtaB2ZDHi7eNVMcR/LOLTza
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 05:41:21.3859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e908d6-04b0-410b-0e0f-08de978cf638
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_224129_775610_0D6F455F 
X-CRM114-Status: GOOD (  11.27  )
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

T24gRnJpLCAxMCBBcHIgMjAyNiAxMjo1OTowNiArMDIwMCwgUmFmYWVsIEouIFd5c29ja2kgd3Jv
dGU6Cj4gT24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgNjo0NeKAr0FNIEFraGlsIFIgPGFraGlscmFq
ZWV2QG52aWRpYS5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIDkgQXByIDIwMjYgMjI6MDQ6MDUg
LTA0MDAsIEZyYW5rIExpIHdyb3RlOgo+Pj4gT24gVGh1LCBBcHIgMDksIDIwMjYgYXQgMDQ6Mjc6
MzJQTSArMDUzMCwgQWtoaWwgUiB3cm90ZToKPj4+PiBBQ1BJIDYuMyBzcGVjaWZpZXMgYnl0ZSA4
IG9mIEkyQyBTZXJpYWwgQnVzIENvbm5lY3Rpb24gZGVzY3JpcHRvciB0byBiZQo+Pj4+IHVzZWQg
Zm9yIExlZ2FjeSBWaXJ0dWFsIFJlZ2lzdGVyIChMVlIpIGRhdGEgYXMgc3BlY2lmaWVkIGluIHRo
ZSBNSVBJCj4+Pj4gSTNDIFNwZWNpZmljYXRpb24gZm9yIGFuIEkyQyBkZXZpY2UgY29ubmVjdGVk
IHRvIGFuIEkzQyBIb3N0IENvbnRyb2xsZXIuCj4+Pj4gTFZSIHdpbGwgYmUgcmVhZCBieSBJM0Mg
aG9zdCBjb250cm9sbGVyIGRyaXZlcnMgYW5kIGl0IHByb3ZpZGVzIGRldGFpbHMKPj4+PiBhYm91
dCB0aGUgc3BlY2lmaWMgc3BlZWQgYW5kIDUwbnMgc3Bpa2UgZmlsdGVyIGNhcGFiaWxpdGllcyBv
ZiBJMkMKPj4+PiBkZXZpY2VzLgo+Pj4+Cj4+Pj4gVXBkYXRlIHRoZSByc2NvbnZlcnRfaW5mbyB0
byBpbmNsdWRlIHRoaXMgZmllbGQuIEZvciBJMkMgZGV2aWNlcyBvbiBhbgo+Pj4+IEkyQyBidXMs
IHRoaXMgZmllbGQgaXMgUmVzZXJ2ZWQgYW5kIHVudXNlZC4KPj4+Pgo+Pj4+IFRoaXMgY29tbWl0
IGlzIHRoZSByZXN1bHQgb2Ygc3F1YXNoaW5nIHRoZSBmb2xsb3dpbmc6Cj4+Pj4gQUNQSUNBIGNv
bW1pdCA3MDA4MmRjOGZjODQ3NjczYWM3ZjRiYmIxNTQxNzc2NzMwZjBiNjNlCj4+Pj4gQUNQSUNB
IGNvbW1pdCBlNjJlNzRiYWY3ZTA4Y2YwNTllYzgyMDQ5YWVjY2Q1NjViMjRkNjYxCj4+Pj4gQUNQ
SUNBIGNvbW1pdCBjNDA0MTE4MjM1MTA4MDEyY2FkMzk2YzgzNGI1YWFiZTJkZDFiNTFhCj4+Pj4g
QUNQSUNBIGNvbW1pdCA3NjUwZDRhODg5ZWE3OTA3MDYwYmZjZTg5ZjRmNzgwY2U4M2U3YjI4Cj4+
Pj4gQUNQSUNBIGNvbW1pdCAwMTRmYTlmMmRiY2M2YjFiZDQyYTRhNGE2ZjY3MDVkOWNmN2Q0NjBi
Cj4+Pgo+Pj4gVGhlc2UgY29tbWl0IG51bWJlciBpcyBub3QgZXhpc3RlZCBhdCBsaW51cyBvZmZp
Y2lhbCB0cmVlLiBQbGVhc2UgcmVtb3ZlIGl0Lgo+Pgo+PiBUaGVzZSBhcmUgY29tbWl0cyBmcm9t
IEFDUEktQ0EgZ2l0aHViLiBUaGUgZmlsZXMgaW4gdGhlIGFjcGljYSBmb2xkZXIgaXMKPj4gYSBt
aXJyb3Igb2YgdGhhdCByZXBvLiBJIHN1cHBvc2UgdGhlIGNvbW1pdHMgaW4gdGhpcyBmb2xkZXIg
YXJlIGV4cGVjdGVkCj4+IHRvIGJlIHN0cnVjdHVyZWQgbGlrZSB0aGlzLiBUaGUgcHJvY2VzcyBp
cyBhbHNvIGRlc2NyaWJlZCBoZXJlIC0KPj4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVy
LWFwaS9hY3BpL2xpbnV4aXplZC1hY3BpY2EuaHRtbAo+IAo+IFdoaWxlIHRoZSBhYm92ZSBpcyBj
b3JyZWN0IG92ZXJhbGwsIGl0IHdvdWxkIGFsc28gYmUgc3VmZmljaWVudCB0byB1c2UKPiBMaW5r
OiB0YWdzIHBvaW50aW5nIHRvIHRob3NlIGNvbW1pdHMuCgpBY2suIEkgd2lsbCBkcm9wIHRoZSBj
b21taXQgSURzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpCZXN0IFJlZ2FyZHMsCkFraGlsCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
