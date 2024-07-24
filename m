Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BF7C3DA63
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3RN4WrYZZ/5gnhfzgisHCv9OXUxSXCz6XRA09a3moec=; b=JArHG7B2NzJGGHS7saqoc6w/nw
	xAKNQ02vMYS5I96KdOBQPt4raeX409mEzxYQXNOe9Up7lUgbEv7B604z4GDIsjYDwd4UH1AkvQbwn
	kdkIrW4qC2mrY1Yq1ljc62xMC6lfP3/oxNKY5c+1U+tScFQe8xolMviS9ax0Qml4uAUTVj5a0M6Kk
	q92KcfN3+fljGYuegptBe9q0g5MW+djiy7NthCZooDPp5RVuGVfhS+GwYgPnsbvD6vHcUmpzFFFjM
	TWk0/Tk76Zhgg8JJ/wuvO80ghp97oD/2/hp26m8qbZa6pmfQXWIC+4hxu/1/9I02Y3c0S57TwVU+M
	F02ib4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWeC1-0000000Fou4-1IVX;
	Wed, 24 Jul 2024 15:46:17 +0000
Received: from mail-db8eur05on20601.outbound.protection.outlook.com ([2a01:111:f400:7e1a::601] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWeBx-0000000FosN-1tIU
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 15:46:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL/Q7HnL5kAoc3JStDozAoCPI170iu81xwYIytYfspGKQpcFzdCZ3nx/51c6k5cn2wg80oR36UZasNVOv4jHaAoyKRXUpIaDnk3mL6ZV9G8OcvkggCbmdtoP0CxGbS7XerPiAsDtObEEcwcOb974f9+VExL312XGv2UOuDVmsOr8AgiK8OvuDl7nLzxDVCiXUnDrLHl3wK7Zwh4LsCaolZo4Xkba6IyWjQ28tIRgxd9rNDzGXf0ti97wjSbbRaGonod4fJkE8eCVuvjXbcvffqTkYji+LLmMF+paes/pYc+xuORx75jGPv+N47VqZChgdOhozAvaDrTdplk/ZiCXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEH3AqOKfHzxwLjQgVs3Ok5rqhSw+ALKLhi5IuDAIjI=;
 b=msO/EdVkx2mV9sT0i1lpSL3vgzOXI3/slTEqwN0P8jFNSGsZW2aJDS9Zk/hoe3IVQtIukF3HqtB9kPRg3OKtguZEP6Qi9AEUdJvUbuM0pFRygUl0aBZPifBRhn9JT+uDGNu+ogwrxaFQWEYWOJaAFaKf6FSbnbn4SwPoMyeIf6eK6PpMKAAYLJsdYxOkhM/Z1podt3nmDFJOArRpUwdleVKWY9Nt5AV0Gewxaf6sOr4nYIGuwJWzp0dGzeDmRQ9Lig7WyTB5s0oEyveJw6XmjGoJNgrT4Ls2B9G6zNulGyw1CrilRMr4n/aOoXmYNEQifDKl9vhmrYMyuttHXkaM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEH3AqOKfHzxwLjQgVs3Ok5rqhSw+ALKLhi5IuDAIjI=;
 b=a4QDHlwocieW2UypgvFfBg0npeEBrCOCLsMZcVjMN7MMiVDNX4LogWPJdInIuWkw3OFLUYPtEa351AYAf6Bm15dR0G4yYpTwVqhe1A4dZwERb7WGH+AwcZ7LSXg8Y5eV1wWjnDpGJE8J8slVJt0uP89u45xzhmSh9G3/+fxkotTbsc94IxKCqwero4Oibfrp3bIsMzojfUasvAcBuj826Eudwu7Kh7O4YhgpCUUCepMdE7TDyvq5N/BshEu5jzxfPLwvE3Hp/ZaBSdEztIfoQDkd9buyhsxGPEsW5oxazosjXzy877p09ySGaU2gRs8hAMovTh8hY1QgJ/9e55d04w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 15:46:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 15:46:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 24 Jul 2024 11:45:46 -0400
Subject: [PATCH 1/7] i3c: master: Remove i3c_dev_disable_ibi_locked(olddev)
 on device hotjoin
Message-Id: <20240724-i3c_fix-v1-1-bfa500b023d6@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721835962; l=1374;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/JI8s94ok2z+hT6L0BfTNT5ICOc99IOP4jbZmyhmqiE=;
 b=vyxohMNLsA1z6uxTUSTcPrthrJborPex1MOrjSPVRNKz/05KfcjgbQG571ILWthcw3HcfFCHg
 jrp+UIZPzKTDZNIjlTe3JN0zpCKFlavy19fbLG+9BOEF7RteESp2hXZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: fea120cf-7f9f-48f7-9e90-08dcabf7bc59
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzN5NGlLT29SOWNSVVRsdVpFNzE3T0lZNVNWSExGYnRlbytlSXpBSXhHS0Fw?=
 =?utf-8?B?Skl2QmhYUmJOanFvWDVZR1F2djJrRzZ0ODdIbjRIRmZqOTRDNWtucUNMakN4?=
 =?utf-8?B?MXJtaVlSZEQ5QXNJbTJYbTFHcTdTV1p4YWRySW9zL0Mwa0h3amRVNXI2eXV1?=
 =?utf-8?B?alpYdGRrV1VwTmtqTDl1cjlsdHRXVUg0OWdlc0Rqak9FOVcrMUhjNGFBSE1j?=
 =?utf-8?B?NHlmZVVySHBDcWdyRkhjWTlydmp5NDhqWEJhb0dxRWFKU2xCK1Nka1dTU2FN?=
 =?utf-8?B?OW5iT0t6Sm53UVJGSVI1Z05RdGt6czRCS01OeFB6VVFmTFBVNGVBbEtnakFw?=
 =?utf-8?B?akZoL2U5eUN4aTRQWHFGSHBrRnhpVG81Uk84QjdsZDNQRmpXS1dIZGl2RE5U?=
 =?utf-8?B?YVRIaiszbTcyYVY4bmlVVnNBaDVERGtsMERFSVdxT2wrSlI0ODN4UWlvaUk5?=
 =?utf-8?B?MXQwZng5aU9WSzM2dnl5U0VKOVVxdEttSEMzbWZBbVg1YjU5N081bW5ZaGcy?=
 =?utf-8?B?RTgwemtrUUZLellSWVpjV096N29jRlA2V0lYS2ZUZ1VtOGlreTZrbVVrUitt?=
 =?utf-8?B?L0dKQ0phVzN1YUlqRk0wc005ZFpWYm1QaTM0NFNTVWRzeXV3Y0pOeDhkcyt5?=
 =?utf-8?B?WmYra3kvSVpsWkU1S28xVGdKbTRsNjJDYlBrRFlZYWJyamdhQVBlZjg0akVr?=
 =?utf-8?B?K0dabVlBM2FNZEJUOXNacEkxMnhEYlUrWUdCeUJkcllQQnJ4ZWZEUzgvbkg4?=
 =?utf-8?B?SlpJemhRRnozSGNtejBnK0RjeXFsU2x0Q1Eza3VUcXpkQ1hNNnRjQzdqT0Fk?=
 =?utf-8?B?bWxDbXpVUW1DUXFQa0FSUlRoQjFqQlJJTUhxaVVveGltVnA5UngrcEdkTjk4?=
 =?utf-8?B?ZmVzSzViK21jZXZnMEhnRktMTXM3QnhVOUpuTzhIQlRoSUZhSlMvbXNnakV1?=
 =?utf-8?B?Q2ZoWnN2OE5Ec2lxMGFPNGxYRmsvVHdYOXhFaEUwc1hUV0w2WlZ4YmVMS0t2?=
 =?utf-8?B?NkZKV3ZPbUNtck5yejRjdnlMWkJaKzJMb0oveVVQc1BWeG94Mkk4eEdtTDBk?=
 =?utf-8?B?V0NTaE1kWUZuWjgwVXFab0wrb1ZudElaWE4rQkh1elowckU4eG1UL2lsaWFE?=
 =?utf-8?B?c3FxNkhiTTY0MTN4THI3cm9NQktpQXdIckRJQVAwKytGOEpkb2haY294K201?=
 =?utf-8?B?UExzUGliTmJXVkxyS3JxUDVJUlVlcSt1cUVzS20zajRoS2NmUkpBditIcFVq?=
 =?utf-8?B?Q2dkOGlxcWFzRDVIQmVheXVtMjhQZW0vYzBQU2JsYVVMRnQ5Nm1pV245L1JR?=
 =?utf-8?B?YmZpUkJKYUJ4THhyNFVIZEMzYVJXdzBVa0tGTStPak1LWG5rcW1sUEVtbnpT?=
 =?utf-8?B?ZkZYWGFwZElHcXN4YmVuS3RzbG0rK2cvVXRwWUg3WW5wbTlZRnl6eVRlZTRI?=
 =?utf-8?B?MkxHaHN4RFJWZTUyc1VyTHhpWHJ1TU82N2owNlhyTzZEMlNrSzJQVktnaTZJ?=
 =?utf-8?B?MW9jSFd5NnZUbmNCOW9VVEdYY3lIK2xsVGJDWEJOTEhlbWRpL3BYeG42eU5v?=
 =?utf-8?B?bnFWdTlRNjZYOGgydVpQNWRtYkV4UG1xdWtxVFRjakFiVEhpYnJCS0d2ZWJX?=
 =?utf-8?B?Z3g0YlNPa0hBQWd0ZGZZekV4MVJ0Q2UwS0E2MnFjSy9QNzNoLzQ2eVJlQWxQ?=
 =?utf-8?B?WXVucWVwYm1zQm9GMUduVEVnWHVGaFJkL3ZxNDM2cVhveE0vcmhVbUFiS3di?=
 =?utf-8?B?a3V2bXM1UVdBVHRGS1hacXdBaHpTblBMbUpaSzBzSDA1Skd2dTBObVZPSXAy?=
 =?utf-8?B?aktiaXEvV1ZrVFNrWGxLSEhTaWdWSThJaGtJV1ErcjEwSllaenBtUGVOZjFM?=
 =?utf-8?B?c0tLYW1MM21VMG9NdzJxZWc5TklYbWJKYWVaczRDQ2NPekE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWd5Q3poMGlPdlJkbldhdkhRMEpWc0JhYU1zVkJDWDdsd3BXajZ2ZCtZeVJu?=
 =?utf-8?B?UDlZRTdYclpJdTFZKy8yS2xiNmg5SDUxU0wyaHNzWHBUdVFPK3N2V0UzdkRI?=
 =?utf-8?B?ejNMMCtSZnhGckJZOFBlamx6bmRYT1JBdnhxMGZjSnlyVHE3aUhHVWM4Qkp0?=
 =?utf-8?B?SFFFd3ZYTndxV21rRkJVWVlVTS9FTU01R0IrVm4vMnhCL1laQkpxR0ppaFIw?=
 =?utf-8?B?SGZtdmhLOXJ1cFc2dk85T3ZaWWF1T1hJbE1XMmd5RGpad0FsQVRjK1dYc0Ny?=
 =?utf-8?B?UlBPUy9tUTExRXNtZk1icW80dkkvOVFGd3BJRmhYeUo2QXh3WnFwYm8yTkNw?=
 =?utf-8?B?akhET2xjOWNnVzR4aHMwcEFWck1IelViNWJlQ2J1dzg0SWlXdStCWkkwa2V3?=
 =?utf-8?B?UnpGZUQ4SUlXbElvRzNFVTN1eGFLYmE4azhESHBWZ3lFTEZMWmFxb2dwK1Zr?=
 =?utf-8?B?S2RhR0NUTFZEcXZqVHR1N2M3SmI3U1VUVHNKNnlpVlBqd1ZIT0lKc2wwb09x?=
 =?utf-8?B?V1NXVDVTRm5rWi9ld0E0YUtaZm4yK1VlTzNLc3Y3TnV2d1RDQWorMVJMUEQ4?=
 =?utf-8?B?M0xKU0QxUTY1YU93R1dwczVSVFNpRHlRSFdQS25KL2xucExaL3FVT1o3MVNz?=
 =?utf-8?B?Z29kSUUzVVlWbFl0TnJmQ200TjFRMy9KdU4xdHkrQ2F5NFZLNmFkK3NSSy9T?=
 =?utf-8?B?U2pNTkE1Z2E4Wk82UkEvK1NKSDFnREJCbUtybU9vNU44REp4Qkh3ZGlSOXZO?=
 =?utf-8?B?SWc5ZEFvUUxxQlZCWVFsRFZ0d1lmL1BzZmI1cjhkMUJ1Ui93dUhmbWdiQm1r?=
 =?utf-8?B?S2ZkMU5UYjBGVkU2Q0VnUHFGMXl1azlaYUgySkZ2ZW1rUTh2K1VHWWk5OE95?=
 =?utf-8?B?VnVoRldodG9tZ1pIalVEYk1UcVJ1UndNUHh1bWppQ243YW5Ybm9GTm5wY2NO?=
 =?utf-8?B?ekFXaTVvb3lJMGxENkVUUjhjbWxEWHJ3bTE4VTlBNGxLSk4xZDJDLzVoTWpz?=
 =?utf-8?B?MG84dzFOMnVyRWZVRmI3K243THFtL3hQUnpWeldBb3diK3ZYaGhFUEUxUDM1?=
 =?utf-8?B?OWRQVktVa0EwbVNrQjJibitlS2Rvay90NjRVYklQOXp0SjVHd0lVR3l1UGlr?=
 =?utf-8?B?RWZwcm04OVRPSFdZZmFsZkFGa0hzWkQ4WGx1bDJSUi9PR0ZTalhiaU5RMVY0?=
 =?utf-8?B?SzVXUm9kdVlhV2JVa252ZTd6ZDB6SU9BdlU4STUvQ05Ed3hMUVB2N3JTVk9B?=
 =?utf-8?B?Zk1MUjhmb2o5M2J3TzQ2dVdUeWV0QTdmZHdqazUxVmpqbTQ1OWxQd2thSGEx?=
 =?utf-8?B?TUdOS3U4bHo4dzllajdrVERmSjFiNmgzaXdnQUxialNnMXJMVGltNlhSZkkw?=
 =?utf-8?B?VDRKQXhjbUhKSVRnV2duWVk1L1BSbmNJYXhvUGJLeXNiTEwybzJQY3BPSE9H?=
 =?utf-8?B?U1NvOHQ3WTdoZFVTVHJkb0RJT1ovclpuS04ydFdLM1k0RmhKWlFiVGVJME5p?=
 =?utf-8?B?bHpLUVdBdFdwRlRoTUFBV1owS1lrRFRPN09jK2NjUUN2SzRyTkU5dThVZU5i?=
 =?utf-8?B?eXNGRHlOdWlOb2V5QlJMaGdYbEQyUXFqRFZabjZ6bEdiTGY2N0hOclJocG53?=
 =?utf-8?B?TFdjR3dSYnY2L0JDL1J6QlBsVmhJRlVGZFZSbXNxY0RNcmZJWW5ERkJIbUtL?=
 =?utf-8?B?Z0gvMVVpWnltZUVMYUNmYjVUSzU1N25qZ0dNT3o0b3lyZG9VLzJhZ2ttY2Nl?=
 =?utf-8?B?WkJJWnNrcFlpYnVRY0NYNkRzK3ZUS1JMMTUrc2NWQlVLcSt6eHdPUXI5aXRj?=
 =?utf-8?B?eDJQYUoraTM5dzQ0TTlMVkozdkZhQ05JckNVVkhTUDgwcnN5YVB3ZDVSZER0?=
 =?utf-8?B?VFdJVXJzWTRjNzZxOFV2SkgwWFdYMkhpdTFaeXRHVHUvK2hsc2R4NFJ2aVB1?=
 =?utf-8?B?ME9vd0hrbGNXV1ByL1pPem96NWdyNWZQbitsazdSUTB2dTBTdVJuZFpsRnE5?=
 =?utf-8?B?djdXcG9QRHlLOTl6NC9CU1NJTVR1WG1vY2dNaXpIT2tUa08xTml4aDQ3NzAy?=
 =?utf-8?B?WXNxK3kxTGdOSXBTWkRmZGpQWmV3WC82TS8xTU5FZk1MVklrSjN3Umw0cHpW?=
 =?utf-8?Q?Xf3mCt5PBsq7HyWExX0CNvgWf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea120cf-7f9f-48f7-9e90-08dcabf7bc59
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:46:08.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMwWSxVc2t1XzCseARubJn3D5Kezsb6Im7O6B/4HdMS3HfsjcI0FE+IyM17MRACICJL+GR+8MBvijj9+POBOfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_084613_529855_263413C0 
X-CRM114-Status: GOOD (  11.85  )
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

When a new device hotjoins, a new dynamic address is assigned.
i3c_master_add_i3c_dev_locked() identifies that the device was previously
attached to the bus and locates the olddev.

i3c_master_add_i3c_dev_locked()
{
    ...
    olddev = i3c_master_search_i3c_dev_duplicate(newdev);
    ...
    if (olddev) {
        ...
        i3c_dev_disable_ibi_locked(olddev);
        ^^^^^^
        The olddev should not receive any commands on the i3c bus as it
        does not exist and has been assigned a new address. This will
        result in NACK or timeout. So remove it.
    }
}

Fixes: 317bacf960a4 ("i3c: master: add enable(disable) hot join in sys entry")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7028f03c2c42e..852b32178b722 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2039,10 +2039,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 			ibireq.max_payload_len = olddev->ibi->max_payload_len;
 			ibireq.num_slots = olddev->ibi->num_slots;
 
-			if (olddev->ibi->enabled) {
+			if (olddev->ibi->enabled)
 				enable_ibi = true;
-				i3c_dev_disable_ibi_locked(olddev);
-			}
 
 			i3c_dev_free_ibi_locked(olddev);
 		}

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
