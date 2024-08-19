Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD640C52D7C
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Aug 2024 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7AI6/H7SBpYEXJZDstCYiDrkAz7aOHj8mZS6LynlF9g=; b=OUKx5QX8CioOuV3RtC34UViK4y
	/VyYM7tbrpK4muWtD8bTZXvw8e08O46ntV62kwj1lze9Q+t2/te9LkaVf9qvHLimcyQtaFD+m+cXR
	PKbvVSJZ9TmBaYPlFxfd6QXFdM/3CWize0VA/SO706dwr684TTKmwfZPRDCcvEZW8Yg/79h2/74bQ
	eGAAhih8wNI7JflItaagR2BzFGQ2p8otQ0qdGT/wLJaPzrJTkpOfX03qVunKdoqz+jGw8aCwKEpo9
	c5Z1IHGWFEH6tqvRh0IbW5pX/CGZzQ3icVZFn266drNxuJO+606s+wmXtESZxXGRT+aJZw7H0/0tg
	18uN1+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4qm-000000024hy-2L98;
	Mon, 19 Aug 2024 16:03:20 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4q0-000000024DK-32c2
	for linux-i3c@lists.infradead.org;
	Mon, 19 Aug 2024 16:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSMUQs/raDWipPcsG5zENM1+XzHEOPakEVYgvVkjWb8g5OWUMfPZFUxodW2aBecBYYqZ+OiPJJl2WS5BGRGnosdyAmwAM+oSBAPOTxpM3sURDGEgUAnivGQCGW6/x1EBqkWOH9PIXoL4ggUEepNKCOB4Bk/4I+xsmrsl8woo/5+VEBFSfSfpCSKdNaefQgMzIA1W/JAoyVjjapj5P1gdkMjTXMJoPQed4NNDPYQvDXqhSWDBI5wdJWdUovLNn2itQHEOkYTEPxB5Em9qmup8BydV0+yhhs+l7mNtz71MlLbayy2JehxQ+ZY47WwGV/bsF43NJB//tTIiQ6rKzuXANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khB9K849nl/MU67dxO7G2LRxt5J+Bs0EnkTKFa+J0gI=;
 b=YXcsPCgaDbznlWHD/b642IHS0YFq4IgGhYPg/l/3k6Fpo7++sST45juLRFfpSSh9IaGPWIS58SM4zBHq9IdSSB9QXXZEH/WrD+W4NKWf4T3jka5x7zgF3rpSS6K9QUOlIVuzREVQml6YTHE7LpcM22FKseRrXniHYwU9yuhCQz+oDOrBg4C8VzKU7uLuy6fpyeRgbEtHOTapBujRDAE60EN5tIObTu0BN80kLKb+vb6IQS8jOlwxIIT2QE5IUncjruWE5kIqTGGYj2Bh2fj3cjAB2SgcnBpZgj3UNmrvisuFznGGg1129BWdYx9vZWg62fP5vod5rJRXJ/sCJbyxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khB9K849nl/MU67dxO7G2LRxt5J+Bs0EnkTKFa+J0gI=;
 b=VT9wjUSVSwuWc92TMteATOOB4zdN/JK0idyf70hN4GoAdV/wKdVUMiagZnmKhNB10NHM5v8O5PvWfIOYmQgf3JsoKaBlWafL2EMZ+FM3AbFYqI1mG0+/ckCl+geiyGyuh2qqMEt/0pd95P+gqZ+6N/nvLyLR7PpR+D5P0XxbBJf6qIADmj0m/VvniutllUlCjfStAeQSuxmKq8pWmj6ZxDGCSNMxxBbz8/idCDG1mQ1Dz9Q+hIao/hOT4RQFrzajRkFx2ZWmncI8l8R/tdN8ikxRKuf/lIxhrgYQH7DJ+Lgv4X0iBW3olUcsYmdVGf9YSoFC8hDrpXjnBfqYdjtCpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 16:02:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 16:02:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 19 Aug 2024 12:01:58 -0400
Subject: [PATCH v3 04/11] i3c: master: Fix dynamic address leak when
 'assigned-address' is present
Message-Id: <20240819-i3c_fix-v3-4-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
In-Reply-To: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Parshuram Thombare <pthombar@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, stable@kernel.org
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724083326; l=3637;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=phlwJ/9jw9NpeTB7NJPyHYpdTuYWHApnsz953oBcxmA=;
 b=T8jmLDD61caEY6FKsJk9EB1yCOsJ6DQjBeSuejdIN9NGKNUu4DuLwCya/eUH2pM8Fz4PvP1+b
 9TelFo7AohdCHMr3Q+/jHeOrNCacVcwb71VLPm6CtHpsZobZIT8kRX2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:806:20::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 01371e4f-ba54-4565-f2c1-08dcc0684ce0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzRFNjh1S05Cbm03RHdNb01QdGJpOWRBRE5QWFFpVldlYWh4SlB4aVNtRmQ2?=
 =?utf-8?B?dzlJWkhsRFRGRWZuYnYzb0JvTysxanRIM2UrWDlWUitQOGpRa0d1em10RklX?=
 =?utf-8?B?YmNMNFJ5allRRjRveEllY09XcXVReStscmFqNEdjdDR4UGhKNGhyYWhiOWp6?=
 =?utf-8?B?ZW8vaWhGRDNTamFVcHFVVWtmQ1MzeDl1bnZLOEVKQ1R6MFRZQTdCanB0N1hL?=
 =?utf-8?B?OTFSNEd0em85cHlHSGtMSGFrV1BnOUJRc0p1STA3ZlVHTW5KRk0rejdUMWR0?=
 =?utf-8?B?VEhIbFRJZTJmMFdNUEk1LytoNDZxbENpNVZaQ1M5WEZtYnJNWGtSZHhZQ25R?=
 =?utf-8?B?QlJockdQRlQ0MGdSU0dsTUxETHdNbnd4TTZLemVBcUg1UUNvUHZHY0lZbUNC?=
 =?utf-8?B?eStLOHQ3M0RvT29UaDBVcE82bjNVVUpMWGQraGw4QVdNUDh0RW12SWEzcEpy?=
 =?utf-8?B?OWNkejhqRnA5dUxKM2lpcHdTOG1lbUZUSWFkenVmQkgvT0pRRDFCOStzVmlY?=
 =?utf-8?B?cGxLVW5jbG8wZmxZeWF4SkZ1T1poZExaU3NBSTlLeWdhNk9Oc1BYbkowV3A4?=
 =?utf-8?B?T2RNSHZ2NUdKNnJhRWdSQ0QwdnFUYlFya055RHUzLzVtMnh4a0ZqSmNySkQy?=
 =?utf-8?B?cEw2Zm9lRitubzZmQWt6L0RLYklJOEtFR0Z0bHhVMGZIK0dyR2MzdXl0T0Jh?=
 =?utf-8?B?WDduOC9ZRUtpMjNhdzFJQW5QSzg1dHNNVGgxZlJCZHFjUkZSMWViMnZaSHRM?=
 =?utf-8?B?TGgxYnpQY1dNby9QUDhUY1BUTFlUL3lYYkJYZ2VmTzI2TldaTTlnakRGaVZ2?=
 =?utf-8?B?SDBTTjVmOFpPbk4zVlNGeFNrd2VoTm4zbmhxTlhvRG1JdGFlWDVqUmxPdWxZ?=
 =?utf-8?B?VDU5QXZ3d1F0UUh2MmJkMTBUelpWUnJPMWh6dFZXbExKZisveFJma2xDUXRV?=
 =?utf-8?B?VS9Kd1dnaTc3M3Y1RHVBeDhpUXpCbW1Pai9Ka3RYTkFEVXZ0cmtZbUVFL042?=
 =?utf-8?B?dk5QSnRtK09aYjExbzNwWVdMU3JNcUdYWjBOQ3EvVDR5MzQ5MTYvSm9EeXlQ?=
 =?utf-8?B?VDYxOTZqSXB6SGxDQy9oUStjM1E3THFNMTM2bGRNc1JQMnVHcWlJaGZMSTFs?=
 =?utf-8?B?Q2l5elNVUkFZY3hIak1OVDRqclhrcDJMNFdiZVZlREcwbk4zVHBCMUFBTlRQ?=
 =?utf-8?B?Sk9VZnNvckJyT0VjQnVob3czNWN6a0IwVVBCeXM0ZTR1WlhCWTJFb3FTa0p3?=
 =?utf-8?B?cFdnSUJKZ2VQVjZYd3kwZ3hWOUJUL0FzbDR5OEhGOHk1U2svL2I4b1pVMDJq?=
 =?utf-8?B?VHprL1FBRXp4WHZIM1RaT1pJUnNrOFBKUWVRM3ZESGt1Sm45ODRJMTh0ZVNS?=
 =?utf-8?B?L0FlOXBZa2F4MGlqNWRaTGEzSDF1SExHUDh5V3g3RlM2TEdhSTc1SWNQSVk4?=
 =?utf-8?B?T2JaNU8vN1FXdGZzTHhKeUVPYjJCWlFTcGtJNm5aNkJ1eFJJeXVNQXFXdFRt?=
 =?utf-8?B?K09jUS81emFPU2VOdEtZYlB4SHo4NytOeDJOM2tES0RyaXN5LzNVK09MR04v?=
 =?utf-8?B?bVJVMmhvZmxLTjduOVRPZE9iMGdIa1JCaWIvc05wZGh2WDl2MHgzVkw3amM3?=
 =?utf-8?B?dlB3UGRyRXNBUHkrY2xQUUhWNFMrOEw4dnZHdzVLa0xIUjF3aVhlK2ZjRHhm?=
 =?utf-8?B?d25mT0NWd2JIbjFhUWZkVFloc1p6WGZ3c2J1QmxDUXJzMEIwbGtyODQ0N0hE?=
 =?utf-8?B?YXluQXJQL016bk9iQmh0Y1dHcWdDK2w1VDl2STBJTlRRUzQrcFg5R28yTFVS?=
 =?utf-8?B?ZXNoWkJ0L05IZWZ5eDNTVForVnpQR0JWaUNEeUFaU215WkQvWnBBVWEvMlVJ?=
 =?utf-8?B?UzJrM2UyejJmakErV3VBeGk3Z21YMHRnMDhQQWVxclNPaXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDA5UTA1amErMFlNdnVISW1BWWdncnFVZ2x2aXgrTFFoQ05ZVCtHdnRXVjgx?=
 =?utf-8?B?V25MVGs3eVJyRDdhK2RieDR0QTg2eE5LdVZQdDVRbXBSdTllVzBKcWU2MGdX?=
 =?utf-8?B?aVlxY3hHYXNiNWpLUjZzbTZxL3M2NjlWRksremNvR29rTEJLVFh2bGZZUE4r?=
 =?utf-8?B?VUZSMFVwdGdQa2hRR2FTTGdZTUptemNHa1BEQ0g1Vko3OHdnelM5bWhUODJQ?=
 =?utf-8?B?OEQ3dFNJTVk4YlZYOGpQaGNCT01PN2I5TjI5MmlieFF6SVBHeGdpeVNHYU1v?=
 =?utf-8?B?UkN3WTNqMVlkNFdZdGx0Z0lCSzNNK3A2TEdCdXNQVlJtb1lOSTRaT2xNTVIw?=
 =?utf-8?B?cjI2UjhKdUdkTElDaXYxOUdDZE82TVZNVUtFcDd4ZGVKVmV6dFZJL01kWndI?=
 =?utf-8?B?YlVERklBVkRoUmhGclNmTktVQ2VnTlBWR1hMSm5LajA0QkpPazVPaUI4QmdQ?=
 =?utf-8?B?RHovczg4b1ZTMHg4cE9ObS9iRlRydlA0NzRHRnVZWWVJTEtRL25OcFc2R1ZI?=
 =?utf-8?B?eFplbjZLd052WnErWFBLTmpGMHRVNGdSMFdSK05neVp5S2c1aG9QTVl0Q2Rh?=
 =?utf-8?B?L1JTWG9PdHJlcnZxZmZqS3M1UmJxd1Y1SDJwUTJyRVVCdndreitGM29JcERF?=
 =?utf-8?B?d2gvYUN5Y1A3SjVacE16RzB4eXU3UHZGVUs1cEFldXdiaWtJaDZ1NTR2VHlZ?=
 =?utf-8?B?SXhUWVBrSFN0YTZoMDJOb0ZxRlg3Zm5RRGJoajNVVjVKQk91cHR3R05neEJ5?=
 =?utf-8?B?WStvckkrTXI4VllDbXJrb1JEVTJNcTRWc1ZTU3dPcW94VklKRUpqVmZsZTNF?=
 =?utf-8?B?Slp2OEdoOWtoaVkwMVlZNVZacUZ5QllwZWtnMnltNUNhOVp5REVxaEZ2dnJz?=
 =?utf-8?B?US9LY0hkakFZcS9sSHRkMzlRNUZ2c0lUdzJvVVMvWjBDT1dYQkNzenEzU3JC?=
 =?utf-8?B?ZmNNcTB0U1p5ZW9tWXRLWFFJdElpcDF1d2xROGdEUENOUHE2Vk51cWp6a1Bn?=
 =?utf-8?B?NWFSMk1UTkxGOUVhT1J3QnNSMURpeFU4K1hyYjl5RnozbnEwOE5NcnpPOTYv?=
 =?utf-8?B?emxSaGFNNTRpNFVhTzFTYXpBQnV6QzA2eHpVV3l4b2RRRDZEWTVkUWllcVFu?=
 =?utf-8?B?NFA2OXJGL0dOR3dzQzJVRlBMSGhINnBocVRrVGVYdmMzMjAzbm9VSDF5MENk?=
 =?utf-8?B?MFlDbmlES2pFK0NEc3RHZXRBeExtZVQ2ZlpjK1ROZnEzMSt2c0Vrb3FGUnpp?=
 =?utf-8?B?TTd2bklxTWJnaWprUFdSa0JCekRYMUh3SFZBNittaXZnN3grQzIxVXhHbGhL?=
 =?utf-8?B?ZE9tU2VielgwYzFXVVloVThDRzh0RmVEYmJ6TXJCNDYwUThSRDN3UXVsT1RK?=
 =?utf-8?B?OUFhdWh3TjhLRXNJTnF4RWcrSDhiYU9nSTloclRGQmlmUVlHMm5JbHIrQlNq?=
 =?utf-8?B?YVVleUczQnlXTkVTdlRtbGVrMzNyNzcrS0YrVy92a3pEaEgvMEN0bVBCNnIw?=
 =?utf-8?B?TnpnNzFsa2hlb3ZZb1d1UUtuZUpXK2ZWWGdjRldGOWhkdkQ1K1F5MWhTdzdL?=
 =?utf-8?B?b09adk8vS2plMS9VT05CLzJ2eVN1ckJQTXBrYTlPdVlqUnhmRU8xaFUrM1pD?=
 =?utf-8?B?WWhvT05RcWwyaG82ODViK0lVNzVQSjloVXJENlByYm95d3p3bjhxeEtROTdX?=
 =?utf-8?B?YlMxd2h0K0lPc2JKVFlXaktubXpORDFwZEFWcUZBdDIrWndUaW1KTFJ3K3hH?=
 =?utf-8?B?eFd6TW5nUWo1cTYxYTdWMjlrbzhOb0ZYMkR5UWJDRTM5cmR1d1V6SWF2K0gv?=
 =?utf-8?B?ZCtCVUp1Wkl6OUUvWlNjMFVLOGVRV3pVa1FveWl3ZmhWWHk0WHRhdStwL2xJ?=
 =?utf-8?B?b2RFZHo1YklZUklWQkVlMTZYdERNYVRKdVpLTTBINytQc3FMYkl2NVd0OFR5?=
 =?utf-8?B?YjlNZDVMcWZIdEJFeGNUbmUrV0Z5MndEbXhyS2xrYXYzNjY2Ui9QT1ZncUZ0?=
 =?utf-8?B?d2MyYmkvc2NFdEtiU1FnZHFybVlGaytsckFlM2dqOUxVc0VrQmQ2KzAzZyts?=
 =?utf-8?B?VFRYUUs5ZFdkV1puemswTWY0TERHeFMwYkZUdW1sNkVjNHQyS3FIRlNVZElQ?=
 =?utf-8?Q?huu7jf+p8tbMzTGxr+qya5DGB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01371e4f-ba54-4565-f2c1-08dcc0684ce0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 16:02:17.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr/4+yAui4egw8RTGa3zsIEFZoc5FVL0Uda6w1/x6LgXxcwCGD9JWVDi6uW7hdWyt1N8O/3FR2T8BS05jCSmjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_090232_812785_61F75C46 
X-CRM114-Status: GOOD (  13.14  )
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

If the DTS contains 'assigned-address', a dynamic address leak occurs
during hotjoin events.

Assume a device have assigned-address 0xb.
  - Device issue Hotjoin
  - Call i3c_master_do_daa()
  - Call driver xxx_do_daa()
  - Call i3c_master_get_free_addr() to get dynamic address 0x9
  - i3c_master_add_i3c_dev_locked(0x9)
  -     expected_dyn_addr  = newdev->boardinfo->init_dyn_addr (0xb);
  -     i3c_master_reattach_i3c_dev(newdev(0xb), old_dyn_addr(0x9));
  -         if (dev->info.dyn_addr != old_dyn_addr &&
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 0xb != 0x9 -> TRUE
                (!dev->boardinfo ||
                 ^^^^^^^^^^^^^^^ ->  FALSE
                 dev->info.dyn_addr != dev->boardinfo->init_dyn_addr)) {
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                 0xb != 0xb      ->  FALSE
                 ...
                 i3c_bus_set_addr_slot_status(&master->bus, old_dyn_addr,
                                                     I3C_ADDR_SLOT_FREE);
		 ^^^
                 This will be skipped. So old_dyn_addr never free
            }

  - i3c_master_get_free_addr() will return increased sequence number.

Remove dev->info.dyn_addr != dev->boardinfo->init_dyn_addr condition check.
dev->info.dyn_addr should be checked before calling this function because
i3c_master_setnewda_locked() has already been called and the target device
has already accepted dyn_addr. It is too late to check if dyn_addr is free
in i3c_master_reattach_i3c_dev().

Add check to ensure expected_dyn_addr is free before
i3c_master_setnewda_locked().

Fixes: cc3a392d69b6 ("i3c: master: fix for SETDASA and DAA process")
Cc: stable@kernel.org
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 4281f673e08d8..c8eaeada54781 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1531,16 +1531,9 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 				       u8 old_dyn_addr)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
-	enum i3c_addr_slot_status status;
 	int ret;
 
-	if (dev->info.dyn_addr != old_dyn_addr &&
-	    (!dev->boardinfo ||
-	     dev->info.dyn_addr != dev->boardinfo->init_dyn_addr)) {
-		status = i3c_bus_get_addr_slot_status(&master->bus,
-						      dev->info.dyn_addr);
-		if (status != I3C_ADDR_SLOT_FREE)
-			return -EBUSY;
+	if (dev->info.dyn_addr != old_dyn_addr) {
 		i3c_bus_set_addr_slot_status(&master->bus,
 					     dev->info.dyn_addr,
 					     I3C_ADDR_SLOT_I3C_DEV);
@@ -1931,9 +1924,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 			goto err_rstdaa;
 		}
 
+		/* Not mark as occupied until real device exist in bus */
 		i3c_bus_set_addr_slot_status_ext(&master->bus,
 						 i3cboardinfo->init_dyn_addr,
-						 I3C_ADDR_SLOT_I3C_DEV | I3C_ADDR_SLOT_EXT_INIT);
+						 I3C_ADDR_SLOT_EXT_INIT);
 
 		/*
 		 * Only try to create/attach devices that have a static
@@ -2094,7 +2088,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	else
 		expected_dyn_addr = newdev->info.dyn_addr;
 
-	if (newdev->info.dyn_addr != expected_dyn_addr) {
+	if (newdev->info.dyn_addr != expected_dyn_addr &&
+	    i3c_bus_get_addr_slot_status(&master->bus, expected_dyn_addr) == I3C_ADDR_SLOT_FREE) {
 		/*
 		 * Try to apply the expected dynamic address. If it fails, keep
 		 * the address assigned by the master.

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
