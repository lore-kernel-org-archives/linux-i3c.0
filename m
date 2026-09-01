Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1E8C61DD6
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Sep 2026 21:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJfbPhpsbIEbOq8g79oGZwBiyr9EXdP9ibtabTM6jqc=; b=zCxktOFD1X6YKw
	PkfyqGbbwXyZo+cQrJIVNyUIK96ik6jShj2p1T3e4HYNEanJI1nxH7Kfn7z4t7igu/qV2h85+R6PR
	dbO8qAIbwO9hVMyn94BA+W3/eXA8AYiJcAx+Bh7JB6ywHau21XNoxRW0m0WuUCDY2/jPDkAKaN1S7
	tm0UFNpVLnTNtK/GaofmIMYk8GESCECaTKgV4W9JXgYhF1UNFWlv+27PPAf89H9rNBUD8iczPY6n6
	6I6o5AekavniyKVmy7T1SmJg71q+WaKzuUcqK23HqQApMaS4rKqjuvUpf6nmG2zmHfuJjTBpHQicL
	jalt2xIlIPAI39flq9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Vsz-0000000DO5P-0gwX;
	Tue, 01 Sep 2026 21:19:17 +0000
Received: from mail-swedencentralazon11013060.outbound.protection.outlook.com ([52.101.83.60] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Vsw-0000000DO4e-3exY;
	Tue, 01 Sep 2026 21:19:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTTBWu7c4LrWL91FIgv9na/e6kaRAMdyJbQrIhlPFK0uW5pS2yApv0QtijzM7InNIxB28rHDOzdKiNNhPqUZpkcrL32givnZP2PjFsAr4Kj6ZnHg/OUwN+ZyDsw405niqxUCXGnnjCXFQm5+z0XAsE5rlw+7xC18YEJpij9QMLSCpFuYfUURkZO6MVRS0LNRtshRagZQ71IDR4r85H4qG39cltrMLuMVnB6Bbthr49BAv//fUY2nrtRRyEGLaKJx6RdhvLZ+WZhqV7jrt9dPkxebWHwnX3FczW/EKRoEqznxR9cOs7w3FLgAtq4rsjwV+UFeuORMsWEVxDtBwdrPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w77II0Rsn+plUXj7vgkwwl877K7QmvECZKXGNtXBYBM=;
 b=PVVQq5+oy1HQ5oNqcnZ/K0Prms/UJBLnTZ7sMTm2bGZY1xqYuWFDKZEDFZnCXShefsUJZKY/bxulOAhS2D9hoh3K8UnKBw7x6dUSBnkwa1iSzLHMjTLJGlRX6tuy5Hg86qT80P1QbYGatG6nqJlt29PZNPdku0mOAjimWSkE/AdGdVbGWkbIFUn2TjgO4oxwfXRpB6f3AzfkNXaE1uKzmNmPIFOX2+aA+YuMMZGE//p5fSXJByDuBqq0MeSSKBIrcXBULno/r9vkpNmRjGBk4SyWnKIA5SDx5hKnxKcMbDVGKExkJA0mA83Gyvlg89Lx8j3pZp1dySQEINHp2Po/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w77II0Rsn+plUXj7vgkwwl877K7QmvECZKXGNtXBYBM=;
 b=HFQfpJcTsjSyX8HsseYgUOVHcex63bi8Zc/+mNPdpgzszFCsDzC2vEvi6l+IbQbdlq6of4cx6lnRcXPvnKBgXAz6zQRpX8Q6+z05tygj4sJptV0os8fXsQOl16Qx+qTRA883y8efd4kLVUzIyTqUQ3gw6hEhO272z1pn1AsDV71+0pq0NZW85Q/nKuPZ+aBAxyw8VZCsCA/rxYqTuUxgQsoT9GAS3IxXgOsWtyvvpAAooKy0vimKDUF0dzu8q+l9hdHZxVSWJkuu0Q8rwKVlnVZCQ5xgKzq6ncTeX/HUALkBfP3mhQBLyc477tg4b1vyOPk5U4QQVRM7rAbTounRhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 21:19:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:19:08 +0000
Date: Tue, 1 Sep 2026 17:18:59 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] i3c: mipi-i3c-hci: Add support for the AST2700 I3C
 controller
Message-ID: <apdBQ3GbChnlUk8b@lizhi-Precision-Tower-5810>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-5-19909e7cbd7e@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-5-19909e7cbd7e@aspeedtech.com>
X-ClientProxiedBy: PH7P220CA0135.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: ef041b89-131d-4432-1ab3-08df086ea88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|56012099006|10067099003|11063799006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MbKVOEmC6J+XxuojXpbo8eprdxGIXcARITm6YnHhYgW7P+79oKVErKmzX5pDjW2Aj/k+ylLMFrLizoYcFJxT3C9mZI94rCI+IN1OYCSAtFOEG0s8dRKVWWZkPU+k5pomJXQGP9AUXH7HeRq+spylYZXr0+OMS3ynaxjUurfBq2CB3Y1Sj0JdaK8x7l56xH9KToIlOVhLr0pjDNCcl2y7vzCBTBIcbQfdeGhm0psaZIxVJvY3AlI/qRXfccLwjiBvMigzL2a9AkaLnZFhzAvHp3XCnbuDivIraW4J8KmUY1aM1uBzdZMWxtrrXhxz0FudHbgl5VrY8r8mnG5u77V7HTLBAHYuizwEeUX9P1rgSDFed3FYnWoqSi7UB+HQ7qXuYd50lRBTjOq49scwUWU3Q1/+u71vq/6GP7R0EbzZFj7UZEGKUpnoQt/qNIcxWEqS3ResoPZppJffONaV5D3k/KWgqKtTdGvcM8GWOBU0mUX7+vZTCbW/KYwfavFeekDOIcSN58aNVSM0hXp86TK2FeIeYrA2K1y+TNUFEnfpS45uZwiStZpLDfXlGvtqtAXiQxu1uEqQ7bG+rBiY7lqWozB+oY2LTog8Wm3L5fxxxIZ8y453w/lmB1Qq1fkRN42OezalW8IY1M1BSFQADc9dLupmKVPo2WrGjmI3Q5+Ajf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djBTTkhvejMvQzB6dTBvMkNaMmJha0RvZERUWGVFYkFqRmFwQWN2S084cVhu?=
 =?utf-8?B?S1dZMUVzUHdEWDR6RDFxZ0VPeUk4THg3S0V0dlhSVU9lN3JhTTFCSnBSMUhm?=
 =?utf-8?B?MlZpU3I2V1F5bGc5OHFVL256SDBuK0R1eVo0RmNBWjlzdkNYSUNKeTNSWTRx?=
 =?utf-8?B?Y1FOUy9rRUJ4Ry9PTGQ3NWxwbFdsWmZ1Mnc0c2xtTWtvYnZsd2llU1ZNWmxz?=
 =?utf-8?B?WXZLR2ZxL0lzM3FtVlNwREV2RVgxajdPN0JFdTllMVpDcVE4WGVxVENtRXJs?=
 =?utf-8?B?dTZMOVhmb3dEdk5UaEJUK2RqNTVDMkZuVXJZblVZQVNOcXMvYVMzRGVTT3Fw?=
 =?utf-8?B?c0UrSUhqR2YrQlJseGJFZ0xxbFA1aXJqSXcwb0RyREdBTVFpSFJDcTZOMEpq?=
 =?utf-8?B?WHFJZm9kbnMyMXU4MEI2bk5TYUNaaW5LeEdRV0xJYzh1NUk4a2xIOTJDUThP?=
 =?utf-8?B?NFFKdFRLN3gyQWtvcVM0eVVMMTlQaWVhY3JQRUFKME4rNVNsSG5NVWdLL1do?=
 =?utf-8?B?bDVhMjVsNWoya0ZyTmFKSEtxS25PelNpM055MkFpU2RNdWpHYW85TUxBWkRn?=
 =?utf-8?B?T3ZnblFTSFBHZXBoUmIzcnlHUExKdmdwblVUZENLQmYwdE5LNGR4WWdPV0Jx?=
 =?utf-8?B?eHhmd2wwMEp6eitiUHBhK3B4eFVUMTRkNFNPOWgwWWpSQTBMT1prbmUyYXFH?=
 =?utf-8?B?eVNXaWJPWWd0aE96VXpDam8vVHBmNXhseFJWOWhlRC9jaHdIMndheXE0OHlq?=
 =?utf-8?B?MVVSeHAzMkp2eUxqU2t0eHZpR1hLaWZUZy9sMWNmS1didFZVMEcrSW9wTndr?=
 =?utf-8?B?SFY1eGxMRmZZZXlpTE9aMGRYYXFMZUtJYXVHZ0ZJRVYyK3I1U01OUm9obDNX?=
 =?utf-8?B?c21RSXREWnQraTdheVZ5QmYySDVLanVaRzFIS1d5cENYd1ExTGhBeEJTaE9O?=
 =?utf-8?B?TnduVXRUbHF2WTFuWmFUdGxhcjlvRjFxNmNkZlVuWHc3MzFzL2RveUllQ1gv?=
 =?utf-8?B?MXpkZ3dDaG1HaFZqUjR3dm9WWUdHQWM5bm5jT3FXaHFkTm0rTmUxdWJVRWZM?=
 =?utf-8?B?aFBYazY3WkNVMWJTN3kxL1FnNWpYeDFISnFDekM5MldSNUNlUG9pVWpQNUMv?=
 =?utf-8?B?b2FCdDZuR25GcDZqNmtTYWg1cVB1Tm5HUEJlZFRsTGhRdDdOSHE0cjlLejFk?=
 =?utf-8?B?d1JpWjdZb1hpRno4K3BGNkI3ZjA4K2Y1eGtFdWhBUDZCUDlJTFFpT2FKV0d2?=
 =?utf-8?B?SGIrMkdKcEJ2OUl1RVd0dDRuRUhmQkhmSUJXelZPY1lTdDh2ZVVoNUU3aEor?=
 =?utf-8?B?ald4Wjl5Z0V3aGRIRVppUVFwYTRvcVJnY0hndVMwVFBPUmJ1Tkd2LzNjSnJV?=
 =?utf-8?B?dS92UFpQSlo0VmxWMnFPTDlvbkdqaDAvWUlaOCthZHJzdU9uUi8rWjU2ak1s?=
 =?utf-8?B?OFRtNDc3NEhjYW85TC9jeHBJUzRvMUQyY3krekRDclVkNFpxeDZ2SkMrcFFj?=
 =?utf-8?B?blh4Q09XekZmSnBRbjB0N0lMc0cvL3AvRDVXS2VDeWZQazFUMGIzQVZNSXBM?=
 =?utf-8?B?NVp0eUkvbDAzNHpHdGpYMWxFRVB0THVLMkwxOGFHcHVvZGRaK2NWSWV0T3R1?=
 =?utf-8?B?UkZ1dE5oS255OFFucXp0L3lzYnZGcDhZd3ZGcFJqN2dFNnQ1WFpYTUZjWG9w?=
 =?utf-8?B?V3crR2RMRU13eUVOc0hkczBocU5pMXhPam9nOGZ4SWllUGFIbmhJb3FsR1BM?=
 =?utf-8?B?LzVKdFF1MkZWeE9ZSUFnQ2JYaGtlSUk4cDQxenBwRXN1RWZucVBLU2RoSWZC?=
 =?utf-8?B?UlU0VkZiUGFkWGYrZlM3cU5WdVlxb25mdERrQjRnVkpKNFAyUDJ2MEZnNXhK?=
 =?utf-8?B?R216MC82aGR3V0lkZW84WEtWVWcxUW12ZmRJdUhKUlI4MlM0YzMzUEJpTk1Z?=
 =?utf-8?B?UUpBS1Jpc1dlQ2kzQXVpaEFtSzFmN0lpWUlVNFZmbzdBckdWYmpwVmV0Vm9r?=
 =?utf-8?B?U1NTZmRVWStESVBPclpJRGZMcTBzMm5NcXpPTndjbGlyVDZuUVV6U0hkbCs5?=
 =?utf-8?B?Y25ya0RHN1JrQVdvcUtCczZITEdYdCtUV1hEWjBrSmhvYkxjTWJ0RUxaTk9Z?=
 =?utf-8?B?S0FDMTVCNDVSL01DQWVKYldMYU5LUFdpSG81enRoQmwzV25tcE9DQUJKTkdR?=
 =?utf-8?B?ZXdvWW92eHV0OGdEenZtdk14bUNva3RBTVdqNkpkRTIzZ1hpayt6N1hMM3FR?=
 =?utf-8?B?ZGxCTGhCaUN1WXBFUW0yd1dKMWU5Y2ZrZmhBaFgzTWhXMDZUVERVeEs0b1F4?=
 =?utf-8?B?cXFjeVVGbGdhWmVCcmZVbGdHdlAxSUlVUnlSMGtac2FGZG1TS2RvQXJpeWV4?=
 =?utf-8?Q?hNT6nWfqLXrevCwEZCVSA0pXNT2lcTqNwL21D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef041b89-131d-4432-1ab3-08df086ea88f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 21:19:07.9159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wMuOr4yerxYJkKw5cEWLkIN6pvNPFyBE5x+/wVzbkRrnISfqng6FDuUGh/pstypmi0gnMh3lbkCtgyjVkmb0h/UvMZohaVsZtHlMu05Nyn5fhV3UGTqd4O2HBK+eip1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_141914_916598_A131E007 
X-CRM114-Status: GOOD (  26.94  )
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

T24gVHVlLCBTZXAgMDEsIDIwMjYgYXQgMDc6MzU6MzJQTSArMDgwMCwgQmlsbHkgVHNhaSB3cm90
ZToKPiBUaGUgQVNUMjcwMCBJM0MgY29udHJvbGxlciBjYXJyaWVzIGFuIEFTUEVFRCB2ZW5kb3Ig
ZXh0ZW5kZWQKPiBjYXBhYmlsaXR5IGRlc2NyaWJpbmcgYW4gaW4taG91c2UgY29udHJvbCBibG9j
ayBhbmQgYSBQSFkgcHJvZ3JhbW1pbmcKPiB3aW5kb3cuIFJlY29nbml6ZSB0aGUgQVNQRUVEIE1J
UEkgdmVuZG9yIElEIGluIHRoZSBleHRlbmRlZCBjYXBhYmlsaXR5Cj4gcGFyc2VyIGFuZCBjYWNo
ZSBib3RoIHJlZ2lzdGVyIGJhc2VzIHZpYSB0aGUgZ2VuZXJpYyB2ZW5kb3JfZGF0YQo+IHBvaW50
ZXIsIHdoaWNoIG90aGVyIHZlbmRvcnMgKGUuZy4gTlhQKSBhbHNvIHBvcHVsYXRlOyBhZGQgaXNf
YXNwZWVkKCkKPiB0byBpZGVudGlmeSBBU1BFRUQgc3BlY2lmaWNhbGx5Lgo+Cj4gQnJpbmdpbmcg
dGhlIGNvbnRyb2xsZXIgdXAgZm9yIHRyYW5zZmVycyBuZWVkcyBtb3JlIHRoYW4gdGhlIGdlbmVy
aWMKPiBIQ0kgcmVzZXQgc2VxdWVuY2U6IHRoZSB2ZW5kb3IgYmxvY2sgaGFzIHRvIGJlIHN3aXRj
aGVkIHRvIG1hc3Rlcgo+IG1vZGUsIFBIWSB0aW1pbmcgcmVnaXN0ZXJzIHByb2dyYW1tZWQgZnJv
bSB0aGUgc2VsZWN0ZWQgYnVzIHJhdGVzCj4gKHdpdGggYXNwZWVkLCogZGV2aWNlIHRyZWUgcHJv
cGVydGllcyB0byBvdmVycmlkZSB2YWx1ZXMgZGVyaXZlZCB1bmRlcgo+IG5vbWluYWwgYnVzIGxv
YWRpbmcpLCBhbmQgYWxsIGludGVycnVwdHMgZnVubmVsZWQgdGhyb3VnaCBhIHZlbmRvcgo+IHN1
bW1hcnkgcmVnaXN0ZXIgd2hvc2UgaGFuZGxlciBkaXNwYXRjaGVzIHRvIHRoZSBzYW1lIGNvcmUg
YW5kIElPCj4gaGFuZGxlcnMgYXMgdGhlIGdlbmVyaWMgcGF0aC4gTWFzdGVyIGNsb2NrIHN0YWxs
IGlzIGVuYWJsZWQgYWxvbmdzaWRlCj4gbWFzdGVyLW1vZGUgaW5pdCBzbyBhbiB1bmRlcnJ1biBw
YXVzZXMgYW5kIHJlc3VtZXMgdGhlIHRyYW5zZmVyCj4gaW5zdGVhZCBvZiBhYm9ydGluZyBpdC4g
SG9vayB0aGlzIGluaXRpYWxpemF0aW9uIGludG8gYnVzIHNldHVwIGFuZAo+IHJlc3VtZSBiZWhp
bmQgaXNfYXNwZWVkKCksIGFuZCBhY3F1aXJlIHRoZSBjb3JlIGNsb2NrIGFuZCByZXNldC1uYW1l
cwo+IHJlc291cmNlcyB0aGUgYmluZGluZyBkZXNjcmliZXMgZm9yIGl0Lgo+Cj4gRHVyaW5nIG5v
cm1hbCBvcGVyYXRpb24sIHRoZSB2ZW5kb3IgREFBIGluZGV4IHJlZ2lzdGVycyBtdXN0IGJlIHRv
bGQKPiB3aGljaCBEQVQgc2xvdCBpcyBiZWluZyBhc3NpZ25lZCBkdXJpbmcgRU5UREFBLCBhbmQg
dGhlIFBJTy9JQkkgRklGT3MKPiBuZWVkIHJlc2V0dGluZyBhZnRlciBhIERNQSBlcnJvciBvciBh
Ym9ydCDigJQgd2hpY2ggdGhlIGNvcmUgYWxyZWFkeQo+IGltcGxlbWVudHMgYmVoaW5kIEhDSV9R
VUlSS19ETUFfQUJPUlRfUkVRVUlSRVNfUElPX1JFU0VULCBzbyBzZXQgdGhhdAo+IHF1aXJrIHJh
dGhlciB0aGFuIG9wZW4tY29kaW5nIGEgc2VwYXJhdGUgcmVjb3ZlcnkgcGF0aC4KPgo+IFdpdGgg
dGhlIHJlcXVpcmVkIHN1cHBvcnQgaW4gcGxhY2UsIG1ha2UgdGhlICJhc3BlZWQsYXN0MjcwMC1p
M2MtaGNpIgo+IGNvbXBhdGlibGUgbWF0Y2hhYmxlIHdpdGggdGhlIERBVF9JTkRFWF9JU19BRERS
LCBETUFfNjRCSVQsCj4gRE1BX0FCT1JUX1JFUVVJUkVTX1BJT19SRVNFVCBhbmQgVFhfU1RBUlRf
VEhMRCBxdWlya3MsIGFuZCBzZXQKPiBpc19hc3BlZWQoKSBmcm9tIHRoZSBzYW1lIGNvbXBhdGli
bGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCaWxseSBUc2FpIDxiaWxseV90c2FpQGFzcGVlZHRlY2gu
Y29tPgo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLWZhYmxlLTUKPiAtLS0KPiAgZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9NYWtlZmlsZSAgICAgICAgfCAgIDIgKy0KPiAgZHJp
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jbWRfdjEuYyAgICAgICAgfCAgMjEgKysrCj4g
IGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jICAgICAgICAgIHwgMTc1ICsr
KysrKysrKysrKysrKystLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2V4dF9j
YXBzLmMgICAgICB8ICAxNSArKwo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2V4
dF9jYXBzLmggICAgICB8ICAgMSArCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kv
dmVuZG9yX2FzcGVlZC5jIHwgMjM0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJz
L2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL3ZlbmRvcl9hc3BlZWQuaCB8IDE3NCArKysrKysrKysr
KysrKysrKysKCm5lZWRuJ3QgInZlbmRvciIKCj4gIDcgZmlsZXMgY2hhbmdlZCwgNjA2IGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Ci4uLgo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9taXBpLWkzYy1oY2kvdmVuZG9yX2FzcGVlZC5oCj4gQEAgLTAsMCArMSwxNzQgQEAKPiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0zLUNsYXVzZSAqLwo+ICsvKgo+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMjYgQVNQRUVEIFRlY2hub2xvZ3kgSW5jLgo+ICsgKgo+ICsgKiBBU1QyNzAw
IHNwZWNpZmljIE1JUEkgSTNDIEhDSSBkZWZpbml0aW9ucwo+ICsgKi8KPiArCj4gKyNpZm5kZWYg
VkVORE9SX0FTUEVFRF9ICj4gKyNkZWZpbmUgVkVORE9SX0FTUEVFRF9ICj4gKwo+ICsjaW5jbHVk
ZSA8bGludXgvYml0ZmllbGQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gKwo+ICsjaW5j
bHVkZSAiZXh0X2NhcHMuaCIKPiArCj4gK3N0cnVjdCBjbGs7Cj4gK3N0cnVjdCByZXNldF9jb250
cm9sOwo+ICsKPiArLyoKPiArICogVGhlIEFTVDI3MDAgdmVuZG9yIGV4dGVuZGVkIGNhcGFiaWxp
dHkgcG9pbnRzIHRvIGFuIGluLWhvdXNlIGNvbnRyb2wKPiArICogYmxvY2sgYW5kIGEgUEhZIHBy
b2dyYW1taW5nIHdpbmRvdyBpbnNpZGUgdGhlIGNvbnRyb2xsZXIncyByZWdpc3Rlcgo+ICsgKiBz
cGFjZS4gVGhlIGNvcmUgY2xvY2sgYW5kIHJlc2V0IGxpbmVzIGFyZSBvbmx5IHNwZWNpZmllZCBp
biB0aGUKPiArICogQVNUMjcwMCBiaW5kaW5nIGFzIHdlbGwuIEFsbCBvZiBpdCBpcyBBU1BFRUQt
c3BlY2lmaWMsIHNvIGl0IGlzIGtlcHQKPiArICogb3V0IG9mIHRoZSBnZW5lcmljIHN0cnVjdCBp
M2NfaGNpIGFuZCByZWFjaGVkIGluc3RlYWQgdGhyb3VnaCBpdHMKPiArICogdmVuZG9yX2RhdGEg
cG9pbnRlci4KPiArICovCj4gK3N0cnVjdCBhc3BlZWRfaTNjX3ZlbmRvcl9kYXRhIHsKPiArCXZv
aWQgX19pb21lbSAqaW5ob3VzZV9yZWdzOwo+ICsJdm9pZCBfX2lvbWVtICpwaHlfcmVnczsKPiAr
CXN0cnVjdCByZXNldF9jb250cm9sICpyc3Q7Cj4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqZG1h
X3JzdDsKPiArCXN0cnVjdCBjbGsgKmNsazsKPiArfTsKCnNob3VsZCBiZSBpbiBhc3BlZWQuYwoK
PiArCj4gKy8qCj4gKyAqIGhjaS0+bWFzdGVyLmRldi5vZl9ub2RlIGlzIG9ubHkgdmFsaWQgb25j
ZSBpM2NfbWFzdGVyX3JlZ2lzdGVyKCkgaGFzCj4gKyAqIHJ1biBkZXZpY2Vfc2V0X25vZGUoKSBv
biBpdDsgcHJvYmUoKSBwcmUtcG9wdWxhdGVzIGl0IGJlZm9yZSB0aGF0Cj4gKyAqIHBvaW50IChz
ZWUgaTNjX2hjaV9wcm9iZSgpKSBzbyB0aGlzIHdvcmtzIGZyb20gZWFybHkgaW5pdCBvbndhcmQg
dG9vLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSBib29sIGlzX2FzcGVlZChzdHJ1Y3QgaTNjX2hj
aSAqaGNpKQo+ICt7Cj4gKwlyZXR1cm4gb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoaGNpLT5tYXN0
ZXIuZGV2Lm9mX25vZGUsCj4gKwkJCQkJImFzcGVlZCxhc3QyNzAwLWkzYy1oY2kiKTsKPiArfQoK
RG9uJ3Qgc3VnZ2VzdCBpc19hc3BlZWQoKSwgeW91IHNwbGl0IGVhY2ggZmVhdHVyZSBhbmQgdXNl
IGRydmRhdGEgbGlrZQpwcmV2aW91cyBRVUlSSy4KCkl0IHdpbGwgYmVjb21lIGNvbXBsZXggaWYg
bmV3IGNoaXAgYXBwZWFyLCBzdWNoIGFzcGVlZCxhc3QyODAwLWkzYy1oY2ksCgpGcmFuawoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
