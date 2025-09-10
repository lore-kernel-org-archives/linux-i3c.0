Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124ACCA101F
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Sep 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnmJ1IDkObnqs4WK92rv9chudQkncdYMf8xD+f36hlY=; b=G4xbvmYCiJMUgn
	CaqEzgfTI92AHmn4TIH0uemhkJAr7aNneuSbyQMgbkp5eLIIw9olU+CGIcploIhL+a40MbiBGlfOe
	Qjy6ntzQD/yeKWDoYiHDdKqn1LCRQmIAMrBERsU0IuVgs6HOXvqbIIQ8YFeFnk4RnJkAN77Q11tuq
	36m79RJ2KPbh1DUfX1zrtSm/kbFVQqG9jtzqRh+GMn2qgtvYpUMpNntH6aWf2ly+ihuQT1tAb7o2I
	4w+O0puuS81ee19OjJK2xNbiN6HT0OJ56p5Tl8mecq4vbPaFyKahRYp+Mx6RPdeF9+Mmlfk/TjT9g
	kWGPGeTS4zC6P6sZ5ygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEB6-0000000CGg5-3WVJ;
	Wed, 10 Sep 2025 06:19:36 +0000
Received: from mail-dm6nam11on20626.outbound.protection.outlook.com ([2a01:111:f403:2415::626] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEB3-0000000CGeV-2xbn
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 06:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwPJBBwSwc8w++98roL1qdeYpNZO1AeJ5jeEFf1bWGUgGyyW3MwQz3zPL+L1SfUZ3aLgOYR5iCTOiWZjhuOqGvUPc7N/FiBOPXFDSjPg2Se/yVZkNyiFbsXeK/GGRPVL6Qchgewuj6gTx9rjoSJaWIABgCNhgvdUDY5JctRC5NqiwmHLD4XPEfFwCRGVdQ8A4RorGEMYFHbUeK37FQznr0Xb6+Dj9o9lQYCYyxUb1n4ASWn3W5hVlSmWeWCg8hbVIvxboIQ6rqPtiBVFvW5w56aeatxqsXGGcc4oUYTgVK/awonGXEbcevxSppzL+7cPIkF0G2a6gYwTk5Z1t9Eu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQGFHWhyVsYdiWrJ55e9yQJ9sSt4albgt+vezZPSWtU=;
 b=t0iIO8SsmncQhamKGZ4Zc+RR8YZpirhKTO+g3EZXOuTWyyaTiq2SoEWz5uw+eUuYuUrbpZqRdDhIJMpn/6V1U2h47p7efiUGcswCFkGv7hKH8Osn+zlSFQa0oa6YjxWd6BR8okP/Gi4f2cygHLYXdm9dVaRixDiRayb5WjrE0u6ybNO+79w8DLGR/yWnrHWOf6qAV+kGHuo1wWdpUmhVX7wH3HkjdHHxJIx1A8DZNwHiZ6x096IK0Cj9avNRELa8mKoTXMGEPV6s0MAMLpLwxJCkzO+3d4pEElxadq4s4apRIkLAfa1nkXB/whQ8o81B/mZlfBwjlNQ1OguSn3om6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQGFHWhyVsYdiWrJ55e9yQJ9sSt4albgt+vezZPSWtU=;
 b=tour7acG3nUZL2IxuNz7Mr8SNBHkHB0pasa/9af7LCe8EJJuSPQGlJOELSoEXOvZmdCmUbt/jEzpXk2uQ1c0BEKgvo8HSG4REkkNFbJpPZND7HCGyCvMsuqk6chDsnxpHFnEXPSTUQCHhqyKEd98YPvWCrebQD00wAuxij1l4nqMHi5Cd4OvDYY84sp2xpPZmZwy0CNokMCwvMHyMHoyDYmtrnW+BPSt7UrJ77qnZxX6lwqYbqO5TPp1uqPeZFyUsCaVN2amL18toCUT7dwTyo0Z1LjvdfABJumV0N49ECJgSdu2FIyhXPtXF9YNnPsw434fTRBHeENgKQcWdwT0WA==
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH3PPF3DE9570BE.namprd11.prod.outlook.com (2603:10b6:518:1::d18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 06:19:22 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 06:19:22 +0000
From: <Durai.ManickamKR@microchip.com>
To: <lkp@intel.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Balamanikandan.Gunasundar@microchip.com>, <Nicolas.Ferre@microchip.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 2/4] i3c: master: add Microchip SAMA7D65 I3C HCI master
 driver
Thread-Topic: [PATCH 2/4] i3c: master: add Microchip SAMA7D65 I3C HCI master
 driver
Thread-Index: AQHcIXrqGVMOWFOs9UayQYE6vyTQPbSL7I6AgAAGLYA=
Date: Wed, 10 Sep 2025 06:19:22 +0000
Message-ID: <10e1bb1c-3247-4405-9d6f-7df3dec9c002@microchip.com>
References: <20250909111333.170016-3-durai.manickamkr@microchip.com>
 <202509101550.Bpclx47x-lkp@intel.com>
In-Reply-To: <202509101550.Bpclx47x-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|PH3PPF3DE9570BE:EE_
x-ms-office365-filtering-correlation-id: 850c15ac-b0a7-42c0-c424-08ddf031fbca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SFdQUnN3WkNSTTBWY2NwZXVubDh1SDYrTVNETFNPR2EwRld6bXJuZTFaVUF3?=
 =?utf-8?B?T3IrOGU0NmY4eDk2ZUNDdTNJMUZUKzJQb1JzYlFSN0JtRnhMRzd0THNWejVp?=
 =?utf-8?B?YjQybFJSYzdobjB5Vmg0WW52YlFoWm50MVlhQzBpalVCSDE5UmlrOUIzTHVR?=
 =?utf-8?B?S1hlSW56a2l5Y2JOdndVcDIxR2J5MG15U2pTQkNISUNHandqN2VUV2RYTEwz?=
 =?utf-8?B?cURyNW5qM3hxNERmL3hxTllNYnViTnI1UXVrVFhGZDQ2bVF4UlZVQkFkeDlR?=
 =?utf-8?B?ZUh3MUxHenVSQ3A4b0cyVE5VYlkzbHBiQmRicGdIR3RXRFczajcxM2xMakdX?=
 =?utf-8?B?blZGSFF5ODF0UUFKamFKaC9JTXdJWGEyTWxLVkswZFphTm5lTzFlbEF2WHl0?=
 =?utf-8?B?WXAzUGh2VnpYREVrMXE2Y2pIVk55VmtML2ZKbnZRSGdNa2J4dTczcmRTcWp5?=
 =?utf-8?B?VjRXVHpGc1dCSi9uQ0xtaXJBa2hsNE9rZ1VuNStQLzhzanlVenFTTUpjREhh?=
 =?utf-8?B?M256T25yR1JkU0g4SGo5bEVlRG9qaS9CWHBoV3FCWEU4MWtYTXZiZS9CaGs4?=
 =?utf-8?B?NVlqWDRNRWRYTVd6Ti9IM3VCUTRjank3U3M2SDRneVNxOHlDUTF3czFTN3Fq?=
 =?utf-8?B?YTA4QWRKazlwYVorNm1QTkxydFVuR3RWaCtIWFVTZDV2V0JzZlFYSW9FMmRL?=
 =?utf-8?B?OUxxUllyK1RsS2ZFMnhKWjZQT0hicC9wZDN4dUxkbURrcXVKQ3BRNnhBMEZR?=
 =?utf-8?B?cG11U1NKMlpSWEErNVd6Z1lEUVpOUmdaUllzYURIRnZxY0VOVEY3amhLQmtC?=
 =?utf-8?B?Tk81NVlVSS9OQmFBSjFjaUk1Tm8zSEZOU1dvbEhHMC8wOS80Si90VzIwNHpZ?=
 =?utf-8?B?VDJBVGY0L2NXWEJ1dHBVMTdPby9GMXRSMTdSbC9DQmRQc3RhYVZUbVpTVUVq?=
 =?utf-8?B?Wlp3MzV3VktHRklnZTVtckVqZlc2aFdHdmt5UUJ6RENCVFAra2IwSFNjVytK?=
 =?utf-8?B?UlY0Zmx4YW5jYTBJdldmbVFOalZYV3Bhc2N1aE1MZWkzYWFjcm5PYVQ3M0Iv?=
 =?utf-8?B?NjBNYjdxVm9wRG1Zb0ZXbWJ5UnFyK2FkVkFyMURBb2ZYMUNJT1FFYks3NVNm?=
 =?utf-8?B?ZUJ1bTIrQzg5RG8rTjFVdjFpRUVMVWowUzR1bktucWFheWZLVlNzK1lINlN4?=
 =?utf-8?B?NzM1ZmpPRmt5a1lTR0h6MndJcmJZOUE1MkEzSzVidjdjbUpqL3dFelIvOW1I?=
 =?utf-8?B?Y2FJYnI5NytoUDUxZWM0bmh0MEdjYldrOFhQRENaaWowNHpGbzVxSHBKaXhW?=
 =?utf-8?B?bmtUNDJIVVhxRlpDVUMrY1QxK1lNM1JCcVY5ZDMvdkp6OEZzTUgrWlprZmJv?=
 =?utf-8?B?MzJDWVg2bnBVM0Iyb082WHRnazFScHBsTW1JNVRkUGdZM0cyTWNualhoQXhG?=
 =?utf-8?B?Y0ZSR3dqOFVYUTVHOVdKT3lkYjB0cnNCUE5SdHVqMDRjN2FGU21WWG1lM1g5?=
 =?utf-8?B?WTRIUXJyU3NsUy95U29GbWVBd0h3V0RhdzlLRTZTWE9YczFMQmRLMllEekxw?=
 =?utf-8?B?WHRaRkRFM2hzNnZOSDFIUjZTd09PdDN5YzBlVEpPeGhtbHVRQit6TVFnRzFk?=
 =?utf-8?B?YTF6cHYvdjExcUUwV2w1QUY4UzlIWGJ6SFpXNVl3eDNBK2tGTUQ1Um1CS1BF?=
 =?utf-8?B?eWxKWStDY09QR2U3SGJTZUw5OXBMUDhkSW1FcU1NblBrKzUwWDA3aFVtdUxG?=
 =?utf-8?B?M2c2KzJJeExsQU1HcCt4NFBZZlVUZml3UllPY2gzWVpuR2lRZm1mdHF4TWJI?=
 =?utf-8?B?Zmo0OGlYMkJHQ2V4bkNxWnc1Nlh1K0FqWnFNQ2xpaW9pTkNHR0JqZ0VzcVpw?=
 =?utf-8?B?N3h6Ky9rR0ZYUWY5Q0FLNG1YNkdkODI4Q1dIVnRTQTdjZGROZFJ6SHdnMm1N?=
 =?utf-8?B?NWhRYnArb0V6S1hCcUFvVzh6a2R3R0pVKzd5dFBka2ZEaTZZVVNBTzFBWC9S?=
 =?utf-8?B?ZVNkcGJOelZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NExkVDFwS1RDRElob05uWEp2alpSOUxIbE45YVlYaDhsLzd4LzJydHlwK1lo?=
 =?utf-8?B?OGtXWmIrc3NuQi96Mnk2c1ZycVlYZzRKLzVTRm04QW5IR1JXMDVsSmFHcDBF?=
 =?utf-8?B?RndicCtNZkkxdWxkamtyN1U4ZUFkb3drTy85TUZld3lyelZVNThLMUVFcGVn?=
 =?utf-8?B?aTJFM2l1SFZ3aWtTeGxkQXVhRmsyOFF0MDREY3NxTWFKbk55eExqS0NoQVNk?=
 =?utf-8?B?YTJYVkJ0bzUzb2J4bDcwMTZiOEF2ZEo0eHFYYm94bVIzdmVtRFJtT1RiZ21V?=
 =?utf-8?B?TkFZTmhybER3b0JUSHh2YVRlM0RLMkJkdU5QRW5GUFQwYUxKK0k4YjdKMytD?=
 =?utf-8?B?U1ZTbU1CNnNrZnhjK1ZSQmVIZkNBUFUxRXNka0hMbDJZRGwyQkZITW5nLytX?=
 =?utf-8?B?bVUyeCttazVlRkJ6K1JmWFdaM2Ryb2c3WHoxcW4rUWthQ3RsMmJYdThQYkhD?=
 =?utf-8?B?Mzg2cGhWSW40Y2tnK1V5eVFoM24xckR2cm4yajlKQWFZTzZkdnhxOS8rdHZF?=
 =?utf-8?B?NHVTZ2REdzJKWTVWaEwrc3FZUFJLbG4rcmd3T0daUTMwZXhrcFl6VHpXdENR?=
 =?utf-8?B?a0JaalBCQ1d2RDNxQUFCcTh3NnhRdUFRYVZjWCtUalI3L2t3SGZUWE45bmNL?=
 =?utf-8?B?VkMzdG5Ca05zdXhWeWJLQjJ3MkFNbk9EcU5sVTA1VnhLT0g3TXhEQ3JxYkFR?=
 =?utf-8?B?eEtES041SjdOS3A4MVNSYmN4d3lHRWg2T0cyT1pTZmUyMm1kMGZmS3I5cVJv?=
 =?utf-8?B?aHJsUDBBMGZVbmhqc0RzRENheWlRUE0xeDZaVThjeUVna05BT0o5alE4TmY3?=
 =?utf-8?B?b29Qd09PVk93L2dwZnIxdm16UGduMUlKbVFCbURqSlVSY2k5NkNqaFd2N1RH?=
 =?utf-8?B?TE84WThma3p1S2ZycDludUhYRU15RE9SenU3b1cwMXUxanpTQXNvUlpXZzhx?=
 =?utf-8?B?ckhER0lJNVpmaEM2VGdyTXRuMmp6NWxZUFZFYTVQTnRFYUNBM0hpQ1NKUWpu?=
 =?utf-8?B?TzkyMUlYQVMxbnZKTkswbFU2UWF3dEVtSGhUTGEvRkxVMndpZ21kU2M5TFJR?=
 =?utf-8?B?TkQxSFkyM2I2bnQ1TEE5dE1YcVA5bzJsNHhoSEo4TUVCVjNsRlllaklTaHhk?=
 =?utf-8?B?WmVUcnF2SFAyWVp6cUo4OThUaXdrQjJpMVJLTnBRcHhxTkdUVUJJRTh1QWZK?=
 =?utf-8?B?UlhDRGNLVG4rWFNaZEcrY3JWYjhielJCYTYxNDlPdWJjZGFyVmdUbExSblJp?=
 =?utf-8?B?SnZLK05nK0NCdEtsRXczemZlRk4rbFlxV09LUFhYWkVzZ1dyVTFUNzJoZy9C?=
 =?utf-8?B?ZzA1WmpPRy9QT3ZDazk4MGZCU21zRFlMNndDd0IxNWs3YUtDWXJTUS9tYWFM?=
 =?utf-8?B?cnR0Ym1EY1VNYUhIdUlyZWdYMEFtdFhqUWFrUWxBdkRIK3JSN0FNR0tEb3F0?=
 =?utf-8?B?b1hOeG1RVmZEUGlKRmszaWZBcVhXT2pRQVlhbng4dCtsSVc5L28ySGNzVCtu?=
 =?utf-8?B?S3hSVmN4S3RLMmlWUDhoODJCTG1ocFdKd3RqcnhSUUxtRGJuR2FGaHZPZkxv?=
 =?utf-8?B?SmVQc051a2swc3p1TXl5U0ZtRlRLeHBRcXRSemdXWDkvd0x3Mkx0ZFVmNkIv?=
 =?utf-8?B?YzZRdlJtM0Jxd3UySzA5VWcwdTIvdkRyZEt0a0lXOU9LU00vTU1BcTZYb1hD?=
 =?utf-8?B?RG1rcGt5NUtCZEZLUjBUc3F5ZEwreFFGSEJUNXBzcEZ3STN4TSthaUNyMEdB?=
 =?utf-8?B?MVQxU3lqOTMvZkM0RCtKVkplK0Fhay9TVTR1ek9Jc0xBRGQwanVGYW1Sa0dD?=
 =?utf-8?B?cGNXZHZ1MlljMERoRGFYVHR5aERqVnhWeUpiMTIzb3JyWU9OZTZ4K2U2MFcx?=
 =?utf-8?B?UlBvMDcvbWFpS1hpQlpZSHZOUVM4ZVFSaGhQRmFoL0c1TitLOWFxQnpJc1do?=
 =?utf-8?B?WG5Wa2psMURWVGRLTFVGSTNkeDZDM3ZSMElTWEg0dnJlWHp1WWZaK1dnZFk4?=
 =?utf-8?B?VlNsVjRpQXNFRkpkRmxiL0JkV04xWFR0eE10S21FSm9SYlRBR29kY2hQSmZt?=
 =?utf-8?B?ZmxVL1YzQ282b0cyN2poUzNZMU8waVZSdlpEaUNUb1BrbTBnVG13K3pROStq?=
 =?utf-8?B?OGNmdDNnRGlWeUg3MTRQNUk5b2pabkdqQjBLSEg4eXpyTWpBSzg5WDJUSGgz?=
 =?utf-8?B?WUE9PQ==?=
Content-ID: <575F4B558C7DEB4686927A60B9E862FC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850c15ac-b0a7-42c0-c424-08ddf031fbca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 06:19:22.4363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZA78U5MODt1oeeeR+6qaj7yX9XJYbm+9X/HXpGOAb8sPEzynDpu0pqAY5GTuNzr+i4PNgQYo9dwR511xr81yvj/vx+y6l5XTuSw+Unl9iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_231933_800010_A1B96318 
X-CRM114-Status: GOOD (  19.59  )
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

On 10/09/25 11:27, kernel test robot wrote:
Hi,

Yes, the patch has been updated on top of the latest linux-next branch 
and the issue is fixed. Will send this fix in patch v2 series.
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Hi Durai,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next linus/master v6.17-rc5 next-20250909]
> [cannot apply to abelloni/rtc-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Durai-Manickam-KR/clk-at91-sama7d65-add-peripheral-clock-for-I3C/20250909-192231
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> patch link:    https://lore.kernel.org/r/20250909111333.170016-3-durai.manickamkr%40microchip.com
> patch subject: [PATCH 2/4] i3c: master: add Microchip SAMA7D65 I3C HCI master driver
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250910/202509101550.Bpclx47x-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101550.Bpclx47x-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509101550.Bpclx47x-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>>> drivers/i3c/master/sama7d65-i3c-hci-master.c:2478:35: error: initialization of 'int (*)(struct i2c_dev_desc *, struct i2c_msg *, int)' from incompatible pointer type 'int (*)(struct i2c_dev_desc *, const struct i2c_msg *, int)' [-Wincompatible-pointer-types]
>      2478 |         .i2c_xfers              = mchp_i3c_hci_i2c_xfers,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~
>     drivers/i3c/master/sama7d65-i3c-hci-master.c:2478:35: note: (near initialization for 'mchp_i3c_hci_ops.i2c_xfers')
>     drivers/i3c/master/sama7d65-i3c-hci-master.c:2283:12: note: 'mchp_i3c_hci_i2c_xfers' declared here
>      2283 | static int mchp_i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>           |            ^~~~~~~~~~~~~~~~~~~~~~
>     drivers/i3c/master/sama7d65-i3c-hci-master.c: In function 'mchp_i3c_hci_init':
>>> drivers/i3c/master/sama7d65-i3c-hci-master.c:2517:30: warning: variable 'mode_selector' set but not used [-Wunused-but-set-variable]
>      2517 |         bool size_in_dwords, mode_selector;
>           |                              ^~~~~~~~~~~~~
>     drivers/i3c/master/sama7d65-i3c-hci-master.c: At top level:
>>> drivers/i3c/master/sama7d65-i3c-hci-master.c:2695:10: error: 'struct platform_driver' has no member named 'remove_new'; did you mean 'remove'?
>      2695 |         .remove_new = mchp_i3c_hci_remove,
>           |          ^~~~~~~~~~
>           |          remove
>
>
> vim +2478 drivers/i3c/master/sama7d65-i3c-hci-master.c
>
>    2471
>    2472  static const struct i3c_master_controller_ops mchp_i3c_hci_ops = {
>    2473          .bus_init               = mchp_i3c_hci_bus_init,
>    2474          .bus_cleanup            = mchp_i3c_hci_bus_cleanup,
>    2475          .do_daa                 = mchp_i3c_hci_daa,
>    2476          .send_ccc_cmd           = mchp_i3c_hci_send_ccc_cmd,
>    2477          .priv_xfers             = mchp_i3c_hci_priv_xfers,
>> 2478          .i2c_xfers              = mchp_i3c_hci_i2c_xfers,
>    2479          .attach_i3c_dev         = mchp_i3c_hci_attach_i3c_dev,
>    2480          .reattach_i3c_dev       = mchp_i3c_hci_reattach_i3c_dev,
>    2481          .detach_i3c_dev         = mchp_i3c_hci_detach_i3c_dev,
>    2482          .attach_i2c_dev         = mchp_i3c_hci_attach_i2c_dev,
>    2483          .detach_i2c_dev         = mchp_i3c_hci_detach_i2c_dev,
>    2484          .request_ibi            = mchp_i3c_hci_request_ibi,
>    2485          .free_ibi               = mchp_i3c_hci_free_ibi,
>    2486          .enable_ibi             = mchp_i3c_hci_enable_ibi,
>    2487          .disable_ibi            = mchp_i3c_hci_disable_ibi,
>    2488          .recycle_ibi_slot       = mchp_i3c_hci_recycle_ibi_slot,
>    2489  };
>    2490
>    2491  static irqreturn_t mchp_i3c_hci_irq_handler(int irq, void *dev_id)
>    2492  {
>    2493          struct mchp_i3c_hci *hci = dev_id;
>    2494          irqreturn_t result = IRQ_NONE;
>    2495          u32 val;
>    2496
>    2497          val = reg_read(MCHP_INTR_STATUS);
>    2498          dev_dbg(&hci->master.dev,"INTR_STATUS = %#x", val);
>    2499
>    2500          if (val & MCHP_INTR_HC_INTERNAL_ERR) {
>    2501                  dev_err(&hci->master.dev, "Host Controller Internal Error\n");
>    2502                  val &= ~MCHP_INTR_HC_INTERNAL_ERR;
>    2503          }
>    2504
>    2505          hci->io->irq_handler(hci, 0);
>    2506
>    2507          if (val)
>    2508                  dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
>    2509          else
>    2510                  result = IRQ_HANDLED;
>    2511
>    2512          return result;
>    2513  }
>    2514
>    2515  static int mchp_i3c_hci_init(struct mchp_i3c_hci *hci)
>    2516  {
>> 2517          bool size_in_dwords, mode_selector;
>    2518          u32 regval, offset;
>    2519          int ret;
>    2520
>    2521          /* Validate HCI hardware version */
>    2522          regval = reg_read(MCHP_HCI_VERSION);
>    2523          hci->version_major = (regval >> 8) & 0xf;
>    2524          hci->version_minor = (regval >> 4) & 0xf;
>    2525          hci->revision = regval & 0xf;
>    2526          dev_notice(&hci->master.dev, "MIPI I3C HCI v%u.%u r%02u\n",
>    2527                     hci->version_major, hci->version_minor, hci->revision);
>    2528          /* known versions */
>    2529          switch (regval & ~0xf) {
>    2530          case 0x100:     /* version 1.0 */
>    2531          case 0x110:     /* version 1.1 */
>    2532          case 0x200:     /* version 2.0 */
>    2533                  break;
>    2534          default:
>    2535                  dev_err(&hci->master.dev, "unsupported HCI version\n");
>    2536                  return -EPROTONOSUPPORT;
>    2537          }
>    2538
>    2539          hci->caps = reg_read(MCHP_HC_CAPABILITIES);
>    2540          dev_dbg(&hci->master.dev,"caps = %#x", hci->caps);
>    2541
>    2542          size_in_dwords = hci->version_major < 1 ||
>    2543                           (hci->version_major == 1 && hci->version_minor < 1);
>    2544
>    2545          regval = reg_read(MCHP_DAT_SECTION);
>    2546          offset = FIELD_GET(MCHP_DAT_TABLE_OFFSET, regval);
>    2547          hci->DAT_regs = offset ? hci->base_regs + offset : NULL;
>    2548          hci->DAT_entries = FIELD_GET(MCHP_DAT_TABLE_SIZE, regval);
>    2549          hci->DAT_entry_size = 8;
>    2550          if (size_in_dwords)
>    2551                  hci->DAT_entries = 4 * hci->DAT_entries / hci->DAT_entry_size;
>    2552          dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
>    2553                   hci->DAT_entries, hci->DAT_entry_size, offset);
>    2554
>    2555          regval = reg_read(MCHP_DCT_SECTION);
>    2556          offset = FIELD_GET(MCHP_DCT_TABLE_OFFSET, regval);
>    2557          hci->DCT_regs = offset ? hci->base_regs + offset : NULL;
>    2558          hci->DCT_entries = FIELD_GET(MCHP_DCT_TABLE_SIZE, regval);
>    2559          hci->DCT_entry_size = 16;
>    2560          if (size_in_dwords)
>    2561                  hci->DCT_entries = 4 * hci->DCT_entries / hci->DCT_entry_size;
>    2562          dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
>    2563                   hci->DCT_entries, hci->DCT_entry_size, offset);
>    2564
>    2565          regval = reg_read(MCHP_RING_HEADERS_SECTION);
>    2566          offset = FIELD_GET(MCHP_RING_HEADERS_OFFSET, regval);
>    2567          hci->RHS_regs = offset ? hci->base_regs + offset : NULL;
>    2568          dev_info(&hci->master.dev, "Ring Headers at offset %#x\n", offset);
>    2569
>    2570          regval = reg_read(MCHP_PIO_SECTION);
>    2571          offset = FIELD_GET(MCHP_PIO_REGS_OFFSET, regval);
>    2572          hci->PIO_regs = offset ? hci->base_regs + offset : NULL;
>    2573          dev_info(&hci->master.dev, "PIO section at offset %#x\n", offset);
>    2574
>    2575          regval = reg_read(MCHP_EXT_CAPS_SECTION);
>    2576          offset = FIELD_GET(MCHP_EXT_CAPS_OFFSET, regval);
>    2577          hci->EXTCAPS_regs = offset ? hci->base_regs + offset : NULL;
>    2578          dev_info(&hci->master.dev, "Extended Caps at offset %#x\n", offset);
>    2579
>    2580          ret = i3c_hci_parse_ext_caps(hci);
>    2581          if (ret)
>    2582                  return ret;
>    2583
>    2584          /*
>    2585           * Now let's reset the hardware.
>    2586           * SOFT_RST must be clear before we write to it.
>    2587           * Then we must wait until it clears again.
>    2588           */
>    2589          ret = readx_poll_timeout(reg_read, MCHP_RESET_CONTROL, regval,
>    2590                                   !(regval & MCHP_SOFT_RST), 1, 10000);
>    2591          if (ret)
>    2592                  return -ENXIO;
>    2593          reg_write(MCHP_RESET_CONTROL, MCHP_SOFT_RST);
>    2594          ret = readx_poll_timeout(reg_read, MCHP_RESET_CONTROL, regval,
>    2595                                   !(regval & MCHP_SOFT_RST), 1, 10000);
>    2596          if (ret)
>    2597                  return -ENXIO;
>    2598
>    2599          /* Disable all interrupts and allow all signal updates */
>    2600          reg_write(MCHP_INTR_SIGNAL_ENABLE, 0x0);
>    2601          reg_write(MCHP_INTR_STATUS_ENABLE, 0xffffffff);
>    2602
>    2603          hci->cmd = &mchp_mipi_i3c_hci_cmd_v1;
>    2604          mode_selector = hci->version_major > 1 ||
>    2605                                  (hci->version_major == 1 && hci->version_minor > 0);
>    2606
>    2607          /* Quirk for HCI_QUIRK_PIO_MODE on MICROCHIP platforms */
>    2608          if (hci->quirks & MCHP_HCI_QUIRK_PIO_MODE) {
>    2609                          hci->RHS_regs = NULL;
>    2610          }
>    2611
>    2612          hci->io = &mchp_mipi_i3c_hci_pio;
>    2613          dev_info(&hci->master.dev, "Using PIO\n");
>    2614
>    2615          microchip_set_od_pp_timing(hci);
>    2616
>    2617          return 0;
>    2618  }
>    2619
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
