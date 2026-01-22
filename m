Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE4BD6CFA0
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MtUd1MWKWxXYHRDOdgfxHIVG75Oo7Ikhv2tJ5anCtnA=; b=EiGBzY6AAgEiL4
	p68dWznd56ofumwpV9v5VhrRMDm/O3M7cOopMJ3+Fd+wnd9JR68hnj5TNa8Uw7abdhXET8AMDXnuE
	EeBw06juHCRCwKFjQiY8Q1YVQ5hBPhXTFpFFYUJOyhmmSaaJRyzaaKqfrtU5dYysC6vVP9h5nFAOT
	WR6x3cI4763DPBzMbhbTcf8qho5YH0Nhvj9wzLYQX6V2lPb0ynrj7D+KsInMKviMOSEqnelZErcYv
	7jml95cGKg2xAiQSVUY2L8XULPCyXLZzLyzhouE6NyeKmBjiN9lgFrlFJnJoeoC8lkY8FE1qSvMrz
	93GKCOLEwy5S1Q+Q7TOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyxb-00000007bED-1g2U;
	Thu, 22 Jan 2026 17:59:11 +0000
Received: from mail-francecentralazon11013019.outbound.protection.outlook.com ([40.107.162.19] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyxZ-00000007bDq-00lb
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 17:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3OCGZTEOWvL9Dhoepe+11RKjgD1sCAFxbslWL0hU+i9OoFbY/8oxask5mjxSTeZzwFG0gEYCGpKvu9//p/tqWUo3hBvIBPPBVlxtkl94pa/KgewlPMUDU76gYardQh5KbOOf8eR/kE5me4PDbz8q7dSWTIJF7B5/eoJk1vpl/cmvpwHjPdIA2RFfbSeehRgSwOF+wRrf3H1wp/kR1Xb/KXahfXu7MnQSFhgZAZBYdfo32pRrtJKUiiN/kpm5q5HxB4CX+ZWtRgE++Ftxp6bu15Ax2Eq8CUmU4eGauJhzpNdIvo2V8WKpUVTq4c2SJJnn1rDDrmGxQykLEtjA36mQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz4x7FakxOyYtFSTVzeupKtiEfo6BUOffn64mQqgjKs=;
 b=hRnEg3lkZZ5A30t258S5eA2cHBrQ9a7xmOM98WnzdRNk/fkv8WtPObw6odOeQ11i3qMyODJJ+NlpxSA0VRxOcdEkiOcRESMGrT4Raa/a3PnDzTt9l446w4ek8eimzIiT0lQ8jBoH/ZnKx5zkQhF075s7vFitPO8AZPBHysMEB5X6wtYK4/ntM4eGJgo4JGLiIxVeLoUpdtYT819j/IeAql9d6NUAAyavxxP6UmkhJSdO/dv3zNnXi1JXnVcrISa2WnfUkfmd2Ywpi0JLLge0iCB+IxqlZ/MXhbTWet6/HIKqOm89Z9ae7eBXn6K0zFNmUhxiQmhnVcYdrXFg+2tBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mz4x7FakxOyYtFSTVzeupKtiEfo6BUOffn64mQqgjKs=;
 b=TbhSANsVeUZaSTxJZ3nQc3AuMzCoXKvUcwgm0ea2tBhBocjsQbjiB2h7VOqN25z3vrvFXPwSeRg+J85dHOhgAL+zcEHTx1o3H3NCKjIq8i4QyhI3TdKr1BBrtTPzWQ1mrnS6/owquoR2IdzMrQ1S+HftK6lWaIyuXwMxWG4ZfhkX4mRhZwbwan3DZKKVzETF9ziUe84HlWVoc/x/JxzesL6dHOLKswNeQ3mlfEutA6hD8wyOmFT8xmo9gZYD/GMo0SVm3swuUR13oHpSUa+G6z12OW7XAZSlRxnR6QkupIrSpoWkWu6cxFEOeR8I+cGK9fGMqFhoAJ9a3lUtFuaOlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by VI1P18901MB0686.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:123::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:59:04 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 17:59:04 +0000
From: =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
Date: Thu, 22 Jan 2026 18:58:55 +0100
Subject: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
Message-Id: <20260122-i3c_rescan-v2-1-84c74a483f03@est.tech>
X-B4-Tracking: v=1; b=H4sIAF5lcmkC/02NQQ6CQAxFr0K6dkxbCERX3sMQA0OVugAzHYmGz
 N0FdOHyJe+/P4NJUDE4ZjMEmdR0HBbgXQa+b4abOO0WBkYukah0mvtLEPPN4IoDU4dtQQ0iLIN
 HkKu+tti5/rI927v4uBZWo1eLY3hvbxOt3i/M/B+eyJFDTxVWJJxzexKL+yi+hzql9AGQ2c/Vt
 QAAAA==
X-Change-ID: 20260116-i3c_rescan-4921d0b41a00
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769104740; l=1806;
 i=david.nystrom@est.tech; s=20251215; h=from:subject:message-id;
 bh=T8+dXqmguJpWgm7BPHX2Ag17ysG0nmPTG9KiqE404BY=;
 b=Cf/yPNKrsWI3U8yXrYky6gqSwawW2pt/0rGTYNvdlQMJI7ePD46My+DToclv0xOaqYHVie7pY
 ilj1Hn/2U21BtUk6zRmtn0wo0kk8uwn7Jh4yYrBeNGCm83gDvU4pPLG
X-Developer-Key: i=david.nystrom@est.tech; a=ed25519;
 pk=4E3iRjA+3w+a4ykfCHDoL5z4ONs9OcY4IN3pTwIG7Bs=
X-ClientProxiedBy: GV2PEPF0000385D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:d) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|VI1P18901MB0686:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e6b453-02ab-4b5d-e5c2-08de59dfedfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVKSTEyeXp2WkJpMHZ2Vjc0dDk0N3hoZXhQSW54eU5vSGdDOFY0TXRUZ2ly?=
 =?utf-8?B?ZXBFOGtFc2VxdllLdVVhU3RvVzhJUkplNTlSK1U4WkNmM1oyWDlxZXlqYmJw?=
 =?utf-8?B?Ukc2QXptanJkNzZjQWhJV29ENjVaZ2F2b3dwTjZvVzZ1Zk9KKzZtaUM1MDBX?=
 =?utf-8?B?ajl6dG1wMDQ3RStyS05uRXdNeGFzZS9QMVJnZWVkdTlieDVQM2xpOG0yVHdM?=
 =?utf-8?B?YmxGY3UrUWxlTEFwbVREak9xdllqY1dXaDQ3MmJCK2g0VnJlSllOVDJnNmsy?=
 =?utf-8?B?R1VQK0cwQWk2V29TSWVQcTVLalJ2SVBlZ3FyRVN1YThEOCtXTlFtN2NVREdr?=
 =?utf-8?B?V0FYYmVEczlRQlFpVjdsSEFKRHJvazhNVWlnSWxmSmFIWmdXanM3Smo0SkNs?=
 =?utf-8?B?WFJlbUJ0MjN6dE5sQTN1R2svQlJ1Z3VOQWlRd0Mvb2xLOGdPL0pxL0RUaU1i?=
 =?utf-8?B?SEFrY0hjT05aT1YrdzA1Zk9lT0FRMjdMcXk0dnlyN1ZzMkJVdVFhRWtxaEdt?=
 =?utf-8?B?ZUwxRURBTnhVN2dmLytZOVpFcFJOQ2tYL3NSM3RkakRuTVk4aUhOY2lrdnBH?=
 =?utf-8?B?amFHd21ycVduQmZzcTRTSzlHTW9zTEl4czFmZGpyTWJPR1M5L3k0SEc1bXVR?=
 =?utf-8?B?VmRVcXN2eVdPb25HbWJtZ1djR2poQ0RwQ3JQZDRBZ0Z4MFplU05xWXo1US9W?=
 =?utf-8?B?aHNMbnpVdDc4K3pnTTcyVTluMGpBYnFQMmUxTHpPdjYxd2dsUWt2aGQ2d1JH?=
 =?utf-8?B?Z2tvQVJYeFJ2bWdQdXYrRGhuQzc3OVZFWUx4YU9RdHdsUFZuTHBHcUdxd0tO?=
 =?utf-8?B?ODVOSUdxTjFJSFZYMHlEblpTSk9TOFJSQzl4N1FzZWZad1l3UzB5WTVGMFlS?=
 =?utf-8?B?WlZjZGpxdzI1TUQzNnp4Qnk4dUJTdVhqOHFEUXhaMndqNHZGc2VwTk1JSmxN?=
 =?utf-8?B?czljU08wYWt6RUpnS2NYUUM1bnFaRlh6K1B4MW9CRFkzNSsxaVFibFg2bHoz?=
 =?utf-8?B?RjZ4YzV3T2JodW02VEtKUHAzM0VORlc4UUtVRlJ6VlNWUjVqZ3p1VFBidU44?=
 =?utf-8?B?YkZrUjdHeE5TTjhmazBBdU0ybG5NN2g1ZzBoWHo4UFRzenRNYkR3NnpyUVNp?=
 =?utf-8?B?UnZmejAvYnZkc2cwcFlXclE3Y09rMk52NGFRbUdqanQ2aHhoUmJ2c3JqRFpo?=
 =?utf-8?B?S0ZRR0JhL1R5bHZPMHBxU1hTQUlFMWNjOWN5NTlyWG5odzMxdzdrNUxhVnht?=
 =?utf-8?B?VEVsWFFYSVBvVUNicFFqZERIcGZ2RGdWUklRNTkwUlZKaXA1WnJabWpXLzF1?=
 =?utf-8?B?RzkzNytqUFE5RTNxN0ZqK0ptUXNybkN2dlJNZkthekZCSU9qRHd2TmdReWtt?=
 =?utf-8?B?d1JLeHlxbGh2VE5CbCszbnFqbHo5SnFGWFlOMTRJVHVPUGNPakdqckRBalRV?=
 =?utf-8?B?V0NHMEYwYWxTSmIxTUx6KzRmclVySkx6YTZSMHl0dEF1czdCUWFRLytscU9o?=
 =?utf-8?B?L3pJWHlKWHJLb2oySWJnT3BKdXVoNjFpaWNCT0U1OWZaay9RK1d5blY4NkZY?=
 =?utf-8?B?Tmx2SWFaOWtyQmpabW1palp3ejVEZmlRTHdaNlcwWGFOQWZ5TWVEbXgwcER0?=
 =?utf-8?B?YTE1R3hKbDF3L2h4SVNhRVB1NmVWbDducVRZaDBWYWlrRW5GSEN3bXBLY3k5?=
 =?utf-8?B?d0xZZXlGYktQV1B4dVVsU3BUZWc0WlFWcnEwSkJFRkhRY1lid1c4cE9aMGsv?=
 =?utf-8?B?L3JMMy9sTWo1TzROQWVMaVE0M1VlZktONklVQVdSR3JEWHAzcEVxUDRJMWlV?=
 =?utf-8?B?ejlJMUpnd2ZFYmZHeVBEeE9Ka09qMDBWaytOS2tWakN6NDZ0dHowRXNpZlBS?=
 =?utf-8?B?blhyVS9vL3Y3aHRmZlBFNW9PbVJhL1oyeDErZTM2QjFMWkVDMUxzUThjcGlR?=
 =?utf-8?B?WlQxdzFYNmNLV3FSOCsrZ2I5K240dTk4SkE4VnI2Nmg4bWJyK2wzdWxkTWw0?=
 =?utf-8?B?VFBDMVZ4ZXZzSjdXL0F3NHE0d1NjWDNLN0VDbXdJZ0FPMFRQZ2t1bXlYZDR2?=
 =?utf-8?Q?kxkEAl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdFbEx4REhTci8yY0lnRURic2UvTUtwZkNmOUlNb3Y1UEErTTNaTjlnc0lM?=
 =?utf-8?B?ZFMvMjJrZ3I2TDhZUG5IUmNoL3hNbEVjRW13ZU0yWmtiRDFwQnVldEV3blJp?=
 =?utf-8?B?WUx4UVY0R1k4eGxqaFpDL1dwNHdpQTRBbC9laGd2TnhBYTJEcGFHaGtTdCtk?=
 =?utf-8?B?SEZoMTByeCtMSFhNY3hKMURBSEJ2OTlLU3F4UHlSMGZvMUFBaHBnd1pPaEFw?=
 =?utf-8?B?UnVzRTB5aDgxcE9Qclp2blRHU1FONkN4T2dlSVZEakZoSk1xWE56Z2o1TzQ3?=
 =?utf-8?B?ZGV6bGQxMW9aME9EeXJHQ0tCYnU4eG1zN1kvRXZQL05nN25pRHJLSGgzbHdi?=
 =?utf-8?B?WlZWcERIZ1JJVmZrZldFMm5HRlZwMDdHbUFUSTQ3ei90cDdnTExwTTFheUI4?=
 =?utf-8?B?SXQwcUR1K25kRjducHYzQ2cwQTZVeEZvOERSeFlIeERyNU5HZmk3TTUvNCtu?=
 =?utf-8?B?WkE0YnY2djJLaWJxU0xpUm1VQkZ6V2FCcVBBV2NrdnFqbW10VUVPajN5dXRH?=
 =?utf-8?B?WUJSTG42Uk5xM0YrRWkvUGFsMGg0bE9NbHhkSEdicWJzVjMwelVaaU9TeWF2?=
 =?utf-8?B?NVNkbHN4bEkxekh6QzJ5alVmY3NqK3c3bDlOTEdqaXZLaDNPUHVQR0pyMlli?=
 =?utf-8?B?bXZLbkROWjY4REU0QmlQTnNKQ3YvdUNNUEhlZFptK0p3RDlheTVCNkNPclRp?=
 =?utf-8?B?bkZyaUxDS0gxbStqVFg2QzdXS2twS0NCQ0xoRXcxSTF3SGREZ3FFQWhVWmdY?=
 =?utf-8?B?V0pjUm53U1JMeFEyMmpJTjg2Q0Z2eE1xTVQ0WTZORU5EZXBWd3ZQRUVhbExa?=
 =?utf-8?B?cXR0TUg2UnZPOWxMMUdxaDVCT1dkdzBkN29CMEltSzI5R0RKcTZhVFB2b05v?=
 =?utf-8?B?UTVqa3E4ZkhSdmZTWjBFRFhROVpVbWNOWkxiQlpUU2V5b0tMYW8wK2VMemJQ?=
 =?utf-8?B?VEo4c3ZyTkhPL05ORklXU2JlMlNMS1d1NXlZbHB4OGQxYWk5Z2ZJSmNpWTQ5?=
 =?utf-8?B?bTRZVDNOOWorWlBZSmZPMzd4dkt3bk03MjVVb2lEcm5Od2R0dUlZUGE5Z0k0?=
 =?utf-8?B?amZqTGtITHR0a0ZZQjdaRFNaQTdlSUtWc25QMkc4a0UwbllZS3BNMGRMWnVD?=
 =?utf-8?B?NWZpTnViK1BQbHVzSE9jVXBHN3BlWFhwYXUvdER3bmxPRmxJQk9sTnZQQld2?=
 =?utf-8?B?ck1hZFBEU29JaWdtUEZYdDZ1YSt3WkxvNExsNks2NG5wdWJIL0dZWkRSWlk2?=
 =?utf-8?B?UFZsZXFGYk5ERkR5MkVMT1BvSTkycXRRTDZhbUlnWkhIRUZ5OXZTWkQ2NTdp?=
 =?utf-8?B?d3RZWlFNRlhpck0vemF5aFhldkJyT1c0TG04Nk1iTVBGWXpscHU3M3VzbWRU?=
 =?utf-8?B?RTRobDVDSEFIR0FwelR5ekp2eVBKRjJ0M0tSc3B1RHhteFBlaCtUcWxyTU1u?=
 =?utf-8?B?UVlobW51aGhFeWtOa2dkN3A1WFVNQm4vMkpGL1l3ejdqS2dUeTFINC95Tkx4?=
 =?utf-8?B?REtaSEtjVmQ0a3dmaEozT2lXSjF6MGZ0UlVDeHF0ajNwVHlpSFZZTENnWmYz?=
 =?utf-8?B?ejh5Y3NXMXlmVWVFVlo2UXpTdG5HWUNVTHFYNFpJRTM0WlJIVlJzYVpQNEZV?=
 =?utf-8?B?bkQxTU9ZZmgvaVI4ZGJNcHM3Z3FFUnZXVWNqWjEyRk9paDRTdUhPQVZjYjRv?=
 =?utf-8?B?MlMwYzQzdzBFSnJPYUJYTnR0TWYrWmRzV0kyQ2lKTGZjaEx3VVFNMHp4Y1FH?=
 =?utf-8?B?OFc2dWphREp5c0FYS3ByWVkyNlA1cHlNaXhSbG54TWdqbmVkQ3A0SE9GRnYw?=
 =?utf-8?B?allXbEtsanlJZ3NQbHVIRVhJOURTL0pkQ3BReHNkTDBjcTI5MXl5QVBpTGZn?=
 =?utf-8?B?M1BsaUxhOWlNeVhOVFJKcmxmS1JjVC90cnNPaXZQdng2dHc4SnZFbHdGS0RG?=
 =?utf-8?B?MFBFVjIxelEza00yNUpkRHloajZVaC9mVjMwcTVNcEJLZ24xZHpNTmFBWGpN?=
 =?utf-8?B?WE5UUldKTmZLL3h2SUx5RGNOQVVZK2FvSXBrZ3JqaXIwWldyb1hNSXdLNGxv?=
 =?utf-8?B?QmZXaGdNT3NTZlI1MEVpZlZXczc5QVlyZHFFcTh2OC9XOXNDS2E1MngwL213?=
 =?utf-8?B?U1FBWlgyeDc5c3JaRmxxMC8vMEVYMklUS1VMa0pEdzdKRDFOOXpkTFNmeTlv?=
 =?utf-8?B?RHR1RGsvVEprU3A3YlF4WFprTHVnVysvSU5ZcVhHdlFzSi9TbTNPR1drcUxn?=
 =?utf-8?B?QlR1aDFUVm1lUkcrWEpFVjFPTjZvOFhEeEJGdEJXOGZLNDJ3dlJzV0FSU1Zs?=
 =?utf-8?B?dDQva0g4Z1NDR0Ivd2szSXdjU0dXWnY3RXVSbHdiditYMDdFb2grdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e6b453-02ab-4b5d-e5c2-08de59dfedfe
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:59:03.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOvgn7mspz5AgurYweV8qNjqdhyFyuNlcUHQdj02/PTklUZ6Y1beU/cNVhgl553HOzL1LPeLt7yvD54Jny8QKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0686
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_095909_047080_41FC446E 
X-CRM114-Status: GOOD (  11.61  )
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

QWRkIHRoZSBhYmlsaXR5IHRvIHJlc2NhbiB0aGUgaTNjIGJ1cyBmcm9tIHVzZXJzcGFjZSwgaS5l
LiBwcm92b2tlIGEgRERBLgpUaGUgdXNlY2FzZSBjb3VsZCBiZSBmLmV4LiBhbiBpM2NkZXYgdXNl
cnNwYWNlIGRyaXZlciBmb3IgYSBkZXZpY2Ugd2l0aCBicm9rZW4KaG90am9pbiBzdXBwb3J0LiBJ
ZiB0aGUgaTNjIGRldmljZSBib290cyBzbG93bHksIGl0IG1pZ2h0IGJlIG1pc3MgdGhlIEREQQpk
dXJpbmcgYm9vdC4KClNpZ25lZC1vZmYtYnk6IERhdmlkIE55c3Ryw7ZtIDxkYXZpZC5ueXN0cm9t
QGVzdC50ZWNoPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBJbXByb3ZlZCB0aGUgY29tbWl0IG1lc3Nh
Z2Ugd2l0aCAid2h5Ii4KLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAy
NjAxMjItaTNjX3Jlc2Nhbi12MS0xLTBjMTcwNzFlMjMyYkBlc3QudGVjaAotLS0KIGRyaXZlcnMv
aTNjL21hc3Rlci5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyLmMKaW5kZXggODBkZGEwZTg1NTU4Li5lZGVhZTc0OTNiM2IgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5j
CkBAIC03NTgsNiArNzU4LDI5IEBAIHN0YXRpYyBzc2l6ZV90IGRldl9uYWNrX3JldHJ5X2NvdW50
X3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIERFVklDRV9BVFRSX1JXKGRldl9u
YWNrX3JldHJ5X2NvdW50KTsKIAorc3RhdGljIHNzaXplX3QgcmVzY2FuX3N0b3JlKHN0cnVjdCBk
ZXZpY2UgKmRldiwKKwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKKwkJCSAg
ICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkKK3sKKwlzdHJ1Y3QgaTNjX21hc3Rlcl9j
b250cm9sbGVyICptYXN0ZXIgPSBkZXZfdG9faTNjbWFzdGVyKGRldik7CisJdW5zaWduZWQgbG9u
ZyB2YWw7CisJaW50IHJldDsKKworCXJldCA9IGtzdHJ0b3VsKGJ1ZiwgMCwgJnZhbCk7CisJaWYg
KHJldCkKKwkJcmV0dXJuIHJldDsKKworCWlmICh2YWwpIHsKKwkJcmV0ID0gaTNjX21hc3Rlcl9k
b19kYWEobWFzdGVyKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJfQorCisJcmV0dXJu
IGNvdW50OworfQorCitzdGF0aWMgREVWSUNFX0FUVFJfV08ocmVzY2FuKTsKKwogc3RhdGljIHN0
cnVjdCBhdHRyaWJ1dGUgKmkzY19tYXN0ZXJkZXZfYXR0cnNbXSA9IHsKIAkmZGV2X2F0dHJfbW9k
ZS5hdHRyLAogCSZkZXZfYXR0cl9jdXJyZW50X21hc3Rlci5hdHRyLApAQCAtNzY5LDYgKzc5Miw3
IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICppM2NfbWFzdGVyZGV2X2F0dHJzW10gPSB7CiAJ
JmRldl9hdHRyX2R5bmFtaWNfYWRkcmVzcy5hdHRyLAogCSZkZXZfYXR0cl9oZHJjYXAuYXR0ciwK
IAkmZGV2X2F0dHJfaG90am9pbi5hdHRyLAorCSZkZXZfYXR0cl9yZXNjYW4uYXR0ciwKIAlOVUxM
LAogfTsKIEFUVFJJQlVURV9HUk9VUFMoaTNjX21hc3RlcmRldik7CgotLS0KYmFzZS1jb21taXQ6
IGUzYjMyZGNiOWYyM2UzYzM5MjdlZjNlZWM2YTU4NDJhOTg4ZmI1NzQKY2hhbmdlLWlkOiAyMDI2
MDExNi1pM2NfcmVzY2FuLTQ5MjFkMGI0MWEwMAoKQmVzdCByZWdhcmRzLAotLSAgCkRhdmlkIE55
c3Ryw7ZtIDxkYXZpZC5ueXN0cm9tQGVzdC50ZWNoPgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
