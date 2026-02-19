Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EB8E9A053
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Feb 2026 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FnWyqLFRDmx8QU6rMDXmSHPYsBnIvBtut+y3J69JrmU=; b=Xuq+sY7fR4kIJ3
	VdWAH1Onnlf0F6j8ykU5gWIENUhLhAqoaJ9COt0KElMCBmbISOmLFEGtjm9msLHlCqtVIdz47zgZZ
	/fZQk1pIlUBAjcFCdaMqXmxh2vScTV8J8lYfA3xGJvAskOoSp/O0seAOAu9PsWdU1U8o/p9JB18D4
	5nvCWKQ5gxsQUIii+WXWsD0xS4Thq+JmwwOXUkiuUldHu0jDVMZPbwYeqE4X18aM02tfxLkXA54D2
	+lyZQIYQM3pQAyWNb4qjeWNGS+chkI/Yk5dbWVAlouOKKE8G3uof2y5Ly3ylx7Tn3oBdTspnfZGu3
	5S4M5G5bv9iLbRjMZ1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8VW-0000000Bkhk-48Ij;
	Thu, 19 Feb 2026 18:12:10 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8VU-0000000BkhL-10Zx
	for linux-i3c@lists.infradead.org;
	Thu, 19 Feb 2026 18:12:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2B1QXuFK4pqqLeuh8qbTblchyp5FcmG+GWqDl0RXAYO3ZcB8WZz2UXcnTbwp29IDIn8XSOb2l2Y3WDLA7hRJDs10HuN/GRuhAVhsIWv2WJSvDUJPB6AFqJkl+HGpyj9ha9XZXasejX1boAmDu+7yWEPTxMzyDP4vha5mG5r+l71awsSp84OUbxV44WEh1l9uboFOHHxrx7Dc2D2lMsddv9dnywprQ73WxKQxpKqR5nTXBiaPmpz5m4on2fF4QegpIK61YjSKU1Ag9nN7MV7L+3Dr4HS1i7XHR96FRmNr+In8DAYadjKszVNuvmuZx/bsKEgcQBwcruYL6FTEFnShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvGaZRq2ECBe9m2H52JEw7GUQC9GIIV1BAJSVEtj0xo=;
 b=vsYtl7FPRDe2fZkINzxqkB8qSPYC+gxtJ88qI1oO6n5GmIQyrsYVhvtl5VXdnGXnPpaFxbdamCN37X3w1RG2FLh0LT7JdPHxOcPCDlYuRg3eyagf45k2AycaTzraiiiMx8avxArZgCMTuTtiavyz22CJ8J6nGeIydLXwb59oXuN6Kl3Hd1ZZZLHLAl8FYaMeArwxEdSVmBy/6nn10Sg00ZS13xCoI22IOtrBQnF6j3RxNKM/2K9vetHRObvCVcr52id8NrvD9X19zSfvUYC40r3ivcv9GTSOkNttCwgPyHUa7rpqUUz73uw9GWnVTYT6+M9q2x5aD4jcJ0t00IrIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvGaZRq2ECBe9m2H52JEw7GUQC9GIIV1BAJSVEtj0xo=;
 b=Tifhxi7ft/pNEHJcwQ4Jff7XEPWhNS/CbtJ5PvkYRUyEZr74zjpQa+ktvf8cnIlkO2pSZ1EUhTDw9yD3uCAtKkMy/3Mrs73pSJRpsooDjddLhgxjdSJ6Gj2JV2UseaS0EAaDEOXECbnM+YkkNLhTeG6CgJiEk6XqIHETAKlDvnhizRdv2k+puJGA8h3i7Y7HPECtWFWwGf7zhlO/J7F+EVLLWtz2RPGBcFJusdoBbfO8MifyaOiMSBdqACAJydjN4gXE/Zu8QH6qP+qRPpx6gqspYrUlv6XkWLeJFcbAVIDmIDSUBWF2FlChrVH9vs+EhwNMCFWtcvB65+25eUi+2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by DBBP189MB1307.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Thu, 19 Feb
 2026 18:12:02 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:12:02 +0000
From: =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
Date: Thu, 19 Feb 2026 19:11:40 +0100
Subject: [PATCH v5] i3c: master: Add sysfs option to rescan bus via entdaa
Message-Id: <20260219-i3c_rescan-v5-1-42404db20d18@est.tech>
X-B4-Tracking: v=1; b=H4sIAFtSl2kC/3XQQWrDMBAF0KsEraswM5JlO6vco4QiyeNaXThBc
 kVK8N0rpVk4gS4/zPsf5iYSx8BJHHY3ETmHFM5zCc3bTvjJzp8sw1CyICADiEYG5T8iJ29nqXv
 CAZxGCyAKuEQew/Ve9n76y+nbfbFfakO9mEJazvHnvpax3j2KibbFGSVK8NhCi0yK3JHTsl/YT
 6L2ZvpfUpGd9q22ulMjqBeptlI9SVU3yWjqRwveNC9Sb+XTG7Iu0jjVNP3QkXV+I9d1/QVsHrx
 mYwEAAA==
X-Change-ID: 20260116-i3c_rescan-4921d0b41a00
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joshua Yeong <joshua.yeong@starfivetech.com>, 
 Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771524718; l=3881;
 i=david.nystrom@est.tech; s=20251215; h=from:subject:message-id;
 bh=WQqnTVpEeBSbLk+QyegorBKEvEf0Fz5O0ZKS84F4C4s=;
 b=Of+8Xz8rPaF2wsp22/l69Z1lViUN4KpJzw4YQfZ95PxI5lUSIjv73+YtI207/osOP3nBD2Tgg
 eoAGi3OEFwYDDjvZcivVKmH6acOTdhoCANIqDbxkqbPyeU8tUB2Wp4X
X-Developer-Key: i=david.nystrom@est.tech; a=ed25519;
 pk=4E3iRjA+3w+a4ykfCHDoL5z4ONs9OcY4IN3pTwIG7Bs=
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|DBBP189MB1307:EE_
X-MS-Office365-Filtering-Correlation-Id: 867c92b4-88c9-41b6-2966-08de6fe26178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlA4OHl6RmltRFhXWkZ0cDBlSmdwZURtalA1UHlOSzkwSU92QWxmMVVidU5L?=
 =?utf-8?B?UGtNSENHemQwRzg5aG1JOXF6SENhR1hxQ2NjWW84UVcyRG1SdXIrM3pmaUQ5?=
 =?utf-8?B?WXdXLzh6SjFqdlBNVVE1cEgrbUVwQmdhdER0V1JzbmtGYUg2OXpTcGN1ZTJN?=
 =?utf-8?B?b0RzSUtJTlVteVZIM3BTcVBjWGs3Tm44OU1jelg3bVliOUt1enhtRGxIL0pj?=
 =?utf-8?B?cE1zQk5RRy82TUU3MlR1SWYzbUFDb1ViZW5TMDIxYTVaellHMGZuMmhmZnp4?=
 =?utf-8?B?SklLNk1tSEVOWWduZ0xUTFdhQWsycEZaWVlRM1p6d2Mvci81VEdBNHNaOGFk?=
 =?utf-8?B?NUdZVTZ3VG5tbTdhUFpiSktpUUZXTGlxTTlvbnBIcWM2TWY1YklrOWhyY0JT?=
 =?utf-8?B?VTc3TEQ4UmJVWThVQStNOXhCQ3dQQUxuNGEwbFV0Zi9JRXlUZDhxOGJOT1ZK?=
 =?utf-8?B?eGFuYXZaZmtKNnVGU3VrSHZlcklhUU53enhBc3hpblRkbkFzenZNem5yK0Vv?=
 =?utf-8?B?ODJyUTdhUTQzU20ydFRBTGM5SkdiV2x4bE81Z2VFQ0R2Z3pQaFFHcXBTM05j?=
 =?utf-8?B?ZHQzSHZyYkdRSEF3K2lQMUROMkIzRFhwM3FpTnF6b0RjaEIxWWp1aVpNbFQv?=
 =?utf-8?B?NktBYWI5ZTU3Yy83OFpnNU1UUlpPMkorZlVlNU53Tzg2WkhZa1BaSXBTejJR?=
 =?utf-8?B?RE0ybTYxRitmTHZtMERkZGEyMkt1ODlxRlR6ZVRhL1VVQ3lKbmhZdGwxK0NL?=
 =?utf-8?B?WmpvOU92eVNBakJ3OEVoWURZVDFRTXVzQ0lVV3lQOHB0OWJGc0N4dUxwYkhh?=
 =?utf-8?B?UGg1QzR6bDhaemI0eGE1N1pMcTZUdEFtWThLd2ZHUHBZYXNPMWZBS2RSYmky?=
 =?utf-8?B?T3FqeHYyVHF0MERuWEJxWjA3QW1kSmZKZkZ6Z05icTFhT0xPZEtoZ095TEZQ?=
 =?utf-8?B?RjRqNXNFVE14ZXppZFRoZllpc2YrVEtwbzcwbW9ZMlhKMlZldXY4UnZTdWQ4?=
 =?utf-8?B?Y2YrM0NoZFl6WU1EM2Y3VGtzTVEzejJhTnNGMXoyWXNmMkZOTkJ5d3FtQm5s?=
 =?utf-8?B?MHZPYkJDMUVWQ2NzQkl4MFg1eFpxRTZCdHE2M09VRDRJSU9Yd3dRaGxsVTlj?=
 =?utf-8?B?OGNDZDJKNE14U09zd1V5SEVEZzE0Qm9sa3QrZVdVeGhza1lXWWw3QkFhbndj?=
 =?utf-8?B?cFFpR2RDRW1hRUFObnhvc0IrWndhLytrbGVhWHRwR2I3ajVJUmVaWUVKMnJt?=
 =?utf-8?B?VUpCTDhDd3FCMmh6SzNkRjVxNnJRR1ZtZkMrU3o0YndCZzQySG9rWTduNmFE?=
 =?utf-8?B?ZWpHZTJLdTNLMG1pNTJNOFBYK2k2aXpYOUVLSjlyWnJWeWhhNlNabXdoakRk?=
 =?utf-8?B?dDhzazZuTXYxc1JsSXVicUlqY2ExbGlHRHJUa3ZveFM4aWR6UFMyT3o3OStU?=
 =?utf-8?B?UENEbWlEU2Q4SVhndTZyaTlHbTZNQW1oblBBdVlYMEZQTjdvNnFqMkwwYlJn?=
 =?utf-8?B?UmdUc1l2MXVNUWp5T3Bud3ZiN2E5U0ZPTHF6M2s3VG10dmxIem1kSFVhd1hj?=
 =?utf-8?B?MTRJU1ZSYmRPMERBZXBlNnJkWmd4QXZjbDNnTDlmbHlmU2tEQXN3Q3IyNG5H?=
 =?utf-8?B?RUVxdk8yVEJtKytiVk1OSHluelltcVQ2M2hrUU9BclE2eHQySjMvMHIzbEJK?=
 =?utf-8?B?R1hkY3p1dWVSL21iby9BSURqNlpONHhia0pCdU1KcmFJZ1B4NmdwdWVuVFNn?=
 =?utf-8?B?c1psUDlQRnlzcEZMNjlCdWpsWlFxRi9JL0tWU3FENHlibDVvL0JISC9lUDJ2?=
 =?utf-8?B?dzZqcmZDM2dQUXBqanlsMWl6Y0dGYm11ditTRTlsVEhmVXBWeWo1RkE0SGRi?=
 =?utf-8?B?ZXRWQjd1ZXpySVNwZjBVb1l4a0dLSmhWQlBtdG5JeWNadlovSFA3VEY2azRL?=
 =?utf-8?B?TjRKTE53VS9vK3V5YXlybXl3QWgwQnRXS0VJVDdlU3NoSWYzWkRLNldUQ3Qv?=
 =?utf-8?B?Qk03TFhjSTRJZXNXTXBiSkxkb3JXanFSM2dWd0RWdjhsRG5ycXE3bzlncFk1?=
 =?utf-8?Q?ja8lBy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0V3aVpTNUh5cnNpTDdmdTlyWXpuVmtoZWhmckhXUnBDNmZMdEowcU5pVEIz?=
 =?utf-8?B?QXJ6MUJ0dDB2SGZWdTVxV01CODBBd0RCWnlVSDR2aC9tMjFaeWhaZDBtd3oy?=
 =?utf-8?B?cU8wclJoZmJTYk5taENOMHVJejdpRXN0bm1RSFc2SWgvVkZRRUIyTzhiSStX?=
 =?utf-8?B?RUEyZDdGS1dGVXJDclBMTzBTbjBzTHJzSXJFNVlLOXFBY3JKaS9aZEp3RFph?=
 =?utf-8?B?emdyWnRTZ0JmRWhFK1ltbU5FcnJlcWtYNzZ4d3NFZm9nWkZmUDV1cU0yaFhN?=
 =?utf-8?B?K2c5OXpZQmNkeGZlczhVdG1OYng0M1hxK3k0RHd5S1p5SGdmcDRjY0dLcEl4?=
 =?utf-8?B?UHRmVWd5Z1BGV21SWTh0Yk05bEkxSTUxR2hBUzNOUmVtVEF5SkhVUkVzdXla?=
 =?utf-8?B?eHYyMHh0Z0lTbEdsNmtPVVdnVVkrVmVHRzVzM0J1dFNCbEl0SWt6aVhrOU5y?=
 =?utf-8?B?UjBoR3VCaGZWQURoUGREQ0FkSXFteTVVTHlEYXltT1B0Rm9Wb0l0V0liUzBY?=
 =?utf-8?B?OVlwK1BHOEkxYXNOTDNsVzdsVDl0OUtMMXRGRVl3cnVaU2FlMWxnSHlDN2Rt?=
 =?utf-8?B?Q0dGU1J5U3lJSlpBank0Mm5NSjhMSDg4bzhDZDVobXpQS1FycTY0NFVyd1VG?=
 =?utf-8?B?ajJyd25BM3FOaHZxN3F1STUzSm12bVp2dXUyUGVNRkd4eDhTOHY5QnFFU3kx?=
 =?utf-8?B?QkR4Tyt1MGxaYkJlYysrTnBqRHJaZ28xNm1EUWcyOEpFVjU5UXFqdURQZFJz?=
 =?utf-8?B?U3VtQjVEdFpmTTlPc2NieFI0NENNbldPV1NUdmRSOHRQd1A4cC9MK3N1bjIv?=
 =?utf-8?B?VzlhcVkwOHdJMjhGckNrSEN4Z3p2dTRuSUhaRGpNY1E0ME5idVhYeTVCcWF3?=
 =?utf-8?B?S1cwR2xQL2s5YW51clpzTTM3QlYvZXZJL25pV0tqcmZlY0VSTnJlbTJubTdo?=
 =?utf-8?B?c1JMTWlPY1Y5NGJyQ0ZvbUZBN2VjWUZxb3lQcEcwTlNnYU02a2IzQWFsKzkv?=
 =?utf-8?B?OEU2QVc5bG8wRDUrV0IzeWx5VzBqSkFSY1R4UjhXQVNEU2dLRjhOMERUbi9P?=
 =?utf-8?B?MWlwTFpValZ3ZTdYbG04dTBIWmJpKzNXRlBuR1JZUGd0RjJ3NlhTcXhuUmox?=
 =?utf-8?B?d0tMVTYxclJub1Q2Zk9ydDFKWVRzMzduSThpYUg4NlJhVE05bHVsZDFEZG1z?=
 =?utf-8?B?NE5EVDdvczR3MzZzUDVMTWVMTnYvbTlBY1ErOUJwaWNiZVNMVFlva2I0MFJ5?=
 =?utf-8?B?YjFCc0xkWWxHNjl5V2JFcS9mc3ptZ2NmdlBXK0xtaG80SmMwQUNxS0FiT2Rr?=
 =?utf-8?B?elE5eHlyb1ZacFlCMmpJU1RJZXdYRzdLeE91SUZzQm9TZnBDVmxHSmxnN3pv?=
 =?utf-8?B?SUsra1g1VllxQmVncnlaRG4wYlVxcHZTMFBYS3B6OTA3aTdYODFCOWtvK3Jl?=
 =?utf-8?B?bWlJczRRZVE2K0dhcnhLUFJxZmtyRjFJL0RFd3RXNGRlclBCaFJzc3V6R2Jn?=
 =?utf-8?B?dTdxcHRxbm04bXBtOGp5Z3h6S05nOS82ZllkZGNUMDRuaVV3c2srOFBkZVRs?=
 =?utf-8?B?TUFqNUlHYnJhL0RPNkxkbDdVQkNkYThuOGhwYzdBRUFQcDcyU282RDErdzc3?=
 =?utf-8?B?dGtEK0ZtVEdUN3VmYlhwRzhvMGg3cjU1RS9DOU1md3kzU0F1eVVUVTVsN0tj?=
 =?utf-8?B?UHB2VDBCc1NNWmE2Zmk1cWhLSEZ3ZXpHSGg5dE9aY2FMK09SQXM5cmtRVTMr?=
 =?utf-8?B?NEwxTWFObFZFRmVsUjZEb3JEcUxwbVNHM1VGTlJsUE5Id2pKOStXWldkbXM1?=
 =?utf-8?B?OUxQZUoxQ0NCNzl2VnY4WXRuZjQvMGxEWG1KL2FaV252clBNOFJySTRHUnhw?=
 =?utf-8?B?cGx1VTlsd0JsU2YxRnVzTnJhZS9mdGlzUDcxc3pGNzZBY3VNMmNnQzRiTFZz?=
 =?utf-8?B?RWJBRExHZlIzUkhWQndsdHpmV1NXSzRETGpPdEFReVFORXNheVAvaXVpYllK?=
 =?utf-8?B?TmNnM0pGSTJ1R25oTHd6SFB2RXVtT1Y5c3U3SW0weFVoU0dzaUxXTHFEZE5G?=
 =?utf-8?B?alVYRjZ5czZGTGwwZGRjY0N0K1VmU2ZHVk5ESDFRclpTdGhaMHBsT1RkVE1Z?=
 =?utf-8?B?aEE3cTFjYVNIbStpZzl2TWFaeC9qWWUxSk9rZng2U3FJRXlTS2ZsOUlTZDZM?=
 =?utf-8?B?TUFvMmdOb1RHVkVFVGRyc01yc0JwTThoVTJjS2tpMUVWMEIxL29WOVRORzdH?=
 =?utf-8?B?dUZpbU1hL0VHdWc0dkl5MWptK09EcWNYOSt5d0J3VEg2SHdxSFBRdUVBcFc3?=
 =?utf-8?B?dk9BMCt6WXBkVFdqOTZsak1UZXR0K0FMbUx4OUZob1cwMWxnbkFwZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 867c92b4-88c9-41b6-2966-08de6fe26178
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:12:02.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DS1Puw7C+YQSklwXfYGLvNk6YtjatBeLy+vDB6RSWZYKz+mDHbtxAKsyW72YIP1ildx0DhiE6HeowYEIopVhaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_101208_460486_126554E1 
X-CRM114-Status: GOOD (  12.89  )
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

QWxsb3cgdXNlcnNwYWNlIHRvIHJlcXVlc3QgZHluYW1pYyBhZGRyZXNzIGFzc2lnbm1lbnQsIHdo
aWNoIGlzCnVzZWZ1bCBmb3IgaTNjZGV2IGRldmljZXMgd2l0aCBicm9rZW4gaG90LWpvaW4gc3Vw
cG9ydC4KVGhpcyB3aWxsIGFzc2lnbiBkeW5hbWljIGFkZHJlc3NlcyB0byBhbGwgZGV2aWNlcyBv
biB0aGUgSTNDIGJ1cwp3aGljaCBhcmUgY3VycmVudGx5IHVuYXNzaWduZWQuCgpTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD4KLS0tCkNoYW5nZXMg
aW4gdjU6Ci0gQ2hhbmdlIHN5c2ZzIGludGVyZmFjZSB0byBib29sZWFuLiBDb21tZW50OiBNZWFn
YW4gTGxveWQKLSBDaGFuZ2Ugc3lzZnMgZW50cnkgbmFtZSB0byBkb19kYWE6IENvbW1lbnQgTWVn
YW4gTGxveWQsIEZyYW5rIExpCi0gTGluayB0byB2NDogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5r
LzIwMjYwMTI2LWkzY19yZXNjYW4tdjQtMS02YjM1NTlkODJhYmNAZXN0LnRlY2gKCkNoYW5nZXMg
aW4gdjQ6Ci0gSW1wcm92ZWQgY29tbWl0IG1lc3NhZ2UsIG9uY2UgbW9yZS4gQ29tbWVudDogRnJh
bmsgTGkKLSBBZGRlZCByZXF1aXJlZCBkb2N1bWVudGF0aW9uIGZvciBzeXNmcyBhZGRpdGlvbi4g
Q29tbWVudDogRnJhbmsgTGkKLSBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsv
MjAyNjAxMjMtaTNjX3Jlc2Nhbi12My0xLTAyNjQyOWZhMGM2NUBlc3QudGVjaAoKQ2hhbmdlcyBp
biB2MzoKLSBSZW5hbWUgc3lzZnMgZW50cnkgZnJvbSByZXNjYW4gdG8gZW50ZGRhLCBDb21tZW50
OiBKb3NodWEgWWVvbmcKLSBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAy
NjAxMjItaTNjX3Jlc2Nhbi12Mi0xLTg0Yzc0YTQ4M2YwM0Blc3QudGVjaAoKQ2hhbmdlcyBpbiB2
MjoKLSBJbXByb3ZlZCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCB3aHkuCi0gTGluayB0byB2MTog
aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMTIyLWkzY19yZXNjYW4tdjEtMS0wYzE3MDcx
ZTIzMmJAZXN0LnRlY2gKLS0tCiBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1p
M2MgfCAyMCArKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9pM2MvbWFzdGVyLmMgICAgICAg
ICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDQ0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0
aW5nL3N5c2ZzLWJ1cy1pM2MgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1p
M2MKaW5kZXggYzFlMDQ4OTU3YTAxLi4xOWY1Y2Y4YjFiMTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLWkzYworKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWJ1cy1pM2MKQEAgLTE3MiwzICsxNzIsMjMgQEAgRGVzY3JpcHRpb246CiAJ
CXRoZSBhdXRvbWF0aWMgcmV0cmllcy4gRXhpc3Qgb25seSB3aGVuIEkzQyBjb25zdHJvbGxlciBz
dXBwb3J0cwogCQl0aGlzIHJldHJ5IG9uIG5hY2sgZmVhdHVyZS4KIAorV2hhdDoJCS9zeXMvYnVz
L2kzYy9kZXZpY2VzL2kzYy08YnVzLWlkPi9kb19kYWEKK0tlcm5lbFZlcnNpb246ICA3LjAKK0Nv
bnRhY3Q6CWxpbnV4LWkzY0B2Z2VyLmtlcm5lbC5vcmcKK0Rlc2NyaXB0aW9uOgorCQlXcml0ZS1v
bmx5IGF0dHJpYnV0ZSB0aGF0IHRyaWdnZXJzIGEgRHluYW1pYyBBZGRyZXNzIEFzc2lnbm1lbnQK
KwkJKERBQSkgcHJvY2VkdXJlIHdoaWNoIGRpc2NvdmVycyBuZXcgSTNDIGRldmljZXMgb24gdGhl
IGJ1cy4KKwkJV3JpdGluZyBhIGJvb2xlYW4gdHJ1ZSB2YWx1ZSAoMSwgeSwgeWVzLCB0cnVlLCBv
bikgdG8gdGhpcworCQlhdHRyaWJ1dGUgY2F1c2VzIHRoZSBtYXN0ZXIgY29udHJvbGxlciB0byBw
ZXJmb3JtIERBQSwgd2hpY2gKKwkJaW5jbHVkZXMgYnJvYWRjYXN0aW5nIGFuIEVOVERBQSAoRW50
ZXIgRHluYW1pYyBBZGRyZXNzIEFzc2lnbm1lbnQpCisJCUNvbW1vbiBDb21tYW5kIENvZGUgKEND
Qykgb24gdGhlIGJ1cy4gV3JpdGluZyBhIGZhbHNlIHZhbHVlCisJCXJldHVybnMgLUVJTlZBTC4K
KworCQlUaGlzIGlzIHVzZWZ1bCBmb3IgZGlzY292ZXJpbmcgSTNDIGRldmljZXMgdGhhdCB3ZXJl
IG5vdCBwcmVzZW50CisJCWR1cmluZyBpbml0aWFsIGJ1cyBpbml0aWFsaXphdGlvbiBhbmQgYXJl
IHVuYWJsZSB0byBpc3N1ZQorCQlIb3QtSm9pbi4gT25seSBkZXZpY2VzIHdpdGhvdXQgYSBjdXJy
ZW50bHkgYXNzaWduZWQgZHluYW1pYyBhZGRyZXNzCisJCXdpbGwgcmVzcG9uZCB0byB0aGUgRU5U
REFBIGJyb2FkY2FzdCBhbmQgYmUgYXNzaWduZWQgYWRkcmVzc2VzLgorCisJCU5vdGUgdGhhdCB0
aGlzIG1lY2hhbmlzbSBpcyBkaXN0aW5jdCBmcm9tIEhvdC1Kb2luLCBzaW5jZSB0aGlzIGlzCisJ
CWNvbnRyb2xsZXItaW5pdGlhdGVkIGRpc2NvdmVyeSwgd2hpbGUgSG90LUpvaW4gaXMgZGV2aWNl
LWluaXRpYXRlZAorCQltZXRob2QgdG8gcHJvdm9rZSBjb250cm9sbGVyIGRpc2NvdmVyeSBwcm9j
ZWR1cmUuCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21h
c3Rlci5jCmluZGV4IDBlYWUxOWIzODIzZC4uNjAwMjBkNTZhNTgwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtNzU4LDYgKzc1
OCwyOSBAQCBzdGF0aWMgc3NpemVfdCBkZXZfbmFja19yZXRyeV9jb3VudF9zdG9yZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiAKIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhkZXZfbmFja19yZXRyeV9jb3Vu
dCk7CiAKK3N0YXRpYyBzc2l6ZV90IGRvX2RhYV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCisJ
CQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkgICAgY29uc3QgY2hhciAq
YnVmLCBzaXplX3QgY291bnQpCit7CisJc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFz
dGVyID0gZGV2X3RvX2kzY21hc3RlcihkZXYpOworCWJvb2wgdmFsOworCWludCByZXQ7CisKKwlp
ZiAoa3N0cnRvYm9vbChidWYsICZ2YWwpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmICghdmFs
KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldCA9IGkzY19tYXN0ZXJfZG9fZGFhKG1hc3Rlcik7
CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCXJldHVybiBjb3VudDsKK30KKworc3RhdGlj
IERFVklDRV9BVFRSX1dPKGRvX2RhYSk7CisKIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICppM2Nf
bWFzdGVyZGV2X2F0dHJzW10gPSB7CiAJJmRldl9hdHRyX21vZGUuYXR0ciwKIAkmZGV2X2F0dHJf
Y3VycmVudF9tYXN0ZXIuYXR0ciwKQEAgLTc2OSw2ICs3OTIsNyBAQCBzdGF0aWMgc3RydWN0IGF0
dHJpYnV0ZSAqaTNjX21hc3RlcmRldl9hdHRyc1tdID0gewogCSZkZXZfYXR0cl9keW5hbWljX2Fk
ZHJlc3MuYXR0ciwKIAkmZGV2X2F0dHJfaGRyY2FwLmF0dHIsCiAJJmRldl9hdHRyX2hvdGpvaW4u
YXR0ciwKKwkmZGV2X2F0dHJfZG9fZGFhLmF0dHIsCiAJTlVMTCwKIH07CiBBVFRSSUJVVEVfR1JP
VVBTKGkzY19tYXN0ZXJkZXYpOwoKLS0tCmJhc2UtY29tbWl0OiA0NDk4MmQzNTJjMzM3NjdjZDhk
MTlmODA0NGU3ZTExNjFhNTg3ZmY3CmNoYW5nZS1pZDogMjAyNjAxMTYtaTNjX3Jlc2Nhbi00OTIx
ZDBiNDFhMDAKCkJlc3QgcmVnYXJkcywKLS0gIApEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJv
bUBlc3QudGVjaD4KCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
