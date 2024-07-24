Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C25C3DA61
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Nmrr8qcMyHNsrd4ocAILgiNCkCxjUJBDlLBw+fKRHA=; b=1Ss/qAyM6Qzu2W
	yNyNNB3nkuGi6slXri4guSS4eA4klPzDvOkTQ0k9fO1sOMg2JajVZJgUdiHYaaplNCSeSgoXDTJSf
	i35LbDxl4d/XNEsQB0pVo3JoZDwnf3aKVH2IIUY6aGF/LwzFAeDveogY3pmMS2ml+/Fj1PsM2O/H1
	pjI/H5fH8eIBKHVEx34Pwmwuj0zc55KgQitmOYUZ0E2v1ghXYDIZl4WAOmqO6SD8gHYbz4yC+UdpP
	mAfXqpltRC8ispp0PkR4W326eNyhir5rOGj77cbsE33oUGBGZwQpQCsYALAtIH3iQe8ArDdKCO7hs
	zU3PUG6UfVZl+58ZpDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWeBy-0000000Fot9-2tmv;
	Wed, 24 Jul 2024 15:46:14 +0000
Received: from mail-db8eur05on20601.outbound.protection.outlook.com ([2a01:111:f400:7e1a::601] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWeBv-0000000FosN-3SQF
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 15:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD81r6yU+BMmFJF1pUyOyOwyRF6AyyZJKbx7o10eiLItdUGT43VsTLoPt2/2J7gpYtVeGmLkCxWTqGdg9yN2ZbNvYZVR8sgbSnVZHPpixdNTfel8wz0A7LotrxdUpMkjp065S7fcbczB34v0DRDuGnDPRJWLH2bVRwQn3qdLjmoOsWNV6uHhs1849t2AdOFB7Spgckp+XSVjxUQG9EicjaEzNSPRjmVw+oKx0B46WIJK+5hsx1ORf364KPLW13qbjLnNUsXzEO6h+0jADomIhAlQmavAH8NgakCngLzsSRseEb+VSl4YvjnRX8PGVCK+dkXJFCswIWqaKT1spLr4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSL5r6hTHQi703eiuD2fMg6Gt4zgPLjs1uGp4Sf4U3Y=;
 b=mrM7/OWz6b/CJYjcQ5nH5oKCIbsPWsfwNJWokRARSyCZG6kKmXiqLhfWU0s4/rqTfwz55A7MA2FDy22MvIQEpsZDU575qpPcSbI/aeRlmVBM+SgWGBcnmxNghaADRyU0/sXHGukjnblKusIvPYZBo0a8jgJPuKD5Ug5SSltWe5WdsusqTI3cx9lNV94/fhh7dE8HYm+YLtg+0kiVGPI4c55NFWaYe6YeT4WjU7QAygCgPsLWcEexP95Q2rfIZM3cNO+2Wno+ZO55mzuwwuUIduemQaWio7ofMeOs9o1rO1eOVxfkmE8RS5AvwZMBJrCTvqoiXusrjhd08Ejw281WeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSL5r6hTHQi703eiuD2fMg6Gt4zgPLjs1uGp4Sf4U3Y=;
 b=HxcwoWmP6G49q5Yt++C3UTj1DDRt6cwxOV+7Wismc9cFetwH6BnC03+wJaUX2o+1naycodUT6eHtEUCil8+eFzgBClJKoo44zPdp9ikPlLow+dL8vhOnj3RTdSfTtz5mRkt9VuujVptTtqRZKPKYMTDXLnXzNl3zO/kJtyi4RKyZuTffBnDdWipVUrXEHMhgs8yEwpVOdINGamoCc78mtG65gLqO6xyjdaPGB3SbsUPGS15kW5NrzeFIgVY49UhT+lZDs9grRGIX/p/M6vMYrRFEIc0VWZaIRPhqkYLXrciYJiUns0grKhvLJIVolgIYotFcF8DvR0AFMGPk5g7T9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 15:46:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 15:46:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/7] i3c: master: some fix and improvemnt for hotjoin
Date: Wed, 24 Jul 2024 11:45:45 -0400
Message-Id: <20240724-i3c_fix-v1-0-bfa500b023d6@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKkhoWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyMT3Uzj5Pi0zApdY3PDpDSLtETLVAMDJaDqgqJUoDDYpOjY2loAXy1
 KbVkAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721835962; l=984;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dtHxKJgSuUPP1HUYpHxsFiy9RWJEuwXONAcgw9f1mpk=;
 b=AVeiZtgrriCtVzHWU5/7yvPT2a11mkZcKiNmXzbjeq8HflXMucSPeXIhsEISkf9AkFFSHf+zD
 mWg1bdXJlmEBPkYvoqA58gpdERDvluUUdfd3jJJrHNajFvilGhzyIVs
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0dd672-af90-4fc8-1c56-08dcabf7ba81
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QURtNzNFMWRpTGVRWGFoUFRsRW9WbkVWcmdUenpjR3JhNWp3RUkzbi8wSHBp?=
 =?utf-8?B?dVlpTm9iblJRRU03YTNOL3F6QXEyUmdOd3JWRWZoTU53UnpVWDNkeGVXK1FF?=
 =?utf-8?B?NHBvd2dwOEI2djd6OEhmL0lYZGRpY2NDS0ZaakpoYXJpY0xObnRERUY2aFU3?=
 =?utf-8?B?Q2FNN25CSFBuMjdQN0ttYmlZOGtKV001c1pTTlM4OFlPVVFNRVg0M0I5UVYy?=
 =?utf-8?B?YnNSU3BiQlRzWnR2ZCtGenkrVVpIanNjaU11ZzBrd1pMaW5SenBNMXFHQ2dD?=
 =?utf-8?B?Wkw2b2Z6dW0vUE93bm05dG5GQnd0eHhtNGVtZ01vVGVFL2paS3RwS05hWjN2?=
 =?utf-8?B?QW1ubnEwTllSTTRQS04vNXo2MFNnbnFCeStKNHlPeCt5Vy9mU3pLUXlSSkE1?=
 =?utf-8?B?RjErYkZXcmE5c2JKVDRxUnU0K0l0ZW95R1VqRThaMWZpNTZZajY0aGhYL2M2?=
 =?utf-8?B?VDdwTlAxUXFHRUk5L0ROVlVSRlNDMEFVbnU5TFBwTGF4Q25iWnJNQXdsdGFI?=
 =?utf-8?B?KzZzdk9FTU5Lamt4dnlPSkxyQUpoZ0FEdlVKQWs4YkwySi9EVllaaXNHc29s?=
 =?utf-8?B?NUZlMWQ0WExhdEo5c0lVVk1SVEZnVGxYYnFpS2dkNmlVelRKVnBwdVBMYW9X?=
 =?utf-8?B?UU1mSFRqcklyTFhmSHNGc2lhMFFTK0RUZldHTzhWTk1iRFgwa0dwRUV6THRs?=
 =?utf-8?B?UkhXUFZwNmJIVkN4b016dXlQaG94TWxiYmI5elZiRnB4WnhyZnQySTV3alBU?=
 =?utf-8?B?cXBxOFNhVE9kd3FjaGM4WmxaMDFNWVNvaUZLd2Z0Y1A4RkQrVDhrd2ZDRk1l?=
 =?utf-8?B?Qnp5aVJTM3hlZ0JWNjFYUGVEdWVZYXJHdWtwTDlGYWhXeWZDckN4ak4raWdK?=
 =?utf-8?B?R21MVUhoVkl0bEVmRW1ERi8zSUxOQ2t4NTkzWlppN1ExcitpU053b3pBS1ZO?=
 =?utf-8?B?Q3NSa0FoemdXYUptUjJJaFhIY2JndHNBcE1vM2VlcHBWbitUWkhNQjdaU0Zi?=
 =?utf-8?B?TkpVdFFvS0tNVG42dnFWM1ZIekREdC93RUkvRUZOQVFKcXB5OVRxVmFxTFdz?=
 =?utf-8?B?ZHozZHZmN3FsMjJxeDUxWnhsM0lCS3l0NDlWQXE5S0JiU0ZIbzNwcmEvZTd0?=
 =?utf-8?B?VWtIei9RWm4rVjE1azVSSzVaWnNzbGlWOFZCUzFXVXZ5czc0Um5vZW15SVhX?=
 =?utf-8?B?UFNIdFpTdnNjSENqNWNSSnROenBiOThBemtnRkdhcDY1RGJ6M3pGRGJmZU5i?=
 =?utf-8?B?UlpEQm53R3pDK2YyTU5NYjYvWDFyRlo1MjhMSkU0d0pTQW5zMzNxalNUcmR4?=
 =?utf-8?B?QUpvVTE4dmRESVdOdnJ5VEtrbXBocnpSVEVNaDBJTlJzTFJ2SXA3ZlZtWDRO?=
 =?utf-8?B?SFQ0QUhiNHFOTWJmWnd5OTNvYXkvMldYd0g2am9nRUdnYmtlT1dnN0JhL1l3?=
 =?utf-8?B?Um9BR05GVHZ5M2VmQVBhbFo0Q1BPUEpqVFlZbmU2WTRmazkzVGZ2WGdSdVBT?=
 =?utf-8?B?Q2Uzczk3c3IrQmo0TFdHZElJamN5eGRKSU12OW1pb3A1d3BEcktBaXJwQU5Y?=
 =?utf-8?B?OUUwemJDSG8yOGZwbC9NN25vZng0OEdwWUtrbHZDRXBLaHJEWkZLbFhuNG5M?=
 =?utf-8?B?R21Ja2kwUDYwek9mZ3RkNmJiUHFMaE5oUStUSnBObnBxS0F5WWw0VU81Q1JE?=
 =?utf-8?B?K1NhQ0QwNW56LzNjWHpralhlQ1RiTnNTTjB4N0Iyck9oR0RWTnlqWmpDOHpn?=
 =?utf-8?B?WnB5ekNyZTVwOTlZMTJ3RGMyTkhaa3lpYnNiRmVjQnkvdHRRZDZFMVRxNjg2?=
 =?utf-8?B?cTJ1MUZwSHN4NzlJNm4xRkQrTCtXayt4Q1Q2eDBWT1FGc0FlWnhxTjRFMTMz?=
 =?utf-8?B?c0NTMWFpSWR0Z1FGVUZkb3E2bDdZTVJBR291K2U5d2xQdEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkVmR0xuUXFxWFZBWmgwdGdNTEhSTGJnS3ljRHc3UWk1N25SMGhaNkZsYks1?=
 =?utf-8?B?NGd1TlJFZmtYR3J3b3ZNVi82cmpGS3VXWVROSStkVGxuYWRGaHFCOGtYYk9X?=
 =?utf-8?B?bm05eVpjSnFpVDhKRG5Bd0Z1L01OVkNZU1FKRXJWM2JoSElSN2ZMaHVCdy92?=
 =?utf-8?B?WTltTVBheUtSNTZwUmNxSTZicFpQUjc5ZzBGdS9CcmNsaEdWejZ5QzVXM0tZ?=
 =?utf-8?B?cUhRVXZCdFhWVUY2MnpMRDRPMlduek5peGUvd2ZsRzRMYytmazlMaCtVSW9V?=
 =?utf-8?B?S0VianpiVjcwTWlMMG4xU1doV0psNFR4YXJ4VWdiNGxLcHB6dmJIYU03VEZL?=
 =?utf-8?B?Y21HTkZyU2V6eTBKNmI4QUViNG5PSHJOYldBN2oyWm5TbTAwTk1FMGJMSEJ4?=
 =?utf-8?B?MFBpR1Awc0pzRTRCQzFIMFI0U3dMK05RcHRKT1k2bWxPQnBvREVCZGZQWllC?=
 =?utf-8?B?UVpqdVB6RlFpSGxtaW5EY3JNMUVqVEd0V0xnUUpyeWJaZHE0K1pwblo1cTJY?=
 =?utf-8?B?dlUzSnhiSUgvOS8xM0krNnIxZmxvZVcwOUplK0pJU1ZOL3U2STFPUUdtTWJo?=
 =?utf-8?B?TlhyNU0yQURxZWdLRklpYmxpWVMvZjBuYmpSODJHN0pQU1pKQ1VMbW91di9n?=
 =?utf-8?B?bTIzcmVYYnZ2WUZxTFRLd2pDa1VIRHBYSHBzTzdldGFYRWNDekhveEJWZGht?=
 =?utf-8?B?TUJqczZKZFZZZVp6V2ZZUHBEOFozcE4vc09CWDYvcGRQdzVpdllia05ZK3dr?=
 =?utf-8?B?endsMzZtYWhtSGtRTUUwLy9NRDF5Tm1NZ1V6NG8wR2huK0MwR1ovMFd2ZVFy?=
 =?utf-8?B?eTlLbHhYYTlOMkdTVS95NXlVbzNKS0FlaDZWMllubEN4dUFONTFCQllybmhN?=
 =?utf-8?B?NndvUWFBNGQ1eWZxZXNzeGI5QnhsL213T28yYTh2bWY5c0cxMnhFd3U5bkts?=
 =?utf-8?B?MWVBMmRZWm13TmVqTkpPVURiR00xOGpZbWlYRWkvKzZJTkR5bjNweFIzUCtV?=
 =?utf-8?B?QmMwTG8zaGpseHlBR2dJMGFreWpVVnBDaE9IUDBnaTBEVnVjamNUS1hPc1o3?=
 =?utf-8?B?cUpsSlFtUDE0VDFtS3NBUEkrWGtQVXB0RUxoa05uTU5Ubm9lOStYVkk5bUcx?=
 =?utf-8?B?czRMcUxGVmh5SFpsL0I2bXVjWnRqbDJIT29qUmwyY0xIekxMejF4V1NKVjJh?=
 =?utf-8?B?YkUrZ1VhQWw1b0oyYUIzdkF3Mm1JQUNqTG5nWlRtRUppckUrc2piSkFqeDJp?=
 =?utf-8?B?WjRET3NTSjJLSmd6MU5NbEJyTlIxZHRCMlhwRVdvc0lWa2ozMnEzdGl1eks5?=
 =?utf-8?B?RWtSMzVsUURudDhJa1hZRlFpdzI1VGgzTXluaHYxanIwTGhhL0NxZVVvYk1T?=
 =?utf-8?B?US9iOVk2RURrOHJYem1nNnVGZmNSdS9LMHl6djBWd1hhbjZXdGNldDFoQ1dl?=
 =?utf-8?B?QWtqRSt4K3RrUHNOMFZLdnV5TGJJT0xJS3k1WlF3VDVPTFdsNjZNb0VDaVAz?=
 =?utf-8?B?czRsbGJsMEZNR2NlL25LUmoxdVExMDZISXZjcDMwRE9MOGhJS2F3SWluZkVN?=
 =?utf-8?B?RkhkcGJ2SWNEcW4wOTQ2YzBEa3BZSTNDdm5ub2lRUWtvSk4rQzBmRExlUzhm?=
 =?utf-8?B?djhZQm5MRWtXc1l3M1k0U1hEUStUMXFyQUNJWXJSTWh0Y01mNUxaU1grQVdy?=
 =?utf-8?B?RDczNkI0bDdORVF0dnBITmxwSEduNFB5clFJYnpJQ1ZhN0lhNmxQT3Yva0VT?=
 =?utf-8?B?ci9FTFNOL3ViSHdxeGNkZ3ZmYjBHb2hrSTlVRVptTGU0M1F2Nlc3NDBtc0lL?=
 =?utf-8?B?Y0ZMb2JTZHVXRUIwMGNMZkU4Q2RlOERtSlJTSzkwWVhFdE9WV2F0K2M4clND?=
 =?utf-8?B?dUo0aFBTT3czZi9BTlEycS9rMFg2dFNFZnI4dWllRXZHdVhSYTg5aUEycjFk?=
 =?utf-8?B?WEIzdi9LUityYnE0cnc0WHQ4ampXRjlFTlNSZGFITlRiekpXOTFUd25Ed3NN?=
 =?utf-8?B?elVZMElRelZ6bW43eVhFaFRaK0tBd0ZaRytSWkwrSnBmaUtLZEQvdGtOdHBW?=
 =?utf-8?B?ZUFtTVRUWDVFWFRudWFhVjVTT1ZSY0lCVmVBSGhUcjlXalZYeEFkZ3FabXZT?=
 =?utf-8?Q?1jBa/M1f+KN33KtIWPOspNZrY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0dd672-af90-4fc8-1c56-08dcabf7ba81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:46:05.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1QQAKhKCpbyI6UQWYuEINqai3SCdjgsuO5LKf7wwtMY7zgmr9Fy2RIV8ekv+ppKrl1mb2GPsc/cGSfYCmF2Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_084611_901294_0347B231 
X-CRM114-Status: UNSURE (   6.02  )
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

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (7):
      i3c: master: Remove i3c_dev_disable_ibi_locked(olddev) on device hotjoin
      i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_BITS
      i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_INIT
      i3c: master: Fix dynamic address leak when 'assigned-address' is present
      i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
      i3c: master: svc: use repeat start when IBI WIN happens
      i3c: master: svc: manually emit NACK/ACK for hotjoin

 drivers/i3c/master.c                | 66 +++++++++++++++++++++++--------------
 drivers/i3c/master/svc-i3c-master.c | 44 +++++++++++++++----------
 include/linux/i3c/master.h          |  8 ++++-
 3 files changed, 75 insertions(+), 43 deletions(-)
---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240724-i3c_fix-371bf8fa9e00

Best regards,
---
Frank Li <Frank.Li@nxp.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
