Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CBC3DA63
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6bp/tQqlBOp7EXkQkdMksXeso+Qnl4xw3VX1tOEdRxU=; b=TnwvyIxxpI2rlY/+FeJpLzPOgT
	kHMjDAHmRLWZ96UI2p+RVqDptAMX7SJHwtmbHnBvUGpeFjSGO5H6oeHPF2n2T2GdlLT0bAq7LCOge
	uRvng3MnSGHSHGUzm0abq52KSFtiaOhyi+gL4mnRl8DyjPXAIIzDbEh69dAYJDyndh/02W8mA3wBd
	oewoYl4KjBsI+g06zdc7ORz+RNGQMKRyu0exb7vSrhziJK4nEL/eGLmccBvXMdN8rFu6NUYD7cDLv
	dBRGP4XY8mrfR0UQSPmeGPZ6jUZyklvxDHmZpPumnaOpsHfIa0Fk6ud8eUgViggOJE0DbUefU5ByM
	rSxG0jow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWeCG-0000000Fp0n-3bYp;
	Wed, 24 Jul 2024 15:46:32 +0000
Received: from mail-am7eur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260e::601] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWeCD-0000000Foyc-3uaO
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 15:46:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE3/41bCQMojSs2o5XfAeVyC3ky0SQbfnvgkVSsZWfFhHJmj9qZLb55Sv3STgHHKERVLafAzhmt82q6AIW8euhFGRokN45VQR7KqE0zxdlXwU2WLbOMV5yxigzkQnUtfVwwLu1W0vPPiL/gu9wO9nK+aXACwV+3Y6PtZqU5kD2GHYmKASps/mb18NsK327YTVsIMJpxu5YUEQWc9ucq0LJCu1yXS0KJknGpz3xwGVtNuw/G2ipBEN2jD06newICeqMNf7vYtdaqByNbdTkQDJAudhyY0xkLPk8H4e87lpwxaCIj5BjIekb08WZMgTER2xX8GM7W+8Hqf4jZRc5cftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZHzogEyoKA0FrCgQ8jcF7EjjYfhLpLTAtbn8jWUYd0=;
 b=OlyQ/+7T93lo0ecrPGaYKB/IdR5kO7VG1S30vy8g9mOjjX24jZAP5N1/3nJTRi400xWJRGu+XlyXQ0QDtkqiob52z4Rj4kvwyRYM9Jt2j9sUCDu4AWSKm8Ftv0vxG0vkQOEsqFUD2eKP24iAC2hlUaXh2DWHWuUiG2LqCLKak3oVQaODvMZdZGkujrNW9mtEksCzmmRlA59YgS6wb/lup/2yiijE2f6eo9zlZmNnj1fgpf5Hor7FgM65AnUL95mfGkVVsdsxUCjuRSMekXaDHhYUc7THglAtuFZpLzWwk19FQSal+qkeCcglp9mOhD3esKEHc3DwuoNxOdsue8jgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZHzogEyoKA0FrCgQ8jcF7EjjYfhLpLTAtbn8jWUYd0=;
 b=nP0cI2DglCsZMvDyldJ+TfBzlVyfz2Y+XpiORwfQrzy7pPgeBXDKhFJ7GR5t+0LMe1dHASWEjyrxcpuBtw655OlR9Oz514WGj7hTmTYiy8Yab49WKQVS/kRRlqggOZ4Oz0LkQDbd/+4mWesfnOra1hFuKc65hoV/kNwen18T+aaGEzal2q2F9VrDZy0XkXYeiGnJN2F9AFdB+Tr6U2asurwAPOA+hvvKoiqUqCnhopzWlYS6NZbDcayq5NbSSP3N0vvSO8A7EmHD77PBOZKVi0V6fqsoTAPKD1Jy7DH3m4W+xqHfKqkD/oFFvSS+vut6/6yDCzcusobtAWqobSPqJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 15:46:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 15:46:21 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 24 Jul 2024 11:45:50 -0400
Subject: [PATCH 5/7] i3c: master: Fix miss free init_dyn_addr at
 i3c_master_put_i3c_addrs()
Message-Id: <20240724-i3c_fix-v1-5-bfa500b023d6@nxp.com>
References: <20240724-i3c_fix-v1-0-bfa500b023d6@nxp.com>
In-Reply-To: <20240724-i3c_fix-v1-0-bfa500b023d6@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Parshuram Thombare <pthombar@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, stable@kernel.org
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721835962; l=1049;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EgTA/bzPVGwsyEemXX3hWkQUEBTDZOU6gFrO4erNl9A=;
 b=0UuauI2+/BTetwObzpVZ+YmX7TCq/xYlCGHfHnPIu8OVeBh3FhdtPHT242b84hOpHYMFpmh+i
 vLeIEA3LZIlB+2HaUC9OWqBX7RUYV7fAywjzPdEUccBjPD9eqJIG6oW
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: cb70048c-8e9e-49ec-dd28-08dcabf7c3e7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlVSVldoUlVacXdTa0xHSEg1aFNTcURackowSnFnb3FIUitxVG44eEMrNWhV?=
 =?utf-8?B?K00weEQ4dXNwTUE0ODl0VFhKRWFoWjUvbVRuemtTMkErd1c0OGFHSzQ4Rjg5?=
 =?utf-8?B?UG9OMGRvOVZteWNoOEJ3Q2JnZ2ZGenF1SzIzaEh5RTgrNjk1NGs3RUN6Uktx?=
 =?utf-8?B?Ukw3RFErbFlNeXYvR0E5N2FUVHdTaG9kT2ZINkZ4TGYxMVowSGFnc0ZYRGU2?=
 =?utf-8?B?UmswcGtlLzNZc2d2ekpDRm9MdGFVUit1dnhKaDNCMldPc2pQMkFJZXFYdUU5?=
 =?utf-8?B?U2xBTFpuMFFUQmFiMnR5YkxXeXdVeTNNUWpuSThtd08yRGZRbksrWXBZbXpT?=
 =?utf-8?B?K053WEQvQVBvaWJCQmJVN0xSeTQ0SXpsbyt3b2hOU2o3cW5pcHhqNmVBUlkr?=
 =?utf-8?B?N3FUc0h4REhlWUFzRXBBOFF0dkpFUGhaMERIME9zdFcwdkpmL1d0MlN2K01V?=
 =?utf-8?B?UHdRaHhuZk5sbnRoclA2aG5lOWhScC9xQ0RqTHRaQ0ZYRG9adDVLdnFkd2h4?=
 =?utf-8?B?N0VYeitjQ2lQNk1LSEdtUXoxaTNyZFlMT2NPT3hiVDJyRnU4Qjg4WjJIUDJz?=
 =?utf-8?B?TDhTdXpJUVdUL0s0d3FmTUdXc3VFZE5ESElLNjJ6UTQwdWlVZEFEOWRrakpy?=
 =?utf-8?B?WDhFbGJBbzB5aTVSS0dSU3RpQjljdmlWTG42YlZXZlpKaHZnQUxvOHNtNjBP?=
 =?utf-8?B?UjJMNjFKMUhBV25aeGRiR3FNSGFoT2ZHTVE2QmUwdjNPYlZEdnZrT0dvTlRC?=
 =?utf-8?B?S1lnaldCUmxIeDFFUVB6MHRZSDlSZXVHZEphL0F1RG1udUJvekJTMVJ4T3JM?=
 =?utf-8?B?L0luVkczUkV4M1M5ODhScng2Mm8yL2FwMmtlM2xLMHNNNFFNbVNBM05tM2ZK?=
 =?utf-8?B?VDZVUFRCTnVHelptVGtUSGlMK1dhR3FibVZlWnpQMHJPeFFLUUVnQVN3ZlRn?=
 =?utf-8?B?c2JObzUxbjhncklqc3RRbHlvYUszQ0NmdXlIOWt0aDQ2SnBmcTB0VlJxQzVk?=
 =?utf-8?B?YjJMY2FJN0l6V21zdXRZWEFBa2lQUzRkakg2N0c1TnQ1SG1FS1kyb1lQZUxr?=
 =?utf-8?B?NEJyL2UwcysrN2VmWGpMTVJWRE12a1RmZExJRS9tSmRISUxJTitGNVYwZ05B?=
 =?utf-8?B?ZEEwdDJ4VHBNaXB6OUJrZ1RoS2RjWFZiUzQwMTZadmxMbFlTVkx6d2crZWYw?=
 =?utf-8?B?ZmN6OFhzOXk1ZHZwQ3EvTFd5VjVqeGYydzh3S3gxaWFLRFp6RTQ0QUxhdWpK?=
 =?utf-8?B?WUtERndBMWhzYVNUVUZBS3NXcUl5UlFudUxqbzM3NHZpck1UL20wc1dBY2Fw?=
 =?utf-8?B?YmVuV1lpTm5KUzFoMXhCSHhGSjlwYUw5a3FtbENPSHpBTmlDek4wYlhTNzhE?=
 =?utf-8?B?QlRhNzlGMDlDb3NyelloYmphcXNoaGx0b3A2RjBOa3N6WG12ZFR1b252R3VY?=
 =?utf-8?B?UE9VNE5Ja0dXNkMyRTVRUlZDV010cUdCVTFpQ2tjYVRJaXNhQkMrM21Ic1Mv?=
 =?utf-8?B?NHVxYTdKUlhVQWxKd21lMndicm5MOWk3UHZtcktxMG1XUEZ2dGdERCt1Z25a?=
 =?utf-8?B?VS9SSVdNOEpnZElwSG5PL25iWEdaQm1GakpoTzIrM05TbTBKbDlGZkgySXI1?=
 =?utf-8?B?dkdZaThsYWJBT0E5ZExna1hNTUhXTjVkOUVoRnROOS9zZWxsQ1BQSlJjOTVU?=
 =?utf-8?B?bWpjVHZFNG11ejlYY1BVSkdLUVFRbUFWSVF6MG1MMVFaU0Y4dDE4VnorVCt0?=
 =?utf-8?B?YTAwUmdjVzB0eTBBeFNTdDBnSDdSNi8xSThHVHJGOUlWMEQ5V1pKOEFpamxa?=
 =?utf-8?B?dXg2STIxcy9mS00wMXJxQzYvVXhxTkNpUDdQazRmdHRCNldFVVFEd3BUd005?=
 =?utf-8?B?WCsrRmxRamt5aVlCNTlxQXd1VmxBT1dWS2hURTVPYnB2WXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TldjbVFDb3QvQlA0Tlp6THlnSHZnT29LUjYrdStJZXhhUC8vVm5Cci96Y28x?=
 =?utf-8?B?SEZEZzE1cm93c3k4Mk1TM1E2QXRHSXU4dUF4THBhYkk1djRiR0RXZGZZRGhS?=
 =?utf-8?B?dVNDb1BYeFdiZnEvU3lCaE1NN3U3UUpGamFNN2F3b0oyYW9VMERBb0xQdGta?=
 =?utf-8?B?MHBDZjJrUDQyYndtOE1uZXMyM0JBMUFZcmczZW1JbEU5YzBoSzZES056WnlX?=
 =?utf-8?B?VWZLVm1NUWlrVjRza2hyczUzWnNUZWtKU1hjODY0b0ZyLzZyNExya0FuRUdY?=
 =?utf-8?B?aVJVdGNuK016WmM4UzJYQVdYM3AzWjZoczIwUlNnTzNUdWJ4MEJlZjZKd0hK?=
 =?utf-8?B?c1BhenNESG1YNEJlcUxnN3ZGNjhycGxIVTV4MWQzelpkcGhrd0k5bnNEa1Bt?=
 =?utf-8?B?MUtjWkZ1MXpKdlFWYUhEZnJETVJpRnppeENjODhDdURscDJEdzVLMEdKWjVV?=
 =?utf-8?B?aEowUDZ1WXVFVllzREdyY0JGWWVTUTBaY0w2QU5wMjUrNnN1ZUdRL0o3QSsw?=
 =?utf-8?B?b2FtdDJkWC81dTIrRVB5OExZb0diN0JseVI5VW8weHVkQWhvTmFrZS9kZHRu?=
 =?utf-8?B?Q1FaTWJaOFMrN1hiTDhQVjRScGEwNlJ3aysxV2cveEVpREJBMWNWUCs4djlE?=
 =?utf-8?B?ZytxUjI3UnlhNTRWT1N1VkZnZHJLL25LSHNFaVJFOGZVQ1BHOFovQkt5NFU1?=
 =?utf-8?B?WWFLSTYwWkV1YXhLazEwK0tHMnlBeHYydmF6M2E1U2pkZ2tPSE01VDdmdW9P?=
 =?utf-8?B?K0Z5dUQ3YThqaG42Q292Q3BYTTI4S3BZNEgwVTdiem45NjJVSysvdkdkZklI?=
 =?utf-8?B?Z2oxRmtQN3BLU0FJeTl0eVBkMktFVXN2cjdpNS9NdDM4S0dpbG9WNTNOaXlQ?=
 =?utf-8?B?K2VreUNjRml2dlZORDhzWHpRL25UZGkvakFZZWQ1eHAzbzN2V3liTEIvZXZG?=
 =?utf-8?B?enNFa1ZaN3J0cElIdTllaWpHbVNEMEpINmpRT1cyR0NROEYxS2VpcjNpWDhM?=
 =?utf-8?B?VVBTVVlSUDVwQ3NTb1VqOGFnRENKeVJTQTdBQ1hkbEhVSHo3cUI1cUtucWpX?=
 =?utf-8?B?aU16dEVId0UraEhUdlk0THpPYU42cVpESkY2cFFnMFR6Yi90SW5qZlFYTzZR?=
 =?utf-8?B?eE9sR0M5Yjc4ZmV4TEhVa2J1RTFNNmswVjBEaFVUOENHUE5sa0lsLzFaSkhz?=
 =?utf-8?B?c0VrREdGMUl4NGt6MVNzMmQ3ZTNoWURTV2lYcTVUOUR6VmxjRUlycDJlMHRR?=
 =?utf-8?B?T2VkNDc4TzNGVUc4SnhFSHQwZHBOZi9ZaGxEWjRoYTdEeDgyR3BpUHhVcGFU?=
 =?utf-8?B?bUxVR1JiM2oySGhpa1RRT09FRUhGNWZYZVNRZE5UeTRoVjc4Q3Q1aDFDQm9N?=
 =?utf-8?B?cHZQU3VDK3FSL01rV1E4QWQ2VFYrOCtqVTJGcXZySzhQZXVEZ3RkOGhjVkRx?=
 =?utf-8?B?amRNeGJoWktMRGdDeXJIME8rUkZjTnJLQUI1RU5SNEQ4WmIvM1dUUXlIejV6?=
 =?utf-8?B?aVZXdUpUVHc0V0lHcTg3YWVxeG9vWnFGeWVWVzMrZUNGZEJEcFl6T09RMkFT?=
 =?utf-8?B?ckxUb1RFTG02WnhuZDJCRjBEaGRGYXJFYjhKemVVYVJKUVdidDN2SlNZSlUx?=
 =?utf-8?B?OXRWd2NEbWYrNG5mRGFxMW5EektrVkE3d2dVbkhuMkZtKzBWQTVKTVJqWmNO?=
 =?utf-8?B?ZmZUZlZvRUJTZFNTcVorTS9Pa0JWVStFaEhESTIyaGY0cU10c296eTZWU1Z3?=
 =?utf-8?B?OHNPaUlxcXpZWmpCcXBwdWg5c3VlSmlGM0Z6NnpITHBtZUdPa094UUlIUlQ0?=
 =?utf-8?B?dk5pM1Jidld4TFdhN1BSbm83c2YzTUJlZG1CZERmVTM5cXNiZkM5VWNobEhZ?=
 =?utf-8?B?NlJwYXdxYWIrUVJIQklabklmQXVOcC9yQld5aHpWWUNnbTBHdlRwYnV4K2M3?=
 =?utf-8?B?YUc0S1R6OEttSjRsZkFRU0E1Q2ZnbTNyaVNaUDFWaWpQcWVIZWNKdTVkYmlE?=
 =?utf-8?B?NVAxNG1CTFErZStmZ1EyM0Mzb21zaVl6Q1hGdW1hZmdRQmM2b0ZlWUhBVkJp?=
 =?utf-8?B?RjB0V2N0UzhsNUV0Mklza0g4b3BCdEd4UllyRG5XQ1BScXRqYXUvOXpuc1dT?=
 =?utf-8?Q?q+OU5c6R56hho0JdNRnAqa7Yl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb70048c-8e9e-49ec-dd28-08dcabf7c3e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:46:21.2572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufVv8VsajwIux79ul1PIpFHgNT70+KtFipUDY5L7KXp09hR4etcxqFI+OMBVGBu65+8ghUA1KDfhqTmOIDaCZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_084630_007377_FDB832EA 
X-CRM114-Status: GOOD (  10.79  )
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

if (dev->boardinfo && dev->boardinfo->init_dyn_addr)
                                      ^^^ here check "init_dyn_addr"
	i3c_bus_set_addr_slot_status(&master->bus, dev->info.dyn_addr, ...)
						             ^^^^
							free "dyn_addr"
Fix typo "dyn_addr" by replacing it with "init_dyn_addr".

Cc: stable@kernel.org
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c8eaeada54781..65642e5afdcfb 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1442,7 +1442,7 @@ static void i3c_master_put_i3c_addrs(struct i3c_dev_desc *dev)
 					     I3C_ADDR_SLOT_FREE);
 
 	if (dev->boardinfo && dev->boardinfo->init_dyn_addr)
-		i3c_bus_set_addr_slot_status(&master->bus, dev->info.dyn_addr,
+		i3c_bus_set_addr_slot_status(&master->bus, dev->boardinfo->init_dyn_addr,
 					     I3C_ADDR_SLOT_FREE);
 }
 

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
