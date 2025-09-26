Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD341CAC5B9
	for <linux-i3c@archiver.kernel.org>; Fri, 26 Sep 2025 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4rDdfWm0mgRQoHV58tYEdIXCHwNTmtWQ42yTDnNd6w=; b=nf1lD59Uu12Gy7
	qsq7lGwmDwjpHYgIerEKVvpr4XUxM1hCGxVRLHQoTnBc2nx/KVsJ3tRAFzjSl+KCKjXuhq3QOSAFj
	ff93x68lTTq9Dfek/xMbLYrnANlgAeK7oaxAM5hgckRK3M84dFGmw4Qp3IK1PgmQR64VTbc8N7F45
	VQIeBoKozgRef60H3MyK+zf2+FP+SWFRQjSNVxs25+paOHg3r0zkW8Zgzfvg3eogdbcPCM+znCMLU
	2jfV4zNjkv4ss74EKdjoQbit2fY0i9xYuDtZNyCXvMf93ed0aQc++Qb1HcxzbPhk9uJTnEC2FMSxp
	YdQyrYvfyJzzcrDjHHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2662-00000000ZWF-1aWO;
	Fri, 26 Sep 2025 10:54:38 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v265z-00000000ZTQ-0wJK
	for linux-i3c@lists.infradead.org;
	Fri, 26 Sep 2025 10:54:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtuzHUHggKE38dd4hCrVJH98U8o46GezL85H1LHoYOQZM/BElpTPg50zwFQ07DD2CIgvpidQGH6ni3RIICsAvih3qbwQzgc7phnKtivox51PjKdBczb7pTtD+y3wiShwgJ55EFMFfMJLjiJ//mBY3kZ9tTlns46JSB6jQw1ZAt8zwqlTDfmOXFKA52q0JB9BMg0ke4a/rI6NwsqhoXem6aVWYIidXafqDu+mZuHcabmhtxPosAfXZRCb7ks5EGOWS7kShw85ZrrbJ1Bw4bSPTuRMlN8zJ5J7d7KP6DjOGQ349XOL0yNDlSJX/acivMeseN63s5U3sBfELGtkQUKIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3hBq9Fzr7MFqIOU0wU2Fuhlzau0yLKsxJp0QqKOawU=;
 b=fNPcb+rQpoQjlKb1xOaNTtg6ZqCqyXq+UMoNtZrUYNRzNuSqVu5q6ZjgE6bV3XVGUgQJlV7EcOobj5kgD5TAG4v2kLf1cF8pejax1jAPzu6jGfb67n0VAxKWJhNE8XZKj7TQf2ceE5emlBM9HCGkvB+gKtdyU+GR/XgBP10XrANWhwb00RaaH5M5744ePZYAwVrAEC803au6zlPrHV4OGOHfzXDm5t0MaL6CmU29/ib8RalMJineBmjk05etHR15YGsRikqPRdf8H84MtbqEX1TnCiH5wfBwW/QDCUlyzXodxs6woRvizDfrTG0xpXGwurwX0hBUmZTWLLYOGRuSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3hBq9Fzr7MFqIOU0wU2Fuhlzau0yLKsxJp0QqKOawU=;
 b=DNde8Hmz95ugLSKC5r2AfQJP3J2raZ2tZo8PXaKmn9lvpdZykDhDC5e2HVsguxr5BF3DaVZa7Rbr8Yz9/r4ajjONtkrOzuxPhxPt51Sd/6AbuWcME1a6rSwKdyh50e/CUyHOR8+EGEUarbDyBVSAhE7Rczv68iK/3QhtBbvv3S0=
Received: from BL1PR13CA0062.namprd13.prod.outlook.com (2603:10b6:208:2b8::7)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 10:54:19 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::e0) by BL1PR13CA0062.outlook.office365.com
 (2603:10b6:208:2b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.4 via Frontend Transport; Fri,
 26 Sep 2025 10:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 10:54:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 26 Sep
 2025 03:54:18 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 26 Sep
 2025 05:54:17 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 26 Sep 2025 03:54:10 -0700
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
Subject: [PATCH V8 2/5] asm-generic/io.h: Add big-endian MMIO accessors
Date: Fri, 26 Sep 2025 16:23:46 +0530
Message-ID: <20250926105349.2932952-3-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
References: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf62e7f-5023-40f9-c62c-08ddfceb0af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmNIdXFqNGxxWS9McVdWck5yN0FUaTY4cVFSRlZ6ekV6M0JrY3VXL2FUMWkr?=
 =?utf-8?B?Vmw1ek1oS005NXpYNEFTZ2FhSExFNnkrQnVPRVVSY0dwNEVETVp6ZlVMeUpM?=
 =?utf-8?B?bS8vL0JWTTZ1dXBpdkU1RitqRmNQaW1EeU9Cdmg5L2JNaGEvb2RxVENMUnNN?=
 =?utf-8?B?bkV1MTMxY1dBc2NZK1Z0eldBaHVoek4xaEtXUlRxeGR0MWZKM3V2dHN5UC9L?=
 =?utf-8?B?ZjE1QUh0YU9ldEZtSUJPby9kN0JNMlQzZFlVaXhTWW1qL2hkN2NSOThGY1I1?=
 =?utf-8?B?QTNoMklVQW9ScytWMXh0QkVkc001a29ZbzRxZmY5ek9iY3Z6VUVTUkUvaUl4?=
 =?utf-8?B?YkV6TEE1TXFkOWtkU0JZMGpSRnpocXFHcXpoZDRKQ1hLc25HeVNHWG9Yb09V?=
 =?utf-8?B?a1NvRHorY2JmdjU2RDJycWF4WTduVHRTSzU0aTNTZEJEMldxT0M1akd2b0M3?=
 =?utf-8?B?WUFwNWhmcW5UWFAyVEwrL3FTUHpQNmpLQ0xqZFM5WlNUbGQ5SnZmcjRyT3Fx?=
 =?utf-8?B?Tlcwa1V4bThvL2JEc2w1YThDczBMbjQ1T3l3dlZySUFMbXREcEZsLytvR0ky?=
 =?utf-8?B?N0NrN3oxd3ZZeFpWZHhJMzF1YWczS2ZuRHlXcjUvUjFKY001b0RkWVA1TC9T?=
 =?utf-8?B?WmUyMSs2QkNITFJ5dVhINDArT3Y3c0MrZm50M3dLZGVZQ2JtU0hLcFNoekMr?=
 =?utf-8?B?VTRJY3BZRGJIZmhIbTUySTUyZTA4MXFtdGkyMnVVQWVoRXpQWVI4OUVjRU45?=
 =?utf-8?B?bHpBNXJSRFBaYklyUEtPYUJtaTJLanhmUHNudDRETHVIY2xVL0hvSmR2Uktl?=
 =?utf-8?B?Q25nSmE0YThPclBTVHRHcjVkOURoRGVrSE5wdWlGb3BNUVdDNUt3SWRpME9k?=
 =?utf-8?B?bUdsOE1aMWw5aFN4NHVTQ2Q3cEhZZ3FKZHRYdEUxODhhOGRKWWk2SzZZSmww?=
 =?utf-8?B?bDRqbHc4ZXc5ank0S3hQb1ZsdXQ1aGtLYTlhUU5VWGhhVXRENDFXSFVsSCs3?=
 =?utf-8?B?OU0yRmhURTZNRTRqL2t6Ujc1SDV3Y1cxY0lab0pFOW1CNlhCYjV5YVZMNDFu?=
 =?utf-8?B?SFBsYm9BL2g2YnBGZTVORHVsTS9JbFRkR2NvUTFmeVZSUUh3OFBWZWpRWkx4?=
 =?utf-8?B?MldJY0tja1BwZTVlN1V1elF5cEpUSk10V2hRTFN5K3NLWkhlMFBrSkp5bUZZ?=
 =?utf-8?B?azRCckoxc01sNlhLWTVkTjdGTFlkSVFpbjlBbVBFR21vRTU0TUVtVllMdDRk?=
 =?utf-8?B?REVRYngvaTdKb0dpakRKN1FTMnhWeHRWVEtaQlk2UkRjUFZyWXpkREExQWsx?=
 =?utf-8?B?WmJjdFQvRmQ0dDNTWnNycXZXaEplZTltcTFDUy81dzQyamVnYlRKZFRWQWRo?=
 =?utf-8?B?eWxrU3lxK05PMStpeGx6d1U5dlZLWitmQ2xnU1V1Kzl6L2VXY2xsY2JBS09x?=
 =?utf-8?B?aVNuR2xVeEt1YzdzTXUwVUs3WWRxRjd0YzBuTkdCb0gxekFNRjRrS2p1bU5p?=
 =?utf-8?B?dXBhRHNpU1lhdlViNmRocUtRUVJvQXdyZC8yQTFQNlRqMTdGa0dFM3ZTNEdV?=
 =?utf-8?B?am1hSGFtbndqaWNYcTNQaFJBazNoQVNDSldtdGphVDNnc3piYlMyeW5mWWtW?=
 =?utf-8?B?QWpNWXFITEQxVkg4TXRjMG5rbGErTHk5TTlhWkNZYUUvMHhONGN0Zlk3N1U0?=
 =?utf-8?B?MTdDSXN3aEY2Y2ZVMSt4ZjNPQksyWWx5Qk5Ta2dVcDFUdzhITUlmeCtmbUNp?=
 =?utf-8?B?MEVNck1ZL2ZvM24rdVJlL2NRUzh3eis2SGh4blJValRoRXgwaWlHbzZiUHhH?=
 =?utf-8?B?QW9PN1pMeXFXZFdDNzVsZXk1eDdQNk1xVlJISjlwdTlUV0tkdExJakdRRFhY?=
 =?utf-8?B?NnBJcUIzZklxNElvOEo1MitLdmNYN1RweXNoSE1Zd2dPZVdtbTBUQnBPMFhv?=
 =?utf-8?B?TE1IZE84Q2FnZ25PT0hidXhxNDY4disyc3JMa2E1dExwNEtVVHpvSFZOZEVo?=
 =?utf-8?B?Z2ZITDFRWWN6QW4wWWVYM0NRbld2ZkZCcEt2dVZjb05hUFJNd2xtL0NNTkJp?=
 =?utf-8?B?U1JXVG1nNHZ6cjlkWWtiVXlIRkJyaEtCUVlMZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:54:18.7445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf62e7f-5023-40f9-c62c-08ddfceb0af5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_035435_337330_EB8A7308 
X-CRM114-Status: GOOD (  12.09  )
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
dGEuZ3VudHVwYWxsaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIFY3OgpUaGlzIHBhdGNoIGludHJvZHVjZWQgaW4gVjcu
CgpDaGFuZ2VzIGZvciBWODoKTm9uZS4KLS0tCiBpbmNsdWRlL2FzbS1nZW5lcmljL2lvLmggfCAy
MDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2lv
LmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKaW5kZXggMTFhYmFkNmM4N2UxLi5kMThhOGNh
NmMwNmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaAorKysgYi9pbmNsdWRl
L2FzbS1nZW5lcmljL2lvLmgKQEAgLTI5NSw2ICsyOTUsOTYgQEAgc3RhdGljIGlubGluZSB2b2lk
IHdyaXRlcSh1NjQgdmFsdWUsIHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcikKICNlbmRpZgog
I2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwogCisvKgorICoge3JlYWQsd3JpdGV9e3csbCxxfV9i
ZSgpIGFjY2VzcyBiaWcgZW5kaWFuIG1lbW9yeSBhbmQgcmV0dXJuIHJlc3VsdAorICogaW4gbmF0
aXZlIGVuZGlhbm5lc3MuCisgKi8KKworI2lmbmRlZiByZWFkd19iZQorI2RlZmluZSByZWFkd19i
ZSByZWFkd19iZQorc3RhdGljIGlubGluZSB1MTYgcmVhZHdfYmUoY29uc3Qgdm9sYXRpbGUgdm9p
ZCBfX2lvbWVtICphZGRyKQoreworCXUxNiB2YWw7CisKKwlsb2dfcmVhZF9tbWlvKDE2LCBhZGRy
LCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKKwlfX2lvX2JyKCk7CisJdmFsID0gX19iZTE2X3RvX2Nw
dSgoX19iZTE2IF9fZm9yY2UpX19yYXdfcmVhZHcoYWRkcikpOworCV9faW9fYXIodmFsKTsKKwls
b2dfcG9zdF9yZWFkX21taW8odmFsLCAxNiwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7CisJ
cmV0dXJuIHZhbDsKK30KKyNlbmRpZgorCisjaWZuZGVmIHJlYWRsX2JlCisjZGVmaW5lIHJlYWRs
X2JlIHJlYWRsX2JlCitzdGF0aWMgaW5saW5lIHUzMiByZWFkbF9iZShjb25zdCB2b2xhdGlsZSB2
b2lkIF9faW9tZW0gKmFkZHIpCit7CisJdTMyIHZhbDsKKworCWxvZ19yZWFkX21taW8oMzIsIGFk
ZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOworCV9faW9fYnIoKTsKKwl2YWwgPSBfX2JlMzJfdG9f
Y3B1KChfX2JlMzIgX19mb3JjZSlfX3Jhd19yZWFkbChhZGRyKSk7CisJX19pb19hcih2YWwpOwor
CWxvZ19wb3N0X3JlYWRfbW1pbyh2YWwsIDMyLCBhZGRyLCBfVEhJU19JUF8sIF9SRVRfSVBfKTsK
KwlyZXR1cm4gdmFsOworfQorI2VuZGlmCisKKyNpZmRlZiBDT05GSUdfNjRCSVQKKyNpZm5kZWYg
cmVhZHFfYmUKKyNkZWZpbmUgcmVhZHFfYmUgcmVhZHFfYmUKK3N0YXRpYyBpbmxpbmUgdTY0IHJl
YWRxX2JlKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcikKK3sKKwl1NjQgdmFsOwor
CisJbG9nX3JlYWRfbW1pbyg2NCwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7CisJX19pb19i
cigpOworCXZhbCA9IF9fYmU2NF90b19jcHUoKF9fYmU2NCBfX2ZvcmNlKV9fcmF3X3JlYWRxKGFk
ZHIpKTsKKwlfX2lvX2FyKHZhbCk7CisJbG9nX3Bvc3RfcmVhZF9tbWlvKHZhbCwgNjQsIGFkZHIs
IF9USElTX0lQXywgX1JFVF9JUF8pOworCXJldHVybiB2YWw7Cit9CisjZW5kaWYKKyNlbmRpZiAv
KiBDT05GSUdfNjRCSVQgKi8KKworI2lmbmRlZiB3cml0ZXdfYmUKKyNkZWZpbmUgd3JpdGV3X2Jl
IHdyaXRld19iZQorc3RhdGljIGlubGluZSB2b2lkIHdyaXRld19iZSh1MTYgdmFsdWUsIHZvbGF0
aWxlIHZvaWQgX19pb21lbSAqYWRkcikKK3sKKwlsb2dfd3JpdGVfbW1pbyh2YWx1ZSwgMTYsIGFk
ZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOworCV9faW9fYncoKTsKKwlfX3Jhd193cml0ZXcoKHUx
NiBfX2ZvcmNlKV9fY3B1X3RvX2JlMTYodmFsdWUpLCBhZGRyKTsKKwlfX2lvX2F3KCk7CisJbG9n
X3Bvc3Rfd3JpdGVfbW1pbyh2YWx1ZSwgMTYsIGFkZHIsIF9USElTX0lQXywgX1JFVF9JUF8pOwor
fQorI2VuZGlmCisKKyNpZm5kZWYgd3JpdGVsX2JlCisjZGVmaW5lIHdyaXRlbF9iZSB3cml0ZWxf
YmUKK3N0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZWxfYmUodTMyIHZhbHVlLCB2b2xhdGlsZSB2b2lk
IF9faW9tZW0gKmFkZHIpCit7CisJbG9nX3dyaXRlX21taW8odmFsdWUsIDMyLCBhZGRyLCBfVEhJ
U19JUF8sIF9SRVRfSVBfKTsKKwlfX2lvX2J3KCk7CisJX19yYXdfd3JpdGVsKCh1MzIgX19mb3Jj
ZSlfX2NwdV90b19iZTMyKHZhbHVlKSwgYWRkcik7CisJX19pb19hdygpOworCWxvZ19wb3N0X3dy
aXRlX21taW8odmFsdWUsIDMyLCBhZGRyLCBfVEhJU19JUF8sIF9SRVRfSVBfKTsKK30KKyNlbmRp
ZgorCisjaWZkZWYgQ09ORklHXzY0QklUCisjaWZuZGVmIHdyaXRlcV9iZQorI2RlZmluZSB3cml0
ZXFfYmUgd3JpdGVxX2JlCitzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVxX2JlKHU2NCB2YWx1ZSwg
dm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKQoreworCWxvZ193cml0ZV9tbWlvKHZhbHVlLCA2
NCwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQXyk7CisJX19pb19idygpOworCV9fcmF3X3dyaXRl
cSgodTY0IF9fZm9yY2UpX19jcHVfdG9fYmU2NCh2YWx1ZSksIGFkZHIpOworCV9faW9fYXcoKTsK
Kwlsb2dfcG9zdF93cml0ZV9tbWlvKHZhbHVlLCA2NCwgYWRkciwgX1RISVNfSVBfLCBfUkVUX0lQ
Xyk7Cit9CisjZW5kaWYKKyNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KKwogLyoKICAqIHtyZWFk
LHdyaXRlfXtiLHcsbCxxfV9yZWxheGVkKCkgYXJlIGxpa2UgdGhlIHJlZ3VsYXIgdmVyc2lvbiwg
YnV0CiAgKiBhcmUgbm90IGd1YXJhbnRlZWQgdG8gcHJvdmlkZSBvcmRlcmluZyBhZ2FpbnN0IHNw
aW5sb2NrcyBvciBtZW1vcnkKQEAgLTUyNCw2ICs2MTQsMTE4IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB3cml0ZXNxKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkciwgY29uc3Qgdm9pZCAqYnVmZmVy
LAogI2VuZGlmCiAjZW5kaWYgLyogQ09ORklHXzY0QklUICovCiAKKy8qCisgKiB7cmVhZCx3cml0
ZX1ze3csbCxxfV9iZSgpIHJlcGVhdGVkbHkgYWNjZXNzIHRoZSBzYW1lIG1lbW9yeSBhZGRyZXNz
CisgKiBpbiBiaWcgZW5kaWFubmVzcyBpbiAxNi0sIDMyLSBvciA2NC1iaXQgY2h1bmtzIChAY291
bnQgdGltZXMpIGFuZAorICogcmV0dXJuIHJlc3VsdCBpbiBuYXRpdmUgZW5kaWFubmVzcy4KKyAq
LworCisjaWZuZGVmIHJlYWRzd19iZQorI2RlZmluZSByZWFkc3dfYmUgcmVhZHN3X2JlCitzdGF0
aWMgaW5saW5lIHZvaWQgcmVhZHN3X2JlKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRk
ciwKKwkJCSAgICAgdm9pZCAqYnVmZmVyLAorCQkJICAgICB1bnNpZ25lZCBpbnQgY291bnQpCit7
CisJaWYgKGNvdW50KSB7CisJCXUxNiAqYnVmID0gYnVmZmVyOworCisJCWRvIHsKKwkJCXUxNiB4
ID0gX19iZTE2X3RvX2NwdSgoX19iZTE2IF9fZm9yY2UpX19yYXdfcmVhZHcoYWRkcikpOworCQkJ
KmJ1ZisrID0geDsKKwkJfSB3aGlsZSAoLS1jb3VudCk7CisJfQorfQorI2VuZGlmCisKKyNpZm5k
ZWYgcmVhZHNsX2JlCisjZGVmaW5lIHJlYWRzbF9iZSByZWFkc2xfYmUKK3N0YXRpYyBpbmxpbmUg
dm9pZCByZWFkc2xfYmUoY29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyLAorCQkJICAg
ICB2b2lkICpidWZmZXIsCisJCQkgICAgIHVuc2lnbmVkIGludCBjb3VudCkKK3sKKwlpZiAoY291
bnQpIHsKKwkJdTMyICpidWYgPSBidWZmZXI7CisKKwkJZG8geworCQkJdTMyIHggPSBfX2JlMzJf
dG9fY3B1KChfX2JlMzIgX19mb3JjZSlfX3Jhd19yZWFkbChhZGRyKSk7CisJCQkqYnVmKysgPSB4
OworCQl9IHdoaWxlICgtLWNvdW50KTsKKwl9Cit9CisjZW5kaWYKKworI2lmZGVmIENPTkZJR182
NEJJVAorI2lmbmRlZiByZWFkc3FfYmUKKyNkZWZpbmUgcmVhZHNxX2JlIHJlYWRzcV9iZQorc3Rh
dGljIGlubGluZSB2b2lkIHJlYWRzcV9iZShjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFk
ZHIsCisJCQkgICAgIHZvaWQgKmJ1ZmZlciwKKwkJCSAgICAgdW5zaWduZWQgaW50IGNvdW50KQor
eworCWlmIChjb3VudCkgeworCQl1NjQgKmJ1ZiA9IGJ1ZmZlcjsKKworCQlkbyB7CisJCQl1NjQg
eCA9IF9fYmU2NF90b19jcHUoKF9fYmU2NCBfX2ZvcmNlKV9fcmF3X3JlYWRxKGFkZHIpKTsKKwkJ
CSpidWYrKyA9IHg7CisJCX0gd2hpbGUgKC0tY291bnQpOworCX0KK30KKyNlbmRpZgorI2VuZGlm
IC8qIENPTkZJR182NEJJVCAqLworCisjaWZuZGVmIHdyaXRlc3dfYmUKKyNkZWZpbmUgd3JpdGVz
d19iZSB3cml0ZXN3X2JlCitzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVzd19iZSh2b2xhdGlsZSB2
b2lkIF9faW9tZW0gKmFkZHIsCisJCQkgICAgICBjb25zdCB2b2lkICpidWZmZXIsCisJCQkgICAg
ICB1bnNpZ25lZCBpbnQgY291bnQpCit7CisJaWYgKGNvdW50KSB7CisJCWNvbnN0IHUxNiAqYnVm
ID0gYnVmZmVyOworCisJCWRvIHsKKwkJCV9fcmF3X3dyaXRldygodTE2IF9fZm9yY2UpX19jcHVf
dG9fYmUxNigqYnVmKSwgYWRkcik7CisJCQlidWYrKzsKKwkJfSB3aGlsZSAoLS1jb3VudCk7CisJ
fQorfQorI2VuZGlmCisKKyNpZm5kZWYgd3JpdGVzbF9iZQorI2RlZmluZSB3cml0ZXNsX2JlIHdy
aXRlc2xfYmUKK3N0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZXNsX2JlKHZvbGF0aWxlIHZvaWQgX19p
b21lbSAqYWRkciwKKwkJCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZmZlciwKKwkJCSAgICAgIHVuc2ln
bmVkIGludCBjb3VudCkKK3sKKwlpZiAoY291bnQpIHsKKwkJY29uc3QgdTMyICpidWYgPSBidWZm
ZXI7CisKKwkJZG8geworCQkJX19yYXdfd3JpdGVsKCh1MzIgX19mb3JjZSlfX2NwdV90b19iZTMy
KCpidWYpLCBhZGRyKTsKKwkJCWJ1ZisrOworCQl9IHdoaWxlICgtLWNvdW50KTsKKwl9Cit9Cisj
ZW5kaWYKKworI2lmZGVmIENPTkZJR182NEJJVAorI2lmbmRlZiB3cml0ZXNxX2JlCisjZGVmaW5l
IHdyaXRlc3FfYmUgd3JpdGVzcV9iZQorc3RhdGljIGlubGluZSB2b2lkIHdyaXRlc3FfYmUodm9s
YXRpbGUgdm9pZCBfX2lvbWVtICphZGRyLAorCQkJICAgICAgY29uc3Qgdm9pZCAqYnVmZmVyLAor
CQkJICAgICAgdW5zaWduZWQgaW50IGNvdW50KQoreworCWlmIChjb3VudCkgeworCQljb25zdCB1
NjQgKmJ1ZiA9IGJ1ZmZlcjsKKworCQlkbyB7CisJCQlfX3Jhd193cml0ZXEoKHU2NCBfX2ZvcmNl
KV9fY3B1X3RvX2JlNjQoKmJ1ZiksIGFkZHIpOworCQkJYnVmKys7CisJCX0gd2hpbGUgKC0tY291
bnQpOworCX0KK30KKyNlbmRpZgorI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLworCiAjaWZuZGVm
IFBDSV9JT0JBU0UKICNkZWZpbmUgUENJX0lPQkFTRSAoKHZvaWQgX19pb21lbSAqKTApCiAjZW5k
aWYKLS0gCjIuMzQuMQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
