Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E85CCF9E5
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Oct 2025 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F/NM4UL151vcjs+uZuAG9UtC3AqumlKsW3Rt2DmNCks=; b=GwoJ1OeFFF0WpCUZK49M8ZdvOx
	R7iSNfLPWxytYtC8EU6k2nq/b6L2N8xiWc3Jb5wIyqEF+49UVlMfa2WEkfs7o+QWVoWHmfipcNhu2
	+UVOo2ZEnbvuBimojwPoIfksuvwDDQRCt4azBzKguNkOELNNfHCZRJ9dwscrRjpPtPLdnIBLUuDg0
	S9Cxxod2sFgKpPQy8ZRk8QYByEtxT8CPDsR6DX7R/QTxA6DP9MEs5APKyF5c+FuYjEdkEHhg9MKxz
	Hegu9j+UC58Z5GI85L+budeTt1wBNTbzdS6BJzu4J/urcWPQ/LZw16qkg8xv4Eict5uGD47pbGJI1
	T+3zQNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTWd-0000000EiJE-3V3I;
	Mon, 27 Oct 2025 20:09:08 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTWb-0000000EiHZ-1COg
	for linux-i3c@lists.infradead.org;
	Mon, 27 Oct 2025 20:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbKbNqG0/hF6Po1XB9bbuZ/bUsMW8LXeNvF0R/9l9eaTW7kNivTDWSrqXA/tbpVY3V2sakkBWmY7vDKinMuVZi9GnE5m9kIazjCXxo1Hn3NDgexVbeBYuFqFaknlhwfFpsIxvxrT7W++Qv4dbU/EdWk+W1qMjUb7W2QFe09Gcb/WoreOYZeMewoKSODHWW1dWpC9EUdNxSJQY10ueHVplcIEGUC0jVA0rZHyt0cgglO4lkHUu5B8SDPNY+Nn8uVl07wUFslRdZElO30xP+Wik1v1scJyuLUPxtGWN+HF5PFD5Y2j8PwYa/SCVASFTEeAUogatzo1s9E6MlqYRG6Pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/2t9xOxRR0k6wvZLNSCm6blXDZasSeQSURQqJNw5AE=;
 b=zRA3OFqT78I4pCmtllRolHqhooNtY2cTsg1I7m11kqaOGclunWocdzPN6FJnb4XxlCG0INqP7BmYXNCf81I4e1AdQEalFcxwIRZavyASacgjMuCX0tqKvbf7nrrE4gvWXzDwDEVtYJHBrff5r0vZ0uM3aTFDcjsVZVJwn9b5ppd8auLs1eSYdQoE0S68h1e2Q38Sk/8/R75Zf2s/gGLfU0qVdhhW3SK61vBfBkrrNJsI7QgTfRFFcYlvYxAWeUcquwZRIHAWu3vDfRaVLqoQBXqIVao50LaSx9EY0xmat2EbjnpDJUJYN2ewp/i80azpciGuAOfIY6JOn0hbVhVBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/2t9xOxRR0k6wvZLNSCm6blXDZasSeQSURQqJNw5AE=;
 b=aFVi4ZmiM8juHAxiqJ8A3+bD/HDbgYlXdgQeeDkj2s3/rsQuq55M9l6fazEb/JfMQgcevsl9Qk19fKN+s1kQygquZVFMk1y8W+0v0pO1wjSFglQB6yTNMSY+HGAQtneDMg+v7Dl7uOygFTrz8EVJcxeM6ViR5Z7hW4I646manslRwlKgHdS/ge2lOjHp0SMvJKrE68kCOwHLR6g3gh17SiruTuJMTzZBjapljgKMEf90lCDeKg4cg+HMQ+fQgBTDgZGPKAaTCsoJFt5il5Larq5I3vK4CF1c6lsxUalZPoScMCP4eId0LYT2hFLN+U6bfYidrohEGSGBFolkJNFHNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI0PR04MB11919.eurprd04.prod.outlook.com (2603:10a6:800:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 20:09:01 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 20:09:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 27 Oct 2025 16:08:32 -0400
Subject: [PATCH v7 4/5] dt-bindings: trivial-devices: add MEMSIC 3-axis
 magnetometer
Message-Id: <20251027-i3c_ddr-v7-4-866a0ff7fc46@nxp.com>
References: <20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com>
In-Reply-To: <20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-iio@vger.kernel.org, 
 joshua.yeong@starfivetech.com, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761595722; l=1253;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=IyO4gvDiMVkIrAv3wfTcayqnmwaqUsnJdgwnigkUdYg=;
 b=Nn/swNVNqwPWEmaFeEPutx/o3tc1FFPWTJC+OZPmykJA/DfaRo138EQNXYdltdvo6zOmUGdQu
 UQZay5z0+Z9DfmQt3vohN/4QHYMdHWGbgcFZBFLjU5pwJ9KCi1G1EhZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF00013303.namprd07.prod.outlook.com
 (2603:10b6:518:1::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI0PR04MB11919:EE_
X-MS-Office365-Filtering-Correlation-Id: e5143b7b-bafa-45ff-1a07-08de1594ab69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXlaT3M3cW9LZVhIRjJrd0hST1pQSG5mVkhPTEI1OXc3b1RZUlJncnpwMDh2?=
 =?utf-8?B?a01RMmNxeGRyRERXalVyREtkN1Y2NFROOHZtQWt1RzZHa2dBMWxNUEV5S2h6?=
 =?utf-8?B?OXd0R1V2WWlEdDNaNTNmR0c3M2dvam1FQjhZTzV1dmk0Q2tnTnlHS2lrTm9G?=
 =?utf-8?B?RElYbHRlc2dhTms5MEdNOC9ZSXpEYTg2RXE5UnNINXRVQWJJc0drY0dIS21o?=
 =?utf-8?B?RlJtTHI5bVVKbFEzZ1pvRzN3SFh3LytIRE5CTDBLWlpmM0cxd3FVeGJRM1B3?=
 =?utf-8?B?dnFTM3JyaXIyUkZnZVpjSDZuVk4zZkEyNmZRQmp1cUdhVk44WmV3VXV2Mmdl?=
 =?utf-8?B?MFFMeXpHNC9vYkVkcWVweDN2bWlpa1lENlZmMG5LdXFzMCtLSU1RZEVyTS9J?=
 =?utf-8?B?YWtpYVo0TEUrcVFuL2o5a3UvUzE3OXhib2t2aG4xMDdVWmFxaDhlWFNuM2dP?=
 =?utf-8?B?cFVsaGJSaDNtV1drZXVUWDNrTTE4S3NBaDJFSzFiTEhvVFdTNWcrNzdJM2U0?=
 =?utf-8?B?Z3Z2NUpOQXdjZWZONU5tOTYyV1BpOEdFVWpxMEYxZ2E4di8wNjBtSXI0V2xH?=
 =?utf-8?B?S1UxZTRCT25LUUxIK00yUWd1SENRMmc1RGZ4MFhKcnB6QmhTK2l0R01vYklN?=
 =?utf-8?B?bXBFaTFmeHBZWlRQUGRYc0NLdzJVdmZLdjArRHRnSzdxa05hVVVRbjVoQnN6?=
 =?utf-8?B?WmtwRFNJeUhGMmplWmQwVlhjcTRzQnBLc3UvMEgwenFmUlJJT2lJZlQ2eXQ2?=
 =?utf-8?B?QThWeGlXN1o2aXFsbzZxb0JGMWNWV0N1ditUTlZVdWRJcjFWT1YwWXo0c2Jw?=
 =?utf-8?B?Q2h1b1EvWGZwU1FUZ1U3SlBKUFdYS3Jnb2c0ams3VTBNSEk3MjlWT3U5Yk5i?=
 =?utf-8?B?U0N6UHAwSHZhZkdFM2NTNERCa3RNY1B2U0xyUmVlR3hmVUwxRlFycjRFOUZp?=
 =?utf-8?B?eTlLcUdXNjJRZWlzOU1JTjlkRFc3OUx0eHc0eThtOWt6UUlZeVl2cFZqc3lw?=
 =?utf-8?B?bGhZdGFpc21oYnBRYUYrald6ZDd2RmNrdkVCOWp3R2d1QUhnSHVjdVZRb2Er?=
 =?utf-8?B?TlFtYXFBaCt3L1VKUEh3Q2FVclUzVzFOZ2RHODhXR3oxTmo2U0FmWVc3amEv?=
 =?utf-8?B?TjUyYW5LZk9IejdVQk9hWnM4QVNKMTJ1THBCZmJYVk9JQzZvNGt0ZUtsOUtu?=
 =?utf-8?B?OHpHbzl2THBwazFSNXdLb1E2TDh4OVZDWElRckZDbEFhVXdxbnEvR05LTHRK?=
 =?utf-8?B?QXQ5aFl0NUhUWFR6a0JVQjkvdE1yaHllalljMkFQTW5xSnRWMmtJR0F5ajlj?=
 =?utf-8?B?QzlrUmZQVjFhSHdqZWoxOWRwR0ZDdDdzZkIvKzBIdytpa1ZncE1aT1BTM1dD?=
 =?utf-8?B?UUE3c1FNZTljazJLZ2xPR3hCM3R4d1BReGlTaGdQWHM3R2xySzkweStIZHYz?=
 =?utf-8?B?YUVYczVXUHMvUHA5MTk4TWZSRDlVSVArdlI5N1VZMWs5bFZTaittaTZ6MzUy?=
 =?utf-8?B?M245ZThWOTl3c2t1Q1g0ZzM3TThMQ3JZdks5TTNMd0VXUWxhUVBFd01lMzdJ?=
 =?utf-8?B?Z0U3c01WQmRHUy8rL3BoYmN2U29rS2E1U1Bqck4wMHdzOW01MkJTYXd2NVpP?=
 =?utf-8?B?YWFlQkViSUFuU0tKOGI1SHVNazVPUEdvY293NFlUZ1RJWGtiR3Z4YklocnA5?=
 =?utf-8?B?emxJUElHOS9tV3A3NHpnemVpT1licDM1d0ZUREdsTW53ZmE2aVJERE5mYmll?=
 =?utf-8?B?cUdMLzNiZkN3cXBsSWxidUpmQU5jcTJEdVFoSXJyUFJDbTNmdERiUENEMVM2?=
 =?utf-8?B?dWdLODN5cXNWLzNjSlRnbytlTGNLbVN2OUdzb3JGWDdCMW5sSkJXWkdmWi9Y?=
 =?utf-8?B?TUJZWThZd1VlTVF3cVZwL3NEZU01Vm1oUEZIWDJOSmlYaGl0N3dINVJVUWwv?=
 =?utf-8?B?VWNVenZhck1pYlR4VTJWdTFHNWgxbHNpdGJoNjZQeFlPck9pS0FPMHlUZGh0?=
 =?utf-8?B?aWhJdmM5eTA2NzlaSlhNQUlObEgwUktuVDA5MEJ0cFdYaWlBN1pzYW5EVGEz?=
 =?utf-8?Q?yIpt3/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVTLzNGSXErbmg4VStXS1gzbitWdU4vSzJlWmpvall6ZWxhYmpVTUJHeUJG?=
 =?utf-8?B?TE4zMHMrMGdoZWgzS24yUnBRTjBLVWVuYWVtUWlna0NzYTZpTnM0aUdTbzNt?=
 =?utf-8?B?cm1IZGxPY1BNdERrdEtDVEllZWEyQldiMkZneUZYVXpNTVl3dnJPZVJtb0Fj?=
 =?utf-8?B?NFliMWU2cEUxOFB2N0FwcnM3L0xFaitHZThUY3QvYXcxY1F1d2JjRklxSHpn?=
 =?utf-8?B?YWcxVkFXR0Vzb053WnJjVHZNb1VHZnlEQ2s1b2p3N0EzVzF1ZlZ4eDJDZkxw?=
 =?utf-8?B?Ynppa1hTbk1SazB3Qkc5U1BxNHhNd091ZEdvbm0ya2N6ZzJxRDBxdk9Zc3R6?=
 =?utf-8?B?eTFaQ015MHJyY0N2RkhxeXVMMFYyOUF4Nmx1Z2ZGWkJEWGFzY0FqRG1PS3RB?=
 =?utf-8?B?Qko1RVd3QjVSNXJ5dFVIZ016NUM3bVFZOHhIL3JubVRqdjU3RmZMQTY2ZGRB?=
 =?utf-8?B?YU9aN2JxUjBrdnFJWXRjMFNsbWlONVNjN00yeEZrWTZScEw0RXZwUjQ3TUpV?=
 =?utf-8?B?OElwdWNCM1crdHJ6ckNUZ1ZpbkxJTmd3YXUvZVdGR0xnd1dLeUhzVWVna1dV?=
 =?utf-8?B?VGk0blpjQklaZDZQaGc4VWRTR2pHVmpZYVpKSG9xajJzUmova2IwVFZjVGti?=
 =?utf-8?B?NXJRdWJFd0oyeXVscHdFZ1hpT0J0RTV5Yk9HZDVUOXlrd0Nad2lWdUxxNW9W?=
 =?utf-8?B?bG8rNmxOT0RBZGNSRzVIMG04M2pUQXdRZFdOQXhQeEFGVG9TTHk1TEVnQUJv?=
 =?utf-8?B?WUhXTFhXSTBzcThQemxyb2ovN3dXRW95ZDF0aVczcUVsSDJoOTZSM3NjZ1Yz?=
 =?utf-8?B?cEtUSVNpMjJaRFlyRmJ5U1VmSEUrZlhyWVorZ3M2TEw2eC9TRm9ndEF3bEpk?=
 =?utf-8?B?MjdiQTlGTFVaWkpyb1BiZzg3am1CU0hqUVExRGJKd3JVZFJZWW9MWGw1akwr?=
 =?utf-8?B?NzBlWlZkTWRFYmVocXVqa0hsQ1M1SzVGNlp3Z1BNUWM4M283d0FxVzE3K0dn?=
 =?utf-8?B?b3FscHBianhPYzFPVGQ5MlNOcGFaR0thSCtHQ1lNSFdOUWhvNkJrcHE5QmhQ?=
 =?utf-8?B?UlBNVUNCYTA2WVJvc3orQzREZ3pCay9iVjh1ckhOOStBK1FjeEhPZU1xL1Zz?=
 =?utf-8?B?K2RpMzZDUENHV3FMRjVER1g5NGZjT2VIRHJqWkVTTFJPOWxVZmRiMmRYbjB4?=
 =?utf-8?B?S1BZYnBWSENKZk5jbVhCN2tVdHlML3lwUUgwT09Vb3d6SVFSU2VaWGlRRVlQ?=
 =?utf-8?B?WEZ1cHBWeHErSlhTTjZJdFdjSDBhem5oTk1CeWZmZm5HMzl4QWs1K1JVMWti?=
 =?utf-8?B?N3piZG9ZQUExb3Y4NWN1NFpLN3JuU2dBK0NtdTFOQXcvRncwN21KUVB2dXhm?=
 =?utf-8?B?WnVBQnVCRURnSHEyQlYzb3RScUJxajN6ekZDbGN4NlVUNVYyNUgrVFBkTkxr?=
 =?utf-8?B?djREK2tJM0l4MG1WNmZxUnJmTW1YL2hvNnNPTGswVUV5N1c1aGtnN2hHUEp5?=
 =?utf-8?B?eC9GQTRiandRaU93dEtHN0tld2FZN0RvM3RBZUJvcXh6WUdoKzVaeTExZits?=
 =?utf-8?B?R2doNklpMk41T3F0T3NWRUd0cm4xTVJCanVxVE93MmlhbDZ4TGVnRlJ6NTEz?=
 =?utf-8?B?RUg2ZnV3YnA0WU0wQnRNU21XZWVyaXBCdUlRTi9lL2pCeTNSWHVhL1VNazJk?=
 =?utf-8?B?UmNHTzZhdVJzdlJSNTVTVjJKcHZzbU93eEs4TnQ5QTY4SHp0cEZqVGVkT2p1?=
 =?utf-8?B?WVVRYjB6azcrRElTWjRJemlpRm9rMW1KczU4cnJJM1VSMkl5aERLZzNmTG04?=
 =?utf-8?B?Z1YzQ0RBT1BwMmFiZlZYK052MkE1Q0dIb0VKSWR3bjdmanlQMmZHS29xT3Ro?=
 =?utf-8?B?endYTGhEU3JGSVJEU0xnNldWR1FiR0psdUxvaklzZlNpS3lCMTA0blJBalhB?=
 =?utf-8?B?VGZTNk5sZlQvYkJOMFJGMXMvR1pTbUk3WGlsNEdNMmRFNXBOQy9pdlNpSHRF?=
 =?utf-8?B?WXZRektiMXhUTDNDTTVabHMwSWpYMTBHMy9scDVjbWdYeERrUjZUMENRMmVt?=
 =?utf-8?B?bVFXQjU4d0g0dE1CR2UxeGNxNmpxZk9nQy9ZaUx1N3pvWVM0V1Y4OU5KbmNn?=
 =?utf-8?Q?ux5I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5143b7b-bafa-45ff-1a07-08de1594ab69
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:09:00.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPW61T5eHR9tvnSdBxLuYRmCw09DXaSrkeO+W5qmuETILQd1ctxjZ/UwFg0Ib3YkurCQQnDkniIlarYETIdA2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_130905_356350_E2378D7D 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Add compatible string 'memsic,mmc5603' and 'memsic,mmc5633' for
MEMSIC 3-axis magnetometer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v7
- none

Changes in v6:
- add Conor Dooley ack tag.

Changes in v5
- none

Changes in v4
- add memsic,mmc5603

Changes from v1 .. v3
- None
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2eff6f274302add1ef8f6ae9ec9672697bc812ea..94fc8ff4504b5dc2c0fd7b384f6acaae3d5f80a4 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -227,6 +227,10 @@ properties:
           - meas,tsys01
             # MEMSIC magnetometer
           - memsic,mmc35240
+            # MEMSIC 3-axis magnetometer
+          - memsic,mmc5603
+            # MEMSIC 3-axis magnetometer (Support I3C HDR)
+          - memsic,mmc5633
             # MEMSIC 3-axis accelerometer
           - memsic,mxc4005
             # MEMSIC 2-axis 8-bit digital accelerometer

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
