Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1217CAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/5JLVQvFCV2lX2NvYX4x02bfkRQ2soICjXg2b1W/uc=; b=s/AheGIEI1kktd
	xXOxDd9MqicnulryFc0rNngE+mHA3ITlBOXC3Xz0Qchrf8YluTvwsVIt3qqeCjl5w5CkbQTnBJM2z
	R4/Wi/Wah6whc2A/Zi+IdzDKGUfbr9cr+Gt42gytkmfN27qeH2hDqXUiVYa+7gu7wwOGfHsXWp55G
	lxpSjNDf+wPeJhf5M6N8xK87EyGdQEouE3BhnfiaiSvlXafDczAqlCcWloPudQM/aXyvAjagYI51d
	0vl5SSjS1PsymvwOaqAIeDx6dvCy9ID6xtERlocpQwtu04X5ixQtOKbqYpNwUy6KHKtIhhFyk00JX
	MHWb+cM/j23Mn2J0el6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15Eb-0000000E8Gi-38WW;
	Tue, 23 Sep 2025 15:47:17 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15EZ-0000000E8Fr-2fXy
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 15:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGmyuGQRlaVd33PUZg/YG9TbfILIWhtkBfSo3jD4kHTQklNInLxAy5qhtMzjDq3Ca9WdJ/Bcj4xxfC+s8KGbsCaLKuAzyAu1y3xMbawq18FxyHX/cW/KOF35kPh40EBMmBHiT2maccGfFuKrrpjzX2SkUCmFozq8bjvqAZv2tjklnxx3z9Kdxg7QXChBY3dDuZV5uy+VhtKVgpP82SP4dIF9YIc0qCMFtN9wc7jlIda1ffmyk1+tzHsb3hXFSx4o0G2ea2L3JPD5u/LlDBTvyr70gbCpqphl5Wj26uOzSqs+PkwinMG2bXusg7SyEV/Mny5NDMkL92trVGuN3Gl59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN6Rms9ZWlmB51/0a2t2eVkqTDK/TfL+wO5M1aUkQ0E=;
 b=sOUVDfnBPWko903DnZ99Bq2ADhJcDrGoT2ht8qP7bLrAAizXq1WoOHhgKvpktHakoKVbsq89DaQuE+O9BPSfoCIRimSONGDv8hhsveej4xwpjtaC3ifmdWvBWQkaHLmqdZ/7Wd/MiG13J5taPRNj+hMPfLoA1Bw+tHQTROUj0KgQvbJnvVACN+MhD/sVxvLE5ncjqKF4RBvxgvwb/7oZQiYr2mqdzru0Ze75H9Ejx4CaFEzPPrUNfWepUhenKnVdQsIIq1OxqHeQTDex2JdDtHbxy/A1I+6gaaMl2jsHQWknyTUueZw04Nu0qLYaZCfMXJFrQUS2zn9FeiNZ3Y/F3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN6Rms9ZWlmB51/0a2t2eVkqTDK/TfL+wO5M1aUkQ0E=;
 b=V2GVX/m0DRF046+199NPs8/mGJEYkWeT8J/EBQeY2EXcKNiSUggLKy+fN0DDSFpaALcyluStlBN/fa4QQOa18wushNil8U/PISFQ8PSW9UFmLnjA2u04yP9KKpnUqAivVNobOLhJ54VpS91hrAm3zbl0AmpeI4X/aMoKpupSPsE=
Received: from PH8P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::8)
 by IA4PR12MB9836.namprd12.prod.outlook.com (2603:10b6:208:5d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 15:46:59 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::98) by PH8P223CA0002.outlook.office365.com
 (2603:10b6:510:2db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 15:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 15:46:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 23 Sep
 2025 08:46:29 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Sep
 2025 10:46:27 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 23 Sep 2025 08:46:21 -0700
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <pgaj@cadence.com>,
	<wsa+renesas@sang-engineering.com>, <tommaso.merciai.xr@bp.renesas.com>,
	<arnd@arndb.de>, <quic_msavaliy@quicinc.com>, <Shyam-sundar.S-k@amd.com>,
	<sakari.ailus@linux.intel.com>, <billy_tsai@aspeedtech.com>,
	<kees@kernel.org>, <gustavoars@kernel.org>, <jarkko.nikula@linux.intel.com>,
	<jorge.marques@analog.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-hardening@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
Date: Tue, 23 Sep 2025 21:15:49 +0530
Message-ID: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|IA4PR12MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcb56d4-bac8-4633-34d9-08ddfab86d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amFrOHlzT3hsYVAyVWhVR2s3V3Y1OThUSVRkRmovTmdCL25kc2lpT29ZSDls?=
 =?utf-8?B?dXcvU29lWUNDMVNjcEMzZGFJQ3VtdEF2SHRDdUFwOEg0aDF4K0Q1Rmo4V29K?=
 =?utf-8?B?bVVpQnFEWGx6TmNyWUVuaU5tbTBqZDAwMk1QS3FLcXExMTJQRXdZbkxFR205?=
 =?utf-8?B?WEErWi9UaGVMdEFXbzFhR0p2SGZ1NEp6VXliNkx4ekpnbEpaZ3hkeUZIZXVE?=
 =?utf-8?B?V3N0NmdHUXZReExWVEgyb2RFV1JaN0FjblZVQnBwQWhranFhNjFra0Y5QXFw?=
 =?utf-8?B?ajM4cm1IUnB1S0lFNzZtTUJwb2U0TDVSUjMrcWFzLytyQUplaFRYZDlDalhx?=
 =?utf-8?B?WEpNZ1orU0s0bDRIMmMxUlcyOTdsSnZCakZteEFDWmJZSlNsNEtsNy9WU3NV?=
 =?utf-8?B?bmdaMHY1Skc1OWdLRzZwemVpNmlYOFhkWElZQUV2T2hrWjN2TDFhWmc4Zmta?=
 =?utf-8?B?QStBVjVlaVB3N3RDQVlHUDhLcDI1VVgyTjhLM3doVHcxUU0rNUhhaVFYWFY3?=
 =?utf-8?B?ZmV3SUNtZHZVUjJ1My8zeTJPeDA5MUs5N0RSeldpemRON1hXVGRQcVZtSkl4?=
 =?utf-8?B?cTdFd3FiT2Uya1F4MTFXaVhxaERzTzZFTkQrVUxxTUIzS3djQ3NhRjVJQnFn?=
 =?utf-8?B?QW9VUmZUVHQrNXFlQkQyYW5Icjl2cEhmMGNsN0d2K2hNcVExd2pLUng4RjZM?=
 =?utf-8?B?SmF4RSs2YXhIdU54STgrOVFIMHROc1FPcmh3R2FZUzF3ZGx2UHRiSThYZDFy?=
 =?utf-8?B?TGRQc1ZFQzJGZDVwUitSdkJrR3hmVTdTT0lPTHQvcmpvYmR4cno0cGFtcTRQ?=
 =?utf-8?B?ZjIvamMzWW9iVzFHVmlvclhUd0NOVEF4RjM5clhqT0FrWERzdTZYQnk2VlFT?=
 =?utf-8?B?SXRoM2IvOGVrY0FaUmpIUGFaUE13c09NekRCcHdPN1FNWHBVNHFXK2Fha2s3?=
 =?utf-8?B?UFN3K0FuK1NOOHF0VkFtRkdDZlNIc0o5bW9EcXlyYzhSeVlVR2ozdnkrV0lx?=
 =?utf-8?B?aDhOMHZqTTlJb05tandBRWxVdDduRVBKbnJJeXFvcDlGcGljUnVROXZINjZw?=
 =?utf-8?B?cjQ4cGJWS1kzaWlvc29JaEt0aStLR2pwTTRnRW9zZjNWQ0NBcmkyRWhkQmF4?=
 =?utf-8?B?blFEYTdGMktYakdKa01ZVHZBa3Bsbmw0M3hnV2JBaG10cDFEQUQzMm84OVlm?=
 =?utf-8?B?RkF0K2ZkQWdzRi9XdDJMRnNwa3h4OHlVTGJabHd5ZUJXMVFWMXhKdm5JNndO?=
 =?utf-8?B?MzZ3QmNzdlRncVNINUhTczl2M3VielVCbnVpYzU2Z3RBRzU0RnpEM1JFNU5R?=
 =?utf-8?B?ZFk2OHNBMVo1ZkFaY0lXY2tZc0FxcmFvKzEyUEFxRUlrRkVDTC9ZSmdNZkx3?=
 =?utf-8?B?aERJRmRNZHhKTElVcjVzcS9NNHdRVXo1c2Y4SStHQkloOCtxbko4SVh2WmRo?=
 =?utf-8?B?ejgwRGQ4eXdOMnhxWHl6RlZJdnNvU0JvK2duSS9ZdGgvYWtOZm50RzVZZ3BI?=
 =?utf-8?B?VGZCVEtYRWpwcWZuVHpMdERURitBbndVQjdzMVNMcFNYQVNKM0c1TE1ERGlr?=
 =?utf-8?B?WXorV2dPdjFuWFk4eEtkQWV5YlJjclYvYkhCaC8weGxSK2JHL0Z6OTFnekVv?=
 =?utf-8?B?T011QnFOYjdHck5WZHpWbjB0YmIvZVNQbkcyaVk5Yjl1WjZFZUh2RkpUUlNx?=
 =?utf-8?B?MlBMakNrclJ1blA5WDBvRk16a0V0LzE2UTgyWExGbmtodEF6YzFJV0U3OFNz?=
 =?utf-8?B?d2duNVhiMng2UExYcHV2Q0U1bVZEVFNmVXNHMjRCYlZpcXFMdDFvTENHV0Nz?=
 =?utf-8?B?SUpWbnlkYVdGK00zSWF3cW41ai9KU3p3a2xCcWE0K1BNZ2UxUFgwSFgyaklB?=
 =?utf-8?B?UDFhVGQ1aThTRlR3RWNpdXdSWFJlUWszdTZvNHV6K1d0ZWovc096OXk3YjRK?=
 =?utf-8?B?UHdkWHBjZWJlSEFUZ3lZOU9vUmZOdklmZEp2UTlwVGhDeERJMHZERzAxQ1BT?=
 =?utf-8?B?L0JVaUo5NVVyc3gvVC9ua0g5YWpNaDBBOFFTSHNLMmI5YTdWVGZONkluOHUv?=
 =?utf-8?B?TmdqSXRabUNVWUpvQkpQcXdYV3JDZVV1blBjZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 15:46:57.5081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcb56d4-bac8-4633-34d9-08ddfab86d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_084715_730525_A640B806 
X-CRM114-Status: GOOD (  12.36  )
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

QWRkIE1NSU8gYWNjZXNzb3JzIHRvIHN1cHBvcnQgYmlnLWVuZGlhbiBtZW1vcnkgb3BlcmF0aW9u
cy4gVGhlc2UgaGVscGVycwppbmNsdWRlIHtyZWFkLCB3cml0ZX17dywgbCwgcX1fYmUoKSBhbmQg
e3JlYWQsIHdyaXRlfXN7dywgbCwgcX1fYmUoKSwKd2hpY2ggYWxsb3dzIHRvIGFjY2VzcyBiaWct
ZW5kaWFuIG1lbW9yeSByZWdpb25zIHdoaWxlIHJldHVybmluZwp0aGUgcmVzdWx0cyBpbiB0aGUg
Q1BV4oCZcyBuYXRpdmUgZW5kaWFubmVzcy4KClRoaXMgcHJvdmlkZXMgYSBjb25zaXN0ZW50IGlu
dGVyZmFjZSB0byBpbnRlcmFjdCB3aXRoIGhhcmR3YXJlIHVzaW5nCmJpZy1lbmRpYW4gcmVnaXN0
ZXIgbGF5b3V0cy4KClNpZ25lZC1vZmYtYnk6IE1hbmlrYW50YSBHdW50dXBhbGxpIDxtYW5pa2Fu
dGEuZ3VudHVwYWxsaUBhbWQuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSBWNzoKVGhpcyBwYXRjaCBp
bnRyb2R1Y2VkIGluIFY3LgotLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaCB8IDIwMiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaCBiL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvaW8uaAppbmRleCAxMWFiYWQ2Yzg3ZTEuLmQxOGE4Y2E2YzA2YyAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCisrKyBiL2luY2x1ZGUvYXNtLWdl
bmVyaWMvaW8uaApAQCAtMjk1LDYgKzI5NSw5NiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVx
KHU2NCB2YWx1ZSwgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKQogI2VuZGlmCiAjZW5kaWYg
LyogQ09ORklHXzY0QklUICovCiAKKy8qCisgKiB7cmVhZCx3cml0ZX17dyxsLHF9X2JlKCkgYWNj
ZXNzIGJpZyBlbmRpYW4gbWVtb3J5IGFuZCByZXR1cm4gcmVzdWx0CisgKiBpbiBuYXRpdmUgZW5k
aWFubmVzcy4KKyAqLworCisjaWZuZGVmIHJlYWR3X2JlCisjZGVmaW5lIHJlYWR3X2JlIHJlYWR3
X2JlCitzdGF0aWMgaW5saW5lIHUxNiByZWFkd19iZShjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9t
ZW0gKmFkZHIpCit7CisJdTE2IHZhbDsKKworCWxvZ19yZWFkX21taW8oMTYsIGFkZHIsIF9USElT
X0lQXywgX1JFVF9JUF8pOworCV9faW9fYnIoKTsKKwl2YWwgPSBfX2JlMTZfdG9fY3B1KChfX2Jl
MTYgX19mb3JjZSlfX3Jhd19yZWFkdyhhZGRyKSk7CisJX19pb19hcih2YWwpOworCWxvZ19wb3N0
X3JlYWRfbW1pbyh2YWwsIDE2LCBhZGRyLCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKKwlyZXR1cm4g
dmFsOworfQorI2VuZGlmCisKKyNpZm5kZWYgcmVhZGxfYmUKKyNkZWZpbmUgcmVhZGxfYmUgcmVh
ZGxfYmUKK3N0YXRpYyBpbmxpbmUgdTMyIHJlYWRsX2JlKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19p
b21lbSAqYWRkcikKK3sKKwl1MzIgdmFsOworCisJbG9nX3JlYWRfbW1pbygzMiwgYWRkciwgX1RI
SVNfSVBfLCBfUkVUX0lQXyk7CisJX19pb19icigpOworCXZhbCA9IF9fYmUzMl90b19jcHUoKF9f
YmUzMiBfX2ZvcmNlKV9fcmF3X3JlYWRsKGFkZHIpKTsKKwlfX2lvX2FyKHZhbCk7CisJbG9nX3Bv
c3RfcmVhZF9tbWlvKHZhbCwgMzIsIGFkZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOworCXJldHVy
biB2YWw7Cit9CisjZW5kaWYKKworI2lmZGVmIENPTkZJR182NEJJVAorI2lmbmRlZiByZWFkcV9i
ZQorI2RlZmluZSByZWFkcV9iZSByZWFkcV9iZQorc3RhdGljIGlubGluZSB1NjQgcmVhZHFfYmUo
Y29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKQoreworCXU2NCB2YWw7CisKKwlsb2df
cmVhZF9tbWlvKDY0LCBhZGRyLCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKKwlfX2lvX2JyKCk7CisJ
dmFsID0gX19iZTY0X3RvX2NwdSgoX19iZTY0IF9fZm9yY2UpX19yYXdfcmVhZHEoYWRkcikpOwor
CV9faW9fYXIodmFsKTsKKwlsb2dfcG9zdF9yZWFkX21taW8odmFsLCA2NCwgYWRkciwgX1RISVNf
SVBfLCBfUkVUX0lQXyk7CisJcmV0dXJuIHZhbDsKK30KKyNlbmRpZgorI2VuZGlmIC8qIENPTkZJ
R182NEJJVCAqLworCisjaWZuZGVmIHdyaXRld19iZQorI2RlZmluZSB3cml0ZXdfYmUgd3JpdGV3
X2JlCitzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGV3X2JlKHUxNiB2YWx1ZSwgdm9sYXRpbGUgdm9p
ZCBfX2lvbWVtICphZGRyKQoreworCWxvZ193cml0ZV9tbWlvKHZhbHVlLCAxNiwgYWRkciwgX1RI
SVNfSVBfLCBfUkVUX0lQXyk7CisJX19pb19idygpOworCV9fcmF3X3dyaXRldygodTE2IF9fZm9y
Y2UpX19jcHVfdG9fYmUxNih2YWx1ZSksIGFkZHIpOworCV9faW9fYXcoKTsKKwlsb2dfcG9zdF93
cml0ZV9tbWlvKHZhbHVlLCAxNiwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7Cit9CisjZW5k
aWYKKworI2lmbmRlZiB3cml0ZWxfYmUKKyNkZWZpbmUgd3JpdGVsX2JlIHdyaXRlbF9iZQorc3Rh
dGljIGlubGluZSB2b2lkIHdyaXRlbF9iZSh1MzIgdmFsdWUsIHZvbGF0aWxlIHZvaWQgX19pb21l
bSAqYWRkcikKK3sKKwlsb2dfd3JpdGVfbW1pbyh2YWx1ZSwgMzIsIGFkZHIsIF9USElTX0lQXywg
X1JFVF9JUF8pOworCV9faW9fYncoKTsKKwlfX3Jhd193cml0ZWwoKHUzMiBfX2ZvcmNlKV9fY3B1
X3RvX2JlMzIodmFsdWUpLCBhZGRyKTsKKwlfX2lvX2F3KCk7CisJbG9nX3Bvc3Rfd3JpdGVfbW1p
byh2YWx1ZSwgMzIsIGFkZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOworfQorI2VuZGlmCisKKyNp
ZmRlZiBDT05GSUdfNjRCSVQKKyNpZm5kZWYgd3JpdGVxX2JlCisjZGVmaW5lIHdyaXRlcV9iZSB3
cml0ZXFfYmUKK3N0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZXFfYmUodTY0IHZhbHVlLCB2b2xhdGls
ZSB2b2lkIF9faW9tZW0gKmFkZHIpCit7CisJbG9nX3dyaXRlX21taW8odmFsdWUsIDY0LCBhZGRy
LCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKKwlfX2lvX2J3KCk7CisJX19yYXdfd3JpdGVxKCh1NjQg
X19mb3JjZSlfX2NwdV90b19iZTY0KHZhbHVlKSwgYWRkcik7CisJX19pb19hdygpOworCWxvZ19w
b3N0X3dyaXRlX21taW8odmFsdWUsIDY0LCBhZGRyLCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKK30K
KyNlbmRpZgorI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLworCiAvKgogICoge3JlYWQsd3JpdGV9
e2IsdyxsLHF9X3JlbGF4ZWQoKSBhcmUgbGlrZSB0aGUgcmVndWxhciB2ZXJzaW9uLCBidXQKICAq
IGFyZSBub3QgZ3VhcmFudGVlZCB0byBwcm92aWRlIG9yZGVyaW5nIGFnYWluc3Qgc3BpbmxvY2tz
IG9yIG1lbW9yeQpAQCAtNTI0LDYgKzYxNCwxMTggQEAgc3RhdGljIGlubGluZSB2b2lkIHdyaXRl
c3Eodm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyLCBjb25zdCB2b2lkICpidWZmZXIsCiAjZW5k
aWYKICNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KIAorLyoKKyAqIHtyZWFkLHdyaXRlfXN7dyxs
LHF9X2JlKCkgcmVwZWF0ZWRseSBhY2Nlc3MgdGhlIHNhbWUgbWVtb3J5IGFkZHJlc3MKKyAqIGlu
IGJpZyBlbmRpYW5uZXNzIGluIDE2LSwgMzItIG9yIDY0LWJpdCBjaHVua3MgKEBjb3VudCB0aW1l
cykgYW5kCisgKiByZXR1cm4gcmVzdWx0IGluIG5hdGl2ZSBlbmRpYW5uZXNzLgorICovCisKKyNp
Zm5kZWYgcmVhZHN3X2JlCisjZGVmaW5lIHJlYWRzd19iZSByZWFkc3dfYmUKK3N0YXRpYyBpbmxp
bmUgdm9pZCByZWFkc3dfYmUoY29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyLAorCQkJ
ICAgICB2b2lkICpidWZmZXIsCisJCQkgICAgIHVuc2lnbmVkIGludCBjb3VudCkKK3sKKwlpZiAo
Y291bnQpIHsKKwkJdTE2ICpidWYgPSBidWZmZXI7CisKKwkJZG8geworCQkJdTE2IHggPSBfX2Jl
MTZfdG9fY3B1KChfX2JlMTYgX19mb3JjZSlfX3Jhd19yZWFkdyhhZGRyKSk7CisJCQkqYnVmKysg
PSB4OworCQl9IHdoaWxlICgtLWNvdW50KTsKKwl9Cit9CisjZW5kaWYKKworI2lmbmRlZiByZWFk
c2xfYmUKKyNkZWZpbmUgcmVhZHNsX2JlIHJlYWRzbF9iZQorc3RhdGljIGlubGluZSB2b2lkIHJl
YWRzbF9iZShjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsCisJCQkgICAgIHZvaWQg
KmJ1ZmZlciwKKwkJCSAgICAgdW5zaWduZWQgaW50IGNvdW50KQoreworCWlmIChjb3VudCkgewor
CQl1MzIgKmJ1ZiA9IGJ1ZmZlcjsKKworCQlkbyB7CisJCQl1MzIgeCA9IF9fYmUzMl90b19jcHUo
KF9fYmUzMiBfX2ZvcmNlKV9fcmF3X3JlYWRsKGFkZHIpKTsKKwkJCSpidWYrKyA9IHg7CisJCX0g
d2hpbGUgKC0tY291bnQpOworCX0KK30KKyNlbmRpZgorCisjaWZkZWYgQ09ORklHXzY0QklUCisj
aWZuZGVmIHJlYWRzcV9iZQorI2RlZmluZSByZWFkc3FfYmUgcmVhZHNxX2JlCitzdGF0aWMgaW5s
aW5lIHZvaWQgcmVhZHNxX2JlKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkciwKKwkJ
CSAgICAgdm9pZCAqYnVmZmVyLAorCQkJICAgICB1bnNpZ25lZCBpbnQgY291bnQpCit7CisJaWYg
KGNvdW50KSB7CisJCXU2NCAqYnVmID0gYnVmZmVyOworCisJCWRvIHsKKwkJCXU2NCB4ID0gX19i
ZTY0X3RvX2NwdSgoX19iZTY0IF9fZm9yY2UpX19yYXdfcmVhZHEoYWRkcikpOworCQkJKmJ1Zisr
ID0geDsKKwkJfSB3aGlsZSAoLS1jb3VudCk7CisJfQorfQorI2VuZGlmCisjZW5kaWYgLyogQ09O
RklHXzY0QklUICovCisKKyNpZm5kZWYgd3JpdGVzd19iZQorI2RlZmluZSB3cml0ZXN3X2JlIHdy
aXRlc3dfYmUKK3N0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZXN3X2JlKHZvbGF0aWxlIHZvaWQgX19p
b21lbSAqYWRkciwKKwkJCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZmZlciwKKwkJCSAgICAgIHVuc2ln
bmVkIGludCBjb3VudCkKK3sKKwlpZiAoY291bnQpIHsKKwkJY29uc3QgdTE2ICpidWYgPSBidWZm
ZXI7CisKKwkJZG8geworCQkJX19yYXdfd3JpdGV3KCh1MTYgX19mb3JjZSlfX2NwdV90b19iZTE2
KCpidWYpLCBhZGRyKTsKKwkJCWJ1ZisrOworCQl9IHdoaWxlICgtLWNvdW50KTsKKwl9Cit9Cisj
ZW5kaWYKKworI2lmbmRlZiB3cml0ZXNsX2JlCisjZGVmaW5lIHdyaXRlc2xfYmUgd3JpdGVzbF9i
ZQorc3RhdGljIGlubGluZSB2b2lkIHdyaXRlc2xfYmUodm9sYXRpbGUgdm9pZCBfX2lvbWVtICph
ZGRyLAorCQkJICAgICAgY29uc3Qgdm9pZCAqYnVmZmVyLAorCQkJICAgICAgdW5zaWduZWQgaW50
IGNvdW50KQoreworCWlmIChjb3VudCkgeworCQljb25zdCB1MzIgKmJ1ZiA9IGJ1ZmZlcjsKKwor
CQlkbyB7CisJCQlfX3Jhd193cml0ZWwoKHUzMiBfX2ZvcmNlKV9fY3B1X3RvX2JlMzIoKmJ1Ziks
IGFkZHIpOworCQkJYnVmKys7CisJCX0gd2hpbGUgKC0tY291bnQpOworCX0KK30KKyNlbmRpZgor
CisjaWZkZWYgQ09ORklHXzY0QklUCisjaWZuZGVmIHdyaXRlc3FfYmUKKyNkZWZpbmUgd3JpdGVz
cV9iZSB3cml0ZXNxX2JlCitzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVzcV9iZSh2b2xhdGlsZSB2
b2lkIF9faW9tZW0gKmFkZHIsCisJCQkgICAgICBjb25zdCB2b2lkICpidWZmZXIsCisJCQkgICAg
ICB1bnNpZ25lZCBpbnQgY291bnQpCit7CisJaWYgKGNvdW50KSB7CisJCWNvbnN0IHU2NCAqYnVm
ID0gYnVmZmVyOworCisJCWRvIHsKKwkJCV9fcmF3X3dyaXRlcSgodTY0IF9fZm9yY2UpX19jcHVf
dG9fYmU2NCgqYnVmKSwgYWRkcik7CisJCQlidWYrKzsKKwkJfSB3aGlsZSAoLS1jb3VudCk7CisJ
fQorfQorI2VuZGlmCisjZW5kaWYgLyogQ09ORklHXzY0QklUICovCisKICNpZm5kZWYgUENJX0lP
QkFTRQogI2RlZmluZSBQQ0lfSU9CQVNFICgodm9pZCBfX2lvbWVtICopMCkKICNlbmRpZgotLSAK
Mi4zNC4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1pM2MK
